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
import com.tapfoods.model.User;

@WebServlet("/orderhistory")
public class OrderHistoryServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("user");
		System.out.println(user);
		int userId = user.getUserId();
		OrderDaoImpl orderDaoImpl = new OrderDaoImpl();
		List<Order> allOrderItems = orderDaoImpl.getOrderbyuid(userId);
		session.setAttribute("allOrderItems", allOrderItems);

		RequestDispatcher requestDispatcher = req.getRequestDispatcher("OrderHistory.jsp");
		requestDispatcher.forward(req, resp);
	}

}
