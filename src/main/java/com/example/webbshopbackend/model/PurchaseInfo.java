package com.example.webbshopbackend.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseInfo {
    private String firstName;
    private String lastName;
    private String itemName;
    private String itemSize;
    private String itemColor;
    private String brand;
    private int quantity;

    public PurchaseInfo(String firstName, String lastName, String itemName,
                        String itemSize, String itemColor, String brand, int quantity) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.itemName = itemName;
        this.itemSize = itemSize;
        this.itemColor = itemColor;
        this.brand = brand;
        this.quantity = quantity;
    }
    @Override
    public String toString(){
        return firstName + " " + lastName + " bought " + quantity + " " +
                itemColor + " " + itemSize + " " + itemName + " from " + brand+"\n";
    }

}
