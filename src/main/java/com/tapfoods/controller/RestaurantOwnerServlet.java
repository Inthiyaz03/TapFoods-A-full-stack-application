package com.tapfoods.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.daoimpl.MenuDaoImpl;
import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.model.Menu;
import com.tapfoods.model.Restaurant;

@WebServlet("/RestaurantOwnerServlet")
public class RestaurantOwnerServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession ses=req.getSession();
		int restaurantId =(int)ses.getAttribute("rId");
		RestaurantDaoImpl restdaoimpl=new RestaurantDaoImpl();
		Restaurant rest = restdaoimpl.getRestaurant(restaurantId);
		MenuDaoImpl m = new MenuDaoImpl();
		List<Menu> MenuList = m.getMenuByResto(restaurantId);

		req.setAttribute("Menus", MenuList);
		req.setAttribute("rest", rest);

		RequestDispatcher rd = req.getRequestDispatcher("Restaurantowner.jsp");
		rd.forward(req, resp);
	}
}
