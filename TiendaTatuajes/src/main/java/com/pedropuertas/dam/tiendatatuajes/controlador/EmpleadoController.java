package com.pedropuertas.dam.tiendatatuajes.controlador;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.pedropuertas.dam.tiendatatuajes.modelo.Empleado;
import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;
import com.pedropuertas.dam.tiendatatuajes.repositorio.UsuarioFinder;
import com.pedropuertas.dam.tiendatatuajes.servicio.EmpleadoService;
import com.pedropuertas.dam.tiendatatuajes.servicio.ReservaService;
import com.pedropuertas.dam.tiendatatuajes.servicio.SalaService;

@Controller
@RequestMapping("/admin")
public class EmpleadoController {
	
	@Autowired
	private UsuarioFinder usuario;
	
	@Autowired
	private EmpleadoService empleado;
	
	@Autowired
	private ReservaService reserva;
	
	@Autowired
	private SalaService sala;
	
	
	public EmpleadoController(EmpleadoService empleado) {
		this.empleado = empleado;
	}
	
	@GetMapping("/empleados")
	public String mostrarEmpleados(Model model, @AuthenticationPrincipal UserDetails userD) {
		Optional <Usuario> user = usuario.findUserByUsername(userD.getUsername());
		model.addAttribute("listaEmpleado", empleado.findEmpleadoUsuario(empleado.findAll(), user));
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarEmpleados";
	}
	
	@GetMapping("/nuevoEmpleado")
	public String addEmpleado(Model model) {
		model.addAttribute("empleado", new Empleado());
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/formularioEmpleado";
	}
	
	@PostMapping("/nuevoEmpleado/submit")
	public String procesarFormulario(@ModelAttribute("empleado") Empleado a, @RequestParam("image") MultipartFile file) throws IOException {
		empleado.save(a, file);
		return "redirect:/admin/empleados";
	}
	
	@GetMapping("/editarEmpleado/{id}")
	public String mostrarFormularioEdicion(@PathVariable("id") long id, Model model) {
		Empleado empEditar = empleado.findById(id);

		if (empEditar != null) {
			model.addAttribute("empleado", empEditar);
			model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
			return "admin/formularioEmpleado";
		} else {
			return "redirect:/admin/empleados";
		}

	}

	@PostMapping("/editarEmpleado/submit")
	public String procesarFormularioEdicion(@ModelAttribute("empleado") Empleado a, @RequestParam("image") MultipartFile file) throws IOException{
		empleado.edit(a, file);
		return "redirect:/admin/empleados";
	}

	@GetMapping("/borrarEmpleado/{id}")
	public String borrar(@PathVariable("id") long id, Model model) {
		Empleado e = empleado.findById(id);
		
		if(e != null) {
			if(sala.buscarPorEmpleado(e) == 0) {
				model.addAttribute("empleado", e);
				empleado.delete(e);
			}else {
				return "redirect:/admin/empleados?error=true";
			}
		}
		return "redirect:/admin/empleados";
	}
	
	@GetMapping("/empleados/buscar")
	public String buscar(Model model, @RequestParam String nombre) {
		model.addAttribute("listaEmpleado", empleado.buscarPorNombre(nombre, empleado.findAll()));
		model.addAttribute("existen", reserva.hayPendientes(reserva.findAll()));
		return "admin/mostrarSalas";
	}
	
}
