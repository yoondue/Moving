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

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
//	SqlSession sqlSession2;
	WebHelper web;
	ReviewService reviewService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);

		reviewService = new ReviewServiceImpl(sqlSession, logger);

		MovieHelper helper = new MovieHelper();
		Movie movie = new Movie();

		// 한글 깨질 때 디코딩
//		String entitle = web.getString("title");
//		String title = URLDecoder.decode(entitle, "UTF-8");

		// 영화 제목 가져오기
		String title = web.getString("title"); 

		System.out.println("타이틀 : " + title); 

		// 영화 정보 조회
		String jsonResult = helper.movieSelect(title, 1);

		try {
//			movie = helper.jsonParser(json);
			movie = helper.jsonParser(jsonResult);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 리뷰 정보 조회
		List<Review> reviewList = null;

		try {
			reviewList = reviewService.selectMovieReviewList(movie);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		// 영화의 리뷰 평점 구하기
		Review review = null;

		try {
			review = reviewService.selectReviewGrade(movie);
			System.out.println("여기까지!!!" + review.getGrade());
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// 해당 영화에 리뷰가 하나도 없을때
		if(review.equals(null) && reviewList.isEmpty()) {
			System.out.println("리뷰 널!!!");
			request.setAttribute("movie", movie);
			web.redirect(web.getRootPath() + "/movie_info.do?title="+title, null);
			return null;
			
		}
		

		request.setAttribute("review", review);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("movie", movie);

		return "movie_info";
	}

}
