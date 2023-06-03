package com.pedropuertas.dam.tiendatatuajes.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;
import com.pedropuertas.dam.tiendatatuajes.servicio.EmpleadoService;
import com.pedropuertas.dam.tiendatatuajes.servicio.ReservaService;
import com.pedropuertas.dam.tiendatatuajes.servicio.SalaService;

@Controller
@RequestMapping("/admin")
public class SalaController {

	@Autowired
	private SalaService sala;
	
	@Autowired
	private ReservaService reserva;
	
	@Autowired
	private EmpleadoService empleado;
	
	public SalaController(SalaService servicio) {
		this.sala = servicio;
	}
	
	@GetMapping ("/salas")
	public String mostrarSalas(Model model) {
		model.addAttribute("listaSala", sala.findAll());
		model.addAttribute("listaEmpleado", empleado.findAll());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarSalas";
	}
	
	@GetMapping("/nuevaSala")
	public String addZona(Model model) {
		model.addAttribute("sala", new Sala());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/formularioSala";
	}
	
	@PostMapping("/nuevaSala/submit")
	public String procesarFormulario(@ModelAttribute("sala") Sala a) {
		sala.save(a);
		return "redirect:/admin/salas";
	}
	
	@GetMapping("/editarSala/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Sala salaEditar = sala.findById(id);

		if (salaEditar != null) {
			model.addAttribute("sala", salaEditar);
			model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
			return "admin/formularioSala";
		} else {
			return "redirect:/admin/salas";
		}

	}

	@PostMapping("/editarSala/submit")
	public String procesarFormularioEdicion(@ModelAttribute("sala") Sala a) {
		sala.edit(a);
		return "redirect:/admin/salas";
	}

	@GetMapping("/borrarSala/{id}")
	public String borrar(@PathVariable("id") long id, Model model) {
		Sala s = sala.findById(id);
		
		if(s != null) {
			if(reserva.numeroReservasSala(s) == 0) {
				model.addAttribute("zona", s);
				sala.delete(s);
			}else {
				return "redirect:/admin/salas?error=true";
			}
		}
		return "redirect:/admin/salas";
	}
	
	@GetMapping("/salas/buscar")
	public String buscar(Model model, @RequestParam String nombre) {
		model.addAttribute("listaSala", sala.buscarPorNombre(nombre, sala.findAll()));
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarSalas";
	}
	
}
