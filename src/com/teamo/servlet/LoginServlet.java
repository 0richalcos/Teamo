package com.teamo.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.User;
import com.teamo.dao.UserMapper;
import com.teamo.util.MD5Util;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = new User();

		String name = req.getParameter("username");
		String password = req.getParameter("password");
		String remeberMe = req.getParameter("remeberMe");
		String autoLogin = req.getParameter("autoLogin");

		Cookie ckname = new Cookie("username", name);
		Cookie ckpwd = new Cookie("password", password);
		Cookie flag = new Cookie("flag", remeberMe);
		Cookie auto = new Cookie("auto", autoLogin);

		if ("on".equals(remeberMe)) {
			ckname.setMaxAge(24 * 60 * 60);
			ckpwd.setMaxAge(24 * 60 * 60);
			flag.setMaxAge(24 * 60 * 60);

			if ("on".equals(autoLogin)) {
				auto.setMaxAge(24 * 60 * 60);
				resp.addCookie(auto);
			}

			resp.addCookie(ckname);
			resp.addCookie(ckpwd);
			resp.addCookie(flag);
		} else {
			ckname.setMaxAge(0);
			ckpwd.setMaxAge(0);
			flag.setMaxAge(0);
			auto.setMaxAge(0);

			resp.addCookie(ckname);
			resp.addCookie(ckpwd);
			resp.addCookie(flag);
			resp.addCookie(auto);
		}
		SqlSession sion = SqlSessionUtil.getSqlSession();
		UserMapper mapper = sion.getMapper(UserMapper.class);

		u.setUname(name);

		try {
			u.setUpassword(MD5Util.encrypt(password));
			u = mapper.login(u);
			if (u != null) {
				req.getSession().setAttribute("user", u);
				resp.sendRedirect("index");
			} else {
				resp.sendRedirect("login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

	}
}
