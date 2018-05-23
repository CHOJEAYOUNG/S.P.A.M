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
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
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
	List<Attend> attendList = new ArrayList<Attend>();
	
	XSSFWorkbook xexcelOpen;
	
	String filePath = "C:/Users/CHOJAEYOUNG/Desktop/종설/file";
	
	List<SpamUser> dataListInfoExist;
	List<String> dataListInfoUnExist;
	
	int makedRandomNumber;
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
	SimpleDateFormat dateFormatWithTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.KOREA);
	Date currentTime = new Date();
	
	@Override
	public void excelxlsxRead(MultipartFile excelFile) throws IOException { // 엑셀 파일 읽기
		xexcelOpen = new XSSFWorkbook(excelFile.getInputStream()); 
		XSSFSheet sheet; //내용 복사 용
		
		HashSet<String> set = new HashSet<>();
		int cardNo;
		String cardNoToString;
		
		for(int j=0; j<xexcelOpen.getNumberOfSheets(); j++) {
			sheet = xexcelOpen.getSheetAt(j); // 해당 엑셀파일의 시트(Sheet) 수
			for(Row row : sheet) {
				for(int i=row.getFirstCellNum(); i<row.getLastCellNum(); i++ ){	
					if(row.getCell(i).getCellType() == Cell.CELL_TYPE_NUMERIC) {
						cardNo = (int)row.getCell(i).getNumericCellValue();
						cardNoToString = new Integer(cardNo).toString();
						set.add(cardNoToString); // 카드 중복 값 해결
					}
				}
			}
		}
		checkStudent(set);
	}

	@Override
	public void excelxlsRead(MultipartFile excelFile) throws IOException {
		// TODO Auto-generated method stub
		HSSFWorkbook hexcelOpen = new HSSFWorkbook(excelFile.getInputStream());
	}

	@Override
	public void copyExcel(String insertedFileName) throws IOException { // 파일 복사
		
		File file = new File(filePath+"/"+dateFormat.format(currentTime));
		
		if(!file.exists()) {
			file.mkdirs();
		}
		
		int randomNumberU = randomNumber();
		attendance.setUploadFileNameWithS(randomNumberU);
		//System.out.println(randomNumberU);
		FileOutputStream fileOutputStream = new FileOutputStream(file+File.separator + randomNumberU); // 파일 
		xexcelOpen.write(fileOutputStream);
		
		int randomNumberM = randomNumber();
		if(randomNumberU == randomNumberM) {
			randomNumberM = randomNumber();
		}
		
		attendance.setMakedFileNameWithS(randomNumberM);
		//System.out.println(randomNumberM);
		fileOutputStream = new FileOutputStream(file+File.separator + randomNumberM); //정보 추가 파일
		makeExcel(insertedFileName).write(fileOutputStream);;
		
		fileOutputStream.close();
	}
	
	@Override
	public XSSFWorkbook makeExcel(String insertedFileName) throws IOException {
		XSSFWorkbook xexcelWrite = new XSSFWorkbook();
		XSSFSheet infoSheet = xexcelWrite.createSheet(insertedFileName);
		XSSFSheet nodataSheet = xexcelWrite.createSheet("등록된 정보 없는 카드번호들");
		XSSFRow row = infoSheet.createRow(0);
		XSSFCell cell = null;
		
		cell = row.createCell(0);
		cell.setCellValue("이름");
		
		cell = row.createCell(1);
		cell.setCellValue("학번");
		
		cell = row.createCell(2);
		cell.setCellValue("학년");
		
		cell = row.createCell(3);
		cell.setCellValue("학과");
		
		cell = row.createCell(4);
		cell.setCellValue("전화번호");
		
		for(int i = 0; i<dataListInfoExist.size(); i++) {
			row = infoSheet.createRow(i+1);
			
			cell = row.createCell(0);
			cell.setCellValue(dataListInfoExist.get(i).getName());
			
			cell = row.createCell(1);
			cell.setCellValue(dataListInfoExist.get(i).getId());
			
			Attend attend = new Attend();
			attend.setId(dataListInfoExist.get(i).getId()); // 학생 추가
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
		cell.setCellValue("카드번호");
		
		for(int i = 0; i<dataListInfoUnExist.size(); i++) {
			row = nodataSheet.createRow(i+1);
			cell = row.createCell(0);
			cell.setCellValue(dataListInfoUnExist.get(i));
		}
		return xexcelWrite;
	}
	

	@Override
	public void attendanceInfo(Attendance attendance, String originalFileName) throws IOException { // 입력 정보 처리
		this.attendance = attendance;
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
		copyExcel(attendance.getTitle());
		
		attendance.setRegistrationDate(dateFormatWithTime.format(currentTime));
		attendance.setUploadFileName(attendance.getTitle()+"_원본카드파일"+extension);
		attendance.setMakedFileName(attendance.getTitle()+"_학생정보추가파일"+extension);
		attendance.setFilesLocation(dateFormat.format(currentTime));
		
		attendanceMapper.insertAttendance(attendance);
		
		int seq = attendanceMapper.attendanceSEQ() -1;
		System.out.println();
		
		for(Attend attendInfo :attendList) {
			attendInfo.setAttendanceNo(seq);
			attendMapper.insertAttend(attendInfo);
			System.out.println(attendInfo.toString());
		}
		
	}

	@Override
	public void checkStudent(HashSet<String> set) { // 해당되는 학생 있는지 조회
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
}
