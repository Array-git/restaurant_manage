package com.training.restaurant.Service;

import com.training.restaurant.Repository.ReceiptRepository;
import com.training.restaurant.entity.Orders;
import com.training.restaurant.entity.Receipt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        List<Receipt> oldReceipt = receiptRepository.findReceiptsByOrder_id(order.getId());
        int count = 0;
        form.remove("deskId");
        form.remove("orderId");
        form.remove("deskId");
        form.remove("_csrf");
        for (Map.Entry entry : form.entrySet()) {
            try {
                count = Integer.parseInt(entry.getValue().toString());
            } catch (Exception e) {
                System.out.println("Не удалось перевести в число");
            }
            if (count > 0) {
                boolean isAdded = false;
                int item_id = Integer.parseInt((String) (entry.getKey()));
                for (Receipt receipt : oldReceipt) {
                    if (receipt.getItem_id().getId() == item_id) {
                        receipt.setCount(receipt.getCount() + count);
                        receiptRepository.save(receipt);
                        isAdded = true;
                    }
                }
                if (!isAdded) {
                    Receipt newReceipt = new Receipt();
                    newReceipt.setCount(count);
                    newReceipt.setOrder(order);
                    newReceipt.setItem_id(menuService.findById(item_id));
                    receiptRepository.save(newReceipt);
                }
            }
        }
    }
}
