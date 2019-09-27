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
 * Servlet implementation class ReviewLike
 */
@WebServlet("/review_like.do")
public class ReviewLike extends BaseController {

	private static final long serialVersionUID = -4093107623986978098L;

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
		
		// 리뷰의 id값을 리뷰 객체에 저장
		Review review = new Review();
		review.setId(web.getInt("reviewId"));
		
		// 영화 제목 받아오기
		String title = web.getString("title");
		
		// like_count수를 +1해주기
		try {
			reviewService.updateLikeCount(review);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("title", title);
		web.redirect(web.getRootPath() + "/movie_info.do?title="+title, null);
		
		return null;
	}

}
