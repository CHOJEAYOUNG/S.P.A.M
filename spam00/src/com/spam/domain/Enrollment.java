package com.spam.domain;

import java.io.Serializable;

public class Enrollment implements Serializable {
	int enrollmentNo;
	String enrollmentContent;

	public Enrollment() {

	}
	public Enrollment(int enrollmentNo, String enrollmentContent) {
		this.enrollmentNo = enrollmentNo;
		this.enrollmentContent = enrollmentContent;
	}
	public int getEnrollmentNo() {
		return enrollmentNo;
	}
	public void setEnrollmentNo(int enrollmentNo) {
		this.enrollmentNo = enrollmentNo;
	}
	public String getEnrollmentContent() {
		return enrollmentContent;
	}
	public void setEnrollmentContent(String enrollmentContent) {
		this.enrollmentContent = enrollmentContent;
	}
	@Override
	public String toString() {
		return "Enrollment [enrollmentNo=" + enrollmentNo + ", enrollmentContent=" + enrollmentContent + "]";
	}
}
