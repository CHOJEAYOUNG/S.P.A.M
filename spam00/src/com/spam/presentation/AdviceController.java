package com.spam.presentation;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.Advice;
import com.spam.domain.SpamUser;
import com.spam.service.AdviceService;
import com.spam.service.SpamUserService;

@Controller
@RequestMapping("/advice")
public class adviceController {
	@Resource
	private AdviceService adviceService;
	@Resource
	private SpamUserService spamUserService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Advice advice, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/list");
		HttpSession session = request.getSession(false);
		String power = session.getAttribute("power") != null ? (String) session.getAttribute("power") : null;
		int id = (int) session.getAttribute("id");

		if (power.equals("P")) {
			advice.setpId(id);
		} else if (power.equals("A")) {
			advice.setsId(id);
			List<Advice> listAdvice = this.adviceService.list(advice);
			modelAndView.addObject("listAdvice", listAdvice);
			return new ModelAndView(new RedirectView("/advice/listS"));
		}

		List<Advice> listAdvice = this.adviceService.list(advice);
		modelAndView.addObject("listAdvice", listAdvice);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/add");
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Advice advice) throws Exception {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/advice/add"));
		Advice check = new Advice();
		check.setpId(advice.getpId());
		check.setQuarter(advice.getQuarter());
		check.setAdviceDate(advice.getAdviceDate());
		switch (advice.getDay()) {
		case "mon":
				advice.setMon(advice.getPeriod());
				advice.setTue("0");
				advice.setWed("0");
				advice.setThur("0");
				advice.setFri("0");
			break;
		case "tue":
			advice.setMon("0");
			advice.setTue(advice.getPeriod());
			advice.setWed("0");
			advice.setThur("0");
			advice.setFri("0");
		break;
		case "wed":
			advice.setMon("0");
			advice.setTue("0");
			advice.setWed(advice.getPeriod());
			advice.setThur("0");
			advice.setFri("0");
		break;
		case "thur":
			advice.setMon("0");
			advice.setTue("0");
			advice.setWed("0");
			advice.setThur(advice.getPeriod());
			advice.setFri("0");
		break;
		case "fri":
			advice.setMon("0");
			advice.setTue("0");
			advice.setWed("0");
			advice.setThur("0");
			advice.setFri(advice.getPeriod());
		break;
		default:
			break;
		}
		if (!advice.getMon().isEmpty() && !advice.getMon().equals("0")) {
			check.setMon(advice.getMon());
			if (!this.adviceService.list(check).isEmpty()) {
				String message = "상담이 불가능한 시간대 입니다.";
				modelAndView.addObject("message", message);
				return modelAndView;
			}
		} else if (!advice.getTue().isEmpty() && !advice.getTue().equals("0")) {
			check.setTue(advice.getTue());
			if (!this.adviceService.list(check).isEmpty()) {
				String message = "상담이 불가능한 시간대 입니다.";
				modelAndView.addObject("message", message);
				return modelAndView;
			}
		} else if (!advice.getWed().isEmpty() && !advice.getWed().equals("0")) {
			check.setWed(advice.getWed());
			if (!this.adviceService.list(check).isEmpty()) {
				String message = "상담이 불가능한 시간대 입니다.";
				modelAndView.addObject("message", message);
				return modelAndView;
			}
		} else if (!advice.getThur().isEmpty() && !advice.getThur().equals("0")) {
			check.setThur(advice.getThur());
			if (!this.adviceService.list(check).isEmpty()) {
				String message = "상담이 불가능한 시간대 입니다.";
				modelAndView.addObject("message", message);
				return modelAndView;
			}
		} else if (!advice.getFri().isEmpty() && !advice.getFri().equals("0")) {
			check.setFri(advice.getFri());
			if (!this.adviceService.list(check).isEmpty()) {
				String message = "상담이 불가능한 시간대 입니다.";
				modelAndView.addObject("message", message);
				return modelAndView;
			}
		}

		System.out.println(advice.toString());
		
		this.adviceService.add(advice);
		return new ModelAndView(new RedirectView("/advice/list"));
	}

	@RequestMapping(value = "/view/{adviceNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int adviceNo) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/view");
		Advice advice = new Advice();
		advice.setAdviceNo(adviceNo);
		advice = this.adviceService.view(advice);
		modelAndView.addObject("advice", advice);
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{adviceNo}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int adviceNo, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/edit");
		Advice advice = new Advice();
		advice.setAdviceNo(adviceNo);
		System.out.println(adviceNo);
		modelAndView.addObject("advice", advice);
		advice = this.adviceService.view(advice);
		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit(Advice advice) throws Exception {
		advice.setAssentNo(2);
		this.adviceService.edit(advice);
		return new ModelAndView(new RedirectView("/advice/list"));
	}

	@RequestMapping(value = "/assent/{adviceNo}", method = RequestMethod.GET)
	public ModelAndView assent(@PathVariable int adviceNo) throws Exception {
		Advice advice = new Advice();
		advice.setAdviceNo(adviceNo);
		System.out.println(advice.toString());
		advice.setAssentNo(1);
		this.adviceService.edit(advice);
		return new ModelAndView(new RedirectView("/advice/list"));
	}

	@RequestMapping(value = "/remove/{adviceNo}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int adviceNo) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/view");
		Advice advice = new Advice();
		Advice check = new Advice();
		advice.setAdviceNo(adviceNo);
		check = this.adviceService.view(advice);
		if (check.getAssentNo() == 1) {
			String message = "상담 승인된 예약은 취소 불가능 합니다.";
			modelAndView.addObject("message", message);
			return modelAndView;
		}
		String message = "상담이 삭제되었습니다.";
		modelAndView.addObject("message", message);
		this.adviceService.delete(advice);
		return modelAndView;
	}

	@RequestMapping(value = "/searchE", method = RequestMethod.GET)
	public ModelAndView searchE(HttpServletRequest request, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/searchE");
		String keyword = request.getParameter("keyword");
		
		if (keyword == null || "".equals(keyword)) {
			List<SpamUser> listSpam = spamUserService.listPop(spamuser);
			modelAndView.addObject("listSpam", listSpam);
			return modelAndView;
		} else {
			spamuser.setName(keyword);
		}

		List<SpamUser> listSpam = this.spamUserService.listPop(spamuser);
		modelAndView.addObject("listSpam", listSpam);
		return modelAndView;

	}
}
