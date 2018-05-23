package com.spam.domain;

import java.io.Serializable;

public class EmploymentType implements Serializable {
	private int no;	
	private String name;
	private int year;
	private int required;
	private int choice;
	private String state;

	public EmploymentType() {
	}

	public EmploymentType(int no, String name, int year, int required, int choice, String state) {
		this.no = no;
		this.name = name;
		this.year = year;
		this.required = required;
		this.choice = choice;
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

	public int getRequired() {
		return required;
	}

	public void setRequired(int required) {
		this.required = required;
	}

	public int getChoice() {
		return choice;
	}

	public void setChoice(int choice) {
		this.choice = choice;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
