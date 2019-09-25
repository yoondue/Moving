package com.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.helper.BaseController;
import com.helper.RegexHelper;
import com.helper.WebHelper;
import com.service.impl.MemberServiceImpl;

import oracle.sql.DATE;

/**
 * Servlet implementation class joinOk
 */
@WebServlet("/joinOk.do")
public class JoinOk extends BaseController {
	private static final long serialVersionUID = -4225169984323860028L;

	// 1. Declare Helper + Service Object
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	MemberServiceImpl memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. Create Helper + Service Object
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);

		// 3. Put the passed parameters in Beans Object
		Member member = new Member();
		member.setUserId(web.getString("user_id"));
		member.setUserPw(web.getString("user_pw"));
		member.setNickname(web.getString("nickname"));
		member.setAge(Integer.parseInt(web.getString("age")));
		member.setGender(web.getString("gender"));
		String genre[] = web.getStringArray("genre");
		member.setGenre1(genre[0]);
		member.setGenre2(genre[1]);
		member.setGenre3(genre[2]);
		// System.out.println(member.getUserId());
		// System.out.println(member.getAge());

		// 4. Validate Input
		// Email
		if (!regex.isValue(member.getUserId())) {
			sqlSession.close();
			web.redirect(null, "아이디로 사용할 이메일을 입력하세요.");
			return null;
		}

		// Password
		if (!regex.isValue(member.getUserPw())) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}

		if (!regex.isEngNumChar(member.getUserPw())) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자, 영문, 특수문자를 포함하여야 합니다.");
			return null;
		}

		if (member.getUserPw().length() > 20 || member.getUserPw().length() < 8) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 8자 이상, 20자까지 가능합니다.");
			return null;
		}

		/*
		 * if(!member.getUserPw().equals(userPwRe)) { sqlSession.close();
		 * web.redirect(null, "비밀번호를 확인해주세요."); return null; }
		 */

		// Nickname
		if (!regex.isValue(member.getNickname())) {
			sqlSession.close();
			web.redirect(null, "닉네임을 입력하세요.");
			return null;
		}

		if (!regex.isEngKorNum(member.getNickname())) {
			sqlSession.close();
			web.redirect(null, "닉네임은 한글, 영문, 숫자만 가능합니다.");
			return null;
		}

		if (member.getNickname().length() < 2 || member.getNickname().length() > 6) {
			sqlSession.close();
			web.redirect(null, "닉네임은 2~6자까지 가능합니다.");
			return null;
		}

		// Age
		if (!regex.isValue(String.valueOf(member.getAge()))) {
			sqlSession.close();
			web.redirect(null, "연령대를 선택해주세요.");
			return null;
		}

		// Genre1
		if (!regex.isValue(member.getGenre1())) {
			sqlSession.close();
			web.redirect(null, "선호하는 장르를 최소 1개 선택해주세요.");
			return null;
		}

		// 5. Database Save Processing through Service
		try {
			memberService.insertMember(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		// 6. Complete Join -> Move Login Page
		sqlSession.close();
		web.redirect(web.getRootPath() + "/login.do", "회원가입이 완료되었습니다.");

		return null;
	}
}
