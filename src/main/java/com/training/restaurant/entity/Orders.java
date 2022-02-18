package com.training.restaurant.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "desk_id")
    private Desk desk_id;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order_id", fetch = FetchType.LAZY)
    private List<Order> orders;

    public Orders() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Desk getDesk_id() {
        return desk_id;
    }

    public void setDesk_id(Desk desk_id) {
        this.desk_id = desk_id;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
