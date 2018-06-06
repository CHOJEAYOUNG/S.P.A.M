package com.spam.domain;

import java.util.Date;

public class TimeTable{
	private int period;
	private String begin;
	private String finish;
	
	@Override
	public String toString() {
		return "TimeTable [period=" + period + ", begin=" + begin + ", finish=" + finish + "]";
	}
	
	public int getPeriod() {
		return period;
	}
	public void setPeriod(int period) {
		this.period = period;
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
}
