package com.training.restaurant.Repository;

import com.training.restaurant.entity.Receipt;
import org.springframework.data.repository.CrudRepository;

public interface ReceiptRepository extends CrudRepository<Receipt, Integer> {
}
