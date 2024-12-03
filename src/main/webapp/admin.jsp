<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tapfoods.model.Restaurant"%>
<%@ page import="java.util.List"%>
<%@ page import=" com.tapfoods.model.Order"%>
<%@ page import=" com.tapfoods.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Tap Foods</title>
    <style>
        :root {
            --primary-color: #4a90e2;
            --secondary-color: #f5f6fa;
            --accent-color: #ff6b6b;
            --text-primary: #2d3436;
            --text-secondary: #636e72;
            --success-color: #2ecc71;
            --danger-color: #e74c3c;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: var(--secondary-color);
            color: var(--text-primary);
        }

        /* Navigation Styles */
        nav {
            background: linear-gradient(135deg, #2c3e50, #3498db);
            padding: 15px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            box-shadow: var(--shadow);
        }

        nav ul {
            display: flex;
            justify-content: space-around;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0;
            list-style: none;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-size: 1.1em;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        /* Home Section Styles */
        .home-attributes {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
            padding: 100px 20px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .home-attributes a {
            background: white;
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            text-decoration: none;
            color: var(--text-primary);
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
        }

        .home-attributes a:hover {
            transform: translateY(-10px);
        }

        .home-attributes p {
            color: var(--success-color);
            margin-top: 15px;
        }

        /* Form Styles */
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: var(--shadow);
            max-width: 500px;
            margin: 100px auto 20px;
        }

        .form-container h2 {
            color: var(--primary-color);
            text-align: center;
            margin-bottom: 30px;
        }

        .form-container input, 
        .form-container select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 2px solid #e0e0e0;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-container input:focus {
            border-color: var(--primary-color);
            box-shadow: 0 0 0 3px rgba(74, 144, 226, 0.1);
            outline: none;
        }

        .form-container button {
            width: 100%;
            padding: 12px;
            background: var(--primary-color);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-container button:hover {
            background: #357abd;
            transform: translateY(-2px);
        }

        /* Restaurant Cards Styles */
        .restaurant-cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
            padding: 100px 20px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .restaurant-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover {
            transform: translateY(-10px);
        }

        .restaurant-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .restaurant-details {
            padding: 20px;
        }

        .restaurant-details h3 {
            color: var(--text-primary);
            margin: 0 0 15px;
        }

        .restaurant-actions {
            display: flex;
            gap: 10px;
            padding: 20px;
            background: #f8f9fa;
        }

        .edit-button, .delete-button {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .edit-button {
            background: var(--success-color);
            color: white;
        }

        .delete-button {
            background: var(--danger-color);
            color: white;
        }

        /* Orders Section Styles */
        .orders-container {
            padding: 100px 20px 20px;
            max-width: 1200px;
            margin: 0 auto;
            text-align: center;
        }

        .orders-container button {
            background: var(--primary-color);
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            margin: 10px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .orders-container button:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow);
        }

        /* Preparing Orders Styles */
        .preparingOrders-cards-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
            padding: 100px 20px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .items {
            background: white;
            border-radius: 15px;
            padding: 20px;
            box-shadow: var(--shadow);
            transition: transform 0.3s ease;
        }

        .items:hover {
            transform: translateY(-10px);
        }

        .reorder {
            display: inline-block;
            background: var(--accent-color);
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            margin-top: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .reorder:hover {
            background: #ff5252;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }

            .home-attributes {
                grid-template-columns: 1fr;
            }

            .restaurant-cards-container {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<!-- Rest of your HTML remains the same -->

<body>
    <header>
        <nav>
            <ul>
                <li><a href="#" onclick="showHome()">🏠︎Home</a></li>
                <li><a href="#" onclick="showRegistrationForm()">🙎‍♂️Add Delivery Agent</a></li>
                <li><a href="#" onclick="showAddRestaurantForm()">🍽️Add Restaurant</a></li>
                <li><a href="#" onclick="showRemoveRestaurantForm()">🗑️Remove Restaurant</a></li>
                <li><a href="#" onclick="showViewOrders()">📋View Orders</a></li>
                <li><a href="Login.jsp">➡️Logout</a></li>
            </ul>
        </nav>
    </header>

    <div id="Home">
        <div class="home-attributes">
            <a href="#">➕<br>Add Restaurant<br>
                <p>Add New Restaurant to the<br>Platform</p>
            </a>
            <a href="#">➖<br>Remove Restaurant<br>
                <p>Remove A Restaurant from the<br>Platform</p></a>
            <a href="#">📋<br>View Orders<br>
                <p>View All Incoming Orders</p></a>
            <a href="#" target="_self">🙎‍♂️<br>Add Delivery Agent<br>
                <p>Add New Delivery Agent to the<br>Platform</p></a>
        </div>
    </div>

    <div id="registrationForm" class="form-container">
        <h2>Delivery Agent Registration</h2>
        <form action="CallingDeliveryAgentServlet" method="POST">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
            
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            
            <label for="phone">Phone Number:</label>
            <input type="tel" id="phone" name="phone" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Register</button>
        </form>
    </div>

    <div id="addRestaurantForm" class="form-container">
        <h2>Add Restaurant</h2>
        <form action="CallingRestaurantAddServlet" method="POST">
            
            <label for="restaurantName">Restaurant Name:</label>
            <input type="text" id="restaurantName" name="restaurantName" required>
            
            <label for="image">Image URL:</label>
            <input type="text" id="image" name="image" required>
            
            <label for="rating">Rating:</label>
            <input type="text" id="rating" name="rating" required>
            
            <label for="eta">ETA:</label>
            <input type="text" id="eta" name="eta" required>
            
            <label for="cuisineType">Cuisine Type:</label>
            <input type="text" id="cuisineType" name="cuisineType" required>

            <label for="restaurantAddress">Address:</label>
            <input type="text" id="restaurantAddress" name="restaurantAddress" required>
			
			<label for="isactive">isActive:</label>
            <input type="text" id="isactive" name="isactive" required>
            
            <label for="restaurantOwnerId">RestaurantOwner Id:</label>
            <input type="number" id="restaurantOwnerId" name="restaurantOwnerId" required>
            <button type="submit">Add Restaurant</button>
        </form>
    </div>

    <div id="removeRestaurantForm" class="restaurant-cards-container">
    <% 
        List<Restaurant> restaurants = (List<Restaurant>) request.getAttribute("restaurants");
        if (restaurants != null) {
            for (Restaurant restaurant : restaurants) {
    %>
        <div class="restaurant-card">
            <img src="<%= restaurant.getImagePath() %>" alt="Restaurant Image" class="restaurant-image">
            <div class="restaurant-details">
                <h3><%= restaurant.getName() %></h3>
                <p><strong>Rating:</strong> <%= restaurant.getRating() %></p>
                <p><strong>ETA:</strong> <%= restaurant.getEta() %> mins</p>
                <p><strong>Cuisine:</strong> <%= restaurant.getCuisineType() %></p>
                <p><strong>Address:</strong> <%= restaurant.getAddress() %></p>
                <p><strong>Active:</strong> <%= restaurant.getIsActive() %></p>
            </div>
            <div class="restaurant-actions">
                <a href="RestaurantOwnerServlet?id=<%= restaurant.getRestaurantId() %>"><button class="edit-button">Edit</button></a>
                <a href="CallingRestaurantRemoveServlet?id=<%= restaurant.getRestaurantId() %>"><button class="delete-button">Delete</button></a>
            </div>
        </div>
    <% 
            }
        } else { 
    %>
        <p>No restaurants available.</p>
    <% 
        } 
    %>
</div>


    <div id="viewOrders" class="orders-container">
        <h2>View Orders</h2>
        <div>
            <a onclick="showpreparingOrders()"><button>Preparing Order</button></a>
            <button>Dispatched Order</button>
            <button>On the Way Order</button>
            <button>Delivered Order</button>
        </div>
    </div>
    <div id="preparingOrders" class="preparingOrders-cards-container">
    <%List<Order> AllOrderItems=(List<Order>)session.getAttribute("allOrders");
    if(AllOrderItems!=null && !(AllOrderItems.isEmpty())){
	for(Order orderItems:AllOrderItems){
	%>
		<div class="items">
			<div class="container1">
				<div class="name">
					<%=orderItems.getOrderId() %></div>
				<div class="price">
					₹
					<%=orderItems.getTotalAmount()%></div>
				<div class="quan">
					<%=orderItems.getStatus()%></div>
				<div class="restaurantId">
					<%=orderItems.getModeOfPayment()%></div>
				<div class="userId">
					<%=orderItems.getUserId()%></div>
				<div class="itemName">
					<%=orderItems.getRestaurantId()%></div>
				<div class="totalAmount">
					<%=orderItems.getTotalAmount()%></div>

				<a
					href="CallAgentServlet?orderId=<%=orderItems.getOrderId()%>&userid=<%=orderItems.getUserId() %>
					&restaurantid=<%=orderItems.getRestaurantId() %> ">
					<div class="reorder">Assign To Agent</div>
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
				<div class="text">It's Look like no Order History</div>
				<div class="container3">
					<a href=""><div class="additemstext">
							SEE OrderHistory &nbsp; &#10140;</div></a>
				</div>
			</div>

		</div>

		<%
}
%>
</div>
    <script>
        function showHome() {
            hideAllSections();
            document.getElementById("Home").style.display = "block";
        }

        function showRegistrationForm() {
            hideAllSections();
            document.getElementById("registrationForm").style.display = "block";
        }

        function showAddRestaurantForm() {
            hideAllSections();
            document.getElementById("addRestaurantForm").style.display = "block";
        }

        function showRemoveRestaurantForm() {
            hideAllSections();
            document.getElementById("removeRestaurantForm").style.display = "flex";
        }

        function showViewOrders() {
            hideAllSections();
            document.getElementById("viewOrders").style.display = "block";
        }
		function showpreparingOrders(){
			hideAllSections();
            document.getElementById("preparingOrders").style.display = "flex";
		}
		
        function hideAllSections() {
            document.getElementById("Home").style.display = "none";
            document.getElementById("registrationForm").style.display = "none";
            document.getElementById("addRestaurantForm").style.display = "none";
            document.getElementById("removeRestaurantForm").style.display = "none";
            document.getElementById("viewOrders").style.display = "none";
            document.getElementById("preparingOrders").style.display = "none";
        }

        window.onload = function() {
            showHome();
        };
        function editRestaurant(restaurantId) {
            window.location.href = `editRestaurant.jsp?restaurantId=${restaurantId}`;
        }

        function deleteRestaurant(restaurantId) {
            if (confirm("Are you sure you want to delete this restaurant?")) {
                window.location.href = `DeleteRestaurantServlet?restaurantId=${restaurantId}`;
            }
        }

    </script>
</body>
</html>
