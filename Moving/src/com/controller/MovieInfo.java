package com.controller;

import java.io.IOException;
import java.net.URLDecoder;

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
import com.helper.BaseController;
import com.helper.MovieHelper;
import com.helper.WebHelper;

/**
 * Servlet implementation class MovieInfo
 */
@WebServlet("/movie_info.do")
public class MovieInfo extends BaseController {

	private static final long serialVersionUID = 1785522404768678079L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		MovieHelper helper = new MovieHelper();
		Movie movie = new Movie();
		
		// 한글 깨질때 디코딩
//		String entitle = web.getString("title");
//		
//		String title = URLDecoder.decode(entitle, "UTF-8");

		String title = web.getString("title");
		
//		System.out.println("타이틀 : " + title);
		
		String jsonResult = helper.movieSelect(title, 1);
		
		try {
//			movie = helper.jsonParser(json);
			movie = helper.jsonParser(jsonResult);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("movie", movie);
		
		return "movie_info";
	}

}
