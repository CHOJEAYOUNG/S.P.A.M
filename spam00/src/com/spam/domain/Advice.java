package com.spam.domain;

import java.util.Date;

public class Advice {
	private int adviceNo;
	private int sId;
	private int pId;
	private int assentNo;
	private String cause;
	private String assentDate;
	private String registration;
	private String adviceDate;
	private String reason;
	private String mon;
	private String tue;
	private String wed;
	private String thur;
	private String fri;
	private int quarter;
	private String state;
	private String day;
	private String period;
	private String searchDate;
	private String name;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSearchDate() {
		return searchDate;
	}

	public void setSearchDate(String searchDate) {
		this.searchDate = searchDate;
	}

	public int getAdviceNo() {
		return adviceNo;
	}

	public void setAdviceNo(int adviceNo) {
		this.adviceNo = adviceNo;
	}

	public int getsId() {
		return sId;
	}

	public void setsId(int sId) {
		this.sId = sId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getAssentNo() {
		return assentNo;
	}

	public void setAssentNo(int assentNo) {
		this.assentNo = assentNo;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public String getAssentDate() {
		return assentDate;
	}

	public void setAssentDate(String assentDate) {
		this.assentDate = assentDate;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getAdviceDate() {
		return adviceDate;
	}

	public void setAdviceDate(String adviceDate) {
		this.adviceDate = adviceDate;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
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

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	@Override
	public String toString() {
		return "Advice [adviceNo=" + adviceNo + ", sId=" + sId + ", pId=" + pId + ", assentNo=" + assentNo + ", cause="
				+ cause + ", assentDate=" + assentDate + ", registration=" + registration + ", adviceDate=" + adviceDate
				+ ", reason=" + reason + ", mon=" + mon + ", tue=" + tue + ", wed=" + wed + ", thur=" + thur + ", fri="
				+ fri + ", quarter=" + quarter + ", state=" + state + ", day=" + day + ", period=" + period
				+ ", searchDate=" + searchDate + ", name=" + name + "]";
	}
}
