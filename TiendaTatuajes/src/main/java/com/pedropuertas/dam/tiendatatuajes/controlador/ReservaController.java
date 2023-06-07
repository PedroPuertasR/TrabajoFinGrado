package com.pedropuertas.dam.tiendatatuajes.controlador;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pedropuertas.dam.tiendatatuajes.modelo.Reserva;
import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;
import com.pedropuertas.dam.tiendatatuajes.repositorio.UsuarioFinder;
import com.pedropuertas.dam.tiendatatuajes.servicio.ReservaService;
import com.pedropuertas.dam.tiendatatuajes.servicio.SalaService;
import com.pedropuertas.dam.tiendatatuajes.servicio.ZonaService;

@Controller
@RequestMapping("/admin")
public class ReservaController {

	@Autowired
	private UsuarioFinder usuario;
	
	@Autowired
	private ReservaService reserva;
	
	@Autowired
	private SalaService sala;
	
	@Autowired
	public ZonaService zona;
	
	public ReservaController(ReservaService servicio) {
		this.reserva = servicio;
	}
	
	@GetMapping ("/")
	public String indexAdmin (Model model, @AuthenticationPrincipal UserDetails userD) {
		Optional <Usuario> user = usuario.findUserByUsername(userD.getUsername());
		if(user.isEmpty()) {
    		return "login-error";
    	}else {
    		model.addAttribute("usuario", user.get());
    		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
            return "admin/mainAdmin";
    	}
	}
	
	@GetMapping ("/citas")
	public String mostrarCitas(Model model, @AuthenticationPrincipal UserDetails userD) {
		Optional <Usuario> user = usuario.findUserByUsername(userD.getUsername());
		if(user.get().getUsername().equalsIgnoreCase("admin")) {
			model.addAttribute("listaPendiente", reserva.findPendientes(reserva.findAll()));
			model.addAttribute("listaReserva", reserva.findAceptadas(reserva.findAll()));
		}else {
			model.addAttribute("listaPendiente", reserva.findPendientes(reserva.findAll(), user));
			model.addAttribute("listaReserva", reserva.findAceptadas(reserva.findAll(), user));
		}
		model.addAttribute("listaSala", sala.findAll());
		model.addAttribute("listaZona", zona.findAll());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarCitas";
	}
	
	@GetMapping("/nuevaCita")
	public String addCita(Model model) {
		model.addAttribute("reserva", new Reserva());
		model.addAttribute("sala", sala.findAll());
		model.addAttribute("zona", zona.findAll());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/formularioCita";
	}
	
	@PostMapping("/nuevaCita/submit")
	public String procesarFormulario(@ModelAttribute("reserva") Reserva a) {
		if(!reserva.comprobarFecha(a, reserva.findAll(), sala.findAll())) {
			reserva.save(a, zona.findAll(), sala.findAll());
			return "redirect:/admin/citas/";
		}else {
			reserva.delete(a);
			return "redirect:/admin/citas?error=true/";
		}
		
	}
	
	@GetMapping("/editarCita/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Reserva reservaEditar = reserva.findById(id);

		if (reservaEditar != null) {
			model.addAttribute("reserva", reservaEditar);
			model.addAttribute("sala", sala.findAll());
			model.addAttribute("zona", zona.findAll());
			model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
			return "admin/formularioCita";
		} else {
			return "redirect:/admin/citas/";
		}

	}

	@PostMapping("/editarCita/submit")
	public String procesarFormularioEdicion(@ModelAttribute("reserva") Reserva a) {
		if(!reserva.comprobarFecha(a, reserva.findAll(), sala.findAll())) {
			reserva.edit(a, zona.findAll(), sala.findAll());
			return "redirect:/admin/citas/";
		}else {
			return "redirect:/admin/citas?error=true/";
		}
	}

	@GetMapping("/borrarCita/{id}")
	public String borrar(@PathVariable("id") long id) {
		reserva.deleteById(id);
		return "redirect:/admin/citas";
	}
	
	@GetMapping("/citas/buscar")
	public String buscar(Model model, @RequestParam String nombre) {
		model.addAttribute("listaReserva", reserva.buscarTatuadores(nombre, reserva.findAll()));
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarCitas";
	}
	
}
