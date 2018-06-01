package com.spam.domain;

import java.io.Serializable;

public class EmploymentCategory implements Serializable {
	private int no;
	
	private String name;
	private int empTypeNo;
	private int conditionSqeNo;
	private int score;
	private String info;
	private String state;

	public EmploymentCategory() {

	}
	
	public EmploymentCategory(int no, String name, int empTypeNo, int conditionSqeNo, int score,
			String info, String state) {
		super();
		this.no = no;
		this.name = name;
		this.empTypeNo = empTypeNo;
		this.conditionSqeNo = conditionSqeNo;
		this.score = score;
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

	public int getEmpTypeNo() {
		return empTypeNo;
	}

	public void setEmpTypeNo(int empTypeNo) {
		this.empTypeNo = empTypeNo;
	}

	public int getConditionSqeNo() {
		return conditionSqeNo;
	}

	public void setConditionSqeNo(int conditionSqeNo) {
		this.conditionSqeNo = conditionSqeNo;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
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
	@Override
	public String toString() {
		return "EmploymentCategory [no=" + no + ", name=" + name + ", empTypeNo=" + empTypeNo + ", conditionSqeNo="
				+ conditionSqeNo + ", score=" + score + ", info=" + info + ", state=" + state + "]";
	}

}
