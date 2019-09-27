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
 * Servlet implementation class Out
 */
@WebServlet("/out.do")
public class Out extends BaseController {

	private static final long serialVersionUID = 4424333342188117744L;

	WebHelper web; 

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		web = WebHelper.getInstance(request, response);

		// Check for Login
		if (web.getSession("loginInfo") != null) {
			web.redirect(web.getRootPath() + "/main.do", "로그인 후에 이용가능합니다.");
			return null;
		}

		return "out";
	}

}
