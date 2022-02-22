package com.training.restaurant.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "menu_type")
public class MenuType {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String type;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "type_item", fetch = FetchType.LAZY)
    private List<MenuItems> menuItems;

    public MenuType() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public List<MenuItems> getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(List<MenuItems> menuItems) {
        this.menuItems = menuItems;
    }
}
