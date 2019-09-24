package com.dto;

import java.sql.Date;

public class Review {
	int id; // SEQUENCE RV_SEQ
	String movieName;
	int grade;
	String contents;
	int likeCount;
	Date regDate;
	int memberId;

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

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
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

	@Override
	public String toString() {
		return "Review [id=" + id + ", movieName=" + movieName + ", grade=" + grade + ", contents=" + contents
				+ ", likeCount=" + likeCount + ", regDate=" + regDate + ", memberId=" + memberId + "]";
	}

	

}