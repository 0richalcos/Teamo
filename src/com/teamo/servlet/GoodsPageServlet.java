package com.teamo.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.teamo.bean.Goods;
import com.teamo.dao.GoodsMapper;

/**
 * 商品显示
 * 
 * @author 123
 *
 */
@WebServlet("/goodsPageServlet")
public class GoodsPageServlet extends HttpServlet {
	static int currentPage = 1;
	static int a = 0;
	static int b = 12;

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		SqlSessionFactory sf = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsReader("com/teamo/conf/mybatis.xml"));
		SqlSession session = sf.openSession(true);
		GoodsMapper mapper = session.getMapper(GoodsMapper.class);
		try {
			int sum = mapper.showSum();
			int pageSum = (int) Math.ceil(sum * 1.0 / 12);
			String flag = req.getParameter("flag");
			if (flag != null) {
				if (flag.matches("^-?\\d+(\\.\\d+)?$")) {
					int i = Integer.parseInt(flag);
					a = (i - 1) * 12;
					b = 12;
					if (a == pageSum) {
						b = sum - (a - 1) * 12;
					}
				} else {
					if ("true".equals(flag) && currentPage < pageSum) {
						a = a + 12;
						currentPage++;
						if (currentPage == pageSum) {
							b = sum - (pageSum - 1) * 12;
						}

					} else if ("false".equals(flag) && currentPage > 1) {
						a -= 12;
						b = 12;
						currentPage--;
					}
				}
			}
			List<Goods> list = mapper.show(a, b);
			req.setAttribute("list", list);
			req.getRequestDispatcher("gridproducts_leftsidebar.jsp").forward(req, resp);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doGet(req, resp);
	}

}
