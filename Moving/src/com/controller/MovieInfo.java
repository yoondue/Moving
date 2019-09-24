package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.helper.BaseController;

/**
 * Servlet implementation class MovieInfo
 */
@WebServlet("/movie_info.do")
public class MovieInfo extends BaseController {

	private static final long serialVersionUID = 1785522404768678079L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		return "movie_info";
	}

}
