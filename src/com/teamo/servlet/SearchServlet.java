package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.Goods;
import com.teamo.dao.GoodsMapper;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("search");
		try (SqlSession session = SqlSessionUtil.getSqlSession();) {
			GoodsMapper mapper = session.getMapper(GoodsMapper.class);
			List<Goods> list = mapper.search("%" + str + "%");
			request.setAttribute("list", list);
			request.getRequestDispatcher("gridproducts_leftsidebar.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
