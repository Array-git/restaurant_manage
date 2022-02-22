package com.training.restaurant.Controller;

import com.training.restaurant.Repository.DeskRepository;
import com.training.restaurant.Repository.MenuRepository;
import com.training.restaurant.Repository.MenuTypeRepository;
import com.training.restaurant.Repository.OrdersRepository;
import com.training.restaurant.entity.Desk;
import com.training.restaurant.entity.MenuItems;
import com.training.restaurant.entity.MenuType;
import com.training.restaurant.entity.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

    @RequestMapping("/selectDesk")
    public String createOrder(@RequestParam("deskId") int deskId, Model model){
        Desk desk = deskRepository.findById(deskId).get();
        Orders order = new Orders();
        order.setDesk_id(desk);
        ordersRepository.save(order);
        List<MenuItems> allMenu = (List<MenuItems>) menuRepository.findAll();
        model.addAttribute("menu", allMenu);
        allMenu.forEach(e -> System.out.println(e.getItem()));
        model.addAttribute("orders", order);

        model.addAttribute("menuTypes", menuTypeRepository.findAll());
        return "createOrder";
    }

    @RequestMapping("/deleteOrders")
    public String deleteOrder(@ModelAttribute("orders") Orders orders, @RequestParam("ordersId") int id){
        ordersRepository.deleteById(id);
        return "redirect:desk";
    }

    @RequestMapping("/createOrder")
    public String createOrder(@ModelAttribute("menuTypes") MenuType menuType){
        List<MenuItems> menuItems = menuType.getMenuItems();
        menuItems.forEach(e -> System.out.println(e.getItem()));
        return "redirect:desk";
    }
}
