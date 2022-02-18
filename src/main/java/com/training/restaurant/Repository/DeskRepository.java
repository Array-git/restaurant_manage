package com.training.restaurant.Repository;

import com.training.restaurant.entity.Desk;
import org.springframework.data.repository.CrudRepository;

public interface DeskRepository extends CrudRepository<Desk, Integer> {
}
