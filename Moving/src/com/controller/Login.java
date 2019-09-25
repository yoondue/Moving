package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.BaseController;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login.do")
public class Login extends BaseController {

	private static final long serialVersionUID = 1822025864650906930L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "login";
	}

}
