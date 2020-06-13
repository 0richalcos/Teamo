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
import com.teamo.dao.ShoppingCartMapper;
import com.teamo.util.SqlSessionUtil;

/**
 * 显示购物车商品
 * 
 * @author Orichalcos
 *
 */
@WebServlet("/shoppingcart")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		try (SqlSession session = SqlSessionUtil.getSqlSession();) {
			ShoppingCartMapper mapper = session.getMapper(ShoppingCartMapper.class);
			try {
				List<GoodsShoppingCart> list = mapper.list(user.getUid());
				request.setAttribute("list", list);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		request.getRequestDispatcher("shoppingcart.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
