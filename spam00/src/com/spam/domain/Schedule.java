package com.spam.domain;

public class Schedule {
	private int scheduleNo;
	private int id;
	private String reason;
	private String begin;
	private String finish;
	private String mon;
	private String tue;
	private String wed;
	private String thur;
	private String fri;
	private int quarter;
	private String name;
	

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getBegin() {
		return begin;
	}
	public void setBegin(String begin) {
		this.begin = begin;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	public String getMon() {
		return mon;
	}
	public void setMon(String mon) {
		this.mon = mon;
	}
	public String getTue() {
		return tue;
	}
	public void setTue(String tue) {
		this.tue = tue;
	}
	public String getWed() {
		return wed;
	}
	public void setWed(String wed) {
		this.wed = wed;
	}
	public String getThur() {
		return thur;
	}
	public void setThur(String thur) {
		this.thur = thur;
	}
	public String getFri() {
		return fri;
	}
	public void setFri(String fri) {
		this.fri = fri;
	}
	public int getQuarter() {
		return quarter;
	}
	public void setQuarter(int quarter) {
		this.quarter = quarter;
	}
	@Override
	public String toString() {
		return "Schedule [scheduleNo=" + scheduleNo + ", id=" + id + ", reason=" + reason + ", begin=" + begin
				+ ", finish=" + finish + ", mon=" + mon + ", tue=" + tue + ", wed=" + wed + ", thur=" + thur + ", fri="
				+ fri + ", quarter=" + quarter + "]";
	}
	
}