package com.spam.presentation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spam.domain.Enrollment;
import com.spam.domain.SpamUser;
import com.spam.persistence.EnrollmentMapper;
import com.spam.service.SpamUserService;



@Controller
@RequestMapping("/spamUser")
public class SpamUserController {
	@Autowired
	private SpamUserService spamUserService;
	
	@RequestMapping(value = "/viewS", method = RequestMethod.GET)
	public ModelAndView viewS(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/view");
		String id = request.getParameter("id");
		int intId = Integer.parseInt(id);
		spamuser.setId(intId);
		
		spamuser = spamUserService.view(spamuser);
		modelAndView.addObject("spamuser", spamuser);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
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
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(SpamUser spamuser, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/list");

		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		modelAndView.addObject("listSpam", listSpam);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public ModelAndView edit(@PathVariable String id, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("/spamUser/view");
		SpamUser spamuser = new SpamUser();
		int intId = Integer.parseInt(id);
		spamuser.setId(intId);
		
		spamuser = spamUserService.view(spamuser);
		modelAndView.addObject("spamuser", spamuser);
		
		List<Enrollment> enrollment = spamUserService.enrollments();
		modelAndView.addObject("enrollment",enrollment);
		
		return modelAndView;
	}
}
