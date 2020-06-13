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
import com.teamo.dao.UserMapper;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/addAddress")
public class AddAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String address = request.getParameter("address");
		int uid = ((User) request.getSession().getAttribute("user")).getUid();

		SqlSession session = SqlSessionUtil.getSqlSession();
		UserMapper mapper = session.getMapper(UserMapper.class);
		try {
			mapper.addAddress(address);
			int aid = mapper.findAddressID(address);
			mapper.addAddressRelation(uid, aid);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("index");
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
