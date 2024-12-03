<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Check-out</title>
<style>
    :root {
        --primary-color: #ff6b3d;
        --primary-dark: #e65a2d;
        --background-color: #f9f9f9;
        --surface-color: #ffffff;
        --text-color: #333;
        --border-color: #ddd;
        --shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
        background-color: var(--background-color);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .container {
        max-width: 500px;
        width: 90%;
        padding: 40px;
        background-color: var(--surface-color);
        border-radius: 12px;
        box-shadow: var(--shadow);
        text-align: center;
    }

    h2 {
        margin-bottom: 20px;
        color: var(--primary-color);
        font-size: 1.8rem;
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .form-group label {
        display: block;
        font-weight: 600;
        margin-bottom: 8px;
        color: var(--text-color);
    }

    .form-group input[type="text"], .form-group select {
        width: 100%;
        padding: 12px;
        border: 1px solid var(--border-color);
        border-radius: 8px;
        font-size: 1rem;
        background-color: #f4f4f4;
        transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    .form-group input[type="text"]:focus, .form-group select:focus {
        border-color: var(--primary-color);
        box-shadow: 0 0 0 3px rgba(255, 107, 61, 0.2);
    }

    .form-group select {
        appearance: none;
        background: url('data:image/svg+xml;utf8,<svg fill="%23ff6b3d" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M7 10l5 5 5-5z"/></svg>') no-repeat right 10px center;
        background-size: 16px;
        padding-right: 40px;
        cursor: pointer;
    }

    .btn {
        background-color: var(--primary-color);
        color: #fff;
        border: none;
        padding: 12px 20px;
        border-radius: 8px;
        cursor: pointer;
        font-size: 1rem;
        font-weight: 600;
        transition: background-color 0.3s ease, transform 0.2s ease;
        width: 100%;
    }

    .btn:hover {
        background-color: var(--primary-dark);
        transform: translateY(-2px);
    }
</style>
</head>
<body>

    <div class="container">
        <h2>Checkout</h2>
        <form action="CheckoutServlet" method="post">
            <div class="form-group">
                <label for="plot">Plot/Flat No:</label>
                <input type="text" id="plot" name="plot" placeholder="Enter plot/flat number">
            </div>
            <div class="form-group">
                <label for="street">Street Name:</label>
                <input type="text" id="street" name="street" placeholder="Enter street name">
            </div>
            <div class="form-group">
                <label for="pincode">Pincode:</label>
                <input type="text" id="pincode" name="pincode" placeholder="Enter pincode">
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" placeholder="Enter city" required>
            </div>

            <div class="form-group">
                <label for="payment">Mode of Payment:</label>
                <select id="payment" name="payment">
                    <option value="Cash">Cash on Delivery</option>
                    <option value="CreditCard">Credit Card</option>
                    <option value="DebitCard">Debit Card</option>
                    <option value="Upi">Upi</option>
                </select>
            </div>
            <button type="submit" class="btn">Confirm</button>
        </form>
    </div>

</body>
</html>