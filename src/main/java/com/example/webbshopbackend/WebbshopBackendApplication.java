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
        List printInfo = r.getWhoBoughtWhat("Runner","S","Black","SweetPants");
        for(Object S : printInfo){
            System.out.println(S);
        }
    }
}
