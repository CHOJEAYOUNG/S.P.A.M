package com.spam.persistence;

import java.util.List;

import com.spam.domain.TimeTable;

public interface TimeTableMapper {
	public List<TimeTable> list(TimeTable timeTable);

	public void insert(TimeTable timeTable);

	public TimeTable select(TimeTable timeTable);

	public void update(TimeTable timeTable);

	public void delete(TimeTable timeTable);
}
