package com.spam.service;


import java.util.List;

import com.spam.domain.TimeTable;


public interface TimeTableService {
	public List<TimeTable> list(TimeTable timeTable);

	public void add(TimeTable timeTable);

	public TimeTable view(TimeTable timeTable);

	public void edit(TimeTable timeTable);

}
