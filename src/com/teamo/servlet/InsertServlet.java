package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.User;
import com.teamo.dao.ShoppingCartMapper;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/insert")
public class InsertServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession sion = SqlSessionUtil.getSqlSession();
		ShoppingCartMapper mapper = sion.getMapper(ShoppingCartMapper.class);
		User user = (User) req.getSession().getAttribute("user");
		int input = Integer.parseInt(req.getParameter("input"));
		int idd = Integer.parseInt(req.getParameter("id"));
		try {
			mapper.addGoods(user.getShoppingCarts().get(0).getSid(), idd, input);
			resp.sendRedirect("shoppingcart");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sion.close();
	}
}
