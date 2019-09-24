package com.dto;

import java.sql.Date;

public class Scrap {
	int id; // SEQUENCE SCR_SEQ
	String movieName;
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

	public Scrap(int id, String movieName, Date regDate, int memberId) {
		super();
		this.id = id;
		this.movieName = movieName;
		this.regDate = regDate;
		this.memberId = memberId;
	}

}