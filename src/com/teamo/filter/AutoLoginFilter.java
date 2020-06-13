package com.teamo.filter;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.User;
import com.teamo.dao.UserMapper;
import com.teamo.util.MD5Util;
import com.teamo.util.SqlSessionUtil;

@WebFilter("/*")
public class AutoLoginFilter implements Filter {

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		boolean auto = false;
		if (user == null) {
			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				user = new User();
				for (Cookie cookie : cookies) {
					if ("username".equals(cookie.getName())) {
						user.setUname(cookie.getValue());
					}
					if ("password".equals(cookie.getName())) {
						try {
							user.setUpassword(MD5Util.encrypt(cookie.getValue()));
						} catch (NoSuchAlgorithmException e) {
							e.printStackTrace();
						}
					}
					if ("auto".equals(cookie.getName())) {
						auto = true;
					}
				}
				if (auto) {
					try {
						SqlSession sion = SqlSessionUtil.getSqlSession();
						UserMapper mapper = sion.getMapper(UserMapper.class);
						user = mapper.login(user);
						session.setAttribute("user", user);
						sion.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
		}
		chain.doFilter(req, res);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

}
