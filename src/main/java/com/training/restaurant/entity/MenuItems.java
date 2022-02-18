package com.training.restaurant.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "menu_items")
public class MenuItems {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private String item;

    private int cost;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="type_item")
    private MenuType type_item;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "item_id", fetch = FetchType.LAZY)
    private List<Order> orders;

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

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
