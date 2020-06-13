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

/**
 * 删除购物车商品
 * 
 * @author Orichalcos
 *
 */
@WebServlet("/deleteFromCart")
public class DeleteFromShoppingCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("goodsID"));
		User user = (User) request.getSession().getAttribute("user");

		try (SqlSession session = SqlSessionUtil.getSqlSession();) {
			ShoppingCartMapper mapper = session.getMapper(ShoppingCartMapper.class);
			try {
				mapper.deleteGoods(user.getUid(), id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		response.sendRedirect("shoppingcart");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
