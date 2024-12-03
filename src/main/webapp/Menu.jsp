<%@ page import="java.util.List"%>
<%@ page import="com.tapfoods.model.Menu"%>
<%@ page import="com.tapfoods.model.Restaurant"%>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://fonts.cdnfonts.com/css/proxima-nova-condensed">
    <title>Menu</title>

    <style>
        :root {
            --primary: #ff6b3d;
            --primary-dark: #e65a2d;
            --secondary: #2d3436;
            --background: #fff5f0;
            --surface: #ffffff;
            --text: #2d3436;
            --text-light: #636e72;
            --price: #ff6b3d;
            --rating: #00b894;
            --shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            --error: #ff4757;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Proxima Nova', sans-serif;
        }

        body {
            background: var(--background);
            color: var(--text);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            padding: 25px 0;
            text-align: center;
            color: white;
            box-shadow: var(--shadow);
        }

        header h1 {
            font-size: 2rem;
            font-weight: 600;
            margin: 0;
        }

        .container {
            max-width: 1200px;
            margin: 40px auto;
            padding: 0 20px;
            flex: 1;
        }

        .menu-item {
            background: var(--surface);
            border-radius: 16px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
            display: flex;
            overflow: hidden;
            transition: transform 0.3s ease;
            position: relative;
        }

        .menu-item:hover {
            transform: translateY(-5px);
        }

        .menu-item img {
            width: 280px;
            height: 280px;
            object-fit: cover;
            border-radius: 12px;
            margin: 15px;
        }

        .menu-item-content {
            padding: 30px;
            flex: 1;
            display: flex;
            flex-direction: column;
        }

        .menu-item-name {
            font-size: 24px;
            margin-bottom: 10px;
            color: var(--text);
            font-weight: 600;
        }

        .menu-item-description {
            color: var(--text-light);
            margin-bottom: 20px;
            font-size: 16px;
            line-height: 1.6;
        }

        .menu-item-price {
            font-size: 22px;
            color: var(--price);
            font-weight: 600;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .rating-container {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .bi-star-fill {
            color: var(--rating);
            margin-right: 8px;
        }

        .rating {
            font-weight: 500;
            color: var(--rating);
            font-size: 16px;
        }

        .form-container {
            margin-top: auto;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .quantity-wrapper {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .quantity-label {
            font-size: 16px;
            color: var(--text);
            font-weight: 500;
        }

        .quantity-input {
            width: 100px;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .quantity-input:focus {
            border-color: var(--primary);
            outline: none;
            box-shadow: 0 0 0 3px rgba(255, 107, 61, 0.1);
        }

        .quantity-input:invalid {
            border-color: var(--error);
        }

        .add-button {
            background: var(--primary);
            color: white;
            border: none;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .add-button:hover:not(:disabled) {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        .add-button:disabled {
            background: #cccccc;
            cursor: not-allowed;
        }

        .error-message {
            color: var(--error);
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        footer {
            background: var(--primary);
            color: white;
            text-align: center;
            padding: 15px 0;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .menu-item {
                flex-direction: column;
            }

            .menu-item img {
                width: 100%;
                height: 200px;
                margin: 0;
                border-radius: 16px 16px 0 0;
            }

            .menu-item-content {
                padding: 20px;
            }

            .form-container {
                flex-direction: column;
                align-items: stretch;
                gap: 10px;
            }

            .quantity-wrapper {
                flex-direction: column;
                align-items: stretch;
            }

            .quantity-input {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Menu</h1>
    </header>

    <div class="container">
        <% List<Menu> menuAll = (List<Menu>) request.getAttribute("Menus");
           for (Menu m : menuAll) { %>
            <div class="menu-item">
                <img src="<%=m.getImagePath()%>" alt="<%=m.getName()%>">
                <div class="menu-item-content">
                    <h2 class="menu-item-name"><%=m.getName()%></h2>
                    <p class="menu-item-description"><%=m.getDescription()%></p>
                    <div class="menu-item-price">
                        <i class="fas fa-rupee-sign"></i>
                        <span><%=m.getPrice()%></span>
                    </div>
                    <div class="rating-container">
                        <i class="bi bi-star-fill"></i>
                        <span class="rating"><%=m.getRating()%></span>
                    </div>
                    <form action="CallingCartServlet" method="post" class="form-container" onsubmit="return validateForm(this)">
                        <div class="quantity-wrapper">
                            <label class="quantity-label">Quantity:</label>
                            <input type="number" name="quantity" min="1" 
                                   class="quantity-input" placeholder="Enter quantity"
                                   oninput="validateQuantity(this)">
                            <span class="error-message">Please enter a quantity greater than 0</span>
                        </div>
                        <input type="hidden" name="itemId" value="<%=m.getMenuId()%>">
                        <input type="hidden" name="restaurantId" value="<%=m.getRestaurantId()%>">
                        <input type="hidden" name="action" value="add">
                        <button type="submit" class="add-button" disabled>Add to Cart</button>
                    </form>
                </div>
            </div>
        <% } %>
    </div>

    <footer>
        <p>&copy; 2024 Tap-Foods</p>
    </footer>

    <script>
        function validateQuantity(input) {
            const submitBtn = input.form.querySelector('.add-button');
            const errorMsg = input.parentElement.querySelector('.error-message');
            
            if (input.value > 0) {
                submitBtn.disabled = false;
                errorMsg.style.display = 'none';
                input.style.borderColor = '#ddd';
            } else {
                submitBtn.disabled = true;
                errorMsg.style.display = 'block';
                input.style.borderColor = 'var(--error)';
            }
        }

        function validateForm(form) {
            const quantity = form.querySelector('.quantity-input').value;
            return quantity > 0;
        }
    </script>
</body>
</html>