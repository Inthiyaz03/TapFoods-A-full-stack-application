<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Restaurant SignUp</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 0;
        min-height: 100vh; /* Full viewport height */
        display: flex;
        justify-content: center;
        align-items: center;
        background: url('Images/RestaurantSignUp.jpeg.jpeg') no-repeat center center fixed; 
        background-size: cover; /* Ensure the image covers the entire background */
        color: #333;
    }

    .form-container {
        background: rgba(255, 255, 255, 0.85); /* White with transparency */
        padding: 30px;
        width: 400px;
        border-radius: 15px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    .form-container h2 {
        color: #333;
        margin-bottom: 20px;
        font-size: 24px;
    }

    .form-group {
        display: flex;
        flex-direction: column;
        margin-bottom: 15px;
    }

    .form-group label {
        margin-bottom: 5px;
        font-size: 14px;
        color: #666;
    }

    .form-group input {
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        transition: border-color 0.3s;
    }

    .form-group input:focus {
        border-color: #2193b0;
        outline: none;
    }

    .form-container button {
        background-color: #28a745;
        color: #fff;
        border: none;
        padding: 10px 15px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        width: 100%;
        transition: background-color 0.3s;
    }

    .form-container button:hover {
        background-color: #218838;
    }

    .form-container button:active {
        background-color: #1e7e34;
    }
</style>
</head>
<body>
<div id="addRestaurantForm" class="form-container">
    <h2>Restaurant SignUp</h2>
    <form action="RestaurantSignUpServlet" method="POST">
        <div class="form-group">
            <label for="restaurantName">Restaurant Name:</label>
            <input type="text" id="restaurantName" name="restaurantName" placeholder="Enter the Restaurant Name" required>
        </div>
        
        <div class="form-group">
            <label for="image">Image URL:</label>
            <input type="text" id="image" name="image" placeholder="Enter the Image URL" required>
        </div>
        
        <div class="form-group">
            <label for="rating">Rating:</label>
            <input type="text" id="rating" name="rating" placeholder="Enter the Rating" required>
        </div>
        
        <div class="form-group">
            <label for="eta">ETA:</label>
            <input type="text" id="eta" name="eta" placeholder="Enter the ETA (e.g., 30 mins)" required>
        </div>
        
        <div class="form-group">
            <label for="cuisineType">Cuisine Type:</label>
            <input type="text" id="cuisineType" name="cuisineType" placeholder="Enter the Cuisine Type" required>
        </div>

        <div class="form-group">
            <label for="restaurantAddress">Restaurant Address:</label>
            <input type="text" id="restaurantAddress" name="restaurantAddress" placeholder="Enter the Restaurant Address" required>
        </div>
        
        <div class="form-group">
            <label for="isactive">isActive:</label>
            <input type="text" id="isactive" name="isactive" placeholder="Enter Active Status (true/false)" required>
        </div>
        
        <div class="form-group">
            <label for="restaurantOwnerId">Restaurant Owner ID:</label>
            <input type="number" id="restaurantOwnerId" name="restaurantOwnerId" placeholder="Enter the Owner ID" required>
        </div>
        
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" placeholder="Enter Your Full Name" required>
        </div>
        
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" placeholder="Enter Your Email Address" required>
        </div>
        
        <div class="form-group">
            <label for="phone">Phone Number:</label>
            <input type="text" id="phone" name="phone" placeholder="Enter Your Phone Number" required>
        </div>
        
        <div class="form-group">
            <label for="address">City:</label>
            <input type="text" id="address" name="address" placeholder="Enter Your City" required>
        </div>
        
        <div class="form-group">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" placeholder="Choose a Username" required>
        </div>
        
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" placeholder="Enter Your Password" required>
        </div>
        
        <button type="submit">Add Restaurant</button>
    </form>
</div>
</body>
</html>
