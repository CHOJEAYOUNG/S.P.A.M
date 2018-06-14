package com.spam.presentation;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.spam.domain.TimeTable;
import com.spam.service.TimeTableService;

@Controller
@RequestMapping("/timeTable")
public class TimeTableController {
	@Resource
	private TimeTableService timeTableService;

	@RequestMapping(value = "/list")
	public ModelAndView list(TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/timeTable/list");
		List<TimeTable> listTimeTable = this.timeTableService.list(timeTable);
		modelAndView.addObject("listTimeTable", listTimeTable);
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.GET)
	public ModelAndView addForm(HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/timeTable/add");
		return modelAndView;
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public ModelAndView add(TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/timeTable/add");
		TimeTable check = new TimeTable();
		String beginTime = "0 "+timeTable.getBeginHour()+":"+timeTable.getBeginMinutes()+":00";
		String finishTime = "0 "+timeTable.getFinishHour()+":"+timeTable.getFinishMinutes()+":00";
		System.out.println("time watch");
		System.out.println(beginTime);
		System.out.println(finishTime);
		
		check.setPeriod(timeTable.getPeriod());
		check.setBeginTime(beginTime);
		check.setFinishTime(finishTime);
		
		if (this.timeTableService.list(check).isEmpty()) {
			timeTable.setBeginTime(beginTime);
			timeTable.setFinishTime(finishTime);
			this.timeTableService.add(timeTable);
			return new ModelAndView(new RedirectView("/timeTable/list"));

		} else {
			String message = "이미 존재하는 교시 또는 시간 입니다..";
			modelAndView.addObject("message", message);
			return modelAndView;
		}
	}

	@RequestMapping(value = "/view/{period}", method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int period) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/timeTable/view");
		TimeTable timeTable = new TimeTable();
		timeTable.setPeriod(period);
		timeTable = this.timeTableService.view(timeTable);
		modelAndView.addObject("timeTable", timeTable);
		return modelAndView;
	}

	@RequestMapping(value = "/edit/{period}", method = RequestMethod.GET)
	public ModelAndView editForm(@PathVariable int period, HttpServletRequest request) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/timeTable/edit");
		TimeTable timeTable = new TimeTable();
		timeTable.setPeriod(period);
		timeTable = this.timeTableService.view(timeTable);
		modelAndView.addObject("timeTable", timeTable);
		return modelAndView;
	}

	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public ModelAndView edit(TimeTable timeTable) throws Exception {
		ModelAndView modelAndView = new ModelAndView("/timeTable/edit");
		System.out.println("왔니?");
		TimeTable check = new TimeTable();
		String beginTime = "0 "+timeTable.getBeginHour()+":"+timeTable.getBeginMinutes()+":00";
		String finishTime = "0 "+timeTable.getFinishHour()+":"+timeTable.getFinishMinutes()+":00";
		
		check.setBeginTime(beginTime);
		check.setFinishTime(finishTime);
		System.out.println(check.toString());
		if (this.timeTableService.list(check).isEmpty()) {
			timeTable.setBeginTime(beginTime);
			timeTable.setFinishTime(finishTime);
			this.timeTableService.edit(timeTable);
			return new ModelAndView(new RedirectView("/timeTable/list"));

		} else {
			String message = "이미 존재하는 시간 입니다..";
			modelAndView.addObject("timeTable", timeTable);
			modelAndView.addObject("message", message);
			return modelAndView;
		}
	}
	
	@RequestMapping(value = "/remove/{period}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int period, HttpServletRequest request) throws Exception {
		TimeTable timeTable = new TimeTable();
		timeTable.setPeriod(period);
		this.timeTableService.delete(timeTable);
		return new ModelAndView(new RedirectView("/timeTable/list"));
	}

}
