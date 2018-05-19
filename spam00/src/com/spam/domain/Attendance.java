package com.spam.domain;

import java.io.Serializable;

public class Attendance implements Serializable{
	private int attendanceNo;
	private String title;
	private String registrationDate;
	private String lectureDate;
	private String lectureTime;
	private String location;
	private int score;
	private String uploadFileName;
	private String makedFileName;
	private String filesLocation;
	
	public Attendance() {
		
	};
	
	public Attendance(int attendanceNo, String title, String registrationDate, String lectureDate, String lectureTime,
			String location, int score, String uploadFileName, String makedFileName, String filesLocation) {
		super();
		this.attendanceNo = attendanceNo;
		this.title = title;
		this.registrationDate = registrationDate;
		this.lectureDate = lectureDate;
		this.lectureTime = lectureTime;
		this.location = location;
		this.score = score;
		this.uploadFileName = uploadFileName;
		this.makedFileName = makedFileName;
		this.filesLocation = filesLocation;
	}

	@Override
	public String toString() {
		return "Attendance [attendanceNo=" + attendanceNo + ", title=" + title + ", registrationDate="
				+ registrationDate + ", lectureDate=" + lectureDate + ", lectureTime=" + lectureTime + ", location="
				+ location + ", score=" + score + ", uploadFileName=" + uploadFileName + ", makedFileName="
				+ makedFileName + ", filesLocation=" + filesLocation + "]";
	}



	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegistrationDate() {
		return registrationDate;
	}
	public void setRegistrationDate(String registrationDate) {
		this.registrationDate = registrationDate;
	}
	public String getLectureDate() {
		return lectureDate;
	}
	public void setLectureDate(String lectureDate) {
		this.lectureDate = lectureDate;
	}
	public String getLectureTime() {
		return lectureTime;
	}
	public void setLectureTime(String lectureTime) {
		this.lectureTime = lectureTime;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getMakedFileName() {
		return makedFileName;
	}
	public void setMakedFileName(String makedFileName) {
		this.makedFileName = makedFileName;
	}
	public String getFilesLocation() {
		return filesLocation;
	}
	public void setFilesLocation(String filesLocation) {
		this.filesLocation = filesLocation;
	}

	public int getAttendanceNo() {
		return attendanceNo;
	}

	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
	}
	
}