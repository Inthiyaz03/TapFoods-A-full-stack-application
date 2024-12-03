package com.tapfoods.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.OrderItemDaoImpl;
import com.tapfoods.model.OrderItem;
@WebServlet("/viewOrderDetails")
public class ViewOrderDetails extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int orderid=Integer.parseInt(req.getParameter("orderId"));
		OrderItemDaoImpl orderitemdaoimpl=new OrderItemDaoImpl();
		List<OrderItem> itemslist = orderitemdaoimpl.getAllByOrderId(orderid);
		req.getSession().setAttribute("itemslist", itemslist);
		resp.sendRedirect("AllOrderItems.jsp");
	}
}
