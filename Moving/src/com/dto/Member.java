package com.dto;

import java.sql.Date;

public class Member {
	int id; // SEQUENCE MEM_SEQ
	String userId;
	String userPw;
	String nickname;
	int age;
	String gender;
	String genre1;
	String genre2;
	String genre3;
	Date regDate;
	String profileImg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getGenre1() {
		return genre1;
	}

	public void setGenre1(String genre1) {
		this.genre1 = genre1;
	}

	public String getGenre2() {
		return genre2;
	}

	public void setGenre2(String genre2) {
		this.genre2 = genre2;
	}

	public String getGenre3() {
		return genre3;
	}

	public void setGenre3(String genre3) {
		this.genre3 = genre3;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public Member(int id, String userId, String userPw, String nickname, int age, String gender, String genre1,
			String genre2, String genre3, Date regDate, String profileImg) {
		super();
		this.id = id;
		this.userId = userId;
		this.userPw = userPw;
		this.nickname = nickname;
		this.age = age;
		this.gender = gender;
		this.genre1 = genre1;
		this.genre2 = genre2;
		this.genre3 = genre3;
		this.regDate = regDate;
		this.profileImg = profileImg;
	}
	public Member() {
		
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", userId=" + userId + ", userPw=" + userPw + ", nickname=" + nickname + ", age="
				+ age + ", gender=" + gender + ", genre1=" + genre1 + ", genre2=" + genre2 + ", genre3=" + genre3
				+ ", regDate=" + regDate + ", profileImg=" + profileImg + "]";
	}
	
	

}
