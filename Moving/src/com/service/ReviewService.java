package com.service;

import java.util.List;

import com.dto.Review;

public interface ReviewService {
	
	public List<Review> selectReviewList() throws Exception;
	
}
