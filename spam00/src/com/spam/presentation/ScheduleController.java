package com.spam.presentation;

import java.util.List;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.aop.config.AdvisorComponentDefinition;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.Schedule;
import com.spam.service.ScheduleService;


@Controller
@RequestMapping("/schedule")
public class ScheduleController {
	@Resource
	private ScheduleService scheduleService;

	@RequestMapping(value = "/list")
	public ModelAndView list(Schedule schedule) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/schedule/list");
		List<Schedule> listSchedule = this.scheduleService.list(schedule);
		System.out.println(listSchedule.get(0).getFinish());
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
		ModelAndView modelAndView = new ModelAndView(new RedirectView("/schedule/add"));
		Schedule check = new Schedule();
		System.out.println(schedule.toString());
		check.setId(schedule.getId());
		check.setBegin(schedule.getBegin());
		check.setFinish(schedule.getFinish());
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
		modelAndView.addObject("schedule", schedule);
		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(Schedule schedule) throws Exception {
		this.scheduleService.edit(schedule);
		return new ModelAndView(new RedirectView("/schedule/list"));
	}
	@RequestMapping(value = "/remove/{scheduleNo}", method = RequestMethod.POST)
	public ModelAndView remove(@PathVariable int scheduleNo) throws Exception {
		Schedule schedule = new Schedule();
		schedule.setScheduleNo(scheduleNo);
		this.scheduleService.delete(schedule);
		return new ModelAndView(new RedirectView("/schedule/list"));
	}
}
