package com.tapfoods.controller;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.UserDaoImpl;
import com.tapfoods.model.User;

@WebServlet("/CallingDeliveryAgentServlet")
public class DeliveryAgent extends HttpServlet{
@Override
protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	UserDaoImpl userdaoimpl=new UserDaoImpl();
	String name=req.getParameter("name");
	String email=req.getParameter("email");
	String phone=req.getParameter("phone");
	String address=req.getParameter("address");
	String username=req.getParameter("username");
	String password=req.getParameter("password");
	User user = new User();
	user.setName(name);
	user.setEmail(email);
	user.setPhoneNo(phone);
	user.setUserName(username);
	user.setPassword(password);
	user.setAddress(address);
	user.setRole("DeliveryAgent");
	user.setLastlogin(LocalDateTime.now());
	System.out.println("Added Delivery Agent");
	userdaoimpl.addUser(user);
	resp.sendRedirect("DeliveryAgent.jsp");
}
}
/*ENUM('Customers', 'RestaurentAdmin', 'DeliveryAgent', 'SystemAdmin')*/