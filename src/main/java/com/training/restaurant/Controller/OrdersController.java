package com.training.restaurant.Controller;

import com.training.restaurant.Repository.*;
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
    OrdersRepository ordersRepository;
    @Autowired
    private DeskRepository deskRepository;
    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private MenuTypeRepository menuTypeRepository;
    @Autowired
    private ReceiptRepository receiptRepository;


    @RequestMapping("/selectDesk")
    public String createOrder(@RequestParam("deskId") int deskId, Model model){
        Desk desk = deskRepository.findById(deskId).get();
        Orders order = new Orders();
        order.setDesk_id(desk);
        ordersRepository.save(order);
        model.addAttribute("orders", order);

        List<MenuItems> allMenu = (List<MenuItems>) menuRepository.findAll();
        model.addAttribute("menu", allMenu);
        allMenu.forEach(e -> System.out.println(e.getItem()));

        model.addAttribute("menuTypes", menuTypeRepository.findAll());
        /*Map<String,Integer> configParamsMap=new HashMap<String,Integer>();
        configParamsMap.put("Сырный бургер", 0);
        configParamsMap.put("Сырные сухарики", 0);
        configParamsMap.put("Борщ", 0);
        configParamsMap.put("Цезарь", 0);
        model.addAttribute("maps", configParamsMap);*/
        return "createOrder";
    }

    @RequestMapping("/deleteOrders")
    public String deleteOrder(@ModelAttribute("orders") Orders orders, @RequestParam("ordersId") int id){
        ordersRepository.deleteById(id);
        return "redirect:desk";
    }

    @RequestMapping("/createOrder")
    public String createOrder(@ModelAttribute("menuTypes") MenuType menuType, @RequestParam(value = "order",required = false) String[] listItemsId
            , @RequestParam("orderId") int orderId, Model model){
        System.out.println(orderId);
        Arrays.stream(listItemsId).forEach(System.out::println);
//        List<MenuItems> menuItems = menuType.getMenuItems();
        Orders order = ordersRepository.findById(orderId).get();
        List<Receipt> receipts = new ArrayList<>();
        if(listItemsId!=null){
            for (int i = 0; i < listItemsId.length; i++) {
                Integer itemId = Integer.parseInt(listItemsId[i]);
                Receipt receipt = new Receipt(menuRepository.findById(itemId).get(), ordersRepository.findById(orderId).get());
                receipts.add(receipt);
                receiptRepository.save(receipt);
            }
        }
        else {}

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
}
