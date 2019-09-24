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

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.helper.BaseController;
import com.helper.WebHelper;
import com.service.MemberService;
import com.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class AdminMember
 */
// admin.login에서 a태그를 통해 이동
@WebServlet("/admin_member.do")
public class AdminMember extends BaseController {
       
	private static final long serialVersionUID = -1719232058550673049L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	// --> import org.apache.logging.log4j.Logger;
	Logger logger;
	// --> import org.apache.ibatis.session.SqlSession;
	SqlSession sqlSession;
	// --> import study.jsp.helper.WebHelper;
	WebHelper web;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		
		/** (5) 조회할 정보에 대한 Beans 생성 */
//		Member member = new Member(); // 전체조회가 아닌 조건조회일 때 사용
		
		/** (6) 게시글 목록 조회 */
		List<Member> memberList = null;
		try {
			memberList = memberService.selectMemberList();
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (7) 조회 결과를 View에 전달 */
		request.setAttribute("memberList", memberList);
		
		// 보여줄 뷰 리턴
		return "admin_member";
	}

}
