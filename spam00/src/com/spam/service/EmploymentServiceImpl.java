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

import com.spam.domain.Employment;
import com.spam.persistence.EmploymentMapper;

@Service
public class EmploymentServiceImpl implements EmploymentService {
	@Resource
	private EmploymentMapper employmentMapper;

	String path = "C:/upload";

	@Override
	public List<Employment> find(Employment employment) {
		return this.employmentMapper.list(employment);
	}

	@Override
	@Transactional
	public void add(Employment employment, MultipartFile file, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));

		employment.setRegistration(str);
		employment.setCause("");
		// 취업 등록
		if (employment.getEmpcNo() != 0) {
			employment.setAttendanceNo(0);
			if ("A".equals(session.getAttribute("power"))) {
				employment.setAssentNo(1); // 승인
				employment.setAssentDate(str);
			} else {
				employment.setAssentNo(2); // 대기
				str = "0001-01-01 00:00:00";
				employment.setAssentDate(str);
			}
			String saveName = uploadFile(file.getOriginalFilename());
			File dir = new File(path);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			File serverFile = new File(path + File.separator + saveName);
			String realRath = path + File.separator + saveName; // 경로
			employment.setOriginalName(file.getOriginalFilename());
			employment.setSaveName(saveName);
			employment.setFilePath(realRath);
			try {
				file.transferTo(serverFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 비교과 등록
		else {
			employment.setAssentNo(1); // 승인
			employment.setAssentDate(str);
			employment.setEmpcNo(0);
			employment.setOriginalName("");
			employment.setSaveName("");
			employment.setFilePath("");
		}
		this.employmentMapper.insert(employment);
	}

	@Override
	@Transactional
	public void edit(Employment employment) {
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));

		employment.setAssentDate(str);
		this.employmentMapper.update(employment);
	}

	@Override
	public Employment view(int emplNo) {
		return this.employmentMapper.select(emplNo);
	}

	@Override
	@Transactional
	public void remove(int emplNo) {
		Employment employment = new Employment();
		employment = employmentMapper.select(emplNo);
		File file = new File(employment.getFilePath());
		this.employmentMapper.delete(emplNo);
		file.delete();
	}

	@Override
	public String uploadFile(String originalName) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString() + "_" + originalName;
		return saveName;
	}

	@Override
	public void download(Employment employment, HttpServletResponse response) throws IOException {
		for (Employment employmentInfo : employmentMapper.list(employment)) {
			byte fileByte[] = FileUtils.readFileToByteArray(new File(employment.getFilePath()));
			response.setContentType("application/octet-stream");
			response.setContentLength(fileByte.length);
			response.setHeader("Content-Disposition",
					"attachment; filename=\"" + URLEncoder.encode(employmentInfo.getOriginalName(), "UTF-8") + "\";");
			response.setHeader("Content-Ttransfere-Encoding", "binary");
			response.getOutputStream().write(fileByte);

			response.getOutputStream().flush();
		}
		response.getOutputStream().close();
	}
}