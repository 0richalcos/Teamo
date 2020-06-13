package com.teamo.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.teamo.bean.Goods;
import com.teamo.util.SqlSessionUtil;

@WebServlet("/productClassify")
public class ProducrClassifyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HashMap<String, String> hashMap = new HashMap<>();

		String[] values = req.getParameterValues("kind");
		for (String string : values) {
			switch (string) {
			case "悬挂植物":
				hashMap.put("hangingPlants", "悬挂植物");
				break;
			case "多肉":
				hashMap.put("succulent", "多肉");
				break;
			case "蕨类":
				hashMap.put("fern", "蕨类");
				break;
			case "棕榈植物":
				hashMap.put("palmPlants", "棕榈植物");
				break;
			case "观叶植物":
				hashMap.put("foliagePlant", "观叶植物");
				break;
			case "花盆":
				hashMap.put("flowerpot", "花盆");
				break;
			case "耐干旱":
				hashMap.put("Resistant", "耐干旱");
				break;
			case "耐寒":
				hashMap.put("coldresistant", "耐寒");
				break;
			case "可悬挂":
				hashMap.put("suspensibility", "可悬挂");
				break;
			case "桌面摆设":
				hashMap.put("Desktopdecoration", "桌面摆设");
				break;
			case "室内":
				hashMap.put("indoor", "室内");
				break;
			case "易于打理":
				hashMap.put("Easytodo", "易于打理");
				break;
			case "简约":
				hashMap.put("simple", "简约");
				break;
			case "华丽":
				hashMap.put("gorgeous", "华丽");
				break;
			case "针状叶":
				hashMap.put("needle", "针状叶");
				break;
			case "大型":
				hashMap.put("large", "大型");
				break;
			case "花盆2":
				hashMap.put("flowerpot2", "花盆");
				break;
			case "室外":
				hashMap.put("outdoor", "室外");
				break;
			case "XS":
				hashMap.put("XS", "XS");
				break;
			case "XL":
				hashMap.put("XL", "XL");
				break;
			case "XXL":
				hashMap.put("XXL", "XXL");
				break;
			case "S":
				hashMap.put("S", "S");
				break;
			case "M":
				hashMap.put("M", "M");
				break;
			case "L":
				hashMap.put("L", "L");
				break;
			}
		}

		SqlSession session = SqlSessionUtil.getSqlSession();
		List<Goods> list = session.selectList("getInfo", hashMap);
		req.setAttribute("list", list);
		req.getRequestDispatcher("gridproducts_leftsidebar.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}

}
