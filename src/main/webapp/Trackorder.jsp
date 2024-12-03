<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Track Your Order</title>
<style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #f6f8fd 0%, #f1f4f9 100%);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
}

.container {
    width: 100%;
    max-width: 450px;
    padding: 35px;
    background: white;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
    transform: translateY(0);
    transition: all 0.3s ease;
}

.container:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.12);
}

h2 {
    color: #2d3436;
    font-size: 28px;
    font-weight: 600;
    margin-bottom: 15px;
    position: relative;
    padding-bottom: 15px;
}

h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background: #ff6b6b;
    border-radius: 2px;
}

p {
    font-size: 16px;
    color: #636e72;
    margin-bottom: 30px;
    line-height: 1.6;
}

form {
    width: 100%;
}

input[type="text"] {
    width: 100%;
    padding: 15px 20px;
    border: 2px solid #e0e0e0;
    border-radius: 12px;
    font-size: 16px;
    margin-bottom: 25px;
    transition: all 0.3s ease;
    background: #f8f9fa;
}

input[type="text"]:focus {
    border-color: #ff6b6b;
    box-shadow: 0 0 0 4px rgba(255, 107, 107, 0.1);
    outline: none;
}

input[type="text"]::placeholder {
    color: #b2bec3;
}

button[type="submit"] {
    width: 100%;
    padding: 15px;
    background: #ff6b6b;
    color: white;
    border: none;
    border-radius: 12px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

button[type="submit"]:hover {
    background: #ff5252;
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
}

button[type="submit"]:active {
    transform: translateY(0);
}

/* Animation for container appearance */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.container {
    animation: fadeIn 0.6s ease-out;
}

/* Responsive Design */
@media (max-width: 480px) {
    .container {
        padding: 25px;
    }

    h2 {
        font-size: 24px;
    }

    p {
        font-size: 15px;
    }

    input[type="text"], 
    button[type="submit"] {
        padding: 12px;
        font-size: 15px;
    }
}
</style>
</head>
<body>
    <div class="container">
        <h2>Track Your Order</h2>
        <p>Enter your order ID to track your order status.</p>
        <form action="trackOrderStatus.jsp" method="post">
            <input type="text" name="orderId" placeholder="Enter Order ID" required>
            <button type="submit">Track Order</button>
        </form>
    </div>
</body>
</html>