package com.spam.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.EmploymentType;
import com.spam.service.EmploymentTypeService;

@Controller
@RequestMapping(value = "/employmentType")
public class EmploymentTypeController {
	@Resource
	private EmploymentTypeService employmentTypeService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentType/list");
		List<EmploymentType> listType = null;
		String search = request.getParameter("search");
		String select = request.getParameter("select");
		if("".equals(search) || search == null) {
			search = "0";	
		}
		
		if("year".equals(select)) {	//연도 검색
			listType = this.employmentTypeService.viewYear(Integer.parseInt(search));
		} else if("type".equals(select)) { //유형 검색
			type = employmentTypeService.view(search);

			if(type == null) {
				modelAndView.addObject("listType", type);
				return modelAndView;
			}
			listType = new ArrayList<>();
			listType.add(0, type);
		} else {
			listType = this.employmentTypeService.find(type);
		}
		
		modelAndView.addObject("select", select);
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm() throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentType/add");
		return modelAndView;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = null;
		String name = request.getParameter("name");
		int required = Integer.parseInt(request.getParameter("required"));
		
		if("".equals(type.getName().trim())) {
			String checkName = "유형을 입력해주세요.";
			
			modelAndView = new ModelAndView("/employmentType/add");
			modelAndView.addObject("checkName", checkName);
			
			return modelAndView;
		}
		
		if(this.employmentTypeService.view(type.getName()) != null) {
			String checkName = "이미 등록되어 있습니다.";
			
			modelAndView = new ModelAndView("/employmentType/add");
			modelAndView.addObject("checkName", checkName);
			
			return modelAndView;
		}
		
		employmentTypeService.add(type);
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView editForm(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = null;
		int no = Integer.parseInt(request.getParameter("no"));
		type = employmentTypeService.viewNumber(no);
		
		String name = type.getName();
		String year = String.valueOf(type.getYear());
		String required = String.valueOf(type.getRequired());
		String choice = String.valueOf(type.getChoice());
		String state = String.valueOf(type.getState());
		
		modelAndView = new ModelAndView("/employmentType/edit");
		modelAndView.addObject("no", no);
		modelAndView.addObject("name",name);
		modelAndView.addObject("year",year);
		modelAndView.addObject("required",required);
		modelAndView.addObject("choice",choice);
		modelAndView.addObject("state", state);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = null;
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String year = request.getParameter("year");
		String required = request.getParameter("required");
		String choice = request.getParameter("choice");
		String state = request.getParameter("state");
		
		EmploymentType check = employmentTypeService.view(name);
		
		if("".equals(type.getName().trim())) {
			String checkName = "유형을 입력해주세요.";
			
			modelAndView = new ModelAndView("/employmentType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("no", no);
			modelAndView.addObject("year", year);
			modelAndView.addObject("required", required);
			modelAndView.addObject("choice", choice);
			modelAndView.addObject("state", state);
			
			return modelAndView;
		}
		
		if(!no.equals(name) || !"".equals(check.getName().trim())) {
			String checkName = "이미 등록된 유형 입니다.";
			
			modelAndView = new ModelAndView("/employmentType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("no", no);
			modelAndView.addObject("year", year);
			modelAndView.addObject("required", required);
			modelAndView.addObject("choice", choice);
			modelAndView.addObject("state", state);

		}
		
		employmentTypeService.edit(type);
		
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
	
	@RequestMapping(value = "/remove", method = RequestMethod.GET)
	public ModelAndView remove(HttpServletRequest request) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println("옴");
		employmentTypeService.remove(no);
		
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
}
