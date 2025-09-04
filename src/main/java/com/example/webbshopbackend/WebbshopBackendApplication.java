package com.example.webbshopbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.sql.SQLException;
import java.util.List;


@SpringBootApplication
public class WebbshopBackendApplication {

    public static void main(String[] args) throws SQLException {
        SpringApplication.run(WebbshopBackendApplication.class, args);
        Repository r = new Repository();
        System.out.println(r.getWhoBoughtWhat("Runner","S","Black","SweetPants"));
    }
}
