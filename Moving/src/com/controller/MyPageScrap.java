package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.dto.Scrap;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.ReviewService;
import com.service.ScrapService;
import com.service.impl.ReviewServiceImpl;

/**
 * Servlet implementation class MyPage
 */
@WebServlet("/my_scrap.do")
public class MyPageScrap extends BaseController {

	private static final long serialVersionUID = -6154966169325974724L;

	// 1. Declare Helper + Service Object
	SqlSession sqlSession;
	WebHelper web;
	ReviewService reviewService;
	ScrapService scrapService;


	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. Create Helper + Service Object
		System.out.println("!@!$!@#!@#!@#!#@");
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		reviewService = new ReviewServiceImpl(sqlSession, logger);

		// 3. Select My Scrap List
		List<Scrap> myScrap = null;
		Member scrapInfo = new Member();

		scrapInfo = (Member) web.getSession("loginInfo");

		try {
			myScrap = scrapService.selectMyScrap(scrapInfo);

			System.out.println("!영화이름: " + myScrap.get(0).getMovieName());

		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		// 4. Pass Query Results to the View
		request.setAttribute("scrapList", myScrap);

		return "my_page_scrap";
	}

}
