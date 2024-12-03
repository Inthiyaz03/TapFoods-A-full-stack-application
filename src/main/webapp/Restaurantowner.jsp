<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tapfoods.model.Menu, java.util.List,com.tapfoods.model.Restaurant,
com.tapfoods.model.Menu"%>
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Restaurant Management Dashboard</title>
<style>
/* Existing styles */
/* Container for the menu item cards */
.menu-items-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: center;
    padding: 20px;
    display: none; /* Initially hidden */
}

/* Individual menu item card styling */
.menu-item-card {
    width: 300px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    background-color: #ffffff;
    text-align: center;
    margin-bottom: 20px;
}

.menu-item-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.menu-item-details {
    padding: 15px;
}

.menu-item-details h3 {
    margin: 10px 0;
    font-size: 1.5em;
}

.menu-item-details p {
    margin: 5px 0;
    font-size: 1em;
    color: #555;
}

.menu-item-actions {
    display: flex;
    justify-content: space-around;
    padding: 15px;
    background-color: #f9f9f9;
    border-top: 1px solid #eee;
}

.edit-button, .delete-button {
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.edit-button {
    background-color: #007bff;
    color: white;
}

.edit-button:hover {
    background-color: #0056b3;
}

.delete-button {
    background-color: #dc3545;
    color: white;
}

.delete-button:hover {
    background-color: #c82333;
}
body, ul, li {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

nav {
    background-color: #333;
    padding: 10px 20px;
}

nav ul {
    list-style: none;
    display: flex;
    justify-content: space-around;
}

nav ul li {
    flex: 1;
    text-align: center;
}

nav ul li a {
    color: white;
    text-decoration: none;
    font-size: 1.2em;
    display: block;
    padding: 10px 0;
}

nav ul li a:hover {
    background-color: #555;
    color: #ddd;
}

.welcome-message {
    text-align: center;
    font-size: 2em;
    margin: 20px 0;
}

.form-container {
    display: none;
    margin: 20px auto;
    padding: 40px 50px;
    width: 400px;
    border: 1px solid #e0e0e0;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
    font-family: 'Arial', sans-serif;
}

.form-container label {
    text-align: left;
    margin-bottom: 8px;
    display: block;
    font-weight: 500;
    color: #333333;
    font-size: 14px;
}

.form-container input, .form-container select {
    margin-bottom: 15px;
    width: 100%;
    padding: 12px;
    border-radius: 8px;
    border: 1px solid #cccccc;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    font-size: 14px;
    font-family: 'Arial', sans-serif;
    transition: border-color 0.3s;
}

/* All button styling changed to green */
button, .action-button {
    background-color: #28a745;
    color: #ffffff;
    border: none;
    padding: 12px 24px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 15px;
    font-weight: bold;
    font-family: 'Arial', sans-serif;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    transition: background-color 0.3s, box-shadow 0.3s;
}

button:hover, .action-button:hover {
    background-color: #218838;
    box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
}
</style>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="#" onclick="showHome()">🏠 Home</a></li>
                <li><a href="#" onclick="showAddMenu()">➕ Add Menu</a></li>
                <li><a href="#" onclick="showEditMenu()">➖ Edit Menu</a></li>
                <li><a href="#" onclick="showEditProfile()">✏️ Edit Profile</a></li>
                <li><a href="Login.jsp">➡️ Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="welcome-message">Welcome to the Restaurant Management Dashboard!</div>

    <!-- Add Menu Section -->
    <div id="addMenu" class="form-container">
        <h2>Add Menu Item</h2>
        <% 
        Restaurant r = (Restaurant) request.getAttribute("rest");
        if (r != null) {
        %>
        <form action="AddMenuItemServlet">
            <label for="menuName">Menu Name:</label> 
            <input type="text" id="menuName" name="menuName"  required>
            <label for="menuPrice">Price:</label> 
            <input type="number" id="menuPrice" name="menuPrice" required >
            <label for="menuDescription">Description:</label>
            <input type="text" id="menuDescription" name="menuDescription"  required>
            <label for="menuImagePath">ImagePath:</label>
            <input type="text" id="menuImagePath" name="menuImagePath"  required>
            <label for="menuisAvailable">isAvailable:</label> 
            <input type="text" id="menuisAvailable" name="menuisAvailable" required>
            <label for="menurestaurantId">restaurantId:</label>
            <input type="number" id="menurestaurantId" name="menurestaurantId" value="<%=r.getRestaurantId() %>" readonly>
            <label for="menuRating">Rating:</label>
            <input type="number" id="menuRating" name="menuRating" required>
            <button type="submit">Add Menu Item</button>
        </form>
        <% 
            } 
        else { 
        %>
        <p>No menu available.</p>
        <% 
            } 
        %>
    </div>

    <!-- Remove Menu Section -->
    <div id="editMenu" class="form-container">
        <h2>Edit Menu Item</h2>
        <%
        Menu mm = (Menu) request.getAttribute("menu");
        if (mm != null) {
        %>
        <form>
            <label for="menuName">Menu Name:</label> 
            <input type="text" id="menuName" name="menuName" value="<%= mm.getName()%>">
            <label for="menuPrice">Price:</label> 
            <input type="number" id="menuPrice" name="menuPrice" value="<%= mm.getPrice()%>">
            <label for="menuDescription">Description:</label>
            <input type="text" id="menuDescription" name="menuDescription" value="<%= mm.getDescription()%>">
            <label for="menuisAvailable">isAvailable:</label> 
            <input type="text" id="menuisAvailable" name="menuisAvailable" value="<%= mm.getAvailable()%>">
            <label for="menuRating">Rating:</label>
            <input type="number" id="menuRating" name="menuRating" value="<%= mm.getRating()%>">
            <button type="submit">Edit Menu Item</button>
        </form>
          <% 
            } 
        else { 
        %>
        <p>No menu available.</p>
        <% 
            } 
        %>
    </div>

<!-- Menu Items Display Section -->
        <div id="editProfile" class="form-container">
        <h2>Edit Profile</h2>
        <form>
        <% 
        Restaurant rrr = (Restaurant) request.getAttribute("rest");
        if(rrr!=null)
        {
        %>
            <label for="restaurantName">Restaurant Name:</label> 
            <input type="text" id="restaurantName" name="restaurantName" value="<%= rrr.getName() %>">
            <label for="restaurantRating">Rating:</label> 
            <input type="number" id="restaurantRating" name="restaurantRating" value="<%= rrr.getRating()%>" >
            <label for="restaurantPhone">ETA:</label> 
            <input type="text" id="restaurantPhone" name="restaurantPhone" value="<%= rrr.getEta()%>">
            <label for="restaurantCuisineType">Cuisine Type:</label> 
            <input type="text" id="restaurantCuisineType" name="restaurantCuisineType" value="<%= rrr.getCuisineType() %>">
            <label for="restaurantAddress">Address:</label> 
            <input type="text" id="restaurantAddress" name="restaurantAddress" value="<%= rrr.getAddress()%>" >
            <label for="restaurantisActive">isActive:</label> 
            <input type="text" id="restaurantisActive" name="restaurantisActive" value="<%= rrr.getIsActive()%>">
            <button type="submit">Update Profile</button>
        </form>
            <% 
            } 
        else { 
        %>
        <p>No menu available.</p>
        <% 
            } 
        %>
    </div>

    <!-- Menu Items Display Section -->
    <div id="menuItemsList" class="menu-items-container">
        <% 
            List<Menu> menuItems = (List<Menu>) request.getAttribute("Menus");
            if (menuItems != null) {
                for (Menu menuItem : menuItems) {
        %>
        <div class="menu-item-card">
            <img src="<%= menuItem.getImagePath() %>" alt="Menu Item Image" class="menu-item-image">
            <div class="menu-item-details">
                <h3><%= menuItem.getName() %></h3>
                <p><strong>Description:</strong> <%= menuItem.getDescription() %></p>
                <p><strong>Price:</strong> $<%= menuItem.getPrice() %></p>
                <p><strong>Available:</strong> <%= menuItem.getAvailable() %></p>
            </div>
            <div class="menu-item-actions">
                <a href="EditMenuItemServlet?id=<%= menuItem.getMenuId() %>"><button class="edit-button">Edit</button></a>
                <a href="DeleteMenuItemServlet?id=<%= menuItem.getMenuId() %>"><button class="delete-button">Delete</button></a>
            </div>
        </div>
        <% 
                }
            } else { 
        %>
        <p>No menu items available.</p>
        <% 
            } 
        %>
    </div>

    <script>
        // Show Home and Menu Items by Default
        function showHome() {
            hideAllSections();
            document.querySelector(".welcome-message").style.display = "block";
            document.getElementById("menuItemsList").style.display = "flex"; // Show menu items
        }

        function showAddMenu() {
            hideAllSections();
            document.getElementById("addMenu").style.display = "block";
        }

        function showEditMenu() {
            hideAllSections();
            document.getElementById("editMenu").style.display = "block";
        }

        function showEditProfile() {
            hideAllSections();
            document.getElementById("editProfile").style.display = "block";
        }

        function hideAllSections() {
            document.getElementById("menuItemsList").style.display = "none";
            document.getElementById("addMenu").style.display = "none";
            document.getElementById("editMenu").style.display = "none";
            document.getElementById("editProfile").style.display = "none";
            document.querySelector(".welcome-message").style.display = "none";
        }

        // Call showHome() on page load to display menu items
        window.onload = function() {
            showHome();
        }
    </script>
</body>
</html>
