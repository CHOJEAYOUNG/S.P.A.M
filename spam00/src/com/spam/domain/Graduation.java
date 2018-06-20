package com.spam.domain;

import java.io.Serializable;

public class Graduation implements Serializable {
	private int grlNo; // ������
	private int id; // ���̵�
	private int grcNo; // ��� ī�װ� ��ȣ
	private String registration;// �����
	private String originalName;// ���� ���� �̸�
	private String saveName; // ����� ���� �̸�
	private String filePath; // ���� ���� ���
	private String cause; // ��������
	private int assentNo; // ���� ���� ������
	private String assentDate; // ���� ��¥

	public Graduation() {
		
	}

	public Graduation(int grlNo, int id, int grcNo, String registration, String originalName, String saveName,
			String filePath, String cause, int assentNo, String assentDate) {
		this.grlNo = grlNo;
		this.id = id;
		this.grcNo = grcNo;
		this.registration = registration;
		this.originalName = originalName;
		this.saveName = saveName;
		this.filePath = filePath;
		this.cause = cause;
		this.assentNo = assentNo;
		this.assentDate = assentDate;
	}

	public int getGrlNo() {
		return grlNo;
	}

	public void setGrlNo(int grlNo) {
		this.grlNo = grlNo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getGrcNo() {
		return grcNo;
	}

	public void setGrcNo(int grcNo) {
		this.grcNo = grcNo;
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
}