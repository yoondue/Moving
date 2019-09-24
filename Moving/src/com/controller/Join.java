package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.BaseController;

/**
 * Servlet implementation class Join
 */
@WebServlet("/join.do")
public class Join extends BaseController {
       
	private static final long serialVersionUID = 8039497732399319792L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "join";
	}

}
