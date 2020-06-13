package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.User;
import com.teamo.dao.BlogMapper;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/BlogComment")
public class BlogCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession session = SqlSessionUtil.getSqlSession();
		BlogMapper mapper = session.getMapper(BlogMapper.class);
		String str = request.getParameter("comment");
		Integer bdid = Integer.parseInt(request.getParameter("bdid"));
		try {
			mapper.add(str, new Date(), ((User) request.getSession().getAttribute("user")).getUname(), bdid);
			response.sendRedirect("BlogDetailServlet?bid=" + bdid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		session.close();
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
