package com.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.dto.Movie;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.MovieService;
import com.service.impl.MovieServiceImpl;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main.do")
public class Main extends BaseController {

	private static final long serialVersionUID = -4375106067231496651L;

	// 1. Declare Helper + Service Object
	SqlSession sqlSession;
	WebHelper web;
	MovieService movieService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. Create Helper + Service Object
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		movieService = new MovieServiceImpl(sqlSession, logger);

		// 3. Select My Review List
		List<Movie> recommendedMovie = null;
		Member myMember = new Member();

		myMember = (Member) web.getSession("loginInfo");
		// System.out.println("장르 " + myMember.getGenre1());
		// System.out.println("장르 " + myMember.getGenre2());
		// System.out.println("장르 " + myMember.getGenre3());

		try {
			// 인자: 검색 조건
			recommendedMovie = movieService.selectMovieAsGenre(myMember);
			// System.out.println("영화이름: " + recommendedMovie.get(0).getTitle());

			Collections.shuffle(recommendedMovie);

			for (int i = 0; i < recommendedMovie.size(); i++) {
				System.out.println("!" + recommendedMovie.get(i).getTitle());
			}

		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		// 4. Pass Query Results to the View
		request.setAttribute("recommendedMovie", recommendedMovie);

		return "main";
	}

}
