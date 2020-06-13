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

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		SqlSession sion = SqlSessionUtil.getSqlSession();

		GoodsMapper mapper = sion.getMapper(GoodsMapper.class);
		Integer id = Integer.parseInt(req.getParameter("gid"));
		try {
			List<Goods> list = mapper.sum(id);
			req.setAttribute("list", list);
			req.getRequestDispatcher("product.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sion.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}
}
