package com.training.restaurant.Controller;

import com.training.restaurant.Repository.MenuRepository;
import com.training.restaurant.Repository.MenuTypeRepository;
import com.training.restaurant.entity.Desk;
import com.training.restaurant.entity.MenuItems;
import com.training.restaurant.entity.MenuType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class MenuController {
    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private MenuTypeRepository menuTypeRepository;

    @GetMapping("/editmenu")
    public String editMenu(Model model){
        MenuItems menuItems = new MenuItems();
        model.addAttribute("newItems", menuItems);

        Set<MenuType> menu = menuTypeRepository.findDistinctByTypeIsNotNull();
        List<String> types = menu.stream().map(MenuType::getType).collect(Collectors.toList());
        types.forEach(System.out::println);
        MenuType addedMenuType = new MenuType();
        model.addAttribute("newType", addedMenuType);
        model.addAttribute("types", types);
        model.addAttribute("menuItems", menuRepository.findAll());
        return "editmenu";
    }

    @RequestMapping("/saveItem")
    public String saveItemWithType(@ModelAttribute("newItems") MenuItems menuItems){
        System.out.println(menuItems.getSelectType());
        MenuType menuType = menuTypeRepository.findMenuTypeByTypeIs(menuItems.getSelectType());
        //item.setType_item(menuTypeRepository.findMenuTypeByTypeIs(type));
        menuItems.setType_item(menuType);
        menuRepository.save(menuItems);
        return "redirect:editmenu";
    }

    @RequestMapping("/updateItem")
    public String updateDesk(@RequestParam("itemId") int id, Model model){
        MenuItems menuItems = menuRepository.findById(id).get();
        String selectedType = menuItems.getType_item().getType();
        Set<MenuType> menu = menuTypeRepository.findDistinctByTypeIsNotNull();
        List<String> types = menu.stream().map(MenuType::getType).collect(Collectors.toList());
        types.remove(selectedType);
        model.addAttribute("insert", selectedType);
        model.addAttribute("types", types);
        model.addAttribute("menuItem", menuItems);
        return "edititem";
    }

    @RequestMapping("/deleteItem")
    public String deleteItem(@RequestParam("itemId") int id){
        menuRepository.deleteById(id);
        return "redirect:editmenu";
    }

    @RequestMapping("/edittypes")
    public String editTypes(Model model){
        MenuType menuType = new MenuType();
        model.addAttribute("newType", menuType);
        model.addAttribute("menuTypes", menuTypeRepository.findAll());

        MenuType testMenuType = new MenuType();
        model.addAttribute("testMenuType", testMenuType);
        return "edittypes";
    }

    @RequestMapping("/addType")
    public String addType(@ModelAttribute("addType") MenuType menuType){
        menuTypeRepository.save(menuType);
        return "redirect:edittypes";
    }

    @RequestMapping("updateType")
    public String updateType(@ModelAttribute("testMenuType") MenuType plugType
            , @RequestParam("typeId") int id, @RequestParam("typeName") String typeName, Model model){
        System.out.println(id);
        System.out.println(typeName);
        MenuType menuType = menuTypeRepository.findById(id).get();
        menuType.setType(typeName);
        menuTypeRepository.save(menuType);
        model.addAttribute("type", menuType);
        return "redirect:edittypes";
    }

    @RequestMapping("/deleteType")
    public String deleteType(@RequestParam("typeId") int id){
        menuTypeRepository.deleteById(id);
        return "redirect:editmenu";
    }
}
