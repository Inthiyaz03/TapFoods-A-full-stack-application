<%@ page import="com.tapfoods.model.Cart"%>
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.tapfoods.model.CartItem"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thank You for Your Order</title>
<style>
    :root {
        --primary-color: #ff6b3d;
        --primary-dark: #e65a2d;
        --background-color: #f9f9f9;
        --surface-color: #ffffff;
        --text-color: #333;
        --header-color: #2A2F4F;
        --header-text-color: #fff;
        --border-color: #ddd;
        --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    * {
        box-sizing: border-box;
        margin: 0;
        padding: 0;
    }

    body {
        font-family: 'Segoe UI', sans-serif;
        background-color: var(--background-color);
        color: var(--text-color);
        line-height: 1.6;
    }

    .container {
        max-width: 800px;
        margin: 40px auto;
        padding: 20px;
        background-color: var(--surface-color);
        border-radius: 12px;
        box-shadow: var(--shadow);
    }

    header {
        background-color: var(--header-color);
        color: var(--header-text-color);
        padding: 20px 0;
        text-align: center;
        box-shadow: var(--shadow);
    }

    header h1 {
        font-size: 2rem;
        font-weight: 700;
        margin: 0;
    }

    .content {
        padding: 20px;
    }

    .confirmation-message {
        margin-bottom: 20px;
        text-align: center;
        font-size: 1.25rem;
        color: var(--primary-color);
    }

    .order-summary {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .order-summary th, .order-summary td {
        padding: 12px;
        border: 1px solid var(--border-color);
    }

    .order-summary th {
        background-color: var(--primary-color);
        color: #fff;
        font-weight: 700;
        text-align: left;
    }

    .order-summary tbody tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    .order-summary tbody tr:nth-child(odd) {
        background-color: #fff;
    }

    .total-price {
        margin-top: 20px;
        text-align: right;
        font-size: 1.5rem;
        font-weight: 700;
        color: var(--primary-color);
    }

    .button-container {
        display: flex;
        justify-content: space-between;
        margin-top: 30px;
    }

    .confirm-btn, .cancel-btn {
        background-color: var(--primary-color);
        color: #fff;
        border: none;
        padding: 12px 24px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1rem;
        transition: background-color 0.3s ease, transform 0.2s ease;
    }

    .confirm-btn:hover, .cancel-btn:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
    }
</style>
</head>
<body>
    <header>
        <h1>Thank You for Your Order</h1>
    </header>
    <div class="container">
        <div class="content">
            <div class="confirmation-message">
                <p>Your order has been successfully placed!</p>
            </div>
            <div class="cart-summary">
                <h2>Order Summary</h2>
                <table class="order-summary">
                    <thead>
                        <tr>
                            <th>Item</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            Cart cart = (Cart) session.getAttribute("cart");
                            if (cart != null) {
                                double totalPrice = (double) session.getAttribute("totalPrice");
                                DecimalFormat df = new DecimalFormat("#.##");

                                for (CartItem item : cart.getItems().values()) {
                                    double itemTotal = item.getPrice() * item.getQuantity();
                        %>
                        <tr>
                            <td><%= item.getName() %></td>
                            <td>&#x20B9;<%= item.getPrice() %></td>
                            <td><%= item.getQuantity() %></td>
                            <td>&#x20B9;<%= df.format(itemTotal) %></td>
                        </tr>
                        <% 
                                }
                        %>
                    </tbody>
                </table>
                <div class="total-price">
                    <% if (session.getAttribute("totalPrice") != null) { %>
                    <p>Total Price: &#x20B9;<%= df.format(totalPrice) %></p>
                    <% }
                    }%>
                </div>
            </div>
            <div class="button-container">
                <button class="confirm-btn" onclick="window.location.href='confirmation2.jsp'">Confirm</button>
                <button class="cancel-btn" onclick="window.location.href='RestaurantMain.jsp'">Cancel</button>
            </div>
        </div>
    </div>
</body>
</html>