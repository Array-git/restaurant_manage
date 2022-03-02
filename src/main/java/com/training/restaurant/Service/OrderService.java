package com.training.restaurant.Service;

import com.training.restaurant.Repository.*;
import com.training.restaurant.entity.Desk;
import com.training.restaurant.entity.Orders;
import com.training.restaurant.entity.Receipt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {
    @Autowired
    private OrdersRepository ordersRepository;
    @Autowired
    private DeskRepository deskRepository;
    @Autowired
    private MenuService menuService;
    @Autowired
    private ReceiptService receiptService;


    public List<Desk> findAllDesk() {
        return (List<Desk>) deskRepository.findAll();
    }

    public Desk findDeskById(int deskId) {
        return deskRepository.findById(deskId).get();
    }

    public List<Receipt> deleteReceipt(Receipt receipt) {
        int orderId = receipt.getOrder().getId();
        Orders orders = ordersRepository.findById(orderId).get();
        receiptService.delete(receipt);
        List<Receipt> receipts = receiptService.findReceiptsByOrder_id(orderId);
        if(receipts.size()==0){
            ordersRepository.deleteById(orderId);
        }
        return receipts;
    }

    public Orders createOrder(Map<String, String> form, int deskId) {
        Orders orders = new Orders();
        Desk desk = deskRepository.findById(deskId).get();
        orders.setDesk_id(desk);
        orders.setDataOpen(new Date());
        ordersRepository.save(orders);
        receiptService.addItemsInOrder(form, orders);
        return orders;
    }

    public List<Orders> findOpenOrders() {
        List<Orders> openOrders = ordersRepository.findOrdersByDataOpenNotNullAndDataCloseNull();
        return openOrders;
    }

    public List<Desk> findFreeDesk() {
        List<Desk> desksWithOrders = new ArrayList<>();
        List<Desk> allDesk = (List<Desk>) deskRepository.findAll();
        for (Orders order: ordersRepository.findOrdersByDataOpenNotNullAndDataCloseNull()) {
            desksWithOrders.add(order.getDesk_id());
        }
        allDesk.removeAll(desksWithOrders);
        return allDesk;
    }

    public List<Receipt> getReceipts(Orders order) {
        return receiptService.findReceiptsByOrder_id(order.getId());
    }

    public void closeOrder(Orders order) {
        order.setDataClose(new Date());
        ordersRepository.save(order);
    }
}
