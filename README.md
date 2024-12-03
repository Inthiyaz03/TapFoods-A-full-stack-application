# Tap Foods 🍔🍕🍱

**Tap Foods** is a full-stack web application designed to streamline the food delivery process. The platform offers a user-friendly interface for customers to browse menus, place orders, and manage their food delivery preferences.

## Features 🚀

- **User Authentication**: Secure login and registration system for customers.
- **Browse Menu**: Dynamic menu display with detailed food descriptions, images, and pricing.
- **Order Management**: Add items to the cart, customize orders, and track order status.
- **Admin Dashboard**: Manage menu items, view orders, and track delivery status.
- **Responsive Design**: Optimized for both desktop and mobile devices.
- **Real-time Updates**: Order tracking with status updates.

## Technologies Used 💻

### Frontend:
- **HTML5**: Structure and layout.
- **CSS3**: Styling and responsive design.
- **JavaScript (ES6+)**: Dynamic UI interactions.
- **Bootstrap**: Enhancing responsiveness and UI components.

### Backend:
- **Java (JSE, JEE)**: Backend logic and server-side scripting.
- **Spring MVC**: Framework for building web applications.
- **Hibernate**: ORM for database interactions.
- **JavaMail API**: For sending order confirmations and notifications.

### Database:
- **MySQL**: Storing user, order, and menu data.

## Installation and Setup ⚙️

### Prerequisites:
- **Java Development Kit (JDK)** (Version 11+)
- **Apache Tomcat** (Version 9+)
- **MySQL Server**
- **Maven** (For dependency management)

### Steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/tap-foods.git
   cd tap-foods
   ```

2. **Setup MySQL Database**:
   - Create a new database named `tap_foods`.
   - Run the SQL script provided in the `db` folder to set up the tables.

3. **Configure Application**:
   - Update the `application.properties` file in the `src/main/resources` folder with your database credentials:
     ```properties
     spring.datasource.url=jdbc:mysql://localhost:3306/tap_foods
     spring.datasource.username=yourUsername
     spring.datasource.password=yourPassword
     ```

4. **Build and Run the Application**:
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```

5. **Access the Application**:
   - Open your browser and go to `http://localhost:8080`.

## Project Structure 🗂️

```
tap-foods/
│
├── src/
│   ├── main/
│   │   ├── java/com/tapfoods/
│   │   │   ├── controller/
│   │   │   ├── model/
│   │   │   ├── repository/
│   │   │   ├── service/
│   │   │   └── TapFoodsApplication.java
│   │   ├── resources/
│   │   │   ├── static/ (CSS, JS, images)
│   │   │   ├── templates/ (HTML views)
│   │   │   └── application.properties
│   │   └── webapp/ (Web assets)
│   └── test/ (Test cases)
│
├── db/ (Database scripts)
│
├── README.md
├── pom.xml (Maven dependencies)
└── .gitignore
```

## Future Improvements 🌟

- **Automation**: Schedule daily offers and special discounts.
- **AI Integration**: Suggest popular dishes based on user preferences.
- **Payment Gateway**: Integration with secure payment systems.
- **Push Notifications**: Real-time updates for order status.

## Contribution 🤝

Contributions are welcome! Please fork the repository and submit a pull request for any enhancements or bug fixes.

## License 📜

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---
