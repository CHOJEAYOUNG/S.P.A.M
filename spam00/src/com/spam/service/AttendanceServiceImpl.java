package com.spam.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.Attendance;
import com.spam.domain.SpamUser;
import com.spam.persistence.AttendanceMapper;
import com.spam.persistence.SpamUserMapper;

@Service
public class AttendanceServiceImpl implements AttendanceService{
	
	@Resource
	private AttendanceMapper attendanceMapper;

	@Resource
	private SpamUserMapper spamUserMapper;
	
	XSSFWorkbook xexcelOpen;
	
	String filePath = "C:/Users/CHOJAEYOUNG/Desktop/����/file";
	File file;
	
	List<SpamUser> dataListInfoExist;
	List<String> dataListInfoUnExist;
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd",Locale.KOREA);
	SimpleDateFormat dateFormatWithTime = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss", Locale.KOREA);
	Date currentTime = new Date();
	
	@Override
	public void excelxlsxRead(MultipartFile excelFile) throws IOException { // ���� ���� �б�
		xexcelOpen = new XSSFWorkbook(excelFile.getInputStream()); 
		XSSFSheet sheet; //���� ���� ��
		
		HashSet<String> set = new HashSet<>();
		int cardNo;
		String cardNoToString;
		
		//System.out.println(xexcelOpen.getNumberOfSheets());
		
		for(int j=0; j<xexcelOpen.getNumberOfSheets(); j++) {
			sheet = xexcelOpen.getSheetAt(j); // �ش� ���������� ��Ʈ(Sheet) ��
			for(Row row : sheet) {
				for(int i=row.getFirstCellNum(); i<row.getLastCellNum(); i++ ){	
					//System.out.print(row.getCell(i) +", ");	
					if(row.getCell(i).getCellType() == Cell.CELL_TYPE_NUMERIC) {
						//System.out.print("������" + );
						cardNo = (int)row.getCell(i).getNumericCellValue();
						cardNoToString = new Integer(cardNo).toString();
						set.add(cardNoToString); // ī�� �ߺ� �� �ذ�
					}
				}
				//System.out.println();
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
	public void copyExcel(String insertedFileName, String extension) throws IOException { // ���� ����
		
		System.out.println(dateFormat.format(currentTime));
		file = new File(filePath+"/"+dateFormat.format(currentTime));
		
		if(!file.exists()) {
			file.mkdirs();
		}
		// ���� �̸� Ž�� �ʿ�(�ߺ� ���� ����)
		FileOutputStream fileOutputStream = new FileOutputStream(file+File.separator + insertedFileName+"_����ī������"+extension); // ���� 
		xexcelOpen.write(fileOutputStream);
		
		fileOutputStream = new FileOutputStream(file+File.separator + insertedFileName+"_�л������߰�����"+extension); //���� �߰� ����
		makeExcel(insertedFileName).write(fileOutputStream);;
		
		fileOutputStream.close();
	}
	
	@Override
	public XSSFWorkbook makeExcel(String insertedFileName) throws IOException {
		XSSFWorkbook xexcelWrite = new XSSFWorkbook();
		XSSFSheet infoSheet = xexcelWrite.createSheet(insertedFileName);
		XSSFSheet nodataSheet = xexcelWrite.createSheet("��ϵ� ���� ���� ī���ȣ��");
		XSSFRow row = infoSheet.createRow(0);
		XSSFCell cell = null;
		
		cell = row.createCell(0);
		cell.setCellValue("�̸�");
		
		cell = row.createCell(1);
		cell.setCellValue("�й�");
		
		cell = row.createCell(2);
		cell.setCellValue("�г�");
		
		cell = row.createCell(3);
		cell.setCellValue("�а�");
		
		cell = row.createCell(4);
		cell.setCellValue("��ȭ��ȣ");
		
		for(int i = 0; i<dataListInfoExist.size(); i++) {
			row = infoSheet.createRow(i+1);
			
			cell = row.createCell(0);
			cell.setCellValue(dataListInfoExist.get(i).getName());
			
			cell = row.createCell(1);
			cell.setCellValue(dataListInfoExist.get(i).getId());
			
			cell = row.createCell(2);
			cell.setCellValue(dataListInfoExist.get(i).getGrade());
			
			cell = row.createCell(3);
			cell.setCellValue(dataListInfoExist.get(i).getMajor());
			
			cell = row.createCell(4);
			cell.setCellValue(dataListInfoExist.get(i).getPhoneNo());
		}
		
		row = nodataSheet.createRow(0);
		cell = row.createCell(0);
		cell.setCellValue("ī���ȣ");
		
		for(int i = 0; i<dataListInfoUnExist.size(); i++) {
			row = nodataSheet.createRow(i+1);
			cell = row.createCell(0);
			cell.setCellValue(dataListInfoUnExist.get(i));
		}
		return xexcelWrite;
	}
	

	@Override
	public void attendanceInfo(Attendance attendance, String originalFileName) throws IOException { // �Է� ���� ó��
		
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."), originalFileName.length());
		//System.out.println(originalFileName);
		//System.out.println(extension);
		copyExcel(attendance.getTitle(), extension);
		
		attendance.setRegistrationDate(dateFormatWithTime.format(currentTime));
		attendance.setUploadFileName(attendance.getTitle()+"_����ī������"+extension);
		attendance.setMakedFileName(attendance.getTitle()+"_�л������߰�����"+extension);
		attendance.setFilesLocation(filePath+"/"+dateFormat.format(currentTime));
		
		attendanceMapper.insertAttendance(attendance);
		
		/* ���� ����Ʈ ��� �ϴ��� �𸣰���
		 for(SpamUser user : dataListInfoExist) {
			attendanceMapper.insertAttendanceStudentInfo(user);
		}
		*/
		
		//System.out.println("����");
		//System.out.println(attendance);
		// �� �� ���� �Է�
		// db ���� �ʿ�
	}

	@Override
	public void checkStudent(HashSet<String> set) { // �ش�Ǵ� �л� �ִ��� ��ȸ
		//System.out.println("��°� ���");
		SpamUser spamUser = new SpamUser();
		dataListInfoExist = new ArrayList<SpamUser>();
		dataListInfoUnExist = new ArrayList<String>();
		for(String cardNo : set) {
			spamUser.setCardNo(cardNo);
			if(!(spamUserMapper.select(spamUser) == null)) {			
				//System.out.println(cardNo + "null �ƴ�");
				dataListInfoExist.add(spamUserMapper.select(spamUser));
			}
			else if((spamUserMapper.select(spamUser) == null)){
				//System.out.println(cardNo + "null��");
				dataListInfoUnExist.add(cardNo);
			}
		}
		
		/*for(int i = 0; i< dataListInfoExist.size(); i++) {
			System.out.println(dataListInfoExist.get(i));
		}
		
		System.out.println(dataListInfoExist.size());
		
		
		
		for(int i = 0; i< dataListInfoUnExist.size(); i++) {
			System.out.println(dataListInfoUnExist.get(i));
		}
		
		System.out.println(dataListInfoUnExist.size());
		*/
	}

}
