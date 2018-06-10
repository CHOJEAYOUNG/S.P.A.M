package com.spam.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Graduation;
import com.spam.persistence.GraduationMapper;

@Service
public class GraduationServiceImpl implements GraduationService {
	@Resource
	private GraduationMapper graduationMapper;

	String path = "C:/upload";

	@Override
	public List<Graduation> find(Graduation graduation) {
		return this.graduationMapper.list(graduation);
	}

	@Override
	@Transactional
	public void add(Graduation graduation, MultipartFile file, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));

		graduation.setRegistration(str);
		graduation.setCause("");

		if ("A".equals(session.getAttribute("power"))) {
			graduation.setAssentNo(1); // 승인
			graduation.setAssentDate(str);
		} else {
			graduation.setAssentNo(2); // 대기
			str = "0001-01-01 00:00:00";
			graduation.setAssentDate(str);
		}
		
		String saveName = uploadFile(file.getOriginalFilename());
		File dir = new File(path);
		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		File serverFile = new File(path + File.separator + saveName);
		String localPath = path + File.separator + saveName; // 경로
		graduation.setOriginalName(file.getOriginalFilename());
		graduation.setSaveName(saveName);
		graduation.setFilePath(localPath);
		try {
			file.transferTo(serverFile);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.graduationMapper.insert(graduation);
	}

	@Override
	@Transactional
	public void edit(Graduation graduation) {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));

		graduation.setAssentDate(str);
		this.graduationMapper.update(graduation);
	}

	@Override
	public Graduation view(int grNo) {
		return this.graduationMapper.select(grNo);
	}

	@Override
	@Transactional
	public void remove(int grNo) {
		Graduation graduation = new Graduation();
		graduation = graduationMapper.select(grNo);
		File file = new File(graduation.getFilePath());
		this.graduationMapper.delete(grNo);
		file.delete();
	}

	@Override
	public String uploadFile(String originalName) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString() + "_" + originalName;
		return saveName;
	}

	@Override
	public void download(Graduation graduation, HttpServletResponse response) throws IOException{
		for(Graduation graduationInfo : graduationMapper.list(graduation))	{
			byte fileByte[] = FileUtils.readFileToByteArray(new File(graduation.getFilePath()));
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",
					"attachment; filename=\"" + URLEncoder.encode(graduationInfo.getOriginalName(), "UTF-8") + "\";");
			response.setHeader("Content-Ttransfere-Encoding", "binary");
			response.getOutputStream().write(fileByte);

			response.getOutputStream().flush();
		}
		response.getOutputStream().close();
	}
}
