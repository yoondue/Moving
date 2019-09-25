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
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.MovieService;
import com.service.impl.MovieServiceImpl;

/**
 * Servlet implementation class SearchResult
 */
@WebServlet("/search_result.do")
public class SearchResult extends BaseController {

	private static final long serialVersionUID = -3278435926387545577L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	MovieService movieService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		movieService = new MovieServiceImpl(sqlSession, logger);
		
		String[] genre = web.getStringArray("genre", null);
		
		System.out.println("장르 : " + genre[0].toString());
		
		Movie movie = new Movie();
		
		if(genre.length <= 0) {
			web.redirect(null, "입력값이 없습니다.");
		}
		
		// 검색할 장르 movie객체에 넣기
		switch(genre.length) {
		case 1:
			movie.setGenre1(genre[0]);
			System.out.println(movie.getGenre1());
			break;
			
		case 2:
			movie.setGenre1(genre[0]);
			movie.setGenre2(genre[1]);
			break;
			
		case 3:
			movie.setGenre1(genre[0]);
			movie.setGenre2(genre[1]);
			movie.setGenre3(genre[2]);
			break;
		}
		
		
		// 장르에 맞는 영화 검색
		List<Movie> movieList = null;
		
		try {
			movieList = movieService.selectGenre(movie);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// view에 결과 전달
		request.setAttribute("movieList", movieList);
		
		return "search_result";
	}
	
       


}
