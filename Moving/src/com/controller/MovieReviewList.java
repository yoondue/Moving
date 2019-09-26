package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.dao.MyBatisConnectionFactory;
import com.dto.Movie;
import com.dto.Review;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.ReviewService;
import com.service.impl.ReviewServiceImpl;

/**
 * Servlet implementation class MovieReviewList
 */
@WebServlet("/movie_review_list.do")
public class MovieReviewList extends BaseController {

	private static final long serialVersionUID = 2870019453160489605L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	ReviewService reviewService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		
		Movie movie = new Movie();
		String title = web.getString("title");
		movie.setTitle(title);
		
		List<Review> reviewList = null;
		
		try {
			reviewList = reviewService.selectMovieReviewList(movie);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		request.setAttribute("reviewList", reviewList);
		
		return "review_list";
	}


}
