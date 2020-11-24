package com.thsrc.myapp;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloCtrl {

  @GetMapping("/say-hello")
  public String sayHello() {
    return "Hello Jenkins";
  }
}