package com.tapfoods.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.daoimpl.UserDaoImpl;
import com.tapfoods.model.Restaurant;
import com.tapfoods.model.User;

@WebServlet("/RestaurantSignUpServlet")
public class RestaurantSignUpServlet extends HttpServlet{
	private UserDaoImpl userDaoImpl;
	private RestaurantDaoImpl restdaoimpl;

	public void init() throws ServletException {
		userDaoImpl = new UserDaoImpl();
		restdaoimpl=new  RestaurantDaoImpl();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		int restaurantOwnerId=Integer.parseInt(req.getParameter("restaurantOwnerId"));
		String restaurantName=req.getParameter("restaurantName");
		String imagePath=req.getParameter("image");
		float rating=Float.parseFloat(req.getParameter("rating"));
		String eta=req.getParameter("eta");
		String cuisineType=req.getParameter("cuisineType");
		String restaurantAddress=req.getParameter("restaurantAddress");
		String isactive=req.getParameter("isactive");
		Restaurant restaurant=new Restaurant();
		restaurant.setName(restaurantName);
		restaurant.setImagePath(imagePath);
		restaurant.setRating(rating);
		restaurant.setEta(eta);
		restaurant.setIsActive(isactive);
		restaurant.setCuisineType(cuisineType);
		restaurant.setAddress(restaurantAddress);
		restaurant.setRestaurantOwnerId(restaurantOwnerId);
		restdaoimpl.addRestaurant(restaurant);
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String address = req.getParameter("address");
		String username = req.getParameter("username");
		String password = req.getParameter("password");
		String role = "RestaurentAdmin";
		if (name.isEmpty() || email.isEmpty() || username.isEmpty() || password.isEmpty() || role.isEmpty()) {
			resp.sendRedirect("RestaurantSignUp.jsp?error=missingField");
			return;
		}
		User user = new User();

		user.setName(name);
		user.setEmail(email);
		user.setPhoneNo(phone);
		user.setUserName(username);
		user.setPassword(password);
		user.setAddress(address);
		user.setRole(role);
		user.setLastlogin(LocalDateTime.now());
		user.setRestaurantOwnerId(restaurantOwnerId);
		userDaoImpl.addRUser(user);

		resp.sendRedirect("Login.jsp");
	}

}

