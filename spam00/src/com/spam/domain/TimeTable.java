package com.spam.domain;

public class TimeTable{
	private int period;
	private String beginHour;
	private String beginMinutes;
	private String finishHour;
	private String finishMinutes;
	private String beginTime;
	private String finishTime;
	
	
	
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getFinishTime() {
		return finishTime;
	}
	public void setFinishTime(String finishTime) {
		this.finishTime = finishTime;
	}
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
	}
	public String getBeginHour() {
		return beginHour;
	}
	public void setBeginHour(String beginHour) {
		this.beginHour = beginHour;
	}
	public String getBeginMinutes() {
		return beginMinutes;
	}
	public void setBeginMinutes(String beginMinutes) {
		this.beginMinutes = beginMinutes;
	}
	public String getFinishHour() {
		return finishHour;
	}
	public void setFinishHour(String finishHour) {
		this.finishHour = finishHour;
	}
	public String getFinishMinutes() {
		return finishMinutes;
	}
	public void setFinishMinutes(String finishMinutes) {
		this.finishMinutes = finishMinutes;
	}
	@Override
	public String toString() {
		return "TimeTable [period=" + period + ", beginHour=" + beginHour + ", beginMinutes=" + beginMinutes
				+ ", finishHour=" + finishHour + ", finishMinutes=" + finishMinutes + "]";
	}
}