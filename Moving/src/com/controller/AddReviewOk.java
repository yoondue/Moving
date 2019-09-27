package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.dto.Review;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.ReviewService;
import com.service.impl.ReviewServiceImpl;

/**
 * Servlet implementation class AddReviewOk
 */
@WebServlet("/add_review_ok")
public class AddReviewOk extends BaseController {

	private static final long serialVersionUID = -7336843930604791615L;
	
	WebHelper web;
	Logger logger;
	SqlSession sqlSession;
	ReviewService reviewService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		web = WebHelper.getInstance(request, response);
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		reviewService = new ReviewServiceImpl(sqlSession, logger);
		
		// 로그인한 회원 정보 받아오기
		Member member = new Member();
		member = (Member)web.getSession("loginInfo", null);
		
		System.out.println("아이디:" + member.getId());
		
		// 작성한 리뷰 정보 받아오기
		String title = web.getString("title");
		
		int grade = web.getInt("grade");
		
		float gradeF = (float)grade;
		
		String contents = web.getString("contents");
		
		System.out.println("타이틀 : " + title);
		System.out.println("별점 : " + grade);
		System.out.println("내용 : " + contents);
		
		// 리뷰 객체에 저장
		Review review = new Review();
		review.setMovieName(title);
		review.setGrade(gradeF);
		review.setContents(contents);
		review.setMemberId(member.getId());
		
		try {
			reviewService.insertReview(review);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		title = review.getMovieName();
		
		request.setAttribute("title", title);
		web.redirect(web.getRootPath() + "/movie_info.do?title="+title, "리뷰 작성이 완료되었습니다.");
		
		return null;
	}
       
  

}

