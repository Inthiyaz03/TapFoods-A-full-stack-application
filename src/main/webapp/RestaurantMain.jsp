<%@ page import="java.util.List"%>
<%@ page import="com.tapfoods.model.Restaurant"%>
<%@ page import="com.tapfoods.model.User"%>
<%
User user = (User) session.getAttribute("user");
boolean isLoggedIn = (user != null);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TapFoods - Restaurants</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        :root {
            --primary: #fc8019;
            --primary-light: #fff3e5;
            --secondary: #60b246;
            --dark: #282c3f;
            --gray: #686b78;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: #f4f4f4;
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            background: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            z-index: 1000;
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .logo img {
            height: 50px;
            transition: transform 0.3s ease;
        }

        .logo:hover img {
            transform: scale(1.05);
        }

        .location-div {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
        }

        .location-div:hover {
            background: var(--primary-light);
        }

        .nav-right {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .nav-item {
            text-decoration: none;
            color: var(--dark);
            padding: 8px 15px;
            border-radius: 5px;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .nav-item:hover {
            background: var(--primary-light);
            color: var(--primary);
        }

        .nav-item.cart {
            background: var(--primary);
            color: white;
        }

        .nav-item.cart:hover {
            background: #e67215;
        }
                /* Main Content */
        .main-content {
            margin-top: 80px;
            padding: 20px;
            max-width: 1200px;
            margin-left: auto;
            margin-right: auto;
        }

        /* Category Section */
        .category-section {
            background: white;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .section-title {
            font-size: 24px;
            color: var(--dark);
            margin-bottom: 20px;
            padding-left: 10px;
        }

        .scroll-container {
            position: relative;
            overflow: hidden;
        }

        .category-scroll {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 10px 0;
            scroll-behavior: smooth;
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        .category-scroll::-webkit-scrollbar {
            display: none;
        }

        .category-item {
            flex: 0 0 auto;
            text-align: center;
        }

        .category-item img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            transition: transform 0.3s ease;
            border: 2px solid transparent;
        }

        .category-item:hover img {
            transform: scale(1.05);
            border-color: var(--primary);
        }

        /* Filters Section */
        .filters {
            background: white;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 30px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .filter-list {
            display: flex;
            gap: 15px;
            flex-wrap: wrap;
            list-style: none;
        }

        .filter-button {
            background: #f4f4f4;
            border: none;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 5px;
            font-size: 14px;
        }

        .filter-button:hover {
            background: var(--primary-light);
            color: var(--primary);
        }

        /* Restaurant Grid */
        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
        }

        .restaurant-card {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover {
            transform: translateY(-5px);
        }

        .restaurant-image {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .restaurant-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .restaurant-card:hover .restaurant-image img {
            transform: scale(1.05);
        }

        .restaurant-details {
            padding: 15px;
        }

        .restaurant-name {
            font-size: 18px;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 10px;
        }

        .restaurant-info {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 10px;
        }

        .rating {
            background: var(--secondary);
            color: white;
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 4px;
        }
                /* Additional Restaurant Card Styles */
        .cuisine-type {
            color: var(--gray);
            font-size: 14px;
            margin-bottom: 8px;
        }

        .view-menu-btn {
            width: 100%;
            background: var(--primary-light);
            color: var(--primary);
            border: none;
            padding: 10px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 15px;
            font-weight: 600;
        }

        .view-menu-btn:hover {
            background: var(--primary);
            color: white;
        }

        /* Footer Styles */
        .footer {
            background: #1a1a1a;
            padding: 60px 0 20px;
            margin-top: 60px;
            color: white;
        }

        .footer-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-section h3 {
            color: var(--primary);
            font-size: 18px;
            margin-bottom: 20px;
        }

        .footer-links {
            list-style: none;
        }

        .footer-link {
            margin-bottom: 12px;
        }

        .footer-link a {
            color: #a6a6a6;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .footer-link a:hover {
            color: var(--primary);
        }

        .app-downloads {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .app-downloads img {
            height: 40px;
            cursor: pointer;
            transition: transform 0.3s ease;
        }

        .app-downloads img:hover {
            transform: scale(1.05);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid #333;
            color: #666;
            font-size: 14px;
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .nav-container, .main-content, .footer-container {
                padding: 15px;
            }
        }

        @media (max-width: 768px) {
            .nav-right {
                display: none;
            }
            
            .footer-content {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 480px) {
            .restaurant-grid {
                grid-template-columns: 1fr;
            }
            
            .footer-content {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <div class="nav-container">
            <div class="nav-left">
                <a href="RestaurantMain.jsp" class="logo">
                    <img src="Images/tap_logi-removebg-preview.png" alt="TapFoods">
                </a>
                <div class="location-div">
                    <i class="bi bi-geo-alt"></i>
                    <span>Bengaluru, Karnataka</span>
                    <i class="bi bi-chevron-down"></i>
                </div>
            </div>
            <div class="nav-right">
                <a href="#" class="nav-item">
                    <i class="bi bi-search"></i>
                    <span>Search</span>
                </a>
                <a href="offers.jsp" class="nav-item">
                    <i class="bi bi-gift"></i>
                    <span>Offers</span>
                </a>
                <a href="help.jsp" class="nav-item">
                    <i class="bi bi-question-circle"></i>
                    <span>Help</span>
                </a>
                <a href="EditUserDetails.jsp" class="nav-item">
                    <i class="bi bi-person"></i>
                    <span>Profile</span>
                </a>
                <a href="Cart.jsp" class="nav-item cart">
                    <i class="bi bi-cart"></i>
                    <span>Cart</span>
                </a>
                <a href="OrderHistory.jsp" class="nav-item">
                    <i class="bi bi-clock-history"></i>
                    <span>Orders</span>
                </a>
                <% if(isLoggedIn) { %>
                    <a href="Restaurant.jsp" class="nav-item">
                        <i class="bi bi-box-arrow-right"></i>
                        <span>Logout</span>
                    </a>
                <% } %>
            </div>
        </div>
    </div>
        
        
            <!-- Main Content -->
    <div class="main-content">
        <!-- Category Section -->
        <div class="category-section">
            <h2 class="section-title">What's on your mind?</h2>
            <div class="scroll-container">
                <div class="category-scroll">
                    <% for(int i = 1; i <= 10; i++) { %>
                        <div class="category-item">
                            <img src="Images/scroll-<%=i%>.png" alt="Category <%=i%>">
                        </div>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <ul class="filter-list">
                <li><button class="filter-button"><i class="bi bi-funnel"></i>Filter</button></li>
                <li><button class="filter-button"><i class="bi bi-sort-down"></i>Sort By</button></li>
                <li><button class="filter-button"><i class="bi bi-star-fill"></i>Ratings 4.0+</button></li>
                <li><button class="filter-button"><i class="bi bi-tag"></i>Offers</button></li>
                <li><button class="filter-button"><i class="bi bi-currency-rupee"></i>Rs. 300-600</button></li>
                <li><button class="filter-button"><i class="bi bi-currency-rupee"></i>Less than Rs. 300</button></li>
            </ul>
        </div>

        <!-- Restaurant Grid -->
        <div class="restaurant-grid">
            <% 
            List<Restaurant> restaurants = (List<Restaurant>) session.getAttribute("restaurantList");
            if(restaurants != null && !restaurants.isEmpty()) {
                for(Restaurant restro : restaurants) {
            %>
            <div class="restaurant-card">
                <div class="restaurant-image">
                    <img src="<%=restro.getImagePath()%>" alt="<%=restro.getName()%>">
                </div>
                <div class="restaurant-details">
                    <h3 class="restaurant-name"><%=restro.getName()%></h3>
                    <div class="restaurant-info">
                        <div class="rating">
                            <i class="bi bi-star-fill"></i>
                            <span><%=restro.getRating()%></span>
                        </div>
                        <div class="cuisine-type"><%=restro.getCuisineType()%></div>
                    </div>
                    <p class="restaurant-address"><i class="bi bi-geo-alt"></i> <%=restro.getAddress()%></p>
                    <form action="CallingMenuServlet" method="post">
                        <input type="hidden" name="restaurantId" value="<%=restro.getRestaurantId()%>">
                        <button type="submit" class="view-menu-btn">View Menu</button>
                    </form>
                </div>
            </div>
            <% 
                }
            } else {
            %>
            <p>No restaurants available</p>
            <% } %>
        </div>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-content">
                <div class="footer-section">
                    <h3>COMPANY</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="#"><i class="bi bi-building"></i>About us</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-people"></i>Team</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-briefcase"></i>Careers</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-newspaper"></i>Blog</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>CONTACT</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="#"><i class="bi bi-headset"></i>Help & Support</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-shop"></i>Partner with us</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-bicycle"></i>Ride with us</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>LEGAL</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="#"><i class="bi bi-file-text"></i>Terms & Conditions</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-shield-check"></i>Privacy Policy</a></li>
                        <li class="footer-link"><a href="#"><i class="bi bi-cookie"></i>Cookie Policy</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>DOWNLOAD APP</h3>
                    <div class="app-downloads">
                        <img src="Images/playstore-1.png" alt="Get it on Play Store">
                        <img src="Images/ios-1.png" alt="Download on App Store">
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; 2024 TapFoods. All rights reserved.
            </div>
        </div>
    </footer>
</body>
</html>