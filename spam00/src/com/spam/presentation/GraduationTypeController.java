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

import com.spam.domain.GraduationType;
import com.spam.service.GraduationTypeService;

@Controller
@RequestMapping(value = "/graduationType")
public class GraduationTypeController {
	@Autowired
	private GraduationTypeService graduationTypeService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, GraduationType type) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduationType/list");
		List<GraduationType> listType = null;
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		if ("".equals(search) || search == null) {
			search = "0";
		}

		List<String> purpose = new ArrayList<String>();
		purpose.add(select);
		purpose.add(search);

		listType = this.graduationTypeService.find(type, purpose);

		modelAndView.addObject("select", select);
		modelAndView.addObject("listType", listType);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm() throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduationType/add");
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(HttpServletRequest request, GraduationType type) throws Exception {
		ModelAndView modelAndView = null;
		List<String> purpose = new ArrayList<String>();
		purpose.add("type");
		purpose.add(type.getName());

		List<GraduationType> check = this.graduationTypeService.find(type, purpose);

		if ("".equals(type.getName().trim())) {
			String checkName = "유형을 입력해주세요.";

			modelAndView = new ModelAndView("/graduationType/add");
			modelAndView.addObject("checkName", checkName);

			return modelAndView;
		}

		if (!check.isEmpty()) {
			String checkName = "이미 등록된 유형 입니다.";

			modelAndView = new ModelAndView("/graduationType/add");
			modelAndView.addObject("checkName", checkName);

			return modelAndView;
		}

		graduationTypeService.add(type);
		return new ModelAndView(new RedirectView("/graduationType/list"));
	}

	@RequestMapping(value = "/edit/{no}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int no, HttpServletRequest request, GraduationType type)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduationType/edit");
		type = graduationTypeService.view(no);
		modelAndView.addObject("type", type);

		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, GraduationType type) throws Exception {
		ModelAndView modelAndView = null;

		List<String> purpose = new ArrayList<String>();
		purpose.add("type");
		purpose.add(type.getName());

		List<GraduationType> check = this.graduationTypeService.find(type, purpose);

		if ("".equals(type.getName().trim())) {
			String checkName = "유형을 입력해주세요.";

			modelAndView = new ModelAndView("/graduationType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("type", type);

			return modelAndView;
		}
		if (!check.isEmpty() && !((type.getNo()) == check.get(0).getNo())) {
			String checkName = "이미 등록된 유형 입니다.";

			modelAndView = new ModelAndView("/graduationType/edit");
			modelAndView.addObject("checkName", checkName);
			modelAndView.addObject("type", type);

			return modelAndView;
		}
		graduationTypeService.edit(type);

		return new ModelAndView(new RedirectView("/graduationType/list"));
	}

	@RequestMapping(value = "/remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no) throws Exception {
		graduationTypeService.remove(no);
		return new ModelAndView(new RedirectView("/graduationType/list"));
	}
}
