package com.spam.persistence;

import java.util.List;

import com.spam.domain.Attend;

public interface AttendMapper {
	public void insertAttend(Attend attend);
	public List<Attend> list(Attend attend);
	public void delete(int attendanceNo);
	//public void delete(Attend attend);
}
