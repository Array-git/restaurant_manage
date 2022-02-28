package com.training.restaurant.Repository;

import com.training.restaurant.entity.Orders;
import com.training.restaurant.entity.Receipt;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface OrdersRepository extends CrudRepository<Orders, Integer> {
}
