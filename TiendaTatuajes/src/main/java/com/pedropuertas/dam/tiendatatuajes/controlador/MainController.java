package com.pedropuertas.dam.tiendatatuajes.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	
	@GetMapping ("/")
	public String index (Model model) {
		return "main";
	}
	
	@GetMapping("/login")
    public String login() {
		return "login";
    }

    @GetMapping("/login-error")
    public String loginError(Model model) {
        model.addAttribute("loginError", true);
        return "login";
    }
	
}
