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

import com.teamo.bean.Order;
import com.teamo.bean.User;
import com.teamo.dao.OrderMapper;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		User u = (User) req.getSession().getAttribute("user");
		SqlSession sion = SqlSessionUtil.getSqlSession();
		OrderMapper mapper = sion.getMapper(OrderMapper.class);
		try {
			List<Order> list = mapper.findOrderByUserID(u.getUid());
			System.out.println("======================================" + list.size());
			req.setAttribute("list", list);
			req.getRequestDispatcher("order.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
