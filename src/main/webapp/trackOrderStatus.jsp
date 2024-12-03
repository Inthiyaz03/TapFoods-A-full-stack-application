<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Status | Tap Foods</title>
    <style>
        :root {
            --primary: #ff6b3d;
            --primary-hover: #e65a2d;
            --secondary: #334756;
            --background: #f8f9fa;
            --surface: #ffffff;
            --text: #2d3436;
            --text-light: #636e72;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }

        body {
            background-color: var(--background);
            color: var(--text);
            line-height: 1.6;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 90%;
            max-width: 450px;
            padding: 2.5rem;
            background-color: var(--surface);
            border-radius: 16px;
            box-shadow: var(--shadow);
            transform: translateY(0);
            transition: transform 0.3s ease;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        h2 {
            color: var(--secondary);
            font-size: 2rem;
            margin-bottom: 1.5rem;
            position: relative;
            padding-bottom: 10px;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 3px;
            background: var(--primary);
            border-radius: 2px;
        }

        p {
            font-size: 1.1rem;
            color: var(--text-light);
            margin-bottom: 1.5rem;
        }

        .status {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
            margin: 2rem 0;
            padding: 1rem;
            background: rgba(255, 107, 61, 0.1);
            border-radius: 10px;
            border-left: 4px solid var(--primary);
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 1rem;
            margin-top: 2rem;
        }

        .back-btn, .Cancel-btn {
            flex: 1;
            padding: 12px 20px;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
        }

        .back-btn {
            background-color: var(--primary);
            color: var(--surface);
        }

        .Cancel-btn {
            background-color: var(--secondary);
            color: var(--surface);
        }

        .back-btn:hover, .Cancel-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .back-btn:hover {
            background-color: var(--primary-hover);
        }

        .Cancel-btn:hover {
            background-color: #2a3b47;
        }

        /* Order ID Highlight */
        .order-id {
            font-weight: 600;
            color: var(--secondary);
            background: rgba(51, 71, 86, 0.1);
            padding: 2px 8px;
            border-radius: 4px;
        }

        @media (max-width: 480px) {
            .container {
                padding: 1.5rem;
            }

            h2 {
                font-size: 1.75rem;
            }

            .status {
                font-size: 1.25rem;
            }

            .button-container {
                flex-direction: column;
            }

            .back-btn, .Cancel-btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Status</h2>
        <p>
            Your order with ID 
            <span class="order-id"><%= request.getParameter("orderId") %></span>
            is currently:
        </p>
        <div class="status">
            <%= "Your Order will be dispatched soon!!" %>
        </div>
        <div class="button-container">
            <a href="Trackorder.jsp" class="back-btn">Track Order</a>
            <button class="Cancel-btn" onclick="window.location.href='RestaurantMain.jsp'">Home</button>
        </div>
    </div>
</body>
</html>