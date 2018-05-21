package com.spam.domain;

import java.io.Serializable;

public class Attend implements Serializable {
	private int attendNo;
	private int attendanceNo;
	private int id;
	
	public Attend() {
		
	}
	
	public Attend(int attendNo, int attendanceNo, int id) {
		super();
		this.attendNo = attendNo;
		this.attendanceNo = attendanceNo;
		this.id = id;
	}

	@Override
	public String toString() {
		return "Attend [attendNo=" + attendNo + ", attendanceNo=" + attendanceNo + ", id=" + id + "]";
	}

	public int getAttendNo() {
		return attendNo;
	}

	public void setAttendNo(int attendNo) {
		this.attendNo = attendNo;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
}
