package com.training.restaurant.Controller;

import com.training.restaurant.Repository.MenuRepository;
import com.training.restaurant.Repository.MenuTypeRepository;
import com.training.restaurant.Service.MenuService;
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
    private MenuService menuService;

    @GetMapping("/editmenu")
    public String editMenu(Model model){
        model.addAttribute("newItems", new MenuItems());
        model.addAttribute("types", menuService.getListOfTypes());
        model.addAttribute("menuItems", menuService.findAllMenuItems());
        return "editmenu";
    }

    @RequestMapping("/saveItem")
    public String saveItemWithType(@Valid @ModelAttribute("newItems") MenuItems menuItems, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("newItems", menuItems);
            model.addAttribute("types", menuService.getListOfTypes());
            model.addAttribute("menuItems", menuService.findAllMenuItems());
            return "editmenu";
        }
        menuService.saveItemsForSelectedType(menuItems.getSelectType(), menuItems);
        return "redirect:editmenu";
    }

    @RequestMapping("/editItem")
    public String editItem(@RequestParam("itemId") MenuItems menuItems, Model model){
        String selectedType = menuItems.getType_item().getType();
        List<String> types = menuService.getListOfTypes();
        model.addAttribute("insert", selectedType);
        model.addAttribute("types", types);
        model.addAttribute("menuItem", menuItems);
        return "edititem";
    }

    @RequestMapping("/updateItem")
    public String updateItem(@Valid @ModelAttribute("menuItem") MenuItems menuItems, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            String selectedType = menuItems.getSelectType();
            model.addAttribute("insert", selectedType);
            model.addAttribute("types", menuService.getListOfTypes().remove(selectedType));
            model.addAttribute("menuItem", menuItems);
            return "edititem";
        }
        menuService.saveItemsForSelectedType(menuItems.getSelectType(), menuItems);
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
        model.addAttribute("menuTypes", menuService.findAllMenuTypes());
//        model.addAttribute("testMenuType", new MenuType());
        return "edittypes";
    }

    @RequestMapping("/addType")
    public String addType(@Valid @ModelAttribute("addType") MenuType menuType, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            model.addAttribute("newType", new MenuType());
            model.addAttribute("menuTypes", menuService.findAllMenuItems());
            return "edittypes";
        }
        menuService.saveMenuType(menuType);
        return "redirect:edittypes";
    }

    @RequestMapping("updateType")
    public String updateType(@ModelAttribute("testMenuType") MenuType plugType
            , @RequestParam("typeId") int id, @RequestParam("typeName") String typeName, Model model){
        MenuType menuType = menuService.findMenuTypeById(id);
        menuType.setType(typeName);
        menuService.saveMenuType(menuType);
        model.addAttribute("type", menuType);
        return "redirect:edittypes";
    }

    @RequestMapping("/deleteType")
    public String deleteType(@RequestParam("typeId") int id){
        menuService.deleteTypeById(id);
        return "redirect:edittypes";
    }
}
