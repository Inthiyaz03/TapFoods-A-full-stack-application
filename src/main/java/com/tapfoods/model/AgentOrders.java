package com.tapfoods.model;

import java.util.HashMap;
import java.util.Map;

public class AgentOrders {
    private Map<Integer, DeliveryAgentOrders> orders;

    public AgentOrders() {
        this.orders = new HashMap<>();
    }

    public void addOrder(DeliveryAgentOrders newOrder) {
        if (newOrder != null) {
            int orderId = newOrder.getOrderId();
            orders.put(orderId, newOrder);
        } else {
            System.out.println("Cannot add null order.");
        }
    }

    public Map<Integer, DeliveryAgentOrders> getOrders() {
        return new HashMap<>(orders);
    }

    public void clear() {
        orders.clear();
    }
}
