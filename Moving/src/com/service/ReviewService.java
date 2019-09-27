package com.service;

import java.util.List;

import com.dto.Member;
import com.dto.Movie;
import com.dto.Review;

public interface ReviewService {
	
	public List<Review> selectReviewList() throws Exception;
	
	public List<Review> selectMyReview(Member member) throws Exception;
	
	public List<Review> selectMovieReviewList(Movie movie) throws Exception;
	
	public Review selectReviewGrade(Movie movie) throws Exception;
	
	public void insertReview(Review review) throws Exception;
}
