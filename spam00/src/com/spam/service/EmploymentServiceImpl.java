package com.spam.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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

		employment.setImage(file.getOriginalFilename());
		employment.setRegistration(str);
		//��� ���
		if("A".equals(session.getAttribute("power"))) {
			System.out.println("������ ���");
			employment.setAssentNo(1); //����
			employment.setCause("");
			employment.setAssentDate(str);
		} 
		else {
			System.out.println("�л��� ���");
			employment.setAssentNo(2); //���
			employment.setCause("");
			str = "0001-01-01 00:00:00";
			employment.setAssentDate(str);
		}
		
		//�񱳰� ���
		
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
}