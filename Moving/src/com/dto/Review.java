package com.dto;

import java.sql.Date;

public class Review {
	int id; // SEQUENCE RV_SEQ
	String movieName;
	float grade;
	String contents;
	int likeCount;
	Date regDate;
	int memberId;
	String nickname;
	String profileImg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public float getGrade() {
		return grade;
	}

	public void setGrade(float grade) {
		this.grade = grade;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	@Override
	public String toString() {
		return "Review [id=" + id + ", movieName=" + movieName + ", grade=" + grade + ", contents=" + contents
				+ ", likeCount=" + likeCount + ", regDate=" + regDate + ", memberId=" + memberId + ", nickname="
				+ nickname + ", profileImg=" + profileImg + "]";
	}


}