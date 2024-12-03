<%@ page import="com.tapfoods.model.Cart"%>
<%@ page import="com.tapfoods.model.CartItem"%>
<%@ page import="com.tapfoods.model.Restaurant"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<!-- Previous imports and declarations remain same -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Cart</title>

<style>
    :root {
        --primary: #ff6b3d;
        --primary-light: #ff8b3d;
        --primary-dark: #e65a2d;
        --secondary: #2d3436;
        --background: #fff5f0;
        --surface: #ffffff;
        --text: #2d3436;
        --text-light: #636e72;
        --shadow: 0 4px 20px rgba(255, 107, 61, 0.1);
        --border: #ffe5d9;
    }

    body {
        font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        background: var(--background);
        margin: 0;
        padding: 0;
        min-height: 100vh;
    }

    header {
        background: linear-gradient(135deg, var(--primary), var(--primary-light));
        padding: 1.5rem 0;
        color: white;
        box-shadow: var(--shadow);
    }

    header h1 {
        font-size: 1.8rem;
        margin: 0;
        font-weight: 600;
        text-align: center;
    }

    .header-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 12px;
        padding: 1rem 2rem;
        background: rgba(255, 255, 255, 0.1);
        margin-top: 1rem;
    }

    .cart-item {
        background: var(--surface);
        border-radius: 16px;
        padding: 2rem;
        width: 90%;
        max-width: 1000px;
        margin: 2rem auto;
        box-shadow: var(--shadow);
    }

    .menu-items {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 1.5rem;
        margin-bottom: 2rem;
    }

    .menu-item {
        background: var(--surface);
        border: 2px solid var(--border);
        border-radius: 12px;
        padding: 1.5rem;
        transition: all 0.3s ease;
    }

    .menu-item:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow);
        border-color: var(--primary-light);
    }

    .item-details {
        display: flex;
        flex-direction: column;
        gap: 0.8rem;
    }

    .item-details p {
        margin: 0;
        font-size: 1.1rem;
        font-weight: 600;
        color: var(--text);
    }

    .price {
        color: var(--primary);
        font-size: 1.2rem;
        font-weight: 700;
    }

    .quantity-controls {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-top: 1rem;
    }

    .quantity-controls input[type="number"] {
        width: 80px;
        padding: 8px;
        border: 2px solid var(--border);
        border-radius: 8px;
        font-size: 1rem;
        text-align: center;
    }

    .btn {
        padding: 10px 20px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: 600;
        transition: all 0.3s ease;
        font-size: 0.9rem;
    }

    .remove-btn, .clear-btn {
        background: #ff4757;
        color: white;
    }

    .remove-btn:hover, .clear-btn:hover {
        background: #ff6b81;
        transform: translateY(-2px);
    }

    .update-btn {
        background: var(--primary);
        color: white;
    }

    .update-btn:hover {
        background: var(--primary-light);
        transform: translateY(-2px);
    }

    .newbtn {
        background: rgba(255, 255, 255, 0.2);
        color: white;
        border: 1px solid rgba(255, 255, 255, 0.4);
        padding: 8px 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.3s ease;
    }

    .newbtn:hover {
        background: rgba(255, 255, 255, 0.3);
        transform: translateY(-2px);
    }

    .proceed-buttons-container {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 2rem;
        padding-top: 1.5rem;
        border-top: 2px solid var(--border);
    }

    .add-more-item-btn, .proceed-to-checkout-btn {
        background: var(--primary);
        color: white;
        padding: 12px 24px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s ease;
        border: none;
        font-size: 1rem;
    }

    .add-more-item-btn:hover, .proceed-to-checkout-btn:hover {
        background: var(--primary-light);
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(255, 107, 61, 0.2);
    }

    .empty-cart-msg {
        text-align: center;
        padding: 3rem;
        font-size: 1.2rem;
        color: var(--text-light);
        background: var(--surface);
        border-radius: 12px;
        border: 2px dashed var(--border);
    }

    .clear-cart-container {
        display: flex;
        justify-content: flex-end;
        padding: 1rem 5%;
    }

    @media (max-width: 768px) {
        .cart-item {
            padding: 1rem;
            width: 95%;
        }

        .menu-items {
            grid-template-columns: 1fr;
        }

        .proceed-buttons-container {
            flex-direction: column;
            gap: 1rem;
        }

        .add-more-item-btn, .proceed-to-checkout-btn {
            width: 100%;
            text-align: center;
        }
    }
</style>
</head>
<!-- Rest of your HTML remains the same -->


<body>

    <header>
        <h1>Cart</h1>
        <div style="display: flex; justify-content: flex-end; gap: 10px; padding: 10px;">
            <form action="RestaurantMain.jsp" method="post">
                <input type="submit" value="Home" class="newbtn">
            </form>
            <form action="CallingMenuServlet?restaurantId=<%=session.getAttribute("restaurantId")%>" method="post">
                <input type="submit" value="Prev" class="newbtn">
            </form>
            <form action="checkout.jsp" method="post">
                <input type="submit" value="Next" class="newbtn">
            </form>
        </div>
    </header>

    <div style="display: flex; justify-content: flex-end; padding: 10px;">
        <form action="CallingCartServlet" method="post">
            <input type="hidden" name="action" value="clear">
            <input type="submit" value="Clear Cart" class="clear-btn">
        </form>
    </div>

    <div class="cart-item">
        <div class="menu-items">
            <!-- Cart Items -->
            <% 
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart != null && !cart.getItems().isEmpty()) {
                for (CartItem item : cart.getItems().values()) {
            %>
            <div class="menu-item" id="<%=item.getItemId()%>">
                <div class="item-details">
                    <p><%=item.getName()%></p>
                    <span class="price">&#x20B9;<%=item.getPrice()%></span>
                    <form action="CallingCartServlet" method="post">
                        <input type="hidden" name="itemId" value="<%=item.getItemId()%>">
                        <div class="quantity-controls">
                            <input type="submit" name="action" value="remove" class="remove-btn">
                            <input type="number" name="quantity" value="<%=item.getQuantity()%>" min="1">
                            <input type="submit" name="action" value="update" class="update-btn">
                        </div>
                    </form>
                </div>
            </div>
            <% 
                }
            } else { 
            %>
            <div class="empty-cart-msg">Your Cart Is Empty</div>
            <% 
            } 
            %>
        </div>

        <div class="proceed-buttons-container">
            <a href="CallingMenuServlet?restaurantId=<%=session.getAttribute("restaurantId")%>" class="add-more-item-btn">Add More</a>
            <% if (session.getAttribute("cart") != null && !cart.getItems().isEmpty()) { %>
            <form action="checkout.jsp" method="post">
                <input type="submit" value="Proceed to Checkout" class="proceed-to-checkout-btn">
            </form>
            <% } %>
        </div>
    </div>
</body>
</html>