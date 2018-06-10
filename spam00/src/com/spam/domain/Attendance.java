package com.spam.domain;

import java.io.Serializable;

public class Attendance implements Serializable{
	private int attendanceNo;
	private String title;
	private String registrationDate;
	private String lectureDate;
	private String lectureTime;
	private String lectureTime_hour;
	private String lectureTime_min;
	private String location;
	private int score;
	private String uploadFileName;
	private int uploadFileNameWithS;
	private String makedFileName;
	private int makedFileNameWithS;
	private String filesLocation;
	public int getAttendanceNo() {
		return attendanceNo;
	}
	public void setAttendanceNo(int attendanceNo) {
		this.attendanceNo = attendanceNo;
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
	public String getLectureTime_hour() {
		return lectureTime_hour;
	}
	public void setLectureTime_hour(String lectureTime_hour) {
		this.lectureTime_hour = lectureTime_hour;
	}
	public String getLectureTime_min() {
		return lectureTime_min;
	}
	public void setLectureTime_min(String lectureTime_min) {
		this.lectureTime_min = lectureTime_min;
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
	public int getUploadFileNameWithS() {
		return uploadFileNameWithS;
	}
	public void setUploadFileNameWithS(int uploadFileNameWithS) {
		this.uploadFileNameWithS = uploadFileNameWithS;
	}
	public String getMakedFileName() {
		return makedFileName;
	}
	public void setMakedFileName(String makedFileName) {
		this.makedFileName = makedFileName;
	}
	public int getMakedFileNameWithS() {
		return makedFileNameWithS;
	}
	public void setMakedFileNameWithS(int makedFileNameWithS) {
		this.makedFileNameWithS = makedFileNameWithS;
	}
	public String getFilesLocation() {
		return filesLocation;
	}
	public void setFilesLocation(String filesLocation) {
		this.filesLocation = filesLocation;
	}
	@Override
	public String toString() {
		return "Attendance [attendanceNo=" + attendanceNo + ", title=" + title + ", registrationDate="
				+ registrationDate + ", lectureDate=" + lectureDate + ", lectureTime=" + lectureTime
				+ ", lectureTime_hour=" + lectureTime_hour + ", lectureTime_min=" + lectureTime_min + ", location="
				+ location + ", score=" + score + ", uploadFileName=" + uploadFileName + ", uploadFileNameWithS="
				+ uploadFileNameWithS + ", makedFileName=" + makedFileName + ", makedFileNameWithS="
				+ makedFileNameWithS + ", filesLocation=" + filesLocation + "]";
	}
	
	
}