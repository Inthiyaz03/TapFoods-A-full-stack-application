<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tapfoods.model.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6fb;
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #0056a6;
            color: #ffffff;
            padding: 20px;
            text-align: center;
            font-size: 2em;
            font-weight: bold;
            text-shadow: 1px 1px 4px rgba(0, 0, 0, 0.2);
        }

        .container {
            width: 80%;
            margin: 30px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        h2 {
            color: #0056a6;
            text-align: center;
            margin-bottom: 20px;
            font-size: 1.8em;
        }

        .contact-info {
            margin: 20px 0;
            padding: 20px;
            background-color: #e9f3fb;
            border-radius: 10px;
            line-height: 1.8em;
            font-size: 1.1em;
        }

        .contact-info p {
            display: flex;
            align-items: center;
            margin: 12px 0;
            color: #333;
            transition: color 0.3s ease;
        }

        .contact-info p:hover {
            color: #0056a6;
        }

        .icon {
            font-size: 1.5em;
            margin-right: 12px;
            color: #0056a6;
        }

        .contact-form {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 1px solid #dcdcdc;
            border-radius: 10px;
        }

        .contact-form label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #0056a6;
        }

        .contact-form input,
        .contact-form textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .contact-form textarea {
            resize: none;
            height: 100px;
        }

        .contact-form button {
            background-color: #0056a6;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .contact-form button:hover {
            background-color: #003f84;
        }

        footer {
            text-align: center;
            padding: 15px;
            background-color: #0056a6;
            color: #ffffff;
            font-size: 0.95em;
            border-top: 4px solid #004080;
        }

        .container:hover {
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<header>Help & Support</header>

<div class="container">
    <h2>We're Here to Help! 💬</h2>
	<%
		User user = (User) session.getAttribute("user");
		%>
    <div class="contact-info">
        <p><span class="icon">📞</span>Phone: +91 95150 09576</p>
        <p><span class="icon">📧</span>Email: support@tapfoods.com</p>
        <p><span class="icon">📍</span>Address: 123 Food Street, Bangalore, Karnataka, India</p>
        <p><span class="icon">⏰</span>Hours: 9:00 AM - 10:00 PM IST</p>
    </div>

    <div class="contact-form">
        <h2>Contact Us</h2>
        <form action="#" method="post">
            <label for="name">Your Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" value="<%=user.getName() %>" readonly>

            <label for="email">Your Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" value="<%=user.getEmail()%>" readonly>

            <label for="message">Your Message:</label>
            <textarea id="message" name="message" placeholder="Write your message here" required></textarea>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>

<footer>Need more assistance? Reach out to us anytime! 📲</footer>

</body>
</html>
