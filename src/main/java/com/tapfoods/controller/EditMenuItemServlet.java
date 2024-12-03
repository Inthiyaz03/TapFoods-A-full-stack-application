package com.tapfoods.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tapfoods.daoimpl.MenuDaoImpl;
import com.tapfoods.model.Menu;

@WebServlet("/EditMenuItemServlet")
public class EditMenuItemServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int menuId = Integer.parseInt(req.getParameter("id"));

		MenuDaoImpl m = new MenuDaoImpl();
		Menu menu= m.getMenu(menuId);

		req.setAttribute("menu", menu);

		RequestDispatcher rd = req.getRequestDispatcher("RestaurantOwnerServlet");
		rd.forward(req, resp);

	}
}
