package com.pedropuertas.dam.tiendatatuajes.controlador;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pedropuertas.dam.tiendatatuajes.servicio.EmailSenderService;
import com.pedropuertas.dam.tiendatatuajes.servicio.EmpleadoService;
import com.pedropuertas.dam.tiendatatuajes.servicio.ReservaService;

@Controller
public class MainController {

	@Autowired
	private EmpleadoService empleado;
	
	@Autowired
	private ReservaService reserva;
	
	@Autowired
	private EmailSenderService email;
	
	@GetMapping ("/")
	public String index (Model model) {
		model.addAttribute("listaEmpleado", empleado.findAll());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "main";
	}
	
	@PostMapping("/submit")
	public String procesarFormularioMain(@RequestParam("mensaje") String mensaje) {
		email.sendEmail("ejemplotrabajofinal@gmail.com", "Nueva cita " + LocalDate.now(), mensaje);
		return "redirect:/";
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
