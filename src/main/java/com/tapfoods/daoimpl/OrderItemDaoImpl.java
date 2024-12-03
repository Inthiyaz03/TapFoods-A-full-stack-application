package com.tapfoods.daoimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tapfoods.dao.OrderItemDao;
import com.tapfoods.model.OrderItem;

public class OrderItemDaoImpl implements OrderItemDao {

	private static Connection connection = null;

	// SQL Queries
	static final String INSERT_QUERY = "INSERT INTO `orderitem`( `userId`,`restaurantId`, `menuId`, `itemName`, `quantity`, `price`,`totalAmount`,`orderId`)VALUES(?,?,?,?,?,?,?,?)";
	static final String SELECT_QUERY = "SELECT * FROM `orderitem` WHERE `orderItemId`=?";
	static final String SELECT_BY_ORDERID_QUERY = "SELECT * FROM `orderitem` WHERE `orderId`=?";
	static final String SELECT_ALL_QUERY = "SELECT * FROM `orderitem`";
	static final String UPDATE_QUERY = "UPDATE `orderitem` set `userId`=?,`restaurantId`=?, `menuId`=?, `itemName`=?, `quantity`=?, `price`=?, `totalAmount`=? WHERE `orderItemId`=?";
	static final String DELETE_QUERY = "DELETE FROM `orderitem` WHERE `orderItemId`=?";
	static final String SELECT_ALL_QUERY_BY_USERID = "SELECT * FROM `orderitem` Where `userId`=?";

	public OrderItemDaoImpl() {
		// when we call constructor or create object these things will happen
		String url = "jdbc:mysql://localhost:3306/zaika";
		String username = "root";
		String password = "root";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(url, username, password);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void addOrderItem(OrderItem orderItem) {
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(INSERT_QUERY);

			prepareStatement.setInt(1, orderItem.getUserId());
			prepareStatement.setInt(2, orderItem.getRestaurantId());
			prepareStatement.setInt(3, orderItem.getMenuId());
			prepareStatement.setString(4, orderItem.getItemName());
			prepareStatement.setInt(5, orderItem.getQuantity());
			prepareStatement.setDouble(6, orderItem.getPrice());
			prepareStatement.setDouble(7, orderItem.getTotalAmount());
			prepareStatement.setInt(8, orderItem.getOrderId());
			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepareStatement != null)
				try {
					prepareStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	@Override
	public OrderItem getOrderItem(int orderItemId) {
		PreparedStatement prepareStatement = null;
		ResultSet res = null;
		OrderItem orderItem = null;

		try {
			prepareStatement = connection.prepareStatement(SELECT_QUERY);
			prepareStatement.setInt(1, orderItemId);

			res = prepareStatement.executeQuery();

			if (res.next()) {
				int userId = res.getInt("userId");
				int restaurantId = res.getInt("restaurantId");
				int menuId = res.getInt("menuId");
				String itemName = res.getString("itemName");
				int quantity = res.getInt("quantity");
				double price = res.getDouble("price");
				double totalAmount = res.getDouble("totalAmount");
				orderItem = new OrderItem(userId, restaurantId, menuId, itemName, quantity, price,
						totalAmount);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepareStatement != null)
				try {
					prepareStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return orderItem;
	}

	@Override
	public List<OrderItem> getAllByOrderId(int orderId) {
		 PreparedStatement prepareStatement = null;
		ResultSet res = null;
		OrderItem orderItem = null;
		ArrayList<OrderItem> OrderItemsList = new ArrayList<OrderItem>();
		
		try {
			prepareStatement = connection.prepareStatement(SELECT_BY_ORDERID_QUERY);
			prepareStatement.setInt(1, orderId);
			
			res = prepareStatement.executeQuery();
			while (res.next()) {
				int orderItemId = res.getInt("orderItemId");
				int userId = res.getInt("userId");
				int restaurantId = res.getInt("restaurantId");
				int menuId = res.getInt("menuId");
				String itemName = res.getString("itemName");
				int quantity = res.getInt("quantity");
				double price = res.getDouble("price");
				double totalAmount = res.getDouble("totalAmount");
				
				orderItem = new OrderItem(orderItemId, userId, restaurantId, menuId, itemName, quantity, price,
						totalAmount);
				OrderItemsList.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return OrderItemsList;
	}
	@Override
	public List<OrderItem> getAll() {
		Statement createStatement = null;
		ResultSet res = null;
		OrderItem orderItem = null;
		ArrayList<OrderItem> OrderItemsList = new ArrayList<OrderItem>();

		try {
			createStatement = connection.createStatement();

			res = createStatement.executeQuery(SELECT_ALL_QUERY);
			while (res.next()) {
				int orderItemId = res.getInt("orderItemId");
				int userId = res.getInt("userId");
				int restaurantId = res.getInt("restaurantId");
				int menuId = res.getInt("menuId");
				String itemName = res.getString("itemName");
				int quantity = res.getInt("quantity");
				double price = res.getDouble("price");
				double totalAmount = res.getDouble("totalAmount");

				orderItem = new OrderItem(orderItemId, userId, restaurantId, menuId, itemName, quantity, price,
						totalAmount);
				OrderItemsList.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (createStatement != null)
				try {
					createStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
		return OrderItemsList;
	}

	@Override
	public void UpdateOrderItem(OrderItem orderItem) {
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(UPDATE_QUERY);

			prepareStatement.setInt(1, orderItem.getUserId());
			prepareStatement.setInt(2, orderItem.getRestaurantId());
			prepareStatement.setInt(3, orderItem.getMenuId());
			prepareStatement.setString(4, orderItem.getItemName());
 
			prepareStatement.setInt(5, orderItem.getQuantity());
			prepareStatement.setDouble(6, orderItem.getPrice());
			prepareStatement.setDouble(7, orderItem.getTotalAmount());

			prepareStatement.setInt(8, orderItem.getOrderItemId());

			prepareStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepareStatement != null)
				try {
					prepareStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		PreparedStatement prepareStatement = null;
		try {
			prepareStatement = connection.prepareStatement(DELETE_QUERY);
			prepareStatement.setInt(1, orderItemId);

			prepareStatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepareStatement != null)
				try {
					prepareStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

	}

	@Override
	public List<OrderItem> getAllOrderItemsByUserId(int userid) {
		PreparedStatement prepareStatement = null;
		ResultSet res = null;
		OrderItem orderItem = null;
		ArrayList<OrderItem> OrderItemsList = new ArrayList<OrderItem>();

		try {
			prepareStatement = connection.prepareStatement(SELECT_ALL_QUERY_BY_USERID);
			prepareStatement.setInt(1, userid);

			res = prepareStatement.executeQuery();

			while (res.next()) {
				int orderItemId = res.getInt("orderItemId");
				int userId = res.getInt("userId");
				int restaurantId = res.getInt("restaurantId");
				int menuId = res.getInt("menuId");
				String itemName = res.getString("itemName");
				int quantity = res.getInt("quantity");
				double price = res.getDouble("price");
				double totalAmount = res.getDouble("totalAmount");

				orderItem = new OrderItem(orderItemId, userId, restaurantId, menuId, itemName, quantity, price,
						totalAmount);
				OrderItemsList.add(orderItem);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (prepareStatement != null)
				try {
					prepareStatement.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return OrderItemsList;
	}

}