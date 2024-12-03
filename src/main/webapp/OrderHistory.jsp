<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tapfoods.model.Order"%>
<%@ page import="com.tapfoods.model.User"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order History | Tap Foods</title>
    <link rel="icon" href="http://localhost:8080/tapfoods/Images/icon.png">
    <style>
        body {
            margin: 0px;
            background-color: #B7C8E120;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        ::-webkit-scrollbar {
            width: 5px;
        }

        ::-webkit-scrollbar-thumb {
            background: #fca311;
            border-radius: 20px;
        }

        /* Navigation */
        nav {
            height: 75px;
            width: 101.5%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: rgba(255, 255, 255, 0.9);
            margin: -6% 0% 0% -1%;
            position: fixed;
            z-index: 999;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        nav .logo {
            margin: 0.2% 0% 0% 0.5%;
        }

        nav .logo img {
            margin: 10% 0% 0% -8%;
            height: 10vh;
            width: 150%;
            transition: transform 0.3s ease;
        }

        nav .logo img:hover {
            transform: scale(1.05);
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 30px;
            margin-right: 30px;
            margin-top: 35px;
        }

        nav a {
            text-decoration: none;
            color: #2d3436;
            font-size: 25px;
            margin-top: 1%;
            transition: color 0.3s ease;
        }

        nav a:hover {
            color: #fca311;
        }

        /* Profile Section */
        nav .profile {
            position: relative;
            border-radius: 50%;
            height: 8vh;
            width: 48px;
            margin: -12% 0% 0% 12%;
            background: url("https://cdn.pixabay.com/photo/2016/08/31/11/54/icon-1633249_1280.png");
            background-size: 40px;
            background-position: 4.5px;
            background-repeat: no-repeat;
            box-shadow: 0px 0px 7px black;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        nav .profile:hover {
            transform: scale(1.1);
        }

        .profile-details {
            display: none;
            position: fixed;
            top: 80px;
            right: 20px;
            width: 300px;
            background-color: #ffffff;
            border-radius: 10px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
            z-index: 999;
            padding: 20px;
        }

        .profile-details .profilepic {
            border-radius: 50%;
            height: 60px;
            width: 60px;
            margin: 0 auto 20px;
            background: url("https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_1280.png");
            background-size: cover;
            background-position: center;
            box-shadow: 0px 0px 7px black;
        }

        .profile-details .name {
            font-size: 1.5rem;
            font-weight: bold;
            text-align: center;
            color: #2d3436;
            margin-bottom: 20px;
        }

        .profile-details .info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            padding: 10px;
            border-radius: 8px;
            background-color: #f8f9fa;
        }

        .profile-details .titles {
            color: #fca311;
            font-weight: bold;
        }

        .profile-details .values {
            color: #2d3436;
        }

        .profile-details .logout-edit {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .profile-details .logout-edit a {
            color: #fca311;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.3s ease;
        }

        .profile-details .logout-edit a:hover {
            color: #e67e22;
        }

        /* Order Container Styles */
        .container {
            margin: 100px auto 30px;
            width: 85%;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
        }

        .order-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid #B7C8E9;
            margin-bottom: 20px;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .order-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.12);
        }

        .box-left {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .order-id, .restaurant-id {
            font-size: 16px;
            color: #636e72;
        }

        .box-right {
            text-align: right;
        }

        .total-amount {
            font-size: 18px;
            font-weight: 600;
            color: #fca311;
            margin-bottom: 10px;
        }

        .view-details {
            background: #fca311;
            color: #ffffff;
            border: none;
            padding: 10px 20px;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .view-details:hover {
            background: #e67e22;
            transform: translateY(-2px);
        }

        /* Empty State */
        .no-orders {
            text-align: center;
            padding: 50px 20px;
        }

        .no-orders p {
            font-size: 18px;
            color: #636e72;
            margin-bottom: 20px;
        }

        .see-restaurants {
            background: #fca311;
            color: #ffffff;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .see-restaurants:hover {
            background: #e67e22;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .profile-details {
                width: 90%;
                right: 5%;
            }

            .profile-details .name {
                font-size: 24px;
            }

            .profile-details .logout-edit a {
                font-size: 18px;
            }

            .container {
                width: 95%;
            }

            .order-box {
                flex-direction: column;
                text-align: center;
            }

            .box-right {
                margin-top: 15px;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <nav>
        <div class="logo">
            <a href="#"><img src="Images/tap_logi-removebg-preview.png" alt="logo"></a>
        </div>
        <ul>
            <a href="RestaurantMain.jsp"><li class="elements"><b>Home</b></li></a>
            <a href="orderhistory"><li class="elements"><b>Order History</b></li></a>
            <a href="Cart.jsp"><li class="elements"><b>View Cart</b></li></a>
            <li><div class="profile" id="profile"></div></li>
        </ul>
    </nav>

    <div class="profile-details" id="profile-details">
        <% User user = (User) session.getAttribute("user"); %>
        <div class="profilepic"></div>
        <div class="name"><%=user.getName()%></div>
        <div class="info">
            <span class="titles">USERNAME:</span>
            <span class="values"><%=user.getUserName()%></span>
        </div>
        <div class="info">
            <span class="titles">EMAIL:</span>
            <span class="values"><%=user.getEmail()%></span>
        </div>
        <div class="info">
            <span class="titles">PHONE NO:</span>
            <span class="values"><%=user.getPhoneNo()%></span>
        </div>
        <div class="info">
            <span class="titles">ADDRESS:</span>
            <span class="values">
                <% if(user.getAddress()!=null) { %>
                    <%=user.getAddress()%>
                <% } else { %>
                    <a href="calledit?menu=menu">Add Address</a>
                <% } %>
            </span>
        </div>
        <div class="logout-edit">
            <a href="indexservlet">Logout</a>
            <a href="calledit?isthishistory=history">Edit</a>
        </div>
    </div>

    <div class="container">
        <% List<Order> AllOrderItems = (List<Order>) session.getAttribute("allOrderItems");
           if (AllOrderItems != null && !AllOrderItems.isEmpty()) {
               for (Order orderItems : AllOrderItems) { %>
            <div class="order-box">
                <div class="box-left">
                    <div class="order-id">Order ID: <%= orderItems.getOrderId() %></div>
                    <div class="restaurant-id">Restaurant ID: <%= orderItems.getRestaurantId() %></div>
                </div>
                <div class="box-right">
                    <a href="viewOrderDetails?orderId=<%= orderItems.getOrderId() %>">
                        <div class="total-amount">Status: <%= orderItems.getStatus() %></div>
                        <div class="total-amount">Rs: ₹ <%= orderItems.getTotalAmount() %></div>
                        <button class="view-details">View Details</button>
                    </a>
                </div>
            </div>
        <% } 
           } else { %>
        <div class="no-orders">
            <p>It looks like you haven't ordered anything yet!</p>
            <a href="RestaurantMain.jsp">
                <button class="see-restaurants">SEE RESTAURANTS &nbsp; &#10140;</button>
            </a>
        </div>
        <% } %>
    </div>

    <script>
        document.getElementById("profile").addEventListener('click', function() {
            const profileDetails = document.getElementById("profile-details");
            profileDetails.style.display = profileDetails.style.display === "block" ? "none" : "block";
        });

        document.addEventListener('click', function(event) {
            const profile = document.getElementById("profile");
            const profileDetails = document.getElementById("profile-details");
            if (!profile.contains(event.target) && !profileDetails.contains(event.target)) {
                profileDetails.style.display = "none";
            }
        });
    </script>
</body>
</html>