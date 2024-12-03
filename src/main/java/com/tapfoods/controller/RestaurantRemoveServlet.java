package com.tapfoods.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.RestaurantDaoImpl;

@WebServlet("/CallingRestaurantRemoveServlet")
public class RestaurantRemoveServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDaoImpl restdaoimpl=new RestaurantDaoImpl();
		int restaurantId=Integer.parseInt(req.getParameter("id"));
		restdaoimpl.deleteRestaurant(restaurantId);
		RequestDispatcher rd = req.getRequestDispatcher("CallingRestaurantAllServlet");
		rd.forward(req, resp);
	}
}
