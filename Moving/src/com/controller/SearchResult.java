package com.controller;

import java.io.IOException;
import java.net.URLDecoder;
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
		
		Movie movie = new Movie();
		
		String[] genre = web.getStringArray("genre", null);
		
		if(genre.length <= 0) {
			web.redirect(null, "입력값이 없습니다.");
		}
		
		// 검색할 장르 movie객체에 넣기
		if(genre.length == 1) {
			String result = URLDecoder.decode(genre[0], "UTF-8");
			movie.setGenre1(result);
		}
		else if(genre.length == 2) {
			String result = URLDecoder.decode(genre[0], "UTF-8");
			movie.setGenre1(result);
			result = URLDecoder.decode(genre[1], "UTF-8");
			movie.setGenre2(result);
		}
		else if(genre.length == 3) {
			String result = URLDecoder.decode(genre[0], "UTF-8");
			movie.setGenre1(result);
			result = URLDecoder.decode(genre[1], "UTF-8");
			movie.setGenre2(result);
			result = URLDecoder.decode(genre[2], "UTF-8");
			movie.setGenre3(result);
		}
		
		// 장르에 맞는 영화 검색
		List<Movie> movieList = null;
		
		try {
			// 체크한 장르가 하나일때
			if(genre.length == 1) {
				movieList = movieService.selectGenreOne(movie);
			}
			else if(genre.length == 2) {
				movieList = movieService.selectGenreTwo(movie);
			}
			else if(genre.length == 3) {
				movieList = movieService.selectGenreThree(movie);
			}
			
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
