package com.spam.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Attend;
import com.spam.domain.Attendance;
import com.spam.domain.SpamUser;
import com.spam.persistence.AttendMapper;
import com.spam.persistence.AttendanceMapper;
import com.spam.persistence.SpamUserMapper;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Resource
	private AttendanceMapper attendanceMapper;

	@Resource
	private AttendMapper attendMapper;
	
	@Resource
	private SpamUserMapper spamUserMapper;
	
	Attendance attendance;
	List<Attend> attendList;
	
	XSSFWorkbook xexcelOpen;
	
	String filePath = "C:/Users/CHOJAEYOUNG/Desktop/file";
	
	List<SpamUser> dataListInfoExist;
	List<String> dataListInfoUnExist;
	
	int makedRandomNumber;
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
	SimpleDateFormat dateFormatWithTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.KOREA);
	Date currentTime = new Date();
	
	@Override
	public void excelxlsxRead(MultipartFile excelFile) throws IOException {
		xexcelOpen = new XSSFWorkbook(excelFile.getInputStream()); 
		XSSFSheet sheet; //sheet creat
		
		HashSet<String> set = new HashSet<>();
		int cardNo;
		String cardNoToString;
		
		for(int j=0; j<xexcelOpen.getNumberOfSheets(); j++) {
			sheet = xexcelOpen.getSheetAt(j);
			for(Row row : sheet) {
				for(int i=row.getFirstCellNum(); i<row.getLastCellNum(); i++ ){	
					if(row.getCell(i).getCellType() == Cell.CELL_TYPE_NUMERIC) {
						cardNo = (int)row.getCell(i).getNumericCellValue();
						cardNoToString = new Integer(cardNo).toString();
						set.add(cardNoToString); 
					}
				}
			}
		}
		
		checkStudent(set);
	}

	
	
	
	@Override
	public void copyExcel(String insertedFileName) throws IOException {
		File file = new File(filePath+"/"+dateFormat.format(currentTime));
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		int randomNumberU = randomNumber();
		attendance.setUploadFileNameWithS(randomNumberU);
		System.out.println(randomNumberU);
		FileOutputStream fileOutputStream = new FileOutputStream(file+File.separator + randomNumberU);
		xexcelOpen.write(fileOutputStream);
		
		int randomNumberM = randomNumber();
		if(randomNumberU == randomNumberM) {
			randomNumberM = randomNumber();
		}
		
		attendance.setMakedFileNameWithS(randomNumberM);
		System.out.println(randomNumberM);
		fileOutputStream = new FileOutputStream(file+File.separator + randomNumberM);
		makeExcel(insertedFileName).write(fileOutputStream);;
		
		fileOutputStream.close();
	}
	
	@Override
	public XSSFWorkbook makeExcel(String insertedFileName) throws IOException {
		attendList = new ArrayList<Attend>();
		XSSFWorkbook xexcelWrite = new XSSFWorkbook();
		XSSFSheet infoSheet = xexcelWrite.createSheet(insertedFileName);
		XSSFSheet nodataSheet = xexcelWrite.createSheet("no information about number");
		XSSFRow row = infoSheet.createRow(0);
		XSSFCell cell = null;
		
		cell = row.createCell(0);
		cell.setCellValue("name");
		
		cell = row.createCell(1);
		cell.setCellValue("id");
		
		cell = row.createCell(2);
		cell.setCellValue("grade");
		
		cell = row.createCell(3);
		cell.setCellValue("major");
		
		cell = row.createCell(4);
		cell.setCellValue("phoneNo");
		
		for(int i = 0; i<dataListInfoExist.size(); i++) {
			row = infoSheet.createRow(i+1);
			
			cell = row.createCell(0);
			cell.setCellValue(dataListInfoExist.get(i).getName());
			
			cell = row.createCell(1);
			cell.setCellValue(dataListInfoExist.get(i).getId());
			
			Attend attend = new Attend();
			attend.setId(dataListInfoExist.get(i).getId()); 
			System.out.println("확인용"+attend.toString());
			attendList.add(attend);
			
			cell = row.createCell(2);
			cell.setCellValue(dataListInfoExist.get(i).getGrade());
			
			cell = row.createCell(3);
			cell.setCellValue(dataListInfoExist.get(i).getMajor());
			
			cell = row.createCell(4);
			cell.setCellValue(dataListInfoExist.get(i).getPhoneNo());
			
		}
		
		System.out.println(attendList.size());
		
		row = nodataSheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellValue("cardNo");
		
		for(int i = 0; i<dataListInfoUnExist.size(); i++) {
			row = nodataSheet.createRow(i+1);
			cell = row.createCell(0);
			cell.setCellValue(dataListInfoUnExist.get(i));
		}
		return xexcelWrite;
	}
	

	@Override
	public void attendanceInfo(Attendance attendance, String originalFileName) throws IOException { // �Է� ���� ó��
		this.attendance = attendance;
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
		copyExcel(attendance.getTitle());
		
		attendance.setRegistrationDate(dateFormatWithTime.format(currentTime));
		attendance.setUploadFileName(attendance.getTitle()+"_uploadFile"+extension);
		attendance.setMakedFileName(attendance.getTitle()+"_addedSinfoFile"+extension);
		attendance.setFilesLocation(dateFormat.format(currentTime));
		
		
		attendanceMapper.insertAttendance(attendance);
		
		int seq = attendanceMapper.attendanceSEQ() -1;
		System.out.println(seq);
		System.out.println("여기서 출력이 되는건가////?");
		for(Attend attendInfo :attendList) {
			attendInfo.setAttendanceNo(seq);
			attendMapper.insertAttend(attendInfo);
			System.out.println(attendInfo.toString());
		}
		
	}

	@Override
	public void checkStudent(HashSet<String> set) {
		SpamUser spamUser = new SpamUser();
		dataListInfoExist = new ArrayList<SpamUser>();
		dataListInfoUnExist = new ArrayList<String>();
		for(String cardNo : set) {
			spamUser.setCardNo(cardNo);
			if(!(spamUserMapper.select(spamUser) == null)) {			
				dataListInfoExist.add(spamUserMapper.select(spamUser));
			}
			else if((spamUserMapper.select(spamUser) == null)){
				dataListInfoUnExist.add(cardNo);
			}
		}
	}

	@Override
	public void download(Attendance attendance,HttpServletResponse response) throws IOException {
		
		String compare=null;
		if(attendance.getMakedFileNameWithS() != 0) {
			compare = "M";
		}
		else if(attendance.getUploadFileNameWithS() != 0){
			compare = "U";
		}

		for(Attendance attendanceInfo : attendanceMapper.select(attendance)) {
			if(compare.equals("M")) {
				byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath+"\\"
						+ attendanceInfo.getFilesLocation() + "\\" + attendanceInfo.getMakedFileNameWithS()));
				response.setContentType("application/octet-stream");
				response.setContentLength(fileByte.length);
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + URLEncoder.encode(attendanceInfo.getMakedFileName(), "UTF-8") + "\";");
				response.setHeader("Content-Ttransfere-Encoding", "binary");
				
				//response.getWriter().write(buf);
				// getOutput Stream 오류 수정을 위해서 writer쓰면 됨
				
				response.getOutputStream().write(fileByte);

				response.getOutputStream().flush();
				
			}else if(compare.equals("U")) {
				byte fileByte[] = FileUtils.readFileToByteArray(new File(filePath+"\\"
						+ attendanceInfo.getFilesLocation() + "\\" + attendanceInfo.getUploadFileNameWithS()));
				response.setContentType("application/octet-stream");
				response.setContentLength(fileByte.length);
				response.setHeader("Content-Disposition",
						"attachment; filename=\"" + URLEncoder.encode(attendanceInfo.getUploadFileName(), "UTF-8") + "\";");
				response.setHeader("Content-Ttransfere-Encoding", "binary");
				response.getOutputStream().write(fileByte);

				response.getOutputStream().flush();
				
			}
		}
		response.getOutputStream().close();
	}

	@Override
	public int randomNumber() {
		
		makedRandomNumber = (int)(Math.random()*1000000)+1;
		for(Attendance attendance: attendanceMapper.checkRandomNumber()) {
			if(attendance.getMakedFileNameWithS() == makedRandomNumber
					|| attendance.getUploadFileNameWithS() == makedRandomNumber) {
				randomNumber();
			}
		};
		return makedRandomNumber;
	}

	@Override
	public List<Attendance> list() {
		return attendanceMapper.list();
	}

	@Override
	public Attendance selectOne(int attendanceNo) {
		return attendanceMapper.selectOne(attendanceNo);
	}
	
	@Override
	public List<SpamUser> listStudents(Attend attend){
		List<SpamUser> attendStudent = new ArrayList<SpamUser>();
		for(Attend attendOne : attendMapper.list(attend)) {
			SpamUser spamuser = new SpamUser();
			spamuser.setId(attendOne.getId());
			attendStudent.add(spamUserMapper.select(spamuser));
		}
		return attendStudent;
	}

	@Override
	public void delete(int attendanceNo) {
		Attendance attendanceOne = attendanceMapper.selectOne(attendanceNo);
		File file1 = new File(filePath+"/"+attendanceOne.getFilesLocation()+"/"+attendanceOne.getMakedFileNameWithS());
		File file2 = new File(filePath+"/"+attendanceOne.getFilesLocation()+"/"+attendanceOne.getUploadFileNameWithS());
		if(file1.exists()) {
			file1.delete();
			System.out.println("파일1 삭제");
		}
		if(file2.exists()) {
			file2.delete();
			System.out.println("파일2 삭제");
		}
		
		attendanceMapper.delete(attendanceNo);
		attendMapper.delete(attendanceNo);
		// TODO Auto-generated method stub
	}
	
	
}
