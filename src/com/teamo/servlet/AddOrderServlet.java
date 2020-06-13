package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

@WebServlet("/AddOrder")
public class AddOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dawk = request.getParameter("dawk");
		String phone = request.getParameter("phone");
		int addressID = Integer.parseInt(request.getParameter("address"));
		int uid = ((User) request.getSession().getAttribute("user")).getUid();

		SqlSession session = SqlSessionUtil.getSqlSession();
		OrderMapper orderMapper = session.getMapper(OrderMapper.class);
		ShoppingCartMapper cartMapper = session.getMapper(ShoppingCartMapper.class);
		try {
			String date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			orderMapper.create(date, uid, addressID, dawk, phone);
			List<GoodsShoppingCart> list = cartMapper.list(uid);
			for (int i = 0; i < list.size(); i++) {
				GoodsShoppingCart goodsShoppingCart = list.get(i);
				orderMapper.inserOrderDesc(goodsShoppingCart.getGid().getGid(), orderMapper.findOrderID(date), goodsShoppingCart.getSgsum());
				cartMapper.deleteGoods(uid, goodsShoppingCart.getGid().getGid());
			}
			response.sendRedirect("order");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
