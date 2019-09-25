package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Member;
import com.helper.BaseController;
import com.helper.WebHelper;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/logout.do")
public class Logout extends BaseController {

	private static final long serialVersionUID = -8259203282375679952L;

	// 1. Declare Helper + Service Object
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. Create Helper Object
		web = WebHelper.getInstance(request, response);

		// 3. Check for Login
		Member loginInfo = (Member) web.getSession("loginInfo"); // Get member login

		if (loginInfo == null) {
			web.redirect(web.getRootPath() + "/login.do", "로그인 후 이용 가능합니다.");
		}

		// 4. Logout
		web.removeAllSession();

		// 5. Move Page
		web.redirect(web.getRootPath() + "/main.do", "로그아웃 되었습니다.");

		return null;
	}

}
