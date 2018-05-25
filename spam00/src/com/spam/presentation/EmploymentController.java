package com.spam.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spam.domain.Employment;
import com.spam.domain.EmploymentCategory;
import com.spam.domain.EmploymentType;
import com.spam.domain.SpamUser;
import com.spam.service.EmploymentCategoryService;
import com.spam.service.EmploymentService;
import com.spam.service.EmploymentTypeService;
import com.spam.service.SpamUserService;


@Controller
@RequestMapping(value = "/employment")
public class EmploymentController {
	@Autowired
	private EmploymentService employmentService;
	@Autowired
	private EmploymentCategoryService employmentCategoryService;
	@Autowired
	private EmploymentTypeService employmentTypeService;
	@Autowired
	private SpamUserService spamUserService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, Employment employment, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/list");
		String id = request.getParameter("id");
		if(!("".equals(id) || id == null)) {
			List<Employment> listEmp = employmentService.find(Integer.parseInt(id));
			if(listEmp.size() != 0) {
				spamuser.setId(Integer.parseInt(id));
				spamuser = spamUserService.view(spamuser);
				modelAndView.addObject("spamuser", spamuser);
			}
			modelAndView.addObject("listEmp", listEmp);
			
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/view/{emplNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int emplNo, HttpServletRequest request, Employment employment, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/view");
		
		employment = employmentService.view(emplNo);
		spamuser.setId(employment.getId());
		spamuser = spamUserService.view(spamuser);
		
		if (0 != employment.getEmpcNo()) {
			EmploymentCategory category = employmentCategoryService.view(employment.getAttendanceNo());
			modelAndView.addObject("category", category);
		}
		modelAndView.addObject("employment", employment);
		modelAndView.addObject("spamuser", spamuser);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/selectAttendance", method = RequestMethod.GET)
	public ModelAndView selectAttendance(HttpServletRequest request, Employment employment, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/selectAttendance");
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		modelAndView.addObject("listSpam", listSpam);
		System.out.println("ºñ±³°ú ¿È");
		System.out.println(employment.getId());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/searchE", method = RequestMethod.GET)
	public ModelAndView searchE(HttpServletRequest request, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/searchE");
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		String search = request.getParameter("search");
		String select = request.getParameter("select");
		System.out.println("search - " + search);
		System.out.println("select - " + select);
		
		if("".equals(search) || search == null) {
			modelAndView.addObject("listSpam", listSpam);
			return modelAndView;
		}
		if("id".equals(select)) {
			for(int i = 0 ; i < listSpam.size() ; i++ ) {
				if(!search.equals(String.valueOf(listSpam.get(i).getId()))) {
					listSpam.remove(i);
					i = 0;
				}
			}
		} else if("name".equals(select)) {
			for(int i = 0 ; i < listSpam.size() ; i++ ) {
				if(!search.equals(listSpam.get(i).getName())) {
					listSpam.remove(i);
					i = 0;
				}
			}
		}
		modelAndView.addObject("listSpam", listSpam);
		return modelAndView;
	}
	
	@RequestMapping(value = "/selectEmployment", method = RequestMethod.GET)
	public ModelAndView selectEmploymentForm(HttpServletRequest request, Employment employment, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/selectEmployment");
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		modelAndView.addObject("listSpam", listSpam);
		System.out.println("emp get");
		return modelAndView;
	}
	
	@RequestMapping(value = "/selectEmployment", method = RequestMethod.POST)
	public ModelAndView selectEmployment(HttpServletRequest request, Employment employment, SpamUser spamuser, EmploymentCategory category, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/selectEmployment");
		System.out.println("emp post");
		String id = request.getParameter("id");
		System.out.println(id);
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		for(int i = 0 ; i < listSpam.size() ; i++) {
			if(!id.equals(String.valueOf(listSpam.get(i).getId()))) {
				listSpam.remove(i);
			}
		}
		SpamUser user = listSpam.get(0);
		List<String> purpose = new ArrayList<String>();
		List<String> purposeType = new ArrayList<String>();
		purpose.add("name");
		purposeType.add("type");
		
		List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
		List<EmploymentCategory> listCategory = this.employmentCategoryService.find(category, purpose);
		modelAndView.addObject("listCategory", listCategory);
		modelAndView.addObject("listType", listType);
		modelAndView.addObject("listSpam", listSpam);
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	@RequestMapping(value = "/select", method = RequestMethod.GET)
	public ModelAndView selectForm(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/select");
		System.out.println("select");
		return modelAndView;
	}
	
	@RequestMapping(value = "/confirm", method = RequestMethod.GET)
	public ModelAndView confirmForm() throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/confirm");
		System.out.println("add get");
		return modelAndView;
	}
	
	@RequestMapping(value = "/confirm", method = RequestMethod.POST)
	public ModelAndView confirm(HttpServletRequest request, Employment employment, EmploymentCategory category) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/confirm");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		category = this.employmentCategoryService.view(Integer.parseInt(request.getParameter("no")));
		modelAndView.addObject("category", category);
		modelAndView.addObject("id", id);
		modelAndView.addObject("nameS", name);
		return modelAndView;
	}
}
