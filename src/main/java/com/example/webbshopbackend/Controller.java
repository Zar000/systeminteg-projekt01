package com.example.webbshopbackend;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Controller {

    int num;
    String textUsr;
    String[] animals = {"Cat", "Dog", "Fish", "Horse", "Lion", "Spider", "Tiger", "Wolf", "Zebra", "Elephant"};

    @RequestMapping("/luckyYou")
    public String getAnim(@RequestParam String text) {
        numGen();
        funny(text);
        return animal() + textUsr;

    }
    public void numGen(){
        num = (int)Math.floor(Math.random() * 10);
    }
    public String animal(){
        return animals[num];
    }
    public String funny(String t){
        return textUsr = " " + t + " ROLIGT !!! ";

    }
}
