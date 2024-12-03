package com.tapfoods.controller;

import java.util.List;

import com.tapfoods.daoimpl.OrderItemDaoImpl;
import com.tapfoods.daoimpl.RestaurantDaoImpl;
import com.tapfoods.model.OrderItem;
import com.tapfoods.model.Restaurant;

public class Demo {

	public static void main(String[] args) {
		OrderItemDaoImpl rest=new OrderItemDaoImpl();
		  List<OrderItem> al = rest.getAll();
		System.out.println(al);
	}

}
