package com.tapfoods.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.daoimpl.UserDaoImpl;
import com.tapfoods.model.PasswordEncryption;
import com.tapfoods.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	private UserDaoImpl userDaoImpl;
	public void init() throws ServletException {
		userDaoImpl = new UserDaoImpl();

	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("username");
		String password = req.getParameter("password");

		String encryptedPassword = PasswordEncryption.encryption(password);

		boolean isValid = userDaoImpl.isValidUser(userName, encryptedPassword);
		String role = userDaoImpl.getUserRole(userName, encryptedPassword);
		User user=userDaoImpl.getUserByuserNameAndPassword(userName, encryptedPassword);
		HttpSession session = req.getSession();
		Integer attempts = (Integer) session.getAttribute("attempts");
		if (attempts == null) {
			attempts = 0;
		}
		if (isValid && role.equals("Customers")) {
			session.setAttribute("user",user);
			session.setAttribute("userName", userName);
			System.out.println(userName+" "+"Customersisexcecuting");
			resp.sendRedirect("RestaurantMain.jsp");
		} 
		else if(isValid && role.equals("RestaurentAdmin")) {
			RestaurantDaoImpl restdaoimpl=new RestaurantDaoImpl();
			int restaurantOwnerId=userDaoImpl.getRestaurantOwnerId(userName, encryptedPassword);
			int restaurantId=restdaoimpl.getRestaurantId(restaurantOwnerId);
			session.setAttribute("user",user);
			session.setAttribute("userName", userName);
			session.setAttribute("rId", restaurantId);
			System.out.println(userName+" "+"RestaurentAdminisexcecuting");
			resp.sendRedirect("RestaurantOwnerServlet");
		}
		else if(isValid && role.equals("DeliveryAgent")) {
			session.setAttribute("user",user);
			session.setAttribute("userName", userName);
			System.out.println(userName+" "+"DeliveryAgentisexcecuting");
			resp.sendRedirect("DeliveryAgent.jsp");
		}
		else if(isValid && role.equals("SystemAdmin")) {
			session.setAttribute("user",user);
			session.setAttribute("userName", userName);
			System.out.println(userName+" "+"SystemAdminisexcecuting");
			resp.sendRedirect("CallingRestaurantAllServlet");
		}
		else {
			attempts++;
			session.setAttribute("attempts", attempts);
			if (attempts >= 5) {
				resp.sendRedirect("Login.jsp?error=max_attempts");
			} else {
				resp.sendRedirect("Login.jsp?error=invalid_credientials");
			}
		}

	}

}
/* ENUM('Customers', 'RestaurentAdmin', 'DeliveryAgent', 'SystemAdmin') */