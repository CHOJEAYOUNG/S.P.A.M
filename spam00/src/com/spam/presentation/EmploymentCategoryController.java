package com.spam.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.spam.domain.EmploymentCategory;
import com.spam.domain.EmploymentType;
import com.spam.service.EmploymentCategoryService;
import com.spam.service.EmploymentTypeService;

@Controller
@RequestMapping(value = "/employmentCategory")
public class EmploymentCategoryController {
	@Resource
	private EmploymentTypeService employmentTypeService;
	@Resource
	private EmploymentCategoryService employmentCategoryService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, EmploymentCategory category, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/list");
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		if("".equals(search) || search == null) {
			search = "0";	
		}
		List<String> purpose = new ArrayList<String>();
		List<String> purposeType = new ArrayList<String>();
		purpose.add(select);
		purpose.add(search);
		purposeType.add("type");
		List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
		List<EmploymentCategory> listCategory = this.employmentCategoryService.find(category, purpose);
		
		modelAndView.addObject("listCategory", listCategory);
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm(EmploymentType type) throws Exception {
		List<String> purposeType = new ArrayList<String>();
		purposeType.add("type");
		List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/add");
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, EmploymentType type, EmploymentCategory category) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/add");
		List<String> purpose = new ArrayList<String>();
		purpose.add("name");
		purpose.add(category.getName());
		List<EmploymentCategory> check = new ArrayList<EmploymentCategory>();
		check = this.employmentCategoryService.find(category, purpose);
		//이름 빔
		if("".equals(category.getName().trim())) {
			List<String> purposeType = new ArrayList<String>();
			purposeType.add("type");
			List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
			String checkName = "카테고리 명이 비어있습니다.";
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("listType", listType);
			
			return modelAndView;
		}
		//이름 중복
		if(!check.isEmpty()) {
			List<String> purposeType = new ArrayList<String>();
			purposeType.add("type");
			List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
			String checkName = "이미 등록된 카테고리입니다.";
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("listType", listType);
			
			return modelAndView;
		}
		
		
		employmentCategoryService.add(category);
		return new ModelAndView(new RedirectView("/employmentCategory/list"));
	}
	
	@RequestMapping(value = "/view/{no}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int no, EmploymentCategory category, EmploymentType type) {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/view");
		
		category = employmentCategoryService.view(no);
		type = this.employmentTypeService.view(category.getEmpTypeNo());
		
		modelAndView.addObject("category", category);
		modelAndView.addObject("typeName", type.getName());
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit/{no}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int no, HttpServletRequest request, EmploymentCategory category, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/edit");
		List<String> purposeType = new ArrayList<String>();
		purposeType.add("type");
		
		List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
		category = employmentCategoryService.view(no);
		modelAndView.addObject("category", category);
		modelAndView.addObject("listType", listType);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, EmploymentCategory category, EmploymentType type) {
		ModelAndView modelAndView = null;

		List<String> purpose = new ArrayList<String>();
		purpose.add("name");
		purpose.add(category.getName());
		
		List<EmploymentCategory> check = this.employmentCategoryService.find(category, purpose);
		//유형 명이 빈칸인지
		if("".equals(category.getName().trim())) {
			String checkName = "카테고리 명을 입력해주세요.";
			List<String> purposeType = new ArrayList<String>();
			purposeType.add("type");
			List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
			modelAndView = new ModelAndView("/employmentCategory/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("category", category);
			modelAndView.addObject("listType", listType);
			
			return modelAndView;
		}
		
		//이미 등록되어 있는지
		if(!check.isEmpty() && !((category.getNo()) == check.get(0).getNo())) {
			String checkName = "이미 등록된 카테고리입니다.";
			List<String> purposeType = new ArrayList<String>();
			purposeType.add("type");
			List<EmploymentType> listType = this.employmentTypeService.find(type, purposeType);
			modelAndView = new ModelAndView("/employmentCategory/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("category", category);
			modelAndView.addObject("listType", listType);
			
			return modelAndView;
		}
		
		
		this.employmentCategoryService.edit(category);
		
		return new ModelAndView(new RedirectView("/employmentCategory/list"));
	}
	
	@RequestMapping(value = "remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove (@PathVariable int no) {
		this.employmentCategoryService.remove(no);
		return new ModelAndView(new RedirectView("/employmentCategory/list"));
	}
}
