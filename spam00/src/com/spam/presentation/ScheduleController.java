package com.spam.presentation;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.Schedule;
import com.spam.domain.SpamUser;
import com.spam.domain.TimeTable;
import com.spam.service.ScheduleService;
import com.spam.service.SpamUserService;
import com.spam.service.TimeTableService;


@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Resource
	private ScheduleService scheduleService;
	@Resource
	private TimeTableService timeTableService;
	@Resource
	private SpamUserService spamUserService;

	@RequestMapping(value = "/list")
	public ModelAndView list(Schedule schedule, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/list");
		
		HttpSession session = request.getSession(false);
		String power = session.getAttribute("power") != null ? (String) session.getAttribute("power") : null;
		int id = (int) session.getAttribute("id");
		
		if(power.equals("P")) {
			schedule.setId(id);
		}
		
		List<Schedule> listSchedule = this.scheduleService.list(schedule);
		
		for(int i=0; i<listSchedule.size(); i++) {
			String oldBegin = listSchedule.get(i).getBegin();
			Date dateBegin = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(oldBegin);
			String newBegin = new SimpleDateFormat("yyyy-MM-dd").format(dateBegin);
			listSchedule.get(i).setBegin(newBegin);
			
			String oldFinish = listSchedule.get(i).getFinish();
			Date dateFinish = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(oldFinish);
			String newFinish = new SimpleDateFormat("yyyy-MM-dd").format(dateFinish);
			listSchedule.get(i).setFinish(newFinish);
		}
		modelAndView.addObject("listSchdule", listSchedule);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/add");
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(Schedule schedule) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/add");
		SpamUser spamUser = new SpamUser();
		spamUser.setName(schedule.getName());
		
		List<SpamUser> listSpam = this.spamUserService.listPop(spamUser);
		schedule.setId(listSpam.get(0).getId());
		
		Schedule check = new Schedule();
		check.setId(schedule.getId());
		check.setBegin(schedule.getBegin());
		check.setFinish(schedule.getFinish());
		
		System.out.println(schedule.toString());
		
		if(!schedule.getMon().isEmpty() && !schedule.getMon().equals("0")) {
			StringTokenizer tokenizerMon = new StringTokenizer(schedule.getMon(), ",");
			for(int i=0; tokenizerMon.hasMoreTokens(); i++) {
				check.setMon(tokenizerMon.nextToken());
				
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					return modelAndView;
				}
			}
		}
		if(!schedule.getTue().isEmpty() && !schedule.getTue().equals("0")) {
			StringTokenizer tokenizerTue = new StringTokenizer(schedule.getTue(), ",");
			for(int i=0; tokenizerTue.hasMoreTokens(); i++) {
				check.setTue(tokenizerTue.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					return modelAndView;
				}
			}
		}
		if(!schedule.getWed().isEmpty() && !schedule.getWed().equals("0")) {
			StringTokenizer tokenizerWed = new StringTokenizer(schedule.getWed(), ",");
			for(int i=0; tokenizerWed.hasMoreTokens(); i++) {
				check.setWed(tokenizerWed.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					return modelAndView;
				}
			}
		}
		if(!schedule.getThur().isEmpty() && !schedule.getThur().equals("0")) {
			StringTokenizer tokenizerThur = new StringTokenizer(schedule.getThur(), ",");
			for(int i=0; tokenizerThur.hasMoreTokens(); i++) {
				check.setMon(tokenizerThur.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					return modelAndView;
				}
			}
		}
		if(!schedule.getFri().isEmpty() && !schedule.getFri().equals("0")) {
			StringTokenizer tokenizerFri = new StringTokenizer(schedule.getFri(), ",");
			for(int i=0; tokenizerFri.hasMoreTokens(); i++) {
				check.setMon(tokenizerFri.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					return modelAndView;
				}
			}
		}
		System.out.println(schedule.toString());
		this.scheduleService.add(schedule);
		return new ModelAndView(new RedirectView("/schedule/list"));
	}

	@RequestMapping(value = "/view/{scheduleNo}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int scheduleNo) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/view");
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(scheduleNo);
		schedule = this.scheduleService.view(schedule);
		modelAndView.addObject("schedule", schedule);
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{scheduleNo}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int scheduleNo, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/edit");
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(scheduleNo);
		schedule = this.scheduleService.view(schedule);

		SpamUser spamUser = new SpamUser();
		spamUser.setId(schedule.getId());
		List<SpamUser> listSpam = this.spamUserService.listPop(spamUser);
		schedule.setName(listSpam.get(0).getName());
		
		modelAndView.addObject("schedule", schedule);
		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(Schedule schedule) throws Exception {
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/schedule/edit"));

		SpamUser spamUser = new SpamUser();
		spamUser.setName(schedule.getName());
		
		List<SpamUser> listSpam = this.spamUserService.listPop(spamUser);
		schedule.setId(listSpam.get(0).getId());
		
		Schedule check = new Schedule();
		check.setId(schedule.getId());
		check.setBegin(schedule.getBegin());
		check.setFinish(schedule.getFinish());
		
		System.out.println(schedule.toString());
		
		if(!schedule.getMon().isEmpty() && !schedule.getMon().equals("0")) {
			StringTokenizer tokenizerMon = new StringTokenizer(schedule.getMon(), ",");
			for(int i=0; tokenizerMon.hasMoreTokens(); i++) {
				check.setMon(tokenizerMon.nextToken());
				
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					modelAndView.addObject("schedule", schedule);
					return modelAndView;
				}
			}
		}
		if(!schedule.getTue().isEmpty() && !schedule.getTue().equals("0")) {
			StringTokenizer tokenizerTue = new StringTokenizer(schedule.getTue(), ",");
			for(int i=0; tokenizerTue.hasMoreTokens(); i++) {
				check.setTue(tokenizerTue.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					modelAndView.addObject("schedule", schedule);
					return modelAndView;
				}
			}
		}
		if(!schedule.getWed().isEmpty() && !schedule.getWed().equals("0")) {
			StringTokenizer tokenizerWed = new StringTokenizer(schedule.getWed(), ",");
			for(int i=0; tokenizerWed.hasMoreTokens(); i++) {
				check.setWed(tokenizerWed.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					modelAndView.addObject("schedule", schedule);
					return modelAndView;
				}
			}
		}
		if(!schedule.getThur().isEmpty() && !schedule.getThur().equals("0")) {
			StringTokenizer tokenizerThur = new StringTokenizer(schedule.getThur(), ",");
			for(int i=0; tokenizerThur.hasMoreTokens(); i++) {
				check.setMon(tokenizerThur.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					modelAndView.addObject("schedule", schedule);
					return modelAndView;
				}
			}
		}
		if(!schedule.getFri().isEmpty() && !schedule.getFri().equals("0")) {
			StringTokenizer tokenizerFri = new StringTokenizer(schedule.getFri(), ",");
			for(int i=0; tokenizerFri.hasMoreTokens(); i++) {
				check.setMon(tokenizerFri.nextToken());
				if (!this.scheduleService.list(check).isEmpty()) {
					String message = "이미 존재하는 스케줄 입니다";
					modelAndView.addObject("message", message);
					modelAndView.addObject("schedule", schedule);
					return modelAndView;
				}
			}
		}

		
		this.scheduleService.edit(schedule);
		return new ModelAndView(new RedirectView("/schedule/list"));
	}
	@RequestMapping(value = "/remove/{scheduleNo}", method = RequestMethod.GET)
	public ModelAndView remove(@PathVariable int scheduleNo) throws Exception {
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(scheduleNo);
		this.scheduleService.delete(schedule);
		return new ModelAndView(new RedirectView("/schedule/list"));
	}
	@RequestMapping(value = "/searchT", method = RequestMethod.GET)
	public ModelAndView searchT(HttpServletRequest request, TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/searchT");

		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;

	}
	@RequestMapping(value = "/searchT2", method = RequestMethod.GET)
	public ModelAndView searchT2(HttpServletRequest request, TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/searchT2");

		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;

	}
	@RequestMapping(value = "/searchT3", method = RequestMethod.GET)
	public ModelAndView searchT3(HttpServletRequest request, TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/searchT3");

		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;

	}
	@RequestMapping(value = "/searchT4", method = RequestMethod.GET)
	public ModelAndView searchT4(HttpServletRequest request, TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/searchT4");

		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;

	}
	@RequestMapping(value = "/searchT5", method = RequestMethod.GET)
	public ModelAndView searchT5(HttpServletRequest request, TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/searchT5");

		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;

	}
	
	@RequestMapping(value = "/searchE", method = RequestMethod.GET)
	public ModelAndView searchE(HttpServletRequest request, SpamUser spamuser) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/searchE");
		String keyword = request.getParameter("keyword");
		
		if (keyword == null || "".equals(keyword)) {
			List<SpamUser> listSpam = spamUserService.listPop(spamuser);
			modelAndView.addObject("listSpam", listSpam);
			for(int i=0; i < listSpam.size(); i++) {
				System.out.println(listSpam.get(i).toString());
				
			}
			return modelAndView;
		} else {
			spamuser.setName(keyword);
		}

		List<SpamUser> listSpam = this.spamUserService.listPop(spamuser);
		modelAndView.addObject("listSpam", listSpam);
		
		for(int i=0; i < listSpam.size(); i++) {
			System.out.println(listSpam.get(i).toString());
		}
		return modelAndView;
	}
}
