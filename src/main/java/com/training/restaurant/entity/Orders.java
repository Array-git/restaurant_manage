package com.training.restaurant.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "orders")
public class Orders {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE
            , CascadeType.DETACH, CascadeType.REFRESH}, fetch = FetchType.EAGER)
    @JoinColumn(name = "desk_id")
    private Desk desk_id;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "order", fetch = FetchType.LAZY)
    private List<Receipt> orders;

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

    public List<Receipt> getOrders() {
        return orders;
    }

    public void setOrders(List<Receipt> orders) {
        this.orders = orders;
    }
}
