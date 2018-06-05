package com.spam.domain;

import java.io.Serializable;

public class GraduationCategory implements Serializable {
	private int no;
	private String name;
	private int grTypeNo;
	private int conditionSqeNo;
	private String info;
	private String state;

	public GraduationCategory() {

	}

	public GraduationCategory(int no, String name, int grTypeNo, int conditionSqeNo, String info, String state) {
		this.no = no;
		this.name = name;
		this.grTypeNo = grTypeNo;
		this.conditionSqeNo = conditionSqeNo;
		this.info = info;
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

	public int getGrTypeNo() {
		return grTypeNo;
	}

	public void setGrTypeNo(int grTypeNo) {
		this.grTypeNo = grTypeNo;
	}

	public int getConditionSqeNo() {
		return conditionSqeNo;
	}

	public void setConditionSqeNo(int conditionSqeNo) {
		this.conditionSqeNo = conditionSqeNo;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
}
