package com.spam.persistence;

import java.util.List;
import java.util.Map;

import com.spam.domain.Attendance;

public interface AttendanceMapper {
	public void insertAttendance(Attendance attendance);
	public List<Attendance> checkRandomNumber();
	public List<Attendance> select(Attendance attendance);
	//public void insertAttendanceStudentInfo(SpamUser spamUser);
//select
//insert
//delete
}
