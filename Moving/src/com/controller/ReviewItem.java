package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.dao.MyBatisConnectionFactory;
import com.dto.Review;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.ReviewService;
import com.service.impl.ReviewServiceImpl;

/**
 * Servlet implementation class ReviewItem
 */
@WebServlet("/review_item.do")
public class ReviewItem extends BaseController {

	private static final long serialVersionUID = 91210029121116404L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	ReviewService reviewService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		
		Review review = new Review();
		Review reviewItem = new Review();
		
		System.out.println("id: " + web.getInt("id"));
		System.out.println("title: " + web.getString("title"));
		
		review.setMemberId(web.getInt("id"));
		review.setMovieName(web.getString("title"));
		
		try {
			reviewItem = reviewService.selectMyReviewItem(review);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("reviewItem", reviewItem);
		
		return "review_item";
	}
}
