package com.spam.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Employment;

public interface EmploymentService {
	public List<Employment> find(Employment employment);
	
	public void add(Employment employment, MultipartFile file, HttpServletRequest request);

	public void edit(Employment employment);

	public Employment view(int emplNo);

	public void remove(int emplNo);
	
	public String uploadFile(String originalName);

	public void download(Employment employment, HttpServletResponse response) throws IOException;
}