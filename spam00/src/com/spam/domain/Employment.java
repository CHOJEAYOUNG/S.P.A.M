package com.spam.domain;

import java.io.Serializable;

public class Employment implements Serializable {
	private int emplNo; 		//시퀀스
	private int id;				//아이디
	private int empcNo;			//취업 카테고리 번호
	private String registration;//등록일
	private String image;		//이미지 (첨부파일)
	private String cause;		//거절사유
	private int assentNo;		//승인 상태 시퀀스
	private String assentDate;	//승인 날짜
	private int attendanceNo;		//비교과 시퀀스

	public Employment() {

	}

	public Employment(int emplNo, int id, int empcNo, String registration, String image, String cause, int assentNo,
			String assentDate, int attendanceNo) {
		this.emplNo = emplNo;
		this.id = id;
		this.empcNo = empcNo;
		this.registration = registration;
		this.image = image;
		this.cause = cause;
		this.assentNo = assentNo;
		this.assentDate = assentDate;
		this.attendanceNo = attendanceNo;
	}

	public int getEmplNo() {
		return emplNo;
	}

	public void setEmplNo(int emplNo) {
		this.emplNo = emplNo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmpcNo() {
		return empcNo;
	}

	public void setEmpcNo(int empcNo) {
		this.empcNo = empcNo;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCause() {
		return cause;
	}

	public void setCause(String cause) {
		this.cause = cause;
	}

	public int getAssentNo() {
		return assentNo;
	}

	public void setAssentNo(int assentNo) {
		this.assentNo = assentNo;
	}

	public String getAssentDate() {
		return assentDate;
	}

	public void setAssentDate(String assentDate) {
		this.assentDate = assentDate;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public void setattendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}

}
