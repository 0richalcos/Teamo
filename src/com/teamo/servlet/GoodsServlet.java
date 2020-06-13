
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

/**
 * 
 * @author
 *
 */
@WebServlet("/index")
public class GoodsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSession sion = SqlSessionUtil.getSqlSession();
		GoodsMapper mapper = sion.getMapper(GoodsMapper.class);
		try {
			List<Goods> list = mapper.list(3, 6);
			List<Goods> list1 = mapper.list(4, 8);
			List<Goods> list2 = mapper.list(8, 16);
			List<Goods> list3 = mapper.list(16, 26);
			req.setAttribute("list1", list1);
			req.setAttribute("list", list);
			req.setAttribute("list2", list2);
			req.setAttribute("list3", list3);
			req.getRequestDispatcher("index.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		sion.close();
	}
}