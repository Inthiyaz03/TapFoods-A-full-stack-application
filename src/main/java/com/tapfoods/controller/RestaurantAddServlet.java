package com.tapfoods.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.model.Restaurant;

@WebServlet("/CallingRestaurantAddServlet")
public class RestaurantAddServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RestaurantDaoImpl restdaoimpl=new  RestaurantDaoImpl();
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
		RequestDispatcher rd=req.getRequestDispatcher("CallingRestaurantAllServlet");
		rd.forward(req, resp);
	}
}
