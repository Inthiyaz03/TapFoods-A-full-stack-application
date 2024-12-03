<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.tapfoods.model.Restaurant"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TapFoods - Delicious Food Delivered</title>
    
    <!-- Enhanced CSS Libraries -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        :root {
            --primary: #fc8019;
            --primary-light: #fff3e5;
            --primary-dark: #e67215;
            --secondary: #60b246;
            --dark: #282c3f;
            --gray: #686b78;
            --light-gray: #f8f9fa;
            --white: #ffffff;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Arial, sans-serif;
        }

        body {
            background: var(--light-gray);
            min-height: 100vh;
        }

        /* Enhanced Navbar Styles */
        .navbar {
            background: rgba(255, 255, 255, 0.98);
            backdrop-filter: blur(10px);
            box-shadow: 0 2px 20px rgba(0, 0, 0, 0.08);
            padding: 15px 0;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .navbar.scrolled {
            padding: 10px 0;
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.05);
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .nav-left {
            display: flex;
            align-items: center;
            gap: 50px;
        }

        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
            transition: transform 0.3s ease;
        }

        .logo img {
            height: 60px;
            transition: transform 0.3s ease;
        }

        .logo:hover {
            transform: translateY(-2px);
        }

        .location-selector {
            display: flex;
            align-items: center;
            gap: 12px;
            cursor: pointer;
            padding: 10px 20px;
            border-radius: 12px;
            transition: all 0.3s ease;
            background: var(--white);
            border: 1px solid #eee;
        }

        .location-selector:hover {
            background: var(--primary-light);
            color: var(--primary);
            border-color: var(--primary-light);
            transform: translateY(-2px);
        }

        .location-selector i {
            color: var(--primary);
            font-size: 1.2rem;
        }

        .nav-right {
            display: flex;
            gap: 30px;
            align-items: center;
        }

        .nav-item {
            display: flex;
            align-items: center;
            gap: 8px;
            color: var(--dark);
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 12px;
            transition: all 0.3s ease;
            font-weight: 500;
            position: relative;
        }

        .nav-item i {
            font-size: 1.2rem;
            transition: all 0.3s ease;
        }

        .nav-item:hover {
            background: var(--primary-light);
            color: var(--primary);
            transform: translateY(-2px);
        }

        .nav-item:hover i {
            transform: scale(1.1);
        }

        .nav-item.cart {
            background: var(--primary);
            color: white;
        }

        .nav-item.cart:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .cart-count {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--secondary);
            color: white;
            font-size: 0.8rem;
            padding: 2px 6px;
            border-radius: 50%;
            min-width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* Enhanced Category Scroll */
        .category-section {
            background: white;
            padding: 35px;
            border-radius: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
            margin-bottom: 40px;
            position: relative;
        }

        .section-title {
            font-size: 28px;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 30px;
            padding-left: 10px;
        }

        .scroll-wrapper {
            position: relative;
            padding: 0 40px;
            margin: 0 -20px;
        }

        .category-scroll {
            display: flex;
            overflow-x: auto;
            gap: 30px;
            padding: 15px 10px;
            scroll-behavior: smooth;
            scrollbar-width: none;
            -ms-overflow-style: none;
            position: relative;
        }

        .category-scroll::-webkit-scrollbar {
            display: none;
        }

        .category-item {
            flex: 0 0 auto;
            width: 180px;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            cursor: pointer;
        }
        
                .category-item:hover {
            transform: translateY(-8px);
        }

        .category-item img {
            width: 180px;
            height: 180px;
            border-radius: 20px;
            object-fit: cover;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .category-item:hover img {
            transform: scale(1.03);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }

        .scroll-button {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: white;
            border: none;
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
            z-index: 2;
            color: var(--primary);
        }

        .scroll-button:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-50%) scale(1.1);
            box-shadow: 0 4px 20px rgba(252, 128, 25, 0.3);
        }

        .scroll-button.left { left: 10px; }
        .scroll-button.right { right: 10px; }

        /* Enhanced Restaurant Cards */
        .restaurant-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(350px, 1fr));
            gap: 35px;
            padding: 20px 0;
        }

        .restaurant-card {
            background: white;
            border-radius: 24px;
            overflow: hidden;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
            position: relative;
        }

        .restaurant-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.12);
        }

        .restaurant-image {
            position: relative;
            height: 240px;
            overflow: hidden;
        }

        .restaurant-image::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            height: 60%;
            background: linear-gradient(to top, rgba(0,0,0,0.6), transparent);
            z-index: 1;
            transition: all 0.3s ease;
        }

        .restaurant-card:hover .restaurant-image::after {
            height: 70%;
            opacity: 0.8;
        }

        .restaurant-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }

        .restaurant-card:hover .restaurant-image img {
            transform: scale(1.1);
        }

        .restaurant-info {
            padding: 30px;
            position: relative;
        }

        .restaurant-name {
            font-size: 1.6rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 20px;
            transition: color 0.3s ease;
        }

        .restaurant-card:hover .restaurant-name {
            color: var(--primary);
        }

        .restaurant-meta {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 1px dashed rgba(0,0,0,0.1);
        }

        .rating {
            background: var(--secondary);
            color: white;
            padding: 10px 16px;
            border-radius: 12px;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .restaurant-card:hover .rating {
            transform: scale(1.05);
            box-shadow: 0 4px 15px rgba(96, 178, 70, 0.2);
        }

        .rating i {
            color: #ffd700;
        }

        .delivery-time {
            color: var(--gray);
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 1.1rem;
        }

        .restaurant-details {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin-bottom: 25px;
        }

        .detail-item {
            display: flex;
            align-items: center;
            gap: 12px;
            color: var(--gray);
            font-size: 1.05rem;
            transition: all 0.3s ease;
        }

        .detail-item i {
            color: var(--primary);
            font-size: 1.2rem;
        }

        .restaurant-card:hover .detail-item {
            transform: translateX(5px);
        }

        .view-menu-btn {
            background: var(--primary);
            color: white;
            border: none;
            padding: 16px 32px;
            border-radius: 14px;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            font-size: 1.1rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
        }

        .view-menu-btn::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 0;
            height: 0;
            background: rgba(255,255,255,0.2);
            border-radius: 50%;
            transform: translate(-50%, -50%);
            transition: width 0.6s ease, height 0.6s ease;
        }

        .view-menu-btn:hover::before {
            width: 300px;
            height: 300px;
        }

        .view-menu-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(252, 128, 25, 0.4);
        }

        /* Enhanced Modern Footer */
        .footer {
            background: #1a1a1a;
            color: #fff;
            padding: 90px 0 40px;
            margin-top: 100px;
            position: relative;
        }

        .footer::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, 
                var(--primary) 0%, 
                var(--primary-dark) 50%, 
                var(--primary) 100%);
            background-size: 200% 100%;
            animation: gradient 3s linear infinite;
        }

        @keyframes gradient {
            0% { background-position: 200% 0; }
            100% { background-position: -200% 0; }
        }

        .footer-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 30px;
        }

        .footer-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 70px;
            margin-bottom: 70px;
        }

        .footer-section h3 {
            color: #fff;
            font-size: 1.5rem;
            margin-bottom: 35px;
            font-weight: 600;
            position: relative;
            padding-bottom: 15px;
        }

        .footer-section h3::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 45px;
            height: 3px;
            background: var(--primary);
            border-radius: 2px;
            transition: width 0.3s ease;
        }

        .footer-section:hover h3::after {
            width: 60px;
        }

        .footer-links {
            list-style: none;
            padding: 0;
        }

        .footer-links li {
            margin-bottom: 20px;
        }

        .footer-links a {
            color: #b3b3b3;
            text-decoration: none;
            transition: all 0.3s ease;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .footer-links a:hover {
            color: var(--primary);
            transform: translateX(10px);
        }

        .footer-links a i {
            color: var(--primary);
            font-size: 1.2rem;
            transition: transform 0.3s ease;
        }

        .footer-links a:hover i {
            transform: scale(1.2);
        }

        .app-downloads {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .app-downloads img {
            height: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .app-downloads img:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .footer-bottom {
            text-align: center;
            padding-top: 40px;
            border-top: 1px solid #333;
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 25px;
            margin-bottom: 25px;
        }

        .social-links a {
            color: #b3b3b3;
            font-size: 1.8rem;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: rgba(255,255,255,0.05);
        }

        .social-links a:hover {
            color: var(--primary);
            transform: translateY(-5px);
            background: rgba(255,255,255,0.1);
        }

        .copyright {
            color: #888;
            font-size: 0.95rem;
        }
        /* Add these updated styles to your existing CSS */

/* Container width control */
.nav-container, .main-content, .footer-container {
    max-width: 1200px;  /* Reduced from 1400px for better spacing */
    margin: 0 auto;
    padding: 0 20px;
}

/* Enhanced Navbar */
.navbar {
    background: rgba(255, 255, 255, 0.98);
    backdrop-filter: blur(10px);
    box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
    padding: 12px 0;
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
    transition: all 0.3s ease;
}

.nav-right {
    display: flex;
    gap: 25px;
    align-items: center;
}

/* Updated Navbar Items */
.nav-item {
    display: flex;
    align-items: center;
    gap: 8px;
    color: var(--dark);
    text-decoration: none;
    padding: 10px 16px;
    border-radius: 8px;
    transition: all 0.3s ease;
    font-weight: 500;
}

/* Specific styles for each nav item */
.nav-item.home {
    color: var(--primary);
}

.nav-item.search {
    background: var(--light-gray);
}

.nav-item.offers {
    background: var(--primary-light);
    color: var(--primary);
}

.nav-item.help {
    background: var(--light-gray);
}

.nav-item.sign-in {
    background: var(--primary-light);
    color: var(--primary);
}

.nav-item.cart {
    background: var(--primary);
    color: white;
}

/* Main content spacing */
.main-content {
    margin-top: 100px;
    padding: 20px;
}

/* Update the restaurant grid for better spacing */
.restaurant-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(330px, 1fr));
    gap: 30px;
    padding: 20px 0;
}
    </style>
</head>


<body>
    <!-- Enhanced Navbar -->
    <nav class="navbar">
    <div class="nav-container">
        <div class="nav-left">
            <a href="Restaurant.jsp" class="logo">
                <img src="Images/tap_logi-removebg-preview.png" alt="TapFoods Logo">
            </a>
        </div>
        <div class="nav-right">
            <a href="Restaurant.jsp" class="nav-item home">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </a>
            <a href="#" class="nav-item search">
                <i class="fas fa-search"></i>
                <span>Search</span>
            </a>
            <a href="offers.jsp" class="nav-item offers">
                <i class="fas fa-percent"></i>
                <span>Offers</span>
            </a>
            <a href="help.jsp" class="nav-item help">
                <i class="fas fa-question-circle"></i>
                <span>Help</span>
            </a>
            <a href="Login.jsp" class="nav-item sign-in">
                <i class="fas fa-user"></i>
                <span>Sign In</span>
            </a>
            <a href="SignUp.jsp" class="nav-item sign-in">
                <i class="fas fa-user"></i>
                <span>Sign Up</span>
            </a>
            <a href="Login.jsp" class="nav-item cart">
                <i class="fas fa-shopping-cart"></i>
                <span>Cart</span>
                <span class="cart-count">2</span>
            </a>
        </div>
    </div>
</nav>

    <main class="main-content">
        <!-- Enhanced Category Section -->
        <section class="category-section">
            <h2 class="section-title">What's on your mind?</h2>
            <div class="scroll-wrapper">
                <button class="scroll-button left" id="scrollLeft">
                    <i class="fas fa-chevron-left"></i>
                </button>
                <div class="category-scroll" id="categoryScroll">
                    <% for(int i = 1; i <= 20; i++) { %>
                        <div class="category-item">
                            <img src="Images/scroll-<%=i%>.png" alt="Food Category <%=i%>">
                        </div>
                    <% } %>
                </div>
                <button class="scroll-button right" id="scrollRight">
                    <i class="fas fa-chevron-right"></i>
                </button>
            </div>
        </section>

        <!-- Restaurant Grid -->
        <div class="restaurant-grid">
            <% 
            List<Restaurant> restaurants = (List<Restaurant>) session.getAttribute("restaurantList");
            if(restaurants != null && !restaurants.isEmpty()) {
                for(Restaurant restaurant : restaurants) { 
            %>
                <div class="restaurant-card">
                    <div class="restaurant-image">
                        <img src="<%=restaurant.getImagePath()%>" alt="<%=restaurant.getName()%>">
                    </div>
                    <div class="restaurant-info">
                        <h3 class="restaurant-name"><%=restaurant.getName()%></h3>
                        <div class="restaurant-meta">
                            <div class="rating">
                                <i class="fas fa-star"></i>
                                <span><%=restaurant.getRating()%></span>
                            </div>
                            <div class="delivery-time">
                                <i class="far fa-clock"></i>
                                <span><%=restaurant.getEta()%> </span>
                            </div>
                        </div>
                        <div class="restaurant-details">
                            <div class="detail-item">
                                <i class="fas fa-utensils"></i>
                                <span><%=restaurant.getCuisineType()%></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-map-marker-alt"></i>
                                <span><%=restaurant.getAddress()%></span>
                            </div>
                            <div class="detail-item">
                                <i class="fas fa-tags"></i>
                             
                            </div>
                        </div>
                        <form action="CallingMenuServlet" method="post">
                            <input type="hidden" name="restaurantId" value="<%=restaurant.getRestaurantId()%>">
                            <button type="submit" class="view-menu-btn">
                                <span>View Menu</span>
                            </button>
                        </form>
                    </div>
                </div>
            <% 
                }
            } 
            %>
        </div>
    </main>

    <!-- Enhanced Footer -->
    <footer class="footer">
        <div class="footer-container">
            <div class="footer-grid">
                <div class="footer-section">
                    <h3>COMPANY</h3>
                    <ul class="footer-links">
                        <li><a href="#"><i class="fas fa-info-circle"></i>About Us</a></li>
                        <li><a href="#"><i class="fas fa-users"></i>Team</a></li>
                        <li><a href="#"><i class="fas fa-briefcase"></i>Careers</a></li>
                        <li><a href="#"><i class="fas fa-blog"></i>Blog</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>CONTACT</h3>
                    <ul class="footer-links">
                        <li><a href="#"><i class="fas fa-headset"></i>Help & Support</a></li>
                        <li><a href="#"><i class="fas fa-handshake"></i>Partner with us</a></li>
                        <li><a href="#"><i class="fas fa-motorcycle"></i>Ride with us</a></li>
                    </ul>
                </div>
                <div class="footer-section">
                    <h3>LEGAL</h3>
                    <ul class="footer-links">
                        <li><a href="#"><i class="fas fa-file-contract"></i>Terms & Conditions</a></li>
                        <li><a href="#"><i class="fas fa-shield-alt"></i>Privacy Policy</a></li>
                        <li><a href="#"><i class="fas fa-cookie"></i>Cookie Policy</a></li>
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
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <div class="copyright">
                    <p>&copy; 2024 TapFoods. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <script>
        // Enhanced Scroll Functionality
        const categoryScroll = document.getElementById('categoryScroll');
        const scrollLeft = document.getElementById('scrollLeft');
        const scrollRight = document.getElementById('scrollRight');
        
        let scrollAmount = 0;
        const scrollStep = 300;

        function updateScrollButtons() {
            scrollLeft.style.opacity = categoryScroll.scrollLeft > 0 ? '1' : '0.5';
            scrollRight.style.opacity = 
                categoryScroll.scrollLeft < (categoryScroll.scrollWidth - categoryScroll.clientWidth) 
                ? '1' : '0.5';
        }

        scrollLeft.addEventListener('click', () => {
            categoryScroll.scrollBy({
                left: -scrollStep,
                behavior: 'smooth'
            });
        });

        scrollRight.addEventListener('click', () => {
            categoryScroll.scrollBy({
                left: scrollStep,
                behavior: 'smooth'
            });
        });

        categoryScroll.addEventListener('scroll', updateScrollButtons);
        window.addEventListener('resize', updateScrollButtons);
        updateScrollButtons();

        // Enhanced Navbar Scroll Effect
        const navbar = document.querySelector('.navbar');
        let lastScroll = 0;

        window.addEventListener('scroll', () => {
            const currentScroll = window.pageYOffset;
            if (currentScroll > 50) {
                navbar.classList.add('scrolled');
            } else {
                navbar.classList.remove('scrolled');
            }
        });

        // Smooth scroll reveal animation for restaurant cards
        const observerOptions = {
            threshold: 0.1,
            rootMargin: '0px 0px -50px 0px'
        };

        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.style.opacity = '1';
                    entry.target.style.transform = 'translateY(0)';
                }
            });
        }, observerOptions);

        document.querySelectorAll('.restaurant-card').forEach(card => {
            card.style.opacity = '0';
            card.style.transform = 'translateY(20px)';
            card.style.transition = 'all 0.6s cubic-bezier(0.4, 0, 0.2, 1)';
            observer.observe(card);
        });
    </script>
</body>
</html>