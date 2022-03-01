package com.training.restaurant.Repository;

import com.training.restaurant.entity.Orders;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrdersRepository extends CrudRepository<Orders, Integer> {
    List<Orders> findOrdersByDataOpenNotNullAndDataCloseNull();
}
