package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.BaseController;
import com.helper.WebHelper;

/**
 * Servlet implementation class Join
 */
@WebServlet("/join.do")
public class Join extends BaseController {

	private static final long serialVersionUID = 8039497732399319792L;

	// 1. Declare Helper + Service Object 
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 2. Create Helper Object
		web = WebHelper.getInstance(request, response);

		// 3. Check for Login
		if (web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath() + "/main.do", "이미 로그인 하셨습니다.");
			return null;
		}

		return "join";
	}

}
