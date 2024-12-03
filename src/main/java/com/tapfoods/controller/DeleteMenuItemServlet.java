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

@WebServlet("/DeleteMenuItemServlet")
public class DeleteMenuItemServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int menuid=Integer.parseInt(req.getParameter("id"));
		MenuDaoImpl m = new MenuDaoImpl();
		int status=m.deleteMenu(menuid);
		if(status==1)
		{
			RequestDispatcher rd = req.getRequestDispatcher("RestaurantOwnerServlet");
			rd.forward(req, resp);
		}
	}
}
