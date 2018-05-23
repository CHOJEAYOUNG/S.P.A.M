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

import com.spam.domain.EmploymentType;
import com.spam.service.EmploymentCategoryService;
import com.spam.service.EmploymentTypeService;

@Controller
@RequestMapping(value = "/employmentType")
public class EmploymentTypeController {
	@Resource
	private EmploymentTypeService employmentTypeService;
	@Resource
	private EmploymentCategoryService employmentCategoryService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentType/list");
		List<EmploymentType> listType = null;
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		if("".equals(search) || search == null) {
			search = "0";	
		}
		
		List<String> purpose = new ArrayList<String>();
		purpose.add(select);
		purpose.add(search);
		
		listType = this.employmentTypeService.find(type, purpose);
		
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
		List<String> purpose = new ArrayList<String>();
		purpose.add("type");
		purpose.add(type.getName());
		
		List<EmploymentType> check = this.employmentTypeService.find(type, purpose);
		
		if("".equals(type.getName().trim())) {
			String checkName = "유형을 입력하세요.";
			
			modelAndView = new ModelAndView("/employmentType/add");
			modelAndView.addObject("checkName", checkName);
			
			return modelAndView;
		}
		
		
		if(!check.isEmpty()) {
			String checkName = "이미 유형이 존재합니다";
					
			modelAndView = new ModelAndView("/employmentType/add");
			modelAndView.addObject("checkName", checkName);
			
			return modelAndView;
		}
		
		employmentTypeService.add(type);
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
	public ModelAndView edit(HttpServletRequest request, EmploymentType type) throws Exception {
		ModelAndView modelAndView = null;

		List<String> purpose = new ArrayList<String>();
		purpose.add("type");
		purpose.add(type.getName());
		
 		List<EmploymentType> check = this.employmentTypeService.find(type, purpose);
		
		if("".equals(type.getName().trim())) {
			String checkName = "������ �Է����ּ���.";
			
			modelAndView = new ModelAndView("/employmentType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("type", type);
			
			return modelAndView;
		}
		
		if(!check.isEmpty() && !((type.getNo()) == check.get(0).getNo())) {
			String checkName = "�̹� ��ϵ� ���� �Դϴ�.";
					
			modelAndView = new ModelAndView("/employmentType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("type", type);
					
			return modelAndView;
		}	
		employmentTypeService.edit(type);
		
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
	
	@RequestMapping(value = "/remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no) throws Exception {
		employmentTypeService.remove(no);
		employmentCategoryService.remove(no);
		return new ModelAndView(new RedirectView("/employmentType/list"));
	}
}
