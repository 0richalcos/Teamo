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

import com.teamo.bean.GoodsShoppingCart;
import com.teamo.bean.User;
import com.teamo.dao.OrderMapper;
import com.teamo.dao.ShoppingCartMapper;
import com.teamo.util.SqlSessionUtil;

/**
 * 结账Servlet
 * 
 * @author Orichalcos
 *
 */

@WebServlet("/CheckOut")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = ((User) request.getSession().getAttribute("user")).getUid();
		SqlSession sqlSession = SqlSessionUtil.getSqlSession();
		ShoppingCartMapper cartMapper = sqlSession.getMapper(ShoppingCartMapper.class);
		OrderMapper orderMapper = sqlSession.getMapper(OrderMapper.class);
		try {
			List<GoodsShoppingCart> list = cartMapper.list(id);
			request.setAttribute("cartList", list);

			User user = orderMapper.findOrder(id);
			request.setAttribute("user", user);

			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
