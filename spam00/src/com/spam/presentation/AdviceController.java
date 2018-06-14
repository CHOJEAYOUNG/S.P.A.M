package com.spam.presentation;

import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import com.spam.domain.TimeTable;
import com.spam.service.AdviceService;
import com.spam.service.SpamUserService;
import com.spam.service.TimeTableService;

@Controller
@RequestMapping("/advice")
public class AdviceController {
	@Resource
	private AdviceService adviceService;
	@Resource
	private SpamUserService spamUserService;
	@Resource
	private TimeTableService timeTableService;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(Advice advice, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/list");
		HttpSession session = request.getSession(false);
		String power = session.getAttribute("power") != null ? (String) session.getAttribute("power") : null;
		int id = (int) session.getAttribute("id");
		advice.setAdviceDate(advice.getSearchDate());
		if (power.equals("P")) {
			advice.setpId(id);
		} else if (power.equals("S")) {
			advice.setsId(id);
			List<Advice> listAdvice = this.adviceService.list(advice);
			modelAndView.addObject("listAdvice", listAdvice);
			return new ModelAndView(new RedirectView("/advice/listS"));
		}

		List<Advice> listAdvice = this.adviceService.list(advice);
		modelAndView.addObject("listAdvice", listAdvice);
		return modelAndView;
	}

	@RequestMapping(value = "/listS", method = RequestMethod.GET)
	public ModelAndView listS(Advice advice, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/listS");
		HttpSession session = request.getSession(false);
		int id = (int) session.getAttribute("id");

		advice.setAdviceDate(advice.getSearchDate());

		if (advice.getAdviceDate() != null) {
			advice.setAdviceDate(advice.getSearchDate());
		}
		advice.setsId(id);
		List<Advice> listAdvice = this.adviceService.listS(advice);
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
		SpamUser spamUser = new SpamUser();
		spamUser.setName(advice.getName());

		List<SpamUser> listSpam = this.spamUserService.listPop(spamUser);
		advice.setpId(listSpam.get(0).getId());

		Advice check = new Advice();
		check.setpId(advice.getpId());
		check.setQuarter(advice.getQuarter());
		check.setAdviceDate(advice.getAdviceDate());

		String inputDate = advice.getAdviceDate();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date date = dateFormat.parse(inputDate);

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		String dayCheck = "";
		System.out.println("받은 날짜" + advice.getAdviceDate());
		System.out.println("date :" + date);
		System.out.println("날짜:" + calendar.get(Calendar.DAY_OF_WEEK));
		switch (calendar.get(Calendar.DAY_OF_WEEK)) {
		case 2:
			advice.setMon(advice.getPeriod());
			advice.setTue("0");
			advice.setWed("0");
			advice.setThur("0");
			advice.setFri("0");
			break;
		case 3:
			advice.setMon("0");
			advice.setTue(advice.getPeriod());
			advice.setWed("0");
			advice.setThur("0");
			advice.setFri("0");
			break;
		case 4:
			advice.setMon("0");
			advice.setTue("0");
			advice.setWed(advice.getPeriod());
			advice.setThur("0");
			advice.setFri("0");
			break;
		case 5:
			advice.setMon("0");
			advice.setTue("0");
			advice.setWed("0");
			advice.setThur(advice.getPeriod());
			advice.setFri("0");
			break;
		case 6:
			advice.setMon("0");
			advice.setTue("0");
			advice.setWed("0");
			advice.setThur("0");
			advice.setFri(advice.getPeriod());
			break;
		default:
			dayCheck = "error";
			break;
		}

		if (dayCheck.equals("error")) {
			String message = "상담이 불가능한 시간대 입니다.";
			modelAndView.addObject("message", message);
			return modelAndView;
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
	public ModelAndView view(@PathVariable int adviceNo, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/view");
		Advice advice = new Advice();
		SpamUser spamUser = new SpamUser();

		HttpSession session = request.getSession(false);
		String power = session.getAttribute("power") != null ? (String) session.getAttribute("power") : null;
		int id = (int) session.getAttribute("id");

		advice.setAdviceNo(adviceNo);
		advice = this.adviceService.view(advice);

		if (power.equals("P")) {
			spamUser.setId(advice.getsId());
			List<SpamUser> listSpam = this.spamUserService.listPop(spamUser);
			advice.setName(listSpam.get(0).getName());
		} else if (power.equals("S")) {
			spamUser.setId(advice.getpId());
			List<SpamUser> listSpam = this.spamUserService.listPop(spamUser);
			advice.setName(listSpam.get(0).getName());
		}

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
		ModelAndView modelAndView = new ModelAndView("/advice/edit");
		advice.setAssentNo(3);
		this.adviceService.edit(advice);
		modelAndView.addObject("message","삭제가 완료되었습니다.");
		return modelAndView;
	}

	@RequestMapping(value = "/assent/{adviceNo}", method = RequestMethod.GET)
	public ModelAndView assent(@PathVariable int adviceNo) throws Exception {
		Advice advice = new Advice();
		advice.setAdviceNo(adviceNo);
		System.out.println(advice.toString());

		Advice check = new Advice();
		check.setAdviceNo(advice.getAdviceNo());
		check = this.adviceService.view(advice);

		if (check.getAssentNo() == 1) {
			advice.setAssentNo(4);
		} else {
			advice.setAssentNo(1);
		}
		this.adviceService.edit(advice);
		return new ModelAndView(new RedirectView("/advice/list"));
	}

	@RequestMapping(value = "/remove/{adviceNo}", method = RequestMethod.GET)
	public ModelAndView remove(Advice advice) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/view");
		Advice check = new Advice();
		check = this.adviceService.view(advice);
		if (check.getAssentNo() == 1 || check.getAdviceNo() == 4) {
			String message = "상담승인 및 상담완료된 예약은 삭제가 불가능 합니다.";
			modelAndView.addObject("advice", advice);
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
			for (int i = 0; i < listSpam.size(); i++) {
				System.out.println(listSpam.get(i).toString());

			}
			return modelAndView;
		} else {
			spamuser.setName(keyword);
		}

		List<SpamUser> listSpam = this.spamUserService.listPop(spamuser);
		modelAndView.addObject("listSpam", listSpam);

		for (int i = 0; i < listSpam.size(); i++) {
			System.out.println(listSpam.get(i).toString());

		}

		return modelAndView;

	}

	@RequestMapping(value = "/searchT", method = RequestMethod.GET)
	public ModelAndView searchE(HttpServletRequest request, TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/searchT");

		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;

	}

	@RequestMapping(value = "/listC", method = RequestMethod.GET)
	public ModelAndView listC(Advice advice, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/advice/listC");
		System.out.println("왔니?");
		HttpSession session = request.getSession(false);
		int id = (int) session.getAttribute("id");
		advice.setAssentNo(4);

		advice.setsId(id);
		List<Advice> listAdvice = this.adviceService.listS(advice);
		System.out.println(listAdvice.size());
		modelAndView.addObject("listAdvice", listAdvice);
		return modelAndView;
	}
}
