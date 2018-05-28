package com.spam.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Employment;

public interface EmploymentService {
	public List<Employment> find(int id);
	
	public void add(Employment employment, MultipartFile file, HttpServletRequest request);

	public void edit(Employment employment);

	public Employment view(int emplNo);

	public Employment viewID(int id);

	public void remove(int no);
	
	public String uploadFile(String originalName);
}
