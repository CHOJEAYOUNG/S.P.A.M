package com.spam.domain;

import java.io.Serializable;

import oracle.sql.BLOB;

public class Employment implements Serializable {
	private int emplNo; 		//������
	private int id;				//���̵�
	private int empcNo;			//��� ī�װ� ��ȣ
	private String registration;//�����
	private String originalName;//���� ���� �̸�
	private String saveName;	//����� ���� �̸�
	private String filePath;	//���� ���� ���
	private String cause;		//��������
	private int assentNo;		//���� ���� ������
	private String assentDate;	//���� ��¥
	private int attendanceNo;		//�񱳰� ������

	public Employment() {

	}

	public Employment(int emplNo, int id, int empcNo, String registration, String originalName, String saveName,
			String filePath, String cause, int assentNo, String assentDate, int attendanceNo) {
		this.emplNo = emplNo;
		this.id = id;
		this.empcNo = empcNo;
		this.registration = registration;
		this.originalName = originalName;
		this.saveName = saveName;
		this.filePath = filePath;
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

	public String getOriginalName() {
		return originalName;
	}

	public void setOriginalName(String originalName) {
		this.originalName = originalName;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}
}
