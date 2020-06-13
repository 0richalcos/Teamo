package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.dao.ShoppingCartMapper;
import com.teamo.util.SqlSessionUtil;

/**
 * 购物车数量修改
 * 
 * @author Orichalcos
 *
 */

@WebServlet("/updateSum")
public class UpdateShoppingSum extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flag = request.getParameter("flag");
		int id = Integer.parseInt(request.getParameter("id"));
		try (SqlSession session = SqlSessionUtil.getSqlSession();) {
			ShoppingCartMapper mapper = session.getMapper(ShoppingCartMapper.class);
			if ("substarct".equals(flag)) {
				mapper.updateSum(false, id);
			} else {
				mapper.updateSum(true, id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("shoppingcart");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
