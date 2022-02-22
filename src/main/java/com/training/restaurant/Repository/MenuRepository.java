package com.training.restaurant.Repository;

import com.training.restaurant.entity.MenuItems;
import org.springframework.data.repository.CrudRepository;

public interface MenuRepository extends CrudRepository<MenuItems, Integer> {
}
