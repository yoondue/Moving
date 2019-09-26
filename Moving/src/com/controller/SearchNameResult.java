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
import org.json.simple.parser.ParseException;

import com.dao.MyBatisConnectionFactory;
import com.dto.Movie;
import com.helper.BaseController;
import com.helper.MovieHelper;
import com.helper.WebHelper;

/**
 * Servlet implementation class SearchNameResult
 */
@WebServlet("/search_name_result.do")
public class SearchNameResult extends BaseController {

	private static final long serialVersionUID = 8529969527885279567L;
	
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
		
		String keyword = web.getString("keyword");
		System.out.println("키워드 : " + keyword);
		
		MovieHelper helper = new MovieHelper();
		List<Movie> movieList = null;
		
		String jsonResult = helper.movieSelect(keyword, 20);
		
		try {
			movieList = helper.jsonParserList(jsonResult);
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(movieList.get(0).getTitle());
		
		request.setAttribute("movieList", movieList);
		
		return "search_result";
	}
}
