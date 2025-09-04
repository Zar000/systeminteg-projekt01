package com.example.webbshopbackend.model;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryInfo {
    private String categoryName;
    private int quantity;

    public CategoryInfo(String categoryName, int quantity) {
        this.categoryName = categoryName;
        this.quantity = quantity;
    }


}
