package com.spam.service;


import java.util.List;

import com.spam.domain.Schedule;


public interface ScheduleService {
	public List<Schedule> list(Schedule schedule);

	public void add(Schedule schedule);

	public Schedule view(Schedule schedule);

	public void edit(Schedule schedule);
	
	public void delete(Schedule schedule);
}
