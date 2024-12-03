<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import=" com.tapfoods.model.OrderItem"%>
<%@ page import=" com.tapfoods.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delivery Agents</title>
</head>
<style>
.preparingOrders-cards-container {
    display: flex;
    flex-wrap: wrap;  
    justify-content: space-between;  
    gap: 20px;  
    margin: 20px auto;
    max-width: 1200px;  
}

.items {
    width: 30%;  
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);  
    border-radius: 8px;  
    overflow: hidden;
    transition: transform 0.3s ease;
}

.items:hover {
    transform: translateY(-10px);  
}

.container1 {
    padding: 15px;  
}

.container1 .name,
.container1 .price,
.container1 .quan,
.container1 .restaurantId,
.container1 .userId,
.container1 .itemName,
.container1 .totalAmount {
    margin-bottom: 10px;  
}

.container1 .name {
    font-size: 1.5vw;
    font-weight: bold;
    color: #333;
}

.container1 .price {
    font-size: 1.5vw;
    color: #fca311;  
}

.container1 .quan {
    font-size: 1.2vw;
    color: #666;
}

.container1 .restaurantId,
.container1 .userId,
.container1 .itemName,
.container1 .totalAmount {
    font-size: 1.2vw;
    color: #555;
}

.container1 .reorder {
    display: inline-block;
    font-size: 1.4vw;
    color: #fff;
    background-color: #fca311;  
    padding: 10px 15px;
    border-radius: 5px;
    text-align: center;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-top: 10px;
}

.container1 .reorder:hover {
    background-color: #e58e00;  
}

a {
    text-decoration: none;
}

.items .container1 .text {
    font-size: 1.5vw;
    color: #333;
    margin-top: 20px;
}

.items .container3 {
    display: flex;
    justify-content: center;
    margin-top: 10px;
}

.items .container3 .additemstext {
    font-size: 1.5vw;
    color: #007BFF;
    cursor: pointer;
    text-align: center;
}

.items .container3 .additemstext:hover {
    color: #0056b3; /* Hover color */
}
</style>
<body>
<center><h1>Delivery Agents</h1></center>
<div id="preparingOrders" class="preparingOrders-cards-container">
    <%List<User> DeliveryAgents=(List<User>)session.getAttribute("DeliveryAgents");
    if(DeliveryAgents!=null && !(DeliveryAgents.isEmpty())){
	for(User deliveryAgent:DeliveryAgents){
	%>
		<div class="items">
			<div class="container1">
				<div class="name">
					<%=deliveryAgent.getName() %></div>
				<div class="price">
					<%=deliveryAgent.getEmail() %></div>
				<div class="quan">
					<%=deliveryAgent.getPhoneNo()%></div>
				<div class="userId">
					<%=deliveryAgent.getUserName()%></div>
				<div class="itemName">
					<%=deliveryAgent.getUserId()%></div>
				<a
					href="AssignAgentServlet?agentid=<%=deliveryAgent.getUserId() %>&orderid=<%=(int)session.getAttribute("orderid")%>">
					<div class="reorder">Assign To This Agent <%=deliveryAgent.getName() %></div>
				</a>
			</div>

		</div>
		<% 	
}
%>
		<%
}
else{
	%>
		<div class="items">
			<div class="container1">
				<div class="text">It's Look like there were no Agents</div>
				<div class="container3">
					<a href=""><div class="additemstext">
							SEE Agents &nbsp; &#10140;</div></a>
				</div>
			</div>

		</div>

		<%
}
%>
</div>
</body>
</html>