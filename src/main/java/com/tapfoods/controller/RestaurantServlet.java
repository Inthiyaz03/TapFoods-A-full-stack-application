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

import com.tapfoods.daoimpl.OrderDaoImpl;
import com.tapfoods.daoimpl.OrderItemDaoImpl;
import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.model.Order;
import com.tapfoods.model.OrderItem;
import com.tapfoods.model.Restaurant;

@WebServlet("/CallingRestaurantServlet")
public class RestaurantServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDaoImpl restaurant = new RestaurantDaoImpl();
		List<Restaurant> restaurants = restaurant.getAll();
		HttpSession ses = req.getSession();
		OrderDaoImpl orderItemDaoImpl = new OrderDaoImpl();
		List<Order> allOrders=	orderItemDaoImpl.getAll();
		ses.setAttribute("allOrders", allOrders);
		ses.setAttribute("restaurantList", restaurants);
		RequestDispatcher rd = req.getRequestDispatcher("Restaurant.jsp");
		rd.forward(req, resp);
	}
}
