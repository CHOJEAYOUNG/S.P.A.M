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
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.EmploymentType;
import com.spam.service.EmploymentCategoryService;
import com.spam.service.EmploymentTypeService;

@Controller
@RequestMapping(value = "/employmentType")
public class EmploymentTypeController {
	@Autowired
	private EmploymentTypeService employmentTypeService;
	@Autowired
	private EmploymentCategoryService employmentCategoryService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentType/list");
		List<EmploymentType> listType = new ArrayList<EmploymentType>();
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		
		if("type".equals(select)) {
			type.setName(search);
		} else if ("year".equals(select)) {
			type.setYear(Integer.parseInt(search));
		}
		listType = this.employmentTypeService.find(type);
		
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
	public ModelAndView add(HttpServletRequest request, EmploymentType employmentType) throws Exception {
		ModelAndView modelAndView = null;
		EmploymentType type = new EmploymentType();
		type.setName(employmentType.getName());
		List<EmploymentType> check = this.employmentTypeService.find(type);
		
		if("".equals(employmentType.getName().trim())) {
			String checkName = "유형을 입력해주세요.";
			
			modelAndView = new ModelAndView("/employmentType/add");
			modelAndView.addObject("checkName", checkName);
			
			return modelAndView;
		}
		
		
		if(!check.isEmpty()) {
			String checkName = "이미 등록된 유형 입니다.";
					
			modelAndView = new ModelAndView("/employmentType/add");
			modelAndView.addObject("checkName", checkName);
			
			return modelAndView;
		}
		
		employmentTypeService.add(employmentType);
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
	
	@RequestMapping(value = "/edit/{no}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int no, HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentType/edit");
		type = employmentTypeService.view(no);
		modelAndView.addObject("type", type);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, EmploymentType employmentType) throws Exception {
		ModelAndView modelAndView = null;
		EmploymentType type = new EmploymentType();
		type.setName(employmentType.getName());
		List<EmploymentType> check = this.employmentTypeService.find(type);
		
		if("".equals(employmentType.getName().trim())) {
			String checkName = "유형을 입력해주세요.";
			
			modelAndView = new ModelAndView("/employmentType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("type", employmentType);
			
			return modelAndView;
		}
		
		if(!check.isEmpty() && !((employmentType.getNo()) == check.get(0).getNo())) {
			String checkName = "이미 등록된 유형 입니다.";
					
			modelAndView = new ModelAndView("/employmentType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("type", employmentType);
					
			return modelAndView;
		}	
		employmentTypeService.edit(employmentType);
		
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
	
	@RequestMapping(value = "/remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no) throws Exception {
		employmentTypeService.remove(no);
		employmentCategoryService.remove(no);
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
}
