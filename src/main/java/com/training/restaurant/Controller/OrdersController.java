package com.training.restaurant.Controller;

import com.training.restaurant.Repository.*;
import com.training.restaurant.Service.OrderService;
import com.training.restaurant.Service.ReceiptService;
import com.training.restaurant.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.cassandra.CassandraProperties;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
public class OrdersController {
    @Autowired
    private OrderService orderService;
    @Autowired
    private ReceiptService receiptService;
    @Autowired
    private MenuTypeRepository menuTypeRepository;
    @Autowired
    private MenuRepository menuRepository;

    @RequestMapping("/desk")
    public String getDesk(Model model){
        model.addAttribute("openOrders", orderService.findOpenOrders());
        model.addAttribute("freeDesks", orderService.findFreeDesk());
        return "desk";
    }

    @GetMapping("/createOrder")
    public String createOrder(@RequestParam("deskId") int deskId, Model model){
        model.addAttribute("desk", orderService.findDeskById(deskId));
        model.addAttribute("menuTypes", menuTypeRepository.findAll());
        return "createOrder";
    }

    @RequestMapping("/confirm")
    public String createOrder(@RequestParam Map<String, String> form, @RequestParam("deskId") int deskId){
        Orders order = orderService.createOrder(form, deskId);
        return "redirect:listOrder?orderId="+order.getId();
    }

    @RequestMapping("/deletereceipt")
    public String deleteReceipt(@RequestParam("receiptId") Receipt receipt, Model model){
        List<Receipt> receipts = orderService.deleteReceipt(receipt);
        if(receipts.isEmpty()){
            return "redirect:desk";
        }
        model.addAttribute("receipts", receipts);
        return "confirm";
    }

    @PostMapping("/editOrder")
    public String editOrder(@RequestParam int count, @RequestParam("receiptId") Receipt receipt, Model model){
        receipt.setCount(count);
        receiptService.save(receipt);
        model.addAttribute("receipts", receiptService.findReceiptsByOrder_id(receipt.getOrder().getId()));
        return "confirm";
    }

    @GetMapping("/listOrder")
    public String listOrder(@RequestParam("orderId") Orders order, Model model){
        model.addAttribute("order", order);
        model.addAttribute("receipts", orderService.getReceipts(order));
        return "listOrder";
    }

    @GetMapping("/closeOrder")
    public String closeOrder(@RequestParam("orderId") Orders order){
        orderService.closeOrder(order);
        return "redirect:desk";
    }

    @GetMapping("/editOrder")
    public String redirectForEditOrder(@RequestParam("orderId") Orders order, Model model){
        model.addAttribute("receipts", receiptService.findReceiptsByOrder_id(order.getId()));
        return "confirm";
    }

    @GetMapping("/addItemsInOrder")
    public String addItemsInOrder(Model model, @RequestParam("orderId") Orders order){
        model.addAttribute("orderId", order.getId());
        model.addAttribute("menuTypes", menuTypeRepository.findAll());
        return "additemsinorder";
    }

    @PostMapping("/addItems")
    public String addItemsInOrder(Model model, @RequestParam Map<String, String> form, @RequestParam("orderId") Orders order){
        receiptService.addItemsInOrder(form, order);
        return "redirect:listOrder?orderId="+order.getId();
    }
}
