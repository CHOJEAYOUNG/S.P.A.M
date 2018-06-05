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

import com.spam.domain.EmploymentCategory;
import com.spam.domain.EmploymentType;
import com.spam.service.EmploymentCategoryService;
import com.spam.service.EmploymentTypeService;

@Controller
@RequestMapping(value = "/employmentCategory")
public class EmploymentCategoryController {
	@Autowired
	private EmploymentTypeService employmentTypeService;
	@Autowired
	private EmploymentCategoryService employmentCategoryService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, EmploymentCategory category)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/list");
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		EmploymentType type = null;
		List<EmploymentCategory> listCategory = null;

		if ("name".equals(select)) {
			category.setName(search);
		} else if ("condition".equals(select)) {
			if ("필수".equals(search)) {
				category.setConditionSqeNo(1);
			} else if ("선택".equals(search)) {
				category.setConditionSqeNo(2);
			}
		}

		listCategory = this.employmentCategoryService.find(category);
		List<EmploymentType> listType = this.employmentTypeService.find(type);

		modelAndView.addObject("listCategory", listCategory);
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm(EmploymentType type) throws Exception {
		List<EmploymentType> listType = this.employmentTypeService.find(type);
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/add");
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, EmploymentType type, EmploymentCategory category)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/add");
		List<EmploymentCategory> check = new ArrayList<EmploymentCategory>();
		check = this.employmentCategoryService.find(category);
		// 이름 빔
		if ("".equals(category.getName().trim())) {
			List<EmploymentType> listType = this.employmentTypeService.find(type);
			String checkName = "카테고리 명이 비어있습니다.";
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("listType", listType);

			return modelAndView;
		}
		// 이름 중복
		if (!check.isEmpty()) {
			List<EmploymentType> listType = this.employmentTypeService.find(type);
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
	public ModelAndView editForm(@PathVariable int no, HttpServletRequest request, EmploymentCategory category,
			EmploymentType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employmentCategory/edit");

		List<EmploymentType> listType = this.employmentTypeService.find(type);
		category = employmentCategoryService.view(no);
		modelAndView.addObject("category", category);
		modelAndView.addObject("listType", listType);

		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, EmploymentCategory category, EmploymentType type) {
		ModelAndView modelAndView = null;

		List<EmploymentCategory> check = this.employmentCategoryService.find(category);
		// 유형 명이 빈칸인지
		if ("".equals(category.getName().trim())) {
			String checkName = "카테고리 명을 입력해주세요.";
			List<EmploymentType> listType = this.employmentTypeService.find(type);
			modelAndView = new ModelAndView("/employmentCategory/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("category", category);
			modelAndView.addObject("listType", listType);

			return modelAndView;
		}

		// 이미 등록되어 있는지
		if (!check.isEmpty() && !((category.getNo()) == check.get(0).getNo())) {
			String checkName = "이미 등록된 카테고리입니다.";
			List<EmploymentType> listType = this.employmentTypeService.find(type);
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
	public ModelAndView remove(@PathVariable int no) {
		this.employmentCategoryService.remove(no);
		return new ModelAndView(new RedirectView("/employmentCategory/list"));
	}
}
