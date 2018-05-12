package com.spam.presentation;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spam.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET) //페이지 이동
	public ModelAndView getupload(HttpServletRequest HttpServletRequest) {
		
		return new ModelAndView("/attendance/upload"); //using error control
	};
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(HttpServletRequest request) throws Exception{
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile excelFile = multipartRequest.getFile("uploadFileName");
		
		if(excelFile.getOriginalFilename().toUpperCase().endsWith(".XLSX")) {
			attendanceService.excelxlsxRead(excelFile);
		}
		else if(excelFile.getOriginalFilename().toUpperCase().endsWith(".XLS")) {
			attendanceService.excelxlsRead(excelFile);
		}
		
		return new ModelAndView("/attendace/upload"); //using error control
	};
}
