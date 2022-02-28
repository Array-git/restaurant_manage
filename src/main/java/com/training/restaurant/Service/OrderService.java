package com.training.restaurant.Service;

import com.training.restaurant.Repository.*;
import com.training.restaurant.entity.Desk;
import com.training.restaurant.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    private OrdersRepository ordersRepository;
    @Autowired
    private DeskRepository deskRepository;


    public List<Desk> findAll() {
        return (List<Desk>) deskRepository.findAll();
    }

    public Desk findDeskById(int deskId) {
        return deskRepository.findById(deskId).get();
    }

    public void save(Orders orders) {
        ordersRepository.save(orders);
    }

    public Orders findOrderById(int orderId) {
        return ordersRepository.findById(orderId).get();
    }

    public void deleteOrderById(int orderId) {
        ordersRepository.deleteById(orderId);
    }
}
