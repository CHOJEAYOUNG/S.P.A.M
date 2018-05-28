package com.spam.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public ModelAndView list(HttpServletRequest request, Employment employment, EmploymentCategory category,
			SpamUser spamuser) throws Exception {
		HttpSession session = request.getSession(false);
		ModelAndView modelAndView = new ModelAndView("/employment/list");
		List<Employment> listEmp = null;
		List<String> purpose = new ArrayList<String>();
		purpose.add("name");
		List<EmploymentCategory> listCategory = this.employmentCategoryService.find(category, purpose);

		if ("S".equals(session.getAttribute("power"))) {
			int id = (int) session.getAttribute("id");
			listEmp = employmentService.find(id);
			spamuser.setId(id);
			spamuser = spamUserService.view(spamuser);
		} else {
			String id = request.getParameter("id");
			if (!("".equals(id) || id == null)) {
				listEmp = employmentService.find(Integer.parseInt(id));
				if (listEmp.size() != 0) {
					spamuser.setId(Integer.parseInt(id));
					spamuser = spamUserService.view(spamuser);

				}
			}
		}
		modelAndView.addObject("spamuser", spamuser);
		modelAndView.addObject("listEmp", listEmp);
		modelAndView.addObject("listCategory", listCategory);
		return modelAndView;
	}

	@RequestMapping(value = "/view/{emplNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int emplNo, HttpServletRequest request, Employment employment,
			SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/view");

		employment = employmentService.view(emplNo);
		spamuser.setId(employment.getId());
		spamuser = spamUserService.view(spamuser);

		if (0 != employment.getEmpcNo()) {
			EmploymentCategory category = employmentCategoryService.view(employment.getEmpcNo());
			modelAndView.addObject("category", category);
		}
		modelAndView.addObject("employment", employment);
		modelAndView.addObject("spamuser", spamuser);

		return modelAndView;
	}

	@RequestMapping(value = "/selectAttendance", method = RequestMethod.GET)
	public ModelAndView selectAttendance(HttpServletRequest request, Employment employment, SpamUser spamuser)
			throws Exception {
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

	@RequestMapping(value = "/selectEmployment", method = RequestMethod.GET)
	public ModelAndView selectEmploymentForm(HttpServletRequest request, Employment employment, SpamUser spamuser)
			throws Exception {
		ModelAndView modelAndView = new ModelAndView("/employment/selectEmployment");
		List<SpamUser> listSpam = spamUserService.list(spamuser, request);
		modelAndView.addObject("listSpam", listSpam);
		return modelAndView;
	}

	@RequestMapping(value = "/selectEmployment", method = RequestMethod.POST)
	public ModelAndView selectEmployment(HttpServletRequest request, Employment employment, SpamUser spamuser,
			EmploymentCategory category, EmploymentType type) throws Exception {
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
		ModelAndView modelAndView = new ModelAndView("/employment/selectEmployment");

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
		HttpSession session = request.getSession(false);
		ModelAndView modelAndView = null;
		if ("A".equals(session.getAttribute("power"))) {
			modelAndView = new ModelAndView("/employment/select");
		} else {
			return new ModelAndView(new RedirectView("/employment/selectEmployment"));
		}
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(@RequestParam("file") MultipartFile file, HttpServletRequest request, Employment employment,
			EmploymentCategory category) throws Exception {
		HttpSession session = request.getSession(false);

		this.employmentService.add(employment, file, request);
		if ("A".equals(session.getAttribute("power"))) {
			return new ModelAndView(new RedirectView("/employment/list/?id=" + employment.getId()));
		} else {
			return new ModelAndView(new RedirectView("/employment/list"));
		}
		// return null;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(HttpServletRequest request, Employment employment) throws Exception {
		HttpSession session = request.getSession(false);

		this.employmentService.edit(employment);

		if ("A".equals(session.getAttribute("power"))) {
			return new ModelAndView(new RedirectView("/employment/list/?id=" + employment.getId()));
		} else {
			return new ModelAndView(new RedirectView("/employment/list"));
		}
	}

	@RequestMapping(value = "/remove/{no}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int no, HttpServletRequest request, Employment employment)
			throws Exception {
		HttpSession session = request.getSession(false);
		this.employmentService.remove(no);

		if ("A".equals(session.getAttribute("power"))) {
			return new ModelAndView(new RedirectView("/employment/list/?id=" + employment.getId()));
		} else {
			return new ModelAndView(new RedirectView("/employment/list"));
		}
	}
}