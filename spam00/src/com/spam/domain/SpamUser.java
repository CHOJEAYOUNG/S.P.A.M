package com.spam.domain;

import java.io.Serializable;

public class SpamUser implements Serializable {
	private int id;
	private String passWord;
	private String power;
	private String name;
	private int grade;
	private String major;
	private String phoneNo;
	private String phoneNo1;
	private String phoneNo2;
	private String phoneNo3;
	private String birthDate;
	private String office;
	private int empNo;
	private int grNo;
	private int cardNo;
	private int enrollment;
	
	public SpamUser() {
		
	}
	public SpamUser(int id, String passWord, String power, String name, String major, int grade,
			String phoneNo, String birthDate, String office, int empNo, int grNo, int cardNo,
			int enrollment) {
		this.id = id;
		this.passWord = passWord;
		this.power = power;
		this.name = name;
		this.grade = grade;
		this.major = major;
		this.phoneNo = phoneNo;
		this.birthDate = birthDate;
		this.office = office;
		this.empNo = empNo;
		this.grNo = grNo;
		this.cardNo = cardNo;
		this.enrollment = enrollment;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getPower() {
		return power;
	}
	
	public String getPhoneNo1() {
		return phoneNo1;
	}
	public void setPhoneNo1(String phoneNo1) {
		this.phoneNo1 = phoneNo1;
	}
	public String getPhoneNo2() {
		return phoneNo2;
	}
	public void setPhoneNo2(String phoneNo2) {
		this.phoneNo2 = phoneNo2;
	}
	public String getPhoneNo3() {
		return phoneNo3;
	}
	public void setPhoneNo3(String phoneNo3) {
		this.phoneNo3 = phoneNo3;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getOffice() {
		return office;
	}
	public void setOffice(String office) {
		this.office = office;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public int getGrNo() {
		return grNo;
	}
	public void setGrNo(int grNo) {
		this.grNo = grNo;
	}
	public int getCardNo() {
		return cardNo;
	}
	public void setCardNo(int cardNo) {
		this.cardNo = cardNo;
	}
	public int getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(int enrollment) {
		this.enrollment = enrollment;
	}
	@Override
	public String toString() {
		return "SpamUser [id=" + id + ", passWord=" + passWord + ", power=" + power + ", name=" + name + ", grade="
				+ grade + ", major=" + major + "phoneNo=" + phoneNo + ", phoneNo1=" + phoneNo1
				+ ", phoneNo2=" + phoneNo2 + ", phoneNo3=" + phoneNo3 + ", birthDate=" + birthDate + ", office="
				+ office + ", empNo=" + empNo + ", grNo=" + grNo + ", cardNo=" + cardNo + ", enrollment="
				+ enrollment + "]";
	}
}
