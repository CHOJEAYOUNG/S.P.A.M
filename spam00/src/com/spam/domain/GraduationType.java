package com.spam.domain;

import java.io.Serializable;

public class GraduationType implements Serializable {
	private int no;
	private String name;
	private int year;
	private String state;

	public GraduationType() {

	}

	public GraduationType(int no, String name, int year, String state) {
		this.no = no;
		this.name = name;
		this.year = year;
		this.state = state;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
