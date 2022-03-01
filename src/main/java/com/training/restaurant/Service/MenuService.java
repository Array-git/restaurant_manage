package com.training.restaurant.Service;

import com.training.restaurant.Repository.MenuRepository;
import com.training.restaurant.entity.MenuItems;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuService {
    @Autowired
    private MenuRepository menuRepository;

    public MenuItems findById(int item_id) {
        return menuRepository.findById(item_id).get();
    }
}
