package com.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.simple.parser.ParseException;

import com.dao.MyBatisConnectionFactory;
import com.dto.Movie;
import com.dto.Review;
import com.helper.BaseController;
import com.helper.MovieHelper;
import com.helper.WebHelper;
import com.service.ReviewService;
import com.service.impl.ReviewServiceImpl;

/**
 * Servlet implementation class MovieInfo
 */

@WebServlet("/movie_info.do")
public class MovieInfo extends BaseController {

	private static final long serialVersionUID = 1785522404768678079L;

	// Logger - log 확인하기 위한 객체
	// SqlSession - MyBaits에서 sql을 호출해주는 객체
	// WebHelper - 서블릿에서 다양한 처리를 도와주는 객체
	// ReviewService - review 테이블과 관련된 기능을 제공하는 객체
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

		MovieHelper helper = new MovieHelper();
		Movie movie = new Movie();

		// view에서 영화 제목 가져오기
		String title = web.getString("title"); 

		// 영화제목, 출력 개수 지정해서 json데이터로 영화정보 가져오기
		String jsonResult = helper.movieSelect(title, 1);

		try {
			// json데이터 파싱해서 Movie객체로 가져오기
			movie = helper.jsonParser(jsonResult);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		// 리뷰 정보 조회
		List<Review> reviewList = null;
		Review review = null;

		try {
			// ReviewServiceImpl객체의  selectMovieReviewList메소드로 해당 영화에 맞는 리뷰 리스트 가져오기
			// Movie객체로 조건 지정
			reviewList = reviewService.selectMovieReviewList(movie);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		// 작성된 리뷰가 있을 때 
		if(reviewList.size()>0) {
			try {
				// 리뷰 평점 불러오기
				review = reviewService.selectReviewGrade(movie);
				System.out.println(review.getGrade());
			} catch (Exception e) {
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}
		
		sqlSession.close();
		
		// request에 정보 넘기기
		request.setAttribute("review", review);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("movie", movie);
		
		// jsp이름 리턴
		return "movie_info";
	}

}
