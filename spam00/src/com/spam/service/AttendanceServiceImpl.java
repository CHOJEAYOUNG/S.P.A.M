package com.spam.service;

import java.io.IOException;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.Column;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class AttendanceServiceImpl implements AttendanceService{


	@Override
	public void excelxlsxRead(MultipartFile excelFile) throws IOException {
		System.out.println(excelFile.getOriginalFilename());
		
		XSSFWorkbook xexcelOpen = new XSSFWorkbook(excelFile.getInputStream()); 
		XSSFSheet sheet; 
		
		System.out.println(xexcelOpen.getNumberOfSheets());
		
		for(int j=0; j<xexcelOpen.getNumberOfSheets(); j++) {
			sheet = xexcelOpen.getSheetAt(j); // 해당 엑셀파일의 시트(Sheet) 수
			for(Row row : sheet) {
				for(int i=row.getFirstCellNum(); i<row.getLastCellNum(); i++ ){	
					System.out.print(row.getCell(i) +", ");	
					if(row.getCell(i).getCellType() == Cell.CELL_TYPE_NUMERIC) {
						System.out.print("숫자임" + (int)row.getCell(i).getNumericCellValue());
					}
				}
				System.out.println();
			}
		}
	}

	@Override
	public void excelxlsRead(MultipartFile excelFile) throws IOException {
		// TODO Auto-generated method stub
		HSSFWorkbook hexcelOpen = new HSSFWorkbook(excelFile.getInputStream());
	}


}
