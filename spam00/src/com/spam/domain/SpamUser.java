package com.spam.domain;

import java.io.Serializable;

public class SpamUser implements Serializable {
	private int id;
	private String passWord;
	private String power;
	private String name;
	private String grade;
	private String major;
	private String gender;
	private String phoneNo;
	private String phoneNo1;
	private String phoneNo2;
	private String phoneNo3;
	private String birthDate;
	private String office;
	private String empForm;
	private String grForm;
	private String cardNo;
	private String enrollment;
	
	public SpamUser() {
		
	}
	public SpamUser(int id, String passWord, String power, String name, String grade, String major, String gender,
			String phoneNo, String birthDate, String office, String empForm, String grForm, String cardNo,
			String enrollment) {
		this.id = id;
		this.passWord = passWord;
		this.power = power;
		this.name = name;
		this.grade = grade;
		this.major = major;
		this.gender = gender;
		this.phoneNo = phoneNo;
		this.birthDate = birthDate;
		this.office = office;
		this.empForm = empForm;
		this.grForm = grForm;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getEmpForm() {
		return empForm;
	}
	public void setEmpForm(String empForm) {
		this.empForm = empForm;
	}
	public String getGrForm() {
		return grForm;
	}
	public void setGrForm(String grForm) {
		this.grForm = grForm;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getEnrollment() {
		return enrollment;
	}
	public void setEnrollment(String enrollment) {
		this.enrollment = enrollment;
	}
	@Override
	public String toString() {
		return "SpamUser [id=" + id + ", passWord=" + passWord + ", power=" + power + ", name=" + name + ", grade="
				+ grade + ", major=" + major + ", gender=" + gender + ", phoneNo=" + phoneNo + ", phoneNo1=" + phoneNo1
				+ ", phoneNo2=" + phoneNo2 + ", phoneNo3=" + phoneNo3 + ", birthDate=" + birthDate + ", office="
				+ office + ", empForm=" + empForm + ", grForm=" + grForm + ", cardNo=" + cardNo + ", enrollment="
				+ enrollment + "]";
	}
}
