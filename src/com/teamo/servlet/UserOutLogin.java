package com.teamo.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/outlogin")
public class UserOutLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Cookie[] cookies = req.getCookies();
		for (Cookie cookie : cookies) {
			if (!"flag".equals(cookie.getName())) {
				cookie.setMaxAge(0);
				resp.addCookie(cookie);
			}
		}
		session.removeAttribute("user");
		resp.sendRedirect("login.jsp");
	}
}
