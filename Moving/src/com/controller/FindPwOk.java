package com.controller;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;

import com.dao.MyBatisConnectionFactory;
import com.dto.Member;
import com.helper.BaseController;
import com.helper.MailHelper;
import com.helper.RegexHelper;
import com.helper.Util;
import com.helper.WebHelper;
import com.service.MemberService;
import com.service.impl.MemberServiceImpl;

/**
 * Servlet implementation class FindPwOk
 */
@WebServlet("/find_pw_ok.do")
public class FindPwOk extends BaseController {

	private static final long serialVersionUID = -839201381577767154L;

	// 1. Declare Helper + Service Object
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("!!");
		// 2. Create Helper + Service Object
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);

		// 3. Check for Login
		if (web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath() + "/main.do", "이미 로그인 하셨습니다.");
			return null; // !
		}

		// 4. Send to Parameter
		String email = web.getString("email");

		if (email == null) {
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요.");
			return null;
		}

		// 5. Create Temporary Password
		String newPassword = Util.getInstance().getRandomPassword();

		// 6. Put the passed parameters in Beans Object
		Member member = new Member();
		member.setUserId(email);
		member.setUserPw(newPassword);

		// 7. Password Renewal via Service
		try {
			memberService.updateMemberPassword(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		// 8. Sending issued Password by E-mail
		String sender = "movingteam@moving.com";
		String subject = "[Moving] 임시 비밀번호 발급!";
		String content = "임시 비밀번호를 발급해드립니다. <br> <strong>" + newPassword + "</strong>입니다.";
		try {
			System.out.println("sender: " + sender);
			System.out.println("email: " + email);
			System.out.println("subject: " + subject);
			System.out.println("content: " + content);
			System.out.println("new pw: " + newPassword);
			mail.sendMail(sender, email, subject, content);

		} catch(MessagingException e) {
			web.redirect(null, "메일 발송에 실패했습니다. 관리자에게 문의 바랍니다.");
			return null;
		}
		
		// 9. Move Login Page
		web.redirect(null, "임시 비밀번호가 메일로 발송되었습니다.");
		
		return null;
	}

}
