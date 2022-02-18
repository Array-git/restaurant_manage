package com.training.restaurant.entity;

import org.aspectj.weaver.ast.Or;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "desk")
public class Desk {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private int id;

    private int number_desk;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "desk_id", fetch = FetchType.LAZY)
    private List<Orders> order;

    public Desk() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber_desk() {
        return number_desk;
    }

    public void setNumber_desk(int number_desk) {
        this.number_desk = number_desk;
    }

    public List<Orders> getOrder() {
        return order;
    }

    public void setOrder(List<Orders> order) {
        this.order = order;
    }
}
