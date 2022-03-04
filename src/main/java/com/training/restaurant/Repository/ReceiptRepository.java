package com.training.restaurant.Repository;

import com.training.restaurant.entity.Receipt;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ReceiptRepository extends CrudRepository<Receipt, Integer> {
    List<Receipt> findReceiptsByOrder_id(int id);
}
