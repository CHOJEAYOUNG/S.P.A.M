package com.spam.presentation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.Employment;
import com.spam.domain.EmploymentCategory;
import com.spam.domain.EmploymentType;
import com.spam.domain.Enrollment;
import com.spam.domain.GraduationType;
import com.spam.domain.SpamUser;
import com.spam.service.EmploymentCategoryService;
import com.spam.service.EmploymentService;
import com.spam.service.EmploymentTypeService;
import com.spam.service.GraduationCategoryService;
import com.spam.service.GraduationService;
import com.spam.service.GraduationTypeService;
import com.spam.service.SpamUserService;


@Controller
@RequestMapping("/spamUser")
public class SpamUserController {
	@Autowired
	private SpamUserService spamUserService;
	
	@Autowired
	private EmploymentCategoryService employmentCategoryService;
	
	@Autowired
	private EmploymentService employmentService;
	
	@Autowired
	private GraduationCategoryService graduationCategoryService;
	
	@Autowired
	private GraduationService graduationService;
	
	@Autowired
	private GraduationTypeService graduationTypeService;
	
	@Autowired
	private EmploymentTypeService employmentTypeService;
	
	@RequestMapping(value = "/viewS", method = RequestMethod.GET)
	public ModelAndView viewS(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/view");
		EmploymentCategory category = new EmploymentCategory();
		String id = request.getParameter("id");
		int intId = Integer.parseInt(id);
		spamuser.setId(intId);
		
		spamuser = spamUserService.view(spamuser);
		modelAndView.addObject("spamuser", spamuser);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		List<String> purpose = new ArrayList<String>();
		purpose.add("name");
		List<EmploymentCategory> empCategory = employmentCategoryService.find(category, purpose);
		modelAndView.addObject("empCategory",empCategory);
		
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/viewPA/{id}", method = RequestMethod.GET)
	public ModelAndView viewPA(@PathVariable String id, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/view");
		SpamUser spamuser = new SpamUser();
		int intId = Integer.parseInt(id);
		spamuser.setId(intId);
		
		spamuser = spamUserService.view(spamuser);
		modelAndView.addObject("spamuser", spamuser);
		
		EmploymentCategory category = new EmploymentCategory();
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
		List<String> purpose = new ArrayList<String>();
		purpose.add("name");
		List<EmploymentCategory> empCategory = employmentCategoryService.find(category, purpose);
		modelAndView.addObject("empCategory",empCategory);
		
		
		Employment employment = new Employment();
		employment.setId(spamuser.getId());
		employment.setAssentNo(1);
		List<Employment> employmentP = employmentService.find(employment);
		modelAndView.addObject("listEmp",employmentP);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView getList(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/list");
		
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		modelAndView.addObject("listSpam", listSpam);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public ModelAndView postList(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/list");
		String select =  request.getParameter("select");
		String context = request.getParameter("search");
		List<SpamUser> listSpam = new ArrayList<SpamUser>();
		
		if(context == null || context == "") {
			return new ModelAndView(new RedirectView("/spamUser/list"));
		}
		
		if("1".equals(select)) {
			String temp = null;
			for(SpamUser spamuserTest : spamUserService.list(new SpamUser(), request)) {
				temp =  Integer.toString(spamuserTest.getId());
				if(temp.contains(context)) {
					listSpam.add(spamuserTest);
				}
			}
		}else if("2".equals(select)) {
			String temp = null;
			for(SpamUser spamuserTest : spamUserService.list(new SpamUser(), request)) {
				temp = spamuserTest.getName();
				if(temp.contains(context)) {
					listSpam.add(spamuserTest);
				}
			}
		}else if("3".equals(select)) {
			String temp = null;
			for(SpamUser spamuserTest : spamUserService.list(new SpamUser(), request)) {
				if("S".equals(spamuserTest.getPower())) {
					temp = "학생";
				}
				if("P".equals(spamuserTest.getPower())) {
					temp = "교수";
				}
				if("A".equals(spamuserTest.getPower())) {
					temp = "조교";
				}
				if(temp.contains(context)) {
					listSpam.add(spamuserTest);
				}
			}
		}
		modelAndView.addObject("listSpam", listSpam);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable String id, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/edit");
		SpamUser spamuser = new SpamUser();
		int intId = Integer.parseInt(id);
		spamuser.setId(intId);
		
		spamuser = spamUserService.view(spamuser);
		modelAndView.addObject("spamuser", spamuser);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView postedit(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/list");
		spamUserService.edit(spamuser);
		
		return new ModelAndView(new RedirectView("/spamUser/list"));
	}
	
	@RequestMapping(value = "/oneAddS", method = RequestMethod.GET)
	public ModelAndView oneAddS(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/addS");
		return modelAndView;
	}
	
	@RequestMapping(value = "/oneAdd", method = RequestMethod.POST)
	public ModelAndView oneAdd(SpamUser spamuser, HttpServletRequest request) {
		spamUserService.add(spamuser);
		return new ModelAndView(new RedirectView("/spamUser/list"));
	}
	
	@RequestMapping(value = "/oneAddP", method = RequestMethod.GET)
	public ModelAndView oneAddP(SpamUser spamuser, HttpServletRequest request) {
		return new ModelAndView("/spamUser/addP");
	}
	
	@RequestMapping(value = "/listAdd", method = RequestMethod.GET)
	public ModelAndView getListAdd(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/listAdd");
		
		EmploymentType type = new EmploymentType();
		List<String> purpose = new ArrayList<String>();
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		purpose.add(select);
		purpose.add(search);
		List<EmploymentType> listEmp = new ArrayList<EmploymentType>();
		listEmp = employmentTypeService.find(type, purpose);
		modelAndView.addObject("listEmp",listEmp);
		
		
		GraduationType type2 = new GraduationType();
		List<GraduationType> listGr = new ArrayList<GraduationType>();
		listGr = graduationTypeService.find(type2, purpose);
		modelAndView.addObject("listGr",listGr);
		return modelAndView;
	}
	
	@RequestMapping(value = "/listAdd", method = RequestMethod.POST)
	public ModelAndView postListAdd(SpamUser spamuser, HttpServletRequest request) {
		MultipartRequest multipartRequest = (MultipartRequest) request;
		MultipartFile excelFile = multipartRequest.getFile("uploadfile");
		
		if(excelFile.getOriginalFilename().toUpperCase().endsWith(".XLSX")) {
			try {
				spamUserService.excelxlsxRead(spamuser, excelFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return new ModelAndView(new RedirectView("/spamUser/list"));
	}
}
