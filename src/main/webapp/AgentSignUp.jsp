<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tapfoods.daoimpl.UserDaoImpl"%>
<%@ page import="com.tapfoods.model.Cart"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up | Tap Foods</title>
    <style>
        :root {
            --primary: #ff6b6b;
            --primary-dark: #ff5252;
            --text-dark: #333;
            --text-light: #666;
            --bg-light: #f8f9fa;
            --border: #ddd;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', sans-serif;
            min-height: 100vh;
            display: grid;
            place-items: center;
            background: var(--bg-light);
            padding: 1rem;
        }

        .video-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .video-container::after {
            content: '';
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.4);
        }

        video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .signup-container {
            width: 100%;
            max-width: 420px;
            background: white;
            border-radius: 12px;
            padding: 1.5rem;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
        }

        .signup-header {
            text-align: center;
            margin-bottom: 1.25rem;
        }

        .signup-header h2 {
            font-size: 1.5rem;
            color: var(--text-dark);
            margin-bottom: 0.25rem;
        }

        .signup-header p {
            font-size: 0.9rem;
            color: var(--text-light);
        }

        .signup-header a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 0.75rem;
        }

        .form-label {
            display: block;
            font-size: 0.85rem;
            font-weight: 500;
            margin-bottom: 0.25rem;
            color: var(--text-dark);
        }

        .form-input {
            width: 100%;
            padding: 0.6rem 0.75rem;
            font-size: 0.9rem;
            border: 1.5px solid var(--border);
            border-radius: 6px;
            transition: all 0.2s;
        }

        .form-input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.1);
            outline: none;
        }

        .submit-btn {
            width: 100%;
            padding: 0.75rem;
            font-size: 0.95rem;
            font-weight: 600;
            color: white;
            background: var(--primary);
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 0.5rem;
        }

        .submit-btn:hover {
            background: var(--primary-dark);
        }

        .terms {
            text-align: center;
            font-size: 0.75rem;
            color: var(--text-light);
            margin-top: 0.75rem;
        }

        @media (max-height: 700px) {
            .signup-container {
                padding: 1rem;
            }

            .form-group {
                margin-bottom: 0.5rem;
            }

            .form-input {
                padding: 0.5rem 0.75rem;
            }

            .terms {
                margin-top: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="video-container">
        <video autoplay muted loop>
            <source src="S Foods signup backGround Video - Made with Clipchamp.mp4" type="video/mp4">
        </video>
    </div>

    <div class="signup-container">
        <div class="signup-header">
            <h2>Create Account</h2>
            <p>Already have an account? <a href="Login.jsp">Sign in</a></p>
        </div>

        <form action="AgentSignUpServlet" method="post">
            <div class="form-group">
                <label class="form-label" for="name">Full Name</label>
                <input class="form-input" type="text" id="name" name="name" 
                       placeholder="Enter your full name" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="email">Email Address</label>
                <input class="form-input" type="email" id="email" name="email" 
                       placeholder="Enter your email" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="phone">Phone Number</label>
                <input class="form-input" type="tel" id="phone" name="phone" 
                       placeholder="Enter your phone number" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="address">Address</label>
                <input class="form-input" type="text" id="address" name="address" 
                       placeholder="Enter your address" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="username">Username</label>
                <input class="form-input" type="text" id="username" name="username" 
                       placeholder="Choose a username" required>
            </div>

            <div class="form-group">
                <label class="form-label" for="password">Password</label>
                <input class="form-input" type="password" id="password" name="password" 
                       placeholder="Create a password" required>
            </div>

            <button type="submit" class="submit-btn">Create Account</button>

            <p class="terms">
                By creating an account, you agree to our Terms and Privacy Policy
            </p>
        </form>
    </div>
</body>
</html>