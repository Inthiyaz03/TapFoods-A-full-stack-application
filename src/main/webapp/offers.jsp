<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Exclusive Offers</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f1f5f9;
            margin: 0;
            padding: 0;
            color: #222;
        }

        .container {
            width: 85%;
            margin: 30px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }

        h1 {
            text-align: center;
            color: #d7263d;
            font-size: 2.5em;
            margin-top: 10px;
            padding-bottom: 10px;
            border-bottom: 2px solid #d7263d;
        }

        .offer {
            display: flex;
            align-items: center;
            background-color: #fdf1f1;
            margin: 20px 0;
            padding: 15px;
            border-radius: 10px;
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            position: relative;
        }

        .offer:hover {
            transform: scale(1.03);
        }

        .emoji {
            font-size: 2.5em;
            margin-right: 20px;
        }

        .details {
            flex: 1;
            padding-left: 10px;
        }

        .offer-title {
            font-size: 1.5em;
            color: #ff6b6b;
            margin: 0;
            font-weight: bold;
        }

        .offer-description {
            color: #666;
            font-style: italic;
            margin: 5px 0;
        }

        .discount, .validity {
            color: #333;
            margin: 3px 0;
        }

        .discount {
            font-weight: bold;
            color: #38b000;
        }

        .image-container {
            width: 100px;
            height: 100px;
            margin-right: 15px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .image-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .offer {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .image-container {
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h1>🎉 Exclusive Offers Just for You! 🎉</h1>

    <!-- Offer 1 -->
    <div class="offer">
        <div class="image-container">
            <img src="Images/Weekend Feast.jpeg" alt="Weekend Feast">
        </div>
        <div class="emoji">🍕</div>
        <div class="details">
            <div class="offer-title">Weekend Feast</div>
            <div class="offer-description">Savor a 25% discount on all orders above $50 every weekend!</div>
            <div class="discount">Discount: 25% Off</div>
            <div class="validity">Validity: Saturday & Sunday</div>
        </div>
    </div>

    <!-- Offer 2 -->
    <div class="offer">
        <div class="image-container">
            <img src="Images/Lunch Combo.jpeg" alt="Lunch Combo">
        </div>
        <div class="emoji">🥪</div>
        <div class="details">
            <div class="offer-title">Lunch Combo</div>
            <div class="offer-description">Grab a sandwich combo with drink and dessert for just $15!</div>
            <div class="discount">Special Price: $15</div>
            <div class="validity">Validity: Weekdays, 12 PM - 3 PM</div>
        </div>
    </div>

    <!-- Offer 3 -->
    <div class="offer">
        <div class="image-container">
            <img src="Images/Family Feast.jpeg" alt="Family Feast">
        </div>
        <div class="emoji">🍱</div>
        <div class="details">
            <div class="offer-title">Family Feast</div>
            <div class="offer-description">Order a family meal and get a free dessert platter.</div>
            <div class="discount">Free Dessert</div>
            <div class="validity">All days</div>
        </div>
    </div>

    <!-- Offer 4 -->
    <div class="offer">
        <div class="image-container">
            <img src="Images/First Order Gift.jpeg" alt="First Order Gift">
        </div>
        <div class="emoji">🎁</div>
        <div class="details">
            <div class="offer-title">First Order Gift</div>
            <div class="offer-description">Sign up today and enjoy 30% off on your first order.</div>
            <div class="discount">Discount: 30% Off</div>
            <div class="validity">One-time offer</div>
        </div>
    </div>

    <!-- Offer 5 -->
    <div class="offer">
        <div class="image-container">
            <img src="Images/Festival Bonanza.jpeg" alt="Festival Bonanza">
        </div>
        <div class="emoji">🌟</div>
        <div class="details">
            <div class="offer-title">Festival Bonanza</div>
            <div class="offer-description">Celebrate with a 35% discount on all items during the festive season.</div>
            <div class="discount">Discount: 35% Off</div>
            <div class="validity">Valid until New Year's Day</div>
        </div>
    </div>

    <!-- Offer 6 -->
    <div class="offer">
        <div class="image-container">
            <img src="Images/Happy Hours.png" alt="Happy Hours">
        </div>
        <div class="emoji">⏰</div>
        <div class="details">
            <div class="offer-title">Happy Hours</div>
            <div class="offer-description">Enjoy 20% off on all orders placed from 4 PM to 6 PM daily.</div>
            <div class="discount">Discount: 20% Off</div>
            <div class="validity">Daily, 4 PM - 6 PM</div>
        </div>
    </div>
</div>

</body>
</html>
