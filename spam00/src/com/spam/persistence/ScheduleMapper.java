package com.spam.persistence;

import java.util.List;

import com.spam.domain.Schedule;


public interface ScheduleMapper {
	public List<Schedule> list(Schedule schedule);

	public void insert(Schedule schedule);

	public Schedule select(Schedule schedule);

	public void update(Schedule schedule);
	
	public void delete(Schedule schedule);
	
}
