package com.tapfoods.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.tapfoods.daoimpl.OrderDaoImpl;
import com.tapfoods.daoimpl.UserDaoImpl;
import com.tapfoods.model.AgentOrders;
import com.tapfoods.model.DeliveryAgentOrders;
import com.tapfoods.model.Order;
import com.tapfoods.model.User;

@WebServlet("/AssignAgentServlet")
public class AssignAgentServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession ses = req.getSession();
        
        int otd = Integer.parseInt(req.getParameter("orderid"));
        int ud = Integer.parseInt(req.getParameter("agentid"));
        
        AgentOrders agentOrders = (AgentOrders) ses.getAttribute("agentOrders");
        
        if (agentOrders == null) {
            agentOrders = new AgentOrders();
            ses.setAttribute("agentOrders", agentOrders);
        }
        
        OrderDaoImpl orderDaoImpl = new OrderDaoImpl();
        Order order = orderDaoImpl.getOrder(otd);
        
        String status = order.getStatus();
        int restId = order.getRestaurantId();
        int userId = order.getUserId();
        
        UserDaoImpl userDaoImpl = new UserDaoImpl();
        User user = userDaoImpl.getUser(userId);
        
        String name = user.getName();
        String address = user.getAddress();
        
        agentOrders.addOrder(new DeliveryAgentOrders(otd, name, address, status, ud));
        System.out.println(agentOrders.getOrders());
        resp.sendRedirect("Login.jsp");
    }
}
