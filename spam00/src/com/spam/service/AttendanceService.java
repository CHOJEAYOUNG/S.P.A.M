package com.spam.service;

import java.io.IOException;
import java.util.HashSet;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Attendance;

public interface AttendanceService {
	public void excelxlsxRead(MultipartFile excelFile) throws IOException;
	public void excelxlsRead(MultipartFile excelFile) throws IOException;
	public void copyExcel(String insertedFileName) throws IOException;
	public XSSFWorkbook makeExcel(String insertedFileName) throws IOException;
	public void attendanceInfo(Attendance attendance, String originalFileName) throws IOException;
	public void checkStudent(HashSet<String> set);
	public void download(Attendance attendance,HttpServletResponse response)throws IOException;
	public int randomNumber();
}
