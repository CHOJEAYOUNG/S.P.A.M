package com.spam.service;

import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Attend;
import com.spam.domain.Attendance;
import com.spam.domain.SpamUser;

public interface AttendanceService {
	public void excelxlsxRead(MultipartFile excelFile) throws IOException;
	public void copyExcel(String insertedFileName) throws IOException;
	public XSSFWorkbook makeExcel(String insertedFileName) throws IOException;
	public void attendanceInfo(Attendance attendance, String originalFileName) throws IOException;
	public void checkStudent(HashSet<String> set);
	public void download(Attendance attendance,HttpServletResponse response)throws IOException;
	public int randomNumber();
	public Attendance selectOne(int attendanceNo);
	public List<SpamUser> listStudents(Attend attend);
	public List<Attendance> list();
	public void delete(int attendanceNo);
}
