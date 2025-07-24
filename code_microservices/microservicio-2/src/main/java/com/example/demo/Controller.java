package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/microservicio-2")
public class Controller {
    @GetMapping("/saludo")
    public String getSaludo(){
        return "Hola mundo desde el microservicio-2 en la version1";
    }
}
