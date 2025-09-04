package com.example.webbshopbackend.model;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SalesInfo {
    private String yearMonth;
    private int sumSales;

    public SalesInfo(String yearMonth, int sumSales) {
        this.yearMonth = yearMonth;
        this.sumSales = sumSales;
    }

}
