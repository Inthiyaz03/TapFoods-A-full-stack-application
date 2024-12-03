<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Order Confirmed</title>
<style>
    :root {
        --primary: #ff6b3d;
        --primary-light: #ff8b6b;
        --primary-dark: #e65a2d;
        --success: #4CAF50;
        --background: #fff5f0;
        --surface: #ffffff;
        --text: #2d3436;
    }

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: 'Segoe UI', system-ui, sans-serif;
        background: var(--background);
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .container {
        background: var(--surface);
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        text-align: center;
        max-width: 450px;
        width: 100%;
    }

    .success-checkmark {
        width: 80px;
        height: 80px;
        margin: 0 auto 30px;
        border-radius: 50%;
        background: var(--success);
        display: flex;
        align-items: center;
        justify-content: center;
        animation: scaleIn 0.5s ease-in-out;
    }

    .success-checkmark svg {
        width: 40px;
        height: 40px;
        fill: white;
    }

    @keyframes scaleIn {
        from {
            transform: scale(0);
        }
        to {
            transform: scale(1);
        }
    }

    h2 {
        color: var(--text);
        font-size: 28px;
        margin-bottom: 15px;
        font-weight: 600;
    }

    p {
        color: #666;
        font-size: 18px;
        line-height: 1.6;
        margin-bottom: 30px;
    }

    .track-btn {
        background: linear-gradient(to right, var(--primary), var(--primary-dark));
        color: white;
        text-decoration: none;
        padding: 15px 35px;
        border-radius: 50px;
        font-size: 16px;
        font-weight: 500;
        display: inline-block;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(255, 107, 61, 0.3);
    }

    .track-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(255, 107, 61, 0.4);
        background: linear-gradient(to right, var(--primary-dark), var(--primary));
    }

    .order-animation {
        margin-top: 20px;
        opacity: 0.6;
    }

    @media (max-width: 480px) {
        .container {
            padding: 30px 20px;
        }

        h2 {
            font-size: 24px;
        }

        p {
            font-size: 16px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="success-checkmark">
            <svg viewBox="0 0 24 24">
                <path d="M9 16.17L4.83 12l-1.42 1.41L9 19 21 7l-1.41-1.41L9 16.17z"/>
            </svg>
        </div>
        
        <h2>Order Confirmed!</h2>
        <p>Your delicious food is being prepared and will be delivered soon. Get ready for a tasty meal!</p>
        
        <a href="Trackorder.jsp" class="track-btn">
            Track Your Order
        </a>
    </div>
</body>
</html>