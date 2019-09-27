package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.Member;
import com.dto.Movie;
import com.helper.BaseController;
import com.helper.WebHelper;

/**
 * Servlet implementation class AddReview
 */
@WebServlet("/add_review.do")
public class AddReview extends BaseController {

	private static final long serialVersionUID = 3394553626391065384L;
	
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		web = WebHelper.getInstance(request, response);
		
		if(web.getSession("loginInfo", null) == null) {
			web.redirect(null, "회원만 리뷰작성 가능합니다.");
			return null;
		}
		
		Movie movie = new Movie();
		movie.setTitle(web.getString("title"));
		
		request.setAttribute("movie", movie);
		
		return "add_review";
	}
	

}
