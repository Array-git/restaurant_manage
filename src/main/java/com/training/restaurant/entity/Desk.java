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

    private String description;

    private int numberOfPlaces;

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNumberOfPlaces() {
        return numberOfPlaces;
    }

    public void setNumberOfPlaces(int numberOfPlaces) {
        this.numberOfPlaces = numberOfPlaces;
    }

    public List<Orders> getOrder() {
        return order;
    }

    public void setOrder(List<Orders> order) {
        this.order = order;
    }
}
