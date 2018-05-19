package com.spam.presentation;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.spam.domain.Attendance;
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
	public ModelAndView upload(Attendance attendance,HttpServletRequest request) throws Exception{
		
		System.out.println(attendance.toString()); //테스트
		
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile excelFile = multipartRequest.getFile("uploadfile");
		
		if(excelFile.getOriginalFilename().toUpperCase().endsWith(".XLSX")) {
			attendanceService.excelxlsxRead(excelFile);
		}
		else if(excelFile.getOriginalFilename().toUpperCase().endsWith(".XLS")) {
			attendanceService.excelxlsRead(excelFile);
		}
		
		attendanceService.attendanceInfo(attendance, excelFile.getOriginalFilename());
		
		return new ModelAndView("/attendance/view"); //using error control
	};
	
	/*@RequestMapping(value = "/view", method = RequestMethod.GET) //페이지 이동
	public ModelAndView getView(HttpServletRequest HttpServletRequest) {
		
		return new ModelAndView("/attendance/view"); //using error control
	};
	
	@RequestMapping(value = "/view", method = RequestMethod.POST) //페이지 이동
	public ModelAndView postView(HttpServletRequest HttpServletRequest) {
		
		return new ModelAndView("/attendance/view"); //using error control
	};
	*/
	
	@RequestMapping(value = "/files", method = RequestMethod.POST) //페이지 이동
	public ModelAndView files(HttpServletRequest HttpServletRequest) {
		
		return new ModelAndView("/attendance/view"); //using error control
	};
}
