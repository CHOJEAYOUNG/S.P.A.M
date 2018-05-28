package com.spam.service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Employment;
import com.spam.persistence.EmploymentMapper;

@Service
public class EmploymentServiceImpl implements EmploymentService {
	@Resource
	private EmploymentMapper employmentMapper;

	String path = "C:/upload";

	@Override
	public List<Employment> find(int id) {
		return this.employmentMapper.list(id);
	}

	@Override
	public void add(Employment employment, MultipartFile file, HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		long time = System.currentTimeMillis();
		SimpleDateFormat dayTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String str = dayTime.format(new Date(time));

		employment.setRegistration(str);
		employment.setCause("");

		// 취업 등록
		if (file.getSize() != 0) {
			employment.setAttendanceNo(0);
			if ("A".equals(session.getAttribute("power"))) {
				System.out.println("조교가 등록");
				employment.setAssentNo(1); // 승인
				employment.setAssentDate(str);
			} else {
				System.out.println("학생이 등록");
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
			path = path + File.separator + saveName; // 경로
			employment.setOriginalName(file.getOriginalFilename());
			employment.setSaveName(saveName);
			employment.setFilePath(path);
			try {
				file.transferTo(serverFile);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// 비교과 등록
		else {
			System.out.println("비교과 등록");
		}
		this.employmentMapper.insert(employment);
	}

	@Override
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
	public Employment viewID(int id) {
		return this.employmentMapper.selectID(id);
	}

	@Override
	public void remove(int emplNo) {
		this.employmentMapper.delete(emplNo);
	}

	@Override
	public String uploadFile(String originalName) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid.toString() + "_" + originalName;
		return saveName;
	}
}