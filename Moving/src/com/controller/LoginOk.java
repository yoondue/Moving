package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.MemberService;
import com.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class LoginOk
 */
@WebServlet("/login_ok.do")
public class LoginOk extends BaseController {

	private static final long serialVersionUID = -891383550298665336L;

	// 1. Declare Helper + Service Object
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;

	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// 2. Create Helper + Service Object
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);

		// 3. Check for Login
		if (web.getSession("loginInfo") != null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/main.do", "이미 로그인 하셨습니다.");
			
			return null;
		}

		// 4. Parameter Processing
		String userId = web.getString("user_id");
		String userPw = web.getString("user_pw");

		if (userId == null || userPw == null) {
			sqlSession.close();
			web.redirect(null, "아이디나 비밀번호가 없습니다.");
			return null;
		}

		// 5. Put the passed parameters in Beans Object
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPw(userPw);

		// 6. Member Authentication Through Services
		Member loginInfo = null;

		try {
			loginInfo = memberService.selectLoginInfo(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null; 
		}

		// 7. Save Retrieved Member Information in Session
		web.setSession("loginInfo", loginInfo);

		// 8. Go to 'main.do'
		web.redirect(web.getRootPath() + "/main.do", "로그인하셨습니다.");

		return null;

	}

}
