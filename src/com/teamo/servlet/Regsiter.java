package com.teamo.servlet;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.User;
import com.teamo.dao.UserMapper;
import com.teamo.util.MD5Util;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/register")
public class Regsiter extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession sion = SqlSessionUtil.getSqlSession();
		String mssg = (String) req.getSession().getAttribute("mssg");
		UserMapper mapper = sion.getMapper(UserMapper.class);

		String check = req.getParameter("checkCode");
		String n = req.getParameter("user");
		String p = req.getParameter("password");
		String pwd = req.getParameter("pwd");
		String ck = req.getParameter("ck");
		String email = req.getParameter("email");

		if ("on".equals(ck) && p.length() < 16 && p.length() >= 6 && p.equals(pwd) && mssg.equals(check)) {
			User user = new User();
			user.setUname(n);
			try {
				user.setUpassword(MD5Util.encrypt(p));
				user.setUemail(email);
				mapper.reg(user);
				mapper.addCart(mapper.findUserID(n));
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
			resp.sendRedirect("login.jsp");
		} else {
			resp.sendRedirect("register.jsp");
		}
		sion.close();
	}
}
