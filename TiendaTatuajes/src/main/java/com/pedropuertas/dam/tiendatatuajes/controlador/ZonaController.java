package com.pedropuertas.dam.tiendatatuajes.controlador;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.pedropuertas.dam.tiendatatuajes.modelo.Zona;
import com.pedropuertas.dam.tiendatatuajes.servicio.ReservaService;
import com.pedropuertas.dam.tiendatatuajes.servicio.ZonaService;

@Controller
@RequestMapping("/admin")
public class ZonaController {

	@Autowired
	private ZonaService zona;
	
	@Autowired
	private ReservaService reserva;
	
	public ZonaController(ZonaService servicio) {
		this.zona = servicio;
	}
	
	@GetMapping ("/zonas")
	public String mostrarZonas(Model model) {
		model.addAttribute("listaZona", zona.findAll());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarZonas";
	}
	
	@GetMapping("/nuevaZona")
	public String addZona(Model model) {
		model.addAttribute("zona", new Zona());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/formularioZona";
	}
	
	@PostMapping("/nuevaZona/submit")
	public String procesarFormulario(@ModelAttribute("zona") Zona a) {
		zona.save(a);
		return "redirect:/admin/zonas";
	}
	
	@GetMapping("/editarZona/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Zona zonaEditar = zona.findById(id);

		if (zonaEditar != null) {
			model.addAttribute("zona", zonaEditar);
			model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
			return "admin/formularioZona";
		} else {
			return "redirect:/admin/zonas";
		}

	}

	@PostMapping("/editarZona/submit")
	public String procesarFormularioEdicion(@ModelAttribute("zona") Zona a) {
		zona.edit(a);
		return "redirect:/admin/zonas";
	}

	@GetMapping("/borrarZona/{id}")
	public String borrar(@PathVariable("id") long id, Model model) {
		Zona z = zona.findById(id);
		
		if(z != null) {
			if(reserva.numeroReservasZona(z) == 0) {
				model.addAttribute("zona", z);
				zona.delete(z);
			}else {
				return "redirect:/admin/zonas?error=true";
			}
		}
		return "redirect:/admin/zonas";
	}
	
	@GetMapping("/zonas/buscar")
	public String buscar(Model model, @RequestParam Optional <Double> precio) {
		if(precio.isEmpty()) {
			return "redirect:/admin/zonas";
		}else {
			model.addAttribute("listaZona", zona.buscarPorPrecio(precio));
			model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
			return "admin/mostrarZonas";
		}
	}
	
}
