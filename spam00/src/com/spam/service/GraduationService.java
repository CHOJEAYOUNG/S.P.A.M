package com.spam.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Graduation;

public interface GraduationService {
	public List<Graduation> find(Graduation graduation);
	
	public void add(Graduation graduation, MultipartFile file, HttpServletRequest request);

	public void edit(Graduation graduation);

	public Graduation view(int grlNo);

	public void remove(int no);
	
	public String uploadFile(String originalName);

	public void download(Graduation graduation, HttpServletResponse response) throws IOException;
}
