package com.dto;

import java.sql.Date;

public class RecommendMovie {
	int id; // SEQUENCE RM_SEQ
	String movieName;
	String contents;
	String movieImg;
	Date regDate;

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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getMovieImg() {
		return movieImg;
	}

	public void setMovieImg(String movieImg) {
		this.movieImg = movieImg;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "RecommendMovie [id=" + id + ", movieName=" + movieName + ", contents=" + contents + ", movieImg="
				+ movieImg + ", regDate=" + regDate + "]";
	}
	
	
}


