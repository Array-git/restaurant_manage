package com.training.restaurant.entity;

import com.training.restaurant.AnnotationValidation.CheckNumber;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import java.util.List;

@Entity
@Table(name = "desk")
public class Desk {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @NotBlank(message = "Пожалуйста заполните поле")
    @Length(max = 50, message = "Длина не более 50 символов")
    private String description;

    @Min(value=1, message = "Число не должно быть меньше 1")
    private String places;

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

    public String getPlaces() {
        return places;
    }

    public void setPlaces(String places) {
        this.places = places;
    }

    public List<Orders> getOrder() {
        return order;
    }

    public void setOrder(List<Orders> order) {
        this.order = order;
    }
}
