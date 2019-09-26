package com.service;

import java.util.List;

import com.dto.Member;
import com.dto.Review;

public interface ReviewService {
	
	public List<Review> selectReviewList() throws Exception;
	
	public List<Review> selectMyReview(Member member) throws Exception;
	
}
