package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/app/microservice-1")
public class Controller {
    private int contador = 0;
    @GetMapping("/saludo")
    public String getSaludo(){
        return "Hola mundo desde el microservicio-1 en la version2";
    }

    @GetMapping("/contador")
    public String getContador(){
        contador++;
        return "Contador de peticiones de la version2: "+contador;
    }
}
