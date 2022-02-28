package com.training.restaurant.Controller;

import com.training.restaurant.Repository.*;
import com.training.restaurant.Service.OrderService;
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
    private MenuRepository menuRepository;
    @Autowired
    private MenuTypeRepository menuTypeRepository;
    @Autowired
    private ReceiptRepository receiptRepository;

    @RequestMapping("/desk")
    public String getDesk(Model model){
        model.addAttribute("desks", orderService.findAll());
        return "desk";
    }

    @GetMapping("/selectDesk")
    public String createOrder(@RequestParam("deskId") int deskId, Model model){
        Desk desk = orderService.findDeskById(deskId);
        model.addAttribute("desk", desk);
        model.addAttribute("menuTypes", menuTypeRepository.findAll());
        return "createOrder";
    }

/*    @RequestMapping("/deleteOrders")
    public String deleteOrder(@ModelAttribute("orders") Orders orders, @RequestParam("ordersId") int id){
        ordersRepository.deleteById(id);
        return "redirect:desk";
    }*/

    @RequestMapping("/createOrder")
    public String createOrder(Model model
            , @RequestParam Map<String, String> form, @RequestParam("deskId") int deskId){
        //Orders order = ordersRepository.findById(orderId).get();
        System.out.println(deskId);
        Orders orders = new Orders();
        orders.setDesk_id(orderService.findDeskById(deskId));
        orderService.save(orders);
        System.out.println(orders.getId() +" - " + orders.getDesk_id().getId());
        List<Receipt> receipts = new ArrayList<>();
        form.remove("deskId");
        form.remove("_csrf");
        int count = 0;
        for (Map.Entry entry: form.entrySet()){
            int item_id = Integer.parseInt((String) (entry.getKey()));
            try {
                count = Integer.parseInt(entry.getValue().toString());
            }
            catch (Exception e){
                System.out.println("Не удалось перевести в число");
            }
            if(count>0){
                Receipt receipt = new Receipt();
                receipt.setCount(count);
                receipt.setOrder(orders);
                receipt.setItem_id(menuRepository.findById(item_id).get());
                receipts.add(receipt);
                receiptRepository.save(receipt);
            }
        }
        model.addAttribute("receipts", receipts);
        return "confirm";
    }

    @RequestMapping("/confirmOrder")
    public String confirmOrder(@ModelAttribute("testMenuType") Receipt receipts, @RequestParam("count") int count
            ,@RequestParam("typeId") int typeId, @RequestParam("orderId") int orderId, @RequestParam("receiptId") int receiptId
            , Model model){
        System.out.println(count);
        System.out.println(typeId);
        System.out.println(orderId);
        Receipt receipt = receiptRepository.findById(receiptId).get();
        receipt.setCount(count);
        receiptRepository.save(receipt);

        model.addAttribute("orderId",orderId);
        /*for(Receipt receipt : receipts){
            String value = request.getParameter("" + receipt.getId());
            //do some processing with value
        }*/
        return "redirect:createOrder";
    }

    @RequestMapping("/deletereceipt")
    public String deleteReceipt(@RequestParam("receiptId") Receipt receipt, @RequestParam("order_id") int orderId, Model model){
        orderService.deleteReceipt(orderId, receipt);
        Orders orders = orderService.findOrderById(orderId);
        receiptRepository.delete(receipt);
        List<Receipt> receipts = receiptRepository.findReceiptsByOrder_id(orderId);
        if(receipts.size()==0){
            orderService.deleteOrderById(orderId);
        }
        model.addAttribute("receipts", receipts);
        return "confirm";
    }
}
