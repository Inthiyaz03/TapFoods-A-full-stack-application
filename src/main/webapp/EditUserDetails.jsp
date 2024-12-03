<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tapfoods.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Profile | Tap Foods</title>
<link rel="icon" href="http://localhost:8080/tapfoods/Images/icon.png">
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: #f4f4f9;
    display: flex;
    justify-content: center;
    margin-top: 75px;
}

.box {
    height: auto;
    width: 400px;
    background: white;
    border-radius: 20px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    padding: 30px;
    transition: transform 0.3s ease;
}

.box:hover {
    transform: translateY(-5px);
}

.signup h1 {
    font-size: 28px;
    color: #333;
    text-align: center;
    margin-bottom: 25px;
    position: relative;
}

.signup h1:after {
    content: '';
    display: block;
    width: 60px;
    height: 3px;
    background: #fca311;
    margin: 10px auto;
}

.inputbox1, .inputbox2, .inputbox3, .inputbox4, .inputbox5 {
    position: relative;
    margin-bottom: 25px;
}

input[type="text"], 
input[type="email"], 
input[type="tel"] {
    width: 100%;
    padding: 12px 15px;
    border: 2px solid #e0e0e0;
    border-radius: 8px;
    font-size: 16px;
    transition: all 0.3s ease;
    background: #fff;
}

input:focus {
    border-color: #fca311;
    box-shadow: 0 0 0 3px rgba(252, 163, 17, 0.2);
    outline: none;
}

label {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    background: white;
    padding: 0 5px;
    color: #666;
    font-size: 14px;
    transition: all 0.3s ease;
}

input:focus ~ label,
input:valid ~ label {
    top: 0;
    font-size: 12px;
    color: #fca311;
}

.submit {
    margin-top: 20px;
}

.submit input {
    width: 100%;
    padding: 12px;
    background: #fca311;
    color: white;
    border: none;
    border-radius: 8px;
    font-size: 16px;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.3s ease;
}

.submit input:hover {
    background: #e69100;
    transform: translateY(-2px);
}

.login {
    text-align: center;
    margin-top: 20px;
}

.login a {
    color: #fca311;
    text-decoration: none;
    font-weight: 500;
    transition: color 0.3s ease;
}

.login a:hover {
    color: #e69100;
}

.error-message {
    color: #dc3545;
    font-size: 12px;
    margin-top: 5px;
    display: block;
}

.success-message {
    color: #28a745;
}
</style>
</head>
<body>
    <div class="box">
        <%
        User user = (User) session.getAttribute("user");
        %>
        <div class="signup">
            <h1><%=user.getName()%>'s Profile</h1>
        </div>
        <div class="form">
            <form action="udateuserdetails" method="post" onsubmit="return validateForm()">
                <div class="inputbox1">
                    <input type="text" id="name" name="name" required value="<%=user.getName()%>">
                    <label for="name">Name</label>
                    <span id="name-error" class="error-message"></span>
                </div>

                <div class="inputbox2">
                    <input type="text" id="userName" name="userName" required value="<%=user.getUserName()%>">
                    <label for="userName">Username</label>
                    <span id="username-error" class="error-message"></span>
                </div>

                <div class="inputbox3">
                    <input type="email" id="email" name="email" required value="<%=user.getEmail()%>">
                    <label for="email">Email</label>
                    <span id="email-error" class="error-message"></span>
                </div>

                <div class="inputbox4">
                    <input type="tel" id="phoneNo" name="phoneNo" required value="<%=user.getPhoneNo()%>">
                    <label for="phoneNo">Phone Number</label>
                    <span id="phoneNo-error" class="error-message"></span>
                </div>

                <div class="inputbox5">
                    <input type="text" id="address" name="address" required 
                           value="<%=user.getAddress() != null ? user.getAddress() : ""%>">
                    <label for="address">Address</label>
                    <span id="address-error" class="error-message"></span>
                </div>

                <div class="submit">
                    <input type="submit" value="Update Profile">
                </div>

                <div class="login">
                    <h4>
                        <a href="javascript:history.back()">← Back to Previous Page</a>
                    </h4>
                </div>
            </form>
        </div>
    </div>

    <script>
        function validateForm() {
            let isValid = true;
            
            // Name validation
            const name = document.getElementById('name').value.trim();
            if (!/^[A-Za-z\s]{3,}$/.test(name)) {
                document.getElementById('name-error').textContent = 'Please enter a valid name (minimum 3 letters)';
                isValid = false;
            } else {
                document.getElementById('name-error').textContent = '';
            }

            // Username validation
            const userName = document.getElementById('userName').value.trim();
            if (!/^[a-zA-Z][a-zA-Z0-9_]{2,}$/.test(userName)) {
                document.getElementById('username-error').textContent = 'Username must start with a letter';
                isValid = false;
            } else {
                document.getElementById('username-error').textContent = '';
            }

            // Email validation
            const email = document.getElementById('email').value.trim();
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                document.getElementById('email-error').textContent = 'Please enter a valid email';
                isValid = false;
            } else {
                document.getElementById('email-error').textContent = '';
            }

            // Phone validation
            const phoneNo = document.getElementById('phoneNo').value.trim();
            if (!/^[6-9][0-9]{9}$/.test(phoneNo)) {
                document.getElementById('phoneNo-error').textContent = 'Please enter a valid 10-digit phone number';
                isValid = false;
            } else {
                document.getElementById('phoneNo-error').textContent = '';
            }

            // Address validation
            const address = document.getElementById('address').value.trim();
            if (address.length < 5) {
                document.getElementById('address-error').textContent = 'Please enter a valid address';
                isValid = false;
            } else {
                document.getElementById('address-error').textContent = '';
            }

            return isValid;
        }
    </script>
</body>
</html>