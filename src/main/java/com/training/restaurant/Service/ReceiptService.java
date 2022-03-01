package com.training.restaurant.Service;

import com.training.restaurant.Repository.ReceiptRepository;
import com.training.restaurant.entity.Orders;
import com.training.restaurant.entity.Receipt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ReceiptService {
    @Autowired
    private ReceiptRepository receiptRepository;
    @Autowired
    private MenuService menuService;


    public void save(Receipt receipt) {
        receiptRepository.save(receipt);
    }

    public List<Receipt> findReceiptsByOrder_id(int orderId) {
        return receiptRepository.findReceiptsByOrder_id(orderId);
    }

    public void delete(Receipt receipt) {
        receiptRepository.delete(receipt);
    }

    public void addItemsInOrder(Map<String, String> form, Orders order) {
        int count = 0;
        form.remove("orderId");
        form.remove("_csrf");
        for (Map.Entry entry: form.entrySet()){
            int item_id = Integer.parseInt((String) (entry.getKey()));
            try {
                count = Integer.parseInt(entry.getValue().toString());
            }
            catch (Exception e){
                System.out.println("Не удалось перевести в число");
            }
            if(count>0){
                Receipt receipt = new Receipt();
                receipt.setCount(count);
                receipt.setOrder(order);
                receipt.setItem_id(menuService.findById(item_id));
                receiptRepository.save(receipt);
            }
        }
    }
}
