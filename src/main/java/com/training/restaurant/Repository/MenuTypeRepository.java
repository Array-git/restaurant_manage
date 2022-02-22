package com.training.restaurant.Repository;

import com.training.restaurant.entity.MenuType;
import org.springframework.data.repository.CrudRepository;

import java.util.Set;

public interface MenuTypeRepository extends CrudRepository<MenuType, Integer> {
    Set<MenuType> findDistinctByTypeIsNotNull();
    MenuType findMenuTypeByTypeIs(String type);
}
