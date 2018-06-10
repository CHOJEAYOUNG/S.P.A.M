package com.spam.presentation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Redirect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.Attend;
import com.spam.domain.Attendance;
import com.spam.domain.SpamUser;
import com.spam.service.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView getupload(HttpServletRequest HttpServletRequest) {
		
		return new ModelAndView("/attendance/upload"); //using error control
	};
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(Attendance attendance,HttpServletRequest request) throws Exception{
		
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile excelFile = multipartRequest.getFile("uploadfile");
		if(excelFile.getOriginalFilename().toUpperCase().endsWith(".XLSX")) {
			attendanceService.excelxlsxRead(excelFile);
		}
		
		attendance.setLectureTime(attendance.getLectureTime_hour()+ ":" + attendance.getLectureTime_min());
		System.out.println("====="+attendance.getLectureTime());
		attendanceService.attendanceInfo(attendance, excelFile.getOriginalFilename());
		
		return new ModelAndView(new RedirectView("/attendance/view/"+attendance.getAttendanceNo())); //using error control
	};
	
	@RequestMapping(value = "/fileU/{fileNum}", method = RequestMethod.GET) 
	public ModelAndView filesUpload(@PathVariable int fileNum,  HttpServletResponse response) throws IOException {
		Attendance attendance = new Attendance();
		attendance.setUploadFileNameWithS(fileNum);
		attendanceService.download(attendance, response);
		
		return new ModelAndView("/attendance/view"); //using error control
	};
	
	@RequestMapping(value = "/fileM/{fileNum}", method = RequestMethod.GET)
	public ModelAndView filesMaked(@PathVariable int fileNum,  HttpServletResponse response) throws IOException {
		Attendance attendance = new Attendance();
		attendance.setMakedFileNameWithS(fileNum);
		attendanceService.download(attendance, response);
		
		return new ModelAndView("/attendance/view"); //using error control
	};
	
	@RequestMapping(value = "/list" , method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest HttpServletRequest) {
		List<Attendance> attendanceList = attendanceService.list();
		
		ModelAndView modelAndView = new ModelAndView("/attendance/list");
		modelAndView.addObject("attendanceList", attendanceList);
		return modelAndView;
	}
	
	@RequestMapping(value = "/list" , method = RequestMethod.POST)
	public ModelAndView listPost(HttpServletRequest request) {
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		//System.out.println(select + ",,,,"+ search);
		
		List<Attendance> attendanceList = new ArrayList<Attendance>();
		
		if(search == null || search.equals("")) {
			attendanceList = attendanceService.list();
		}
		else {
			if("location".equals(select)) {
				for(Attendance attendance : attendanceService.list()) {
					if(attendance.getLocation().contains(search)) {
						attendanceList.add(attendance);
					}
				}
			}else if("title".equals(select)) {
				for(Attendance attendance : attendanceService.list()) {
					if(attendance.getTitle().contains(search)) {
						attendanceList.add(attendance);
					}
				}
			}else if("score".equals(select)){
				for(Attendance attendance : attendanceService.list()) {
					if( Integer.parseInt(search) ==attendance.getScore()) {
						attendanceList.add(attendance);
					}
				}
			}
		}
		
		ModelAndView modelAndView = new ModelAndView("/attendance/list");
		modelAndView.addObject("attendanceList", attendanceList);
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/view/{attendanceNo}" , method = RequestMethod.GET)
	public ModelAndView listGet(@PathVariable int attendanceNo,  HttpServletRequest HttpServletRequest) {
	
		Attendance attendance = new Attendance();
		attendance = attendanceService.selectOne(attendanceNo);
		
		Attend attend = new Attend();
		attend.setAttendanceNo(attendanceNo);
		
		List<SpamUser> listStudent =  attendanceService.listStudents(attend);
		
		ModelAndView modelAndView = new ModelAndView("/attendance/view");
		modelAndView.addObject("listStudent", listStudent);
		modelAndView.addObject("attendance", attendance);
		return modelAndView;
	}
	
	@RequestMapping(value = "/remove/{attendanceNo}" , method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int attendanceNo,  HttpServletRequest HttpServletRequest) {
		attendanceService.delete(attendanceNo);
		
		return new ModelAndView(new RedirectView("/attendance/list"));
	}
}
