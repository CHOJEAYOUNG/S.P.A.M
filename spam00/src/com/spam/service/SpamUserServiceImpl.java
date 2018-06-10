package com.spam.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.spam.domain.EmploymentType;
import com.spam.domain.Enrollment;
import com.spam.domain.GraduationType;
import com.spam.domain.SpamUser;
import com.spam.persistence.EnrollmentMapper;
import com.spam.persistence.SpamUserMapper;

@Service
public class SpamUserServiceImpl implements SpamUserService {

	@Resource
	private SpamUserMapper spamUserMapper;
	@Resource
	private EnrollmentMapper enrollmentMapper;
	@Resource
	private EmploymentTypeService employmentTypeService;
	@Resource
	private GraduationTypeService graduationTypeService;

	XSSFWorkbook xexcelOpen;

	@Override
	public SpamUser view(SpamUser spamuser) {
		spamuser = spamUserMapper.select(spamuser);

		spamuser.setPhoneNo1(spamuser.getPhoneNo().split("[-]")[0]);
		spamuser.setPhoneNo2(spamuser.getPhoneNo().split("[-]")[1]);
		spamuser.setPhoneNo3(spamuser.getPhoneNo().split("[-]")[2]);

		return spamuser;
	}

	  @Override
	   public List<SpamUser> listPop(SpamUser spamuser) {
	      spamuser.setPower("P");
	      return this.spamUserMapper.listP(spamuser);
	   }
	
	@Override
	public List<SpamUser> list(SpamUser spamuser, HttpServletRequest request) {
		HttpSession session = request.getSession(false);

		List<SpamUser> listSpamUser = spamUserMapper.list(spamuser);

		if ("A".equals(session.getAttribute("power"))) {
			return listSpamUser;
		} else {
			int id = (int) session.getAttribute("id");
			for (int i = 0; i < listSpamUser.size(); i++) {
				if ("A".equals(listSpamUser.get(i).getPower())) {
					listSpamUser.remove(i);
					i = -1;
				} else if ("P".equals(listSpamUser.get(i).getPower()) && id != listSpamUser.get(i).getId()) {
					listSpamUser.remove(i);
					i = -1;
				}
			}
			return listSpamUser;
		}
	}

	@Override
	public List<Enrollment> enrollments() {
		return enrollmentMapper.select();
	}

	@Override
	@Transactional
	public void edit(SpamUser spamuser) {
		spamuser.setPhoneNo(spamuser.getPhoneNo1() + "-" + spamuser.getPhoneNo2() + "-" + spamuser.getPhoneNo3());
		spamUserMapper.update(spamuser);

	}

	@Override
	@Transactional
	public void add(SpamUser spamuser) {
		spamuser.setPhoneNo(spamuser.getPhoneNo1() + "-" + spamuser.getPhoneNo2() + "-" + spamuser.getPhoneNo3());
		spamuser.setPassWord(spamuser.getBirthDate());
		System.out.println(spamuser.toString());

		if (spamuser.getOffice() != null) {
			spamuser.setPower("P");
			spamUserMapper.insertP(spamuser);
		} else {
			spamuser.setPower("S");
			spamuser.setOffice("");
			spamUserMapper.insertS(spamuser);
		}
	}

