package com.spam.domain;

import java.io.Serializable;

public class SpamUser implements Serializable {
	private int spamId;
	private String passWord;
	private String name;
	
	private String rank;
	private String birthDay;
	
	public SpamUser() {
		this.spamId = 0;
		this.passWord = null;
		this.name = null;
		this.rank = null;
		this.birthDay = null;
	}
	public int getSpamId() {
		return spamId;
	}

	public void setSpamId(int spamId) {
		this.spamId = spamId;
	}

	public String getPassWord() {
		return passWord;
	}

	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(String birthDay) {
		this.birthDay = birthDay;
	}

	@Override
	public String toString() {
		return "SpamUser [spampId=" + spamId + ", password=" + passWord + ", name=" + name + ", rank=" + rank
				+ ", birthDay=" + birthDay + "]";
	}
}
