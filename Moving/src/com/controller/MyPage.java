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
import com.dto.Review;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.ReviewService;
import com.service.impl.ReviewServiceImpl;

/**
 * Servlet implementation class MyPage
 */
@WebServlet("/myPage.do")
public class MyPage extends BaseController {

	private static final long serialVersionUID = -6154966169325974724L;

	// 1. Declare Helper + Service Object
	SqlSession sqlSession;
	WebHelper web;
	ReviewService reviewService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. Create Helper + Service Object
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		reviewService = new ReviewServiceImpl(sqlSession, logger);

		// 3. Select My Review List
		List<Review> myReview = null;
		Member reviewInfo = new Member();

		reviewInfo = (Member) web.getSession("loginInfo");

		try {
			myReview = reviewService.selectMyReview(reviewInfo);

			System.out.println("닉네임: " + myReview.get(0).getNickname());
			System.out.println(myReview.get(0).getContents());

		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		// 4. Pass Query Results to the View
		request.setAttribute("reviewList", myReview);

		return "my_page";
	}

}
