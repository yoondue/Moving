package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.BaseController;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main.do")
public class Main extends BaseController {

	private static final long serialVersionUID = -4375106067231496651L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "main";
	}


}
