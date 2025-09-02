package com.example.webbshopbackend;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    int num;
    String[] animals = {"Cat", "Dog", "Fish", "Horse", "Lion", "Spider", "Tiger", "Wolf", "Zebra", "Elephant"};

    @RequestMapping("/luckyYou")
    public String getAnim(@RequestParam(defaultValue = "true") boolean mode) {
        String localMessage = "Your lucky ";
        numGen();
        if(mode){
            localMessage += "animal is : "+ animal() + " !";
        }else{
            localMessage += "number is : "+ num + " !";
        }
        return localMessage;

    }

    public void numGen(){
        num = (int)Math.floor(Math.random() * 10);
    }
    public String animal(){
        return animals[num];
    }
}
