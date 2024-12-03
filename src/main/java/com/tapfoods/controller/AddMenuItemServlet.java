package com.tapfoods.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.MenuDaoImpl;
import com.tapfoods.model.Menu;

@WebServlet("/AddMenuItemServlet")
public class AddMenuItemServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MenuDaoImpl m = new MenuDaoImpl();
		
		 int menu = m.addMenu(new Menu(req.getParameter("menuName"),Float.parseFloat(req.getParameter("menuPrice")),req.getParameter("menuDescription"),req.getParameter("menuImagePath"),Boolean.parseBoolean(req.getParameter("menuisAvailable")),Integer.parseInt(req.getParameter("menurestaurantId")),Float.parseFloat(req.getParameter("menuRating"))));
		RequestDispatcher rd = req.getRequestDispatcher("RestaurantOwnerServlet");
		rd.forward(req, resp);

	}
}
