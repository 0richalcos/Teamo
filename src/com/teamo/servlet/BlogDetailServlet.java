package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.Blog;
import com.teamo.dao.BlogMapper;
import com.teamo.util.SqlSessionUtil;

/**
 * 博客详情
 * 
 * @author 123
 *
 */
@WebServlet("/BlogDetailServlet")
public class BlogDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SqlSession session = SqlSessionUtil.getSqlSession();
		BlogMapper mapper = session.getMapper(BlogMapper.class);
		int i = Integer.parseInt(request.getParameter("bid"));
		try {
			Blog current = mapper.current(i);
			request.setAttribute("current", current);
			request.getRequestDispatcher("inblog_left-siderbar.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
