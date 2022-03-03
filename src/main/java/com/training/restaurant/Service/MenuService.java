package com.training.restaurant.Service;

import com.training.restaurant.Repository.MenuRepository;
import com.training.restaurant.Repository.MenuTypeRepository;
import com.training.restaurant.entity.MenuItems;
import com.training.restaurant.entity.MenuType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class MenuService {
    @Autowired
    private MenuRepository menuRepository;
    @Autowired
    private MenuTypeRepository menuTypeRepository;

    public MenuItems findById(int item_id) {
        return menuRepository.findById(item_id).get();
    }

    public List<String> getListOfTypes() {
        Set<MenuType> menu = menuTypeRepository.findDistinctByTypeIsNotNull();
        return menu.stream().map(MenuType::getType).collect(Collectors.toList());
    }

    public void saveItemsForSelectedType(String selectType, MenuItems menuItems) {
        MenuType menuType = menuTypeRepository.findMenuTypeByTypeIs(selectType);
        menuItems.setType_item(menuType);
        menuRepository.save(menuItems);
    }

    public void saveMenuType(MenuType menuType) {
        menuTypeRepository.save(menuType);
    }

    public List<MenuItems> findAllMenuItems() {
        return (List<MenuItems>) menuRepository.findAll();
    }

    public MenuType findMenuTypeById(int id) {
        return menuTypeRepository.findById(id).get();
    }

    public void deleteTypeById(int id) {
        menuTypeRepository.deleteById(id);
    }

    public List<MenuType> findAllMenuTypes() {
        return (List<MenuType>) menuTypeRepository.findAll();
    }
}
