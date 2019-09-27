package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.membership.MemberImpl;
import org.apache.ibatis.session.SqlSession;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.MemberService;
import com.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class Out
 */
@WebServlet("/out_ok.do")
public class OutOk extends BaseController {

	private static final long serialVersionUID = -7083155849604626292L;

	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);

		String userPw = web.getString("userPw");

		// Check for Login
		if (web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath() + "/main.do", "로그인 후에 이용가능합니다.");
			return null;
		}

		// Service에 전달하기 위해 파라미터를 Beans로 묶기
		Member loginInfo = (Member) web.getSession("loginInfo"); 
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUserPw(userPw);

		// Service를 통한 탈퇴 시도
		try {
			// 비밀번호 검사
			memberService.selectMemberPasswordCount(member);

			// 탈퇴 처리
			memberService.deleteMember(member);

		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
		} finally {
			sqlSession.close();
		}

		web.removeAllSession();
		web.redirect(web.getRootPath() + "/main.do", "탈퇴되었습니다.");

		return null;
	}

}
