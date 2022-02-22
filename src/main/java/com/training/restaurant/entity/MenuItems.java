package com.training.restaurant.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "menu_items")
public class MenuItems {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String item;

    private int cost;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE
            , CascadeType.DETACH, CascadeType.REFRESH}, fetch = FetchType.EAGER)
    @JoinColumn(name="type_item")
    private MenuType type_item;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "item_id", fetch = FetchType.LAZY)
    private List<Receipt> orders;

    @Transient
    String selectType;

    public MenuItems() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    public int getCost() {
        return cost;
    }

    public void setCost(int cost) {
        this.cost = cost;
    }

    public MenuType getType_item() {
        return type_item;
    }

    public void setType_item(MenuType type_item) {
        this.type_item = type_item;
    }

    public List<Receipt> getOrders() {
        return orders;
    }

    public void setOrders(List<Receipt> orders) {
        this.orders = orders;
    }

    public String getSelectType() {
        return selectType;
    }

    public void setSelectType(String selectType) {
        this.selectType = selectType;
    }
}
