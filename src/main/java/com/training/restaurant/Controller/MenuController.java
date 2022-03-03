package com.training.restaurant.Controller;

import com.training.restaurant.Repository.MenuRepository;
import com.training.restaurant.Repository.MenuTypeRepository;
import com.training.restaurant.entity.MenuItems;
import com.training.restaurant.entity.MenuType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping(path = "/admin")
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
        model.addAttribute("types", types);
        model.addAttribute("menuItems", menuRepository.findAll());
        return "editmenu";
    }

    @RequestMapping("/saveItem")
    public String saveItemWithType(@Valid @ModelAttribute("newItems") MenuItems menuItems, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            //отрефакторить дублирующий код сделав все в MenuService
            model.addAttribute("newItems", menuItems);
            Set<MenuType> menu = menuTypeRepository.findDistinctByTypeIsNotNull();
            List<String> types = menu.stream().map(MenuType::getType).collect(Collectors.toList());
            model.addAttribute("types", types);
            model.addAttribute("menuItems", menuRepository.findAll());
            return "editmenu";
        }
        MenuType menuType = menuTypeRepository.findMenuTypeByTypeIs(menuItems.getSelectType());
        menuItems.setType_item(menuType);
        menuRepository.save(menuItems);
        return "redirect:editmenu";
    }

    @RequestMapping("/editItem")
    public String editItem(@RequestParam("itemId") MenuItems menuItems, Model model){
//        MenuItems menuItems = menuRepository.findById(id).get();
        String selectedType = menuItems.getType_item().getType();
        Set<MenuType> menu = menuTypeRepository.findDistinctByTypeIsNotNull();
        List<String> types = menu.stream().map(MenuType::getType).collect(Collectors.toList());
        types.remove(selectedType);
        model.addAttribute("insert", selectedType);
        model.addAttribute("types", types);
        model.addAttribute("menuItem", menuItems);
        return "edititem";
    }

    @RequestMapping("/updateItem")
    public String updateItem(@Valid @ModelAttribute("menuItem") MenuItems menuItems, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            String selectedType = menuItems.getSelectType();

            Set<MenuType> menu = menuTypeRepository.findDistinctByTypeIsNotNull();
            List<String> types = menu.stream().map(MenuType::getType).collect(Collectors.toList());
            types.remove(selectedType);
            model.addAttribute("insert", selectedType);
            model.addAttribute("types", types);
            model.addAttribute("menuItem", menuItems);
            return "edititem";
        }
        //Проблема с сохранением
        MenuType menuType = menuTypeRepository.findMenuTypeByTypeIs(menuItems.getSelectType());
        menuItems.setType_item(menuType);
        menuRepository.save(menuItems);
        return "redirect:editmenu";
    }

    @RequestMapping("/deleteItem")
    public String deleteItem(@RequestParam("itemId") int id){
        menuRepository.deleteById(id);
        return "redirect:editmenu";
    }

    @RequestMapping("/edittypes")
    public String editTypes(Model model){
        model.addAttribute("newType", new MenuType());
        model.addAttribute("menuTypes", menuTypeRepository.findAll());
//        model.addAttribute("testMenuType", new MenuType());
        return "edittypes";
    }

    @RequestMapping("/addType")
    public String addType(@Valid @ModelAttribute("addType") MenuType menuType, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("newType", new MenuType());
            model.addAttribute("menuTypes", menuTypeRepository.findAll());
            return "edittypes";
        }
        menuTypeRepository.save(menuType);
        return "redirect:edittypes";
    }

    @RequestMapping("updateType")
    public String updateType(@ModelAttribute("testMenuType") MenuType plugType
            , @RequestParam("typeId") int id, @RequestParam("typeName") String typeName, Model model){
        MenuType menuType = menuTypeRepository.findById(id).get();
        menuType.setType(typeName);
        menuTypeRepository.save(menuType);
        model.addAttribute("type", menuType);
        return "redirect:edittypes";
    }

    @RequestMapping("/deleteType")
    public String deleteType(@RequestParam("typeId") int id){
        menuTypeRepository.deleteById(id);
        return "redirect:edittypes";
    }
}
