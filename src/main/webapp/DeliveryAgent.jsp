<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tapfoods.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Agent Dashboard</title>
    <style>
        :root {
            --primary: #ff7043;
            --primary-hover: #ff5722;
            --secondary: #2d3436;
            --success: #66bb6a;
            --success-hover: #4caf50;
            --background: #f5f6fa;
            --white: #ffffff;
            --text-dark: #2d3436;
            --text-light: #636e72;
            --border: #dfe6e9;
            --shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', sans-serif;
        }

        body {
            background: var(--background);
            color: var(--text-dark);
            line-height: 1.6;
        }

        /* Header & Navigation */
        nav {
            background: linear-gradient(135deg, var(--primary), var(--primary-hover));
            padding: 15px 0;
            box-shadow: var(--shadow);
        }

        nav ul {
            list-style: none;
            display: flex;
            justify-content: center;
            gap: 30px;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        nav ul li a {
            color: var(--white);
            text-decoration: none;
            font-size: 15px;
            padding: 10px 20px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        nav ul li a:hover {
            background: rgba(255, 255, 255, 0.1);
            transform: translateY(-2px);
        }

        /* Welcome Message */
        .welcome-message {
            text-align: center;
            font-size: 28px;
            color: var(--primary);
            margin: 30px 0;
            font-weight: 600;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.1);
        }

        /* Form Container */
        .form-container {
            display: none; /* Initially hidden */
            background: var(--white);
            padding: 30px;
            border-radius: 12px;
            box-shadow: var(--shadow);
            max-width: 500px;
            margin: 30px auto;
        }

        /* Table Styles */
        #orderTable {
            width: 90%;
            max-width: 1200px;
            margin: 30px auto;
            background: var(--white);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow);
            border-collapse: collapse;
        }

        th {
            background: var(--primary);
            color: var(--white);
            padding: 15px;
            font-weight: 600;
            text-align: left;
        }

        td {
            padding: 15px;
            border-bottom: 1px solid var(--border);
        }

        tbody tr {
            transition: all 0.3s ease;
        }

        tbody tr:hover {
            background: #fff8f6;
        }

        /* Action Button */
        .action-button {
            background: var(--success);
            color: var(--white);
            border: none;
            padding: 8px 16px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .action-button:hover {
            background: var(--success-hover);
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(102, 187, 106, 0.2);
        }

        /* Form Inputs */
        .form-container input {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid var(--border);
            border-radius: 8px;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .form-container input:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 112, 67, 0.1);
        }

        .form-container button {
            background: var(--primary);
            color: var(--white);
            border: none;
            padding: 12px;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-container button:hover {
            background: var(--primary-hover);
            transform: translateY(-2px);
        }

        /* Empty State */
        .empty-cart-msg {
            text-align: center;
            padding: 30px;
            color: var(--text-light);
            font-size: 18px;
        }

        @media (max-width: 768px) {
            nav ul {
                flex-direction: column;
                align-items: center;
            }

            table {
                width: 95%;
                font-size: 14px;
            }

            th, td {
                padding: 10px;
            }

            .welcome-message {
                font-size: 24px;
            }
        }
    </style>
</head>


<!-- Your existing HTML body remains unchanged -->

<body>
    <header>
        <nav>
            <ul>
                <li><a href="#" onclick="showHome()">🏠 Home</a></li>
                <li><a href="#" onclick="showEditProfile()">✏️ Edit Profile</a></li>
                <li><a href="#" onclick="showDeliveryHistory()">📦 Delivery History</a></li>
                <li><a href="Login.jsp" onclick="logout()">➡️ Logout</a></li>
            </ul>
        </nav>
    </header>
	<%
        User user=(User)session.getAttribute("user");
		int agentId=user.getUserId();
        %>
    <div class="welcome-message">
        Welcome, <%=user.getName()%>!
    </div>

    <div id="editProfile" class="form-container">
        <h2>Edit Profile</h2>
        <form action="">
            <label for="agentName">Name:</label>
            <input type="text" id="agentName" name="agentName" value="<%=user.getName()%>">
            
            <label for="agentEmail">Email:</label>
            <input type="email" id="agentEmail" name="agentEmail" value="<%=user.getEmail()%>">
            
            <label for="agentPhone">Phone Number:</label>
            <input type="tel" id="agentPhone" name="agentPhone" value="<%=user.getPhoneNo()%>">

            <label for="agentAddress">Address:</label>
            <input type="text" id="agentAddress" name="agentAddress" value="<%=user.getAddress()%>">

            <button type="submit">Update Profile</button>
        </form>
    </div>
	
    <table id="orderTable">
            <thead>
            <tr>
                <th>Order ID</th>
                <th>Customer Name</th>
                <th>Address</th>
                <th>OTP</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
	<% 
	 AgentOrders agentOrders= (AgentOrders) session.getAttribute("agentOrders");
        if (agentOrders != null && !agentOrders.getOrders().isEmpty()) {
            for (DeliveryAgentOrders order : agentOrders.getOrders().values()) {
        	if(agentId==order.getAgentId())
        	{
        %>
        <tbody id="orderTableBody">
            <tr>
                <td><%= order.getOrderId()%></td>
                <td><%= order.getName()%></td>
                <td><%= order.getAddress()%></td>
                <td>123456<%= +order.getOrderId()%></td>
                <td id="status"><%= order.getStatus()%></td>
                <td><button class="action-button" onclick="DeliveryTask()">Delivered</button></td>
            </tr>
        </tbody>
	<% 
        	}
            }
        } else { 
        %>
			<div class="top-image-container">
					<center><p class="empty-cart-msg">Your Orders Is Empty</p></center>
			</div>
			<% 
        } 
        %>
   </table>
    <script>
    function DeliveryTask() {
    	document.getElementById("status").innerText="Delivered";
    }

        function showHome() {
            hideAllSections();
            document.querySelector(".welcome-message").style.display = "block";
            document.getElementById("orderTable").style.display = "table";
        }

        function showEditProfile() {
            hideAllSections();
            document.getElementById("editProfile").style.display = "block";
        }

        function showDeliveryHistory() {
            hideAllSections();
            // Implement delivery history display
        }

        function logout() {
            // Implement logout functionality
            alert("Logged out successfully!");
        }

        function hideAllSections() {
            document.getElementById("editProfile").style.display = "none";
            document.querySelector(".welcome-message").style.display = "none";
            document.getElementById("orderTable").style.display = "none";
        }

        window.onload = function() {
            // Load delivery agent name dynamically
             window.onload = function() {
        showHome();
    };// Show home section on load
        };
    </script>
    <!-- Rest of your HTML remains the same -->

</body>
</html>
