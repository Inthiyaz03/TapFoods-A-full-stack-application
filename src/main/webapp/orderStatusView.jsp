<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Order Status | Tap Foods</title>
    <style>
        :root {
            --primary: #ff6b3d;
            --primary-dark: #e65a2d;
            --background: #f8f9fa;
            --surface: #ffffff;
            --text: #2d3436;
            --shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            --success: #00b894;
            --pending: #fdcb6e;
            --cancelled: #ff7675;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }

        body {
            background: var(--background);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background: var(--surface);
            padding: 2.5rem;
            border-radius: 15px;
            box-shadow: var(--shadow);
            width: 90%;
            max-width: 500px;
            text-align: center;
        }

        h2 {
            color: var(--text);
            font-size: 2rem;
            margin-bottom: 1.5rem;
            position: relative;
            display: inline-block;
        }

        h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            transform: translateX(-50%);
            width: 60%;
            height: 3px;
            background: var(--primary);
            border-radius: 2px;
        }

        p {
            color: var(--text);
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .status {
            background: #f0f2f5;
            padding: 1.5rem;
            border-radius: 10px;
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 2rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            overflow: hidden;
        }

        .status::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background: var(--primary);
        }

        .back-btn {
            display: inline-block;
            padding: 0.8rem 2rem;
            background: var(--primary);
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .back-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(230, 90, 45, 0.2);
        }

        @media (max-width: 768px) {
            .container {
                width: 95%;
                padding: 2rem;
                margin: 1rem;
            }

            h2 {
                font-size: 1.8rem;
            }

            p {
                font-size: 1rem;
            }

            .status {
                font-size: 1.2rem;
                padding: 1.2rem;
            }
        }

        /* Status-specific colors */
        .status[data-status="Preparing"] {
            color: var(--pending);
        }
        .status[data-status="Preparing"]::before {
            background: var(--pending);
        }

        .status[data-status="Delivered"] {
            color: var(--success);
        }
        .status[data-status="Delivered"]::before {
            background: var(--success);
        }

        .status[data-status="Cancelled"] {
            color: var(--cancelled);
        }
        .status[data-status="Cancelled"]::before {
            background: var(--cancelled);
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Order Status</h2>
        <p>
            Your order with ID
            <strong><%=request.getParameter("orderId")%></strong>
            is currently:
        </p>
        <div class="status" data-status="<%=request.getAttribute("status")%>">
            <%=request.getAttribute("status")%>
        </div>
        <a href="trackorder.jsp" class="back-btn">Back to Track Order</a>
    </div>
</body>
</html>