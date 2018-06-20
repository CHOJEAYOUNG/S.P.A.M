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

import com.spam.domain.GraduationCategory;
import com.spam.domain.GraduationType;
import com.spam.service.GraduationCategoryService;
import com.spam.service.GraduationTypeService;

@Controller
@RequestMapping(value = "/graduationCategory")
public class GraduationCategoryController {
	@Autowired
	private GraduationTypeService graduationTypeService;
	@Autowired
	private GraduationCategoryService graduationCategoryService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, GraduationCategory category) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduationCategory/list");
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		GraduationType type = new GraduationType();
		List<GraduationCategory> listCategory = null;

		if ("name".equals(select)) {
			category.setName(search);
		} else if ("condition".equals(select)) {
			if ("필수".equals(search)) {
				category.setConditionSqeNo(1);
			} else if ("선택".equals(search)) {
				category.setConditionSqeNo(2);
			}
		}

		listCategory = this.graduationCategoryService.find(category);
		List<GraduationType> listType = this.graduationTypeService.find(type);

		modelAndView.addObject("listCategory", listCategory);
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm(GraduationType type) throws Exception {
		List<GraduationType> listType = this.graduationTypeService.find(type);
		ModelAndView modelAndView = new ModelAndView("/graduationCategory/add");
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, GraduationCategory category, GraduationType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduationCategory/add");
		List<GraduationCategory> check = new ArrayList<GraduationCategory>();
		check = this.graduationCategoryService.find(category);
		// 이름 빔
		if ("".equals(category.getName().trim())) {
			List<GraduationType> listType = this.graduationTypeService.find(type);
			String checkName = "카테고리 명이 비어있습니다.";
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("listType", listType);

			return modelAndView;
		}
		// 이름 중복
		if (!check.isEmpty()) {
			List<GraduationType> listType = this.graduationTypeService.find(type);
			String checkName = "이미 등록된 카테고리입니다.";
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("listType", listType);

			return modelAndView;
		}

		graduationCategoryService.add(category);
		return new ModelAndView(new RedirectView("/graduationCategory/list"));
	}

	@RequestMapping(value = "/view/{no}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int no, GraduationCategory category, GraduationType type) {
		ModelAndView modelAndView = new ModelAndView("/graduationCategory/view");

		category = graduationCategoryService.view(no);
		type = this.graduationTypeService.view(category.getGrTypeNo());

		modelAndView.addObject("category", category);
		modelAndView.addObject("typeName", type.getName());

		return modelAndView;
	}

	@RequestMapping(value = "/edit/{no}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int no, HttpServletRequest request, GraduationCategory category,
			GraduationType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduationCategory/edit");

		List<GraduationType> listType = this.graduationTypeService.find(type);
		category = graduationCategoryService.view(no);
		modelAndView.addObject("category", category);
		modelAndView.addObject("listType", listType);

		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, GraduationCategory category, GraduationType type) {
		ModelAndView modelAndView = null;

		List<GraduationCategory> check = this.graduationCategoryService.find(category);
		// 유형 명이 빈칸인지
		if ("".equals(category.getName().trim())) {
			String checkName = "카테고리 명을 입력해주세요.";
			List<GraduationType> listType = this.graduationTypeService.find(type);
			modelAndView = new ModelAndView("/graduationCategory/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("category", category);
			modelAndView.addObject("listType", listType);

			return modelAndView;
		}

		// 이미 등록되어 있는지
		if (!check.isEmpty() && !((category.getNo()) == check.get(0).getNo())) {
			String checkName = "이미 등록된 카테고리입니다.";
			List<GraduationType> listType = this.graduationTypeService.find(type);
			modelAndView = new ModelAndView("/graduationCategory/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("category", category);
			modelAndView.addObject("listType", listType);

			return modelAndView;
		}

		this.graduationCategoryService.edit(category);

		return new ModelAndView(new RedirectView("/graduationCategory/list"));
	}

	@RequestMapping(value = "remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no) {
		this.graduationCategoryService.remove(no);
		return new ModelAndView(new RedirectView("/graduationCategory/list"));
	}
}