package com.spam.service;

import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public interface AttendanceService {
	public void excelxlsxRead(MultipartFile excelFile) throws IOException;
	public void excelxlsRead(MultipartFile excelFile) throws IOException;
	
}