	@Override
	@Transactional
	public void excelxlsxRead(SpamUser spamuser, MultipartFile excelFile) throws IOException {
		xexcelOpen = new XSSFWorkbook(excelFile.getInputStream());
		XSSFSheet sheet; // sheet creat

		HashSet<String> set = new HashSet<>();
		int idNo = 0;
		int nameNo = 0;
		int gradeNo = 0;
		int majorNo = 0;
		int phoneNo = 0;
		int birthDateNo = 0;
		int cardNo = 0;

		for (int j = 0; j < xexcelOpen.getNumberOfSheets(); j++) {
			sheet = xexcelOpen.getSheetAt(j);
			for (Row row : sheet) {
				if (row == sheet.getRow(0)) {
					for (int i = row.getFirstCellNum(); i < row.getLastCellNum(); i++) {
						if ("ID".equals(row.getCell(i).getStringCellValue())) {
							idNo = i;
						} else if ("NAME".equals(row.getCell(i).getStringCellValue())) {
							nameNo = i;
						} else if ("GRADE".equals(row.getCell(i).getStringCellValue())) {
							gradeNo = i;
						} else if ("MAJOR".equals(row.getCell(i).getStringCellValue())) {
							majorNo = i;
						} else if ("PHONE_NO".equals(row.getCell(i).getStringCellValue())) {
							phoneNo = i;
						} else if ("BIRTH_DATE".equals(row.getCell(i).getStringCellValue())) {
							birthDateNo = i;
						}
					}
				} else if (row != sheet.getRow(0)) {
					EmploymentType type = new EmploymentType();
					List<EmploymentType> listEmp = new ArrayList<EmploymentType>();
					listEmp = employmentTypeService.find(type);

					GraduationType type2 = new GraduationType();
					List<GraduationType> listGr = new ArrayList<GraduationType>();
					listGr = graduationTypeService.find(type2);
					List<SpamUser> listSU = spamUserMapper.list(new SpamUser());
					SpamUser spamUserTemp = new SpamUser();
					spamUserTemp.setId((int) row.getCell(idNo).getNumericCellValue());
					spamUserTemp.setName(row.getCell(nameNo).getStringCellValue());
					spamUserTemp.setGrade((int) row.getCell(gradeNo).getNumericCellValue());
					spamUserTemp.setMajor(row.getCell(majorNo).getStringCellValue());
					spamUserTemp.setPhoneNo(row.getCell(phoneNo).getStringCellValue());
					spamUserTemp.setPower("S");
					spamUserTemp.setBirthDate(String.valueOf((int) row.getCell(birthDateNo).getNumericCellValue()));
					spamUserTemp.setPassWord(String.valueOf((int) row.getCell(birthDateNo).getNumericCellValue()));
					spamUserTemp.setEnrollment(1);
					int b = Integer.parseInt(String.valueOf(spamUserTemp.getId()).substring(0, 4));
					System.out.println(b);
					int areEmp[] = new int[listEmp.size()];
					int cemp=0;
					
					for (int r = 0; r < listEmp.size(); r++) {
						areEmp[r] = (listEmp.get(r).getYear()) - b;
					}
					int temp=-100;
					for(int r = 0; r < areEmp.length; r++) {
						if(areEmp[r] < 1) {
							if(areEmp[r] == 0 ) {
								cemp = r;
								break;
							} else {
								if(areEmp[r] > temp) {
									temp = areEmp[r];
									cemp = r;
								}
							}
						}
					}
					spamUserTemp.setEmpNo(listEmp.get(cemp).getNo());
					spamUserTemp.setGrNo(1);
					
					int areGr[] = new int[listGr.size()];
					int cgr=0;
					
					for (int r = 0; r < listGr.size(); r++) {
						areGr[r] = (listGr.get(r).getYear()) - b;
					}
					int temp2 = areGr.length;
					for(int r = 0; r < areGr.length; r++) {
						if(areGr[r] <= 0) {
							if(areGr[r] == 0 ) {
								cgr = r;
								break;
							} else {
								if(areEmp[r] > temp2) {
									temp2 = areGr[r];
									cgr = r;
								}
							}
						}
					}
					spamUserTemp.setGrNo(listGr.get(cgr).getNo());
					System.out.println(spamUserTemp.toString());
					int yay = wndqhr(spamUserTemp);
					if(yay == 0) {
						spamUserMapper.listInsertS(spamUserTemp);
					}
				}
			}
		}
	}
	public int wndqhr(SpamUser spamuser) {
		SpamUser spam = new SpamUser();
		spam.setId(spamuser.getId());
		spam = spamUserMapper.select(spam);
		
		if(spam != null) {
			return 1;
		} else {
			return 0;
		}
	}
}