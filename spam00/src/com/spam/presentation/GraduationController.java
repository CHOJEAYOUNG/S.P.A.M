package com.spam.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.Graduation;
import com.spam.domain.GraduationCategory;
import com.spam.domain.GraduationType;
import com.spam.domain.SpamUser;
import com.spam.service.GraduationCategoryService;
import com.spam.service.GraduationService;
import com.spam.service.GraduationTypeService;
import com.spam.service.SpamUserService;

@Controller
@RequestMapping(value = "/graduation")
public class GraduationController {
	@Autowired
	private GraduationService graduationService;
	@Autowired
	private GraduationCategoryService graduationCategoryService;
	@Autowired
	private GraduationTypeService graduationTypeService;
	@Autowired
	private SpamUserService spamUserService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(HttpServletRequest request, Graduation graduation, GraduationCategory category,
			SpamUser spamuser) throws Exception {
		HttpSession session = request.getSession(false);
		ModelAndView modelAndView = new ModelAndView("/graduation/list");
		List<Graduation> listGr = null;
		List<GraduationCategory> listCategory = this.graduationCategoryService.find(category);

		if ("S".equals(session.getAttribute("power"))) {
			int id = (int) session.getAttribute("id");
			graduation.setId(id);
			listGr = graduationService.find(graduation);
			spamuser.setId(id);
			spamuser = spamUserService.view(spamuser);
		} else {
			String id = request.getParameter("id");
			if (!("".equals(id) || id == null)) {
				graduation.setId(Integer.parseInt(id));
				listGr = graduationService.find(graduation);
				if (listGr.size() != 0) {
					spamuser.setId(Integer.parseInt(id));
					spamuser = spamUserService.view(spamuser);
				}
			} else {
				graduation.setAssentNo(2);
				listGr = graduationService.find(graduation);
			}
		}
		modelAndView.addObject("spamuser", spamuser);
		modelAndView.addObject("listGr", listGr);
		modelAndView.addObject("listCategory", listCategory);
		return modelAndView;
	}
	
	@RequestMapping(value = "/view/{grlNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int grlNo, HttpServletRequest request, Graduation graduation,
			SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduation/view");

		graduation = graduationService.view(grlNo);
		spamuser.setId(graduation.getId());
		spamuser = spamUserService.view(spamuser);

		if (0 != graduation.getGrcNo()) {
			GraduationCategory category = graduationCategoryService.view(graduation.getGrcNo());
			modelAndView.addObject("category", category);
		}
		modelAndView.addObject("graduation", graduation);
		modelAndView.addObject("spamuser", spamuser);

		return modelAndView;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public ModelAndView search(HttpServletRequest request, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduation/search");
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		String search = request.getParameter("search");
		String select = request.getParameter("select");

		if ("".equals(search) || search == null) {
			modelAndView.addObject("listSpam", listSpam);
			return modelAndView;
		}
		if ("id".equals(select)) {
			for (int i = 0; i < listSpam.size(); i++) {
				if (!search.equals(String.valueOf(listSpam.get(i).getId()))) {
					listSpam.remove(i);
					i = 0;
				}
			}
		} else if ("name".equals(select)) {
			for (int i = 0; i < listSpam.size(); i++) {
				if (!search.equals(listSpam.get(i).getName())) {
					listSpam.remove(i);
					i = 0;
				}
			}
		}
		modelAndView.addObject("listSpam", listSpam);
		return modelAndView;
	}
	
	@RequestMapping(value = "/selectGraduation", method = RequestMethod.GET)
	public ModelAndView selectGraduationForm(HttpServletRequest request, Graduation graduation, SpamUser spamuser)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("/graduation/selectGraduation");
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		modelAndView.addObject("listSpam", listSpam);
		return modelAndView;
	}

	@RequestMapping(value = "/selectGraduation", method = RequestMethod.POST)
	public ModelAndView selectGraduation(HttpServletRequest request, Graduation graduation, SpamUser spamuser,
			GraduationCategory category, GraduationType type) throws Exception {
		HttpSession session = request.getSession(false);
		List<SpamUser> listSpam = null;
		SpamUser user = null;
		if ("A".equals(session.getAttribute("power"))) {
			String id = request.getParameter("id");
			listSpam = spamUserService.list(spamuser, request);
			for (int i = 0; i < listSpam.size(); i++) {
				if (!id.equals(String.valueOf(listSpam.get(i).getId()))) {
					listSpam.remove(i);
				}
			}
			user = listSpam.get(0);
		} else {
			int id = (int) session.getAttribute("id");
			spamuser.setId(id);
			user = spamUserService.view(spamuser);

		}
		ModelAndView modelAndView = new ModelAndView("/graduation/selectGraduation");

		List<GraduationType> listType = this.graduationTypeService.find(type);
		List<GraduationCategory> listCategory = this.graduationCategoryService.find(category);
		modelAndView.addObject("listCategory", listCategory);
		modelAndView.addObject("listType", listType);
		modelAndView.addObject("listSpam", listSpam);
		modelAndView.addObject("user", user);
		return modelAndView;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(@RequestParam("file") MultipartFile file, HttpServletRequest request, Graduation graduation,
			GraduationCategory category) throws Exception {
		this.graduationService.add(graduation, file, request);
		return new ModelAndView("employment/confirm");
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, Graduation graduation) throws Exception {
		HttpSession session = request.getSession(false);

		this.graduationService.edit(graduation);

		if ("A".equals(session.getAttribute("power"))) {
			return new ModelAndView(new RedirectView("/graduation/list/?id=" + graduation.getId()));
		} else {
			return new ModelAndView(new RedirectView("/graduation/list"));
		}
	}

	@RequestMapping(value = "/remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no, HttpServletRequest request, Graduation graduation)
			throws Exception {
		HttpSession session = request.getSession(false);
		this.graduationService.remove(no);

		if ("A".equals(session.getAttribute("power"))) {
			return new ModelAndView(new RedirectView("/graduation/list/?id=" + graduation.getId()));
		} else {
			return new ModelAndView(new RedirectView("/graduation/list"));
		}
	}
	
	@RequestMapping(value = "/download/{no}", method = RequestMethod.GET)
	public ModelAndView download(@PathVariable int no, HttpServletResponse response)
			throws Exception {
		Graduation graduation = new Graduation();
		graduation = graduationService.view(no);
		graduationService.download(graduation, response);
		
		return new ModelAndView("/graduation/view");
	}
}
