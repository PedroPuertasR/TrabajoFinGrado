package com.pedropuertas.dam.tiendatatuajes.repositorio;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pedropuertas.dam.tiendatatuajes.modelo.Empleado;
import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;
import com.pedropuertas.dam.tiendatatuajes.servicio.EmpleadoService;

@Repository
public class UsuarioRepository {

	private List<Usuario> usuarios;
	private List<Empleado> empleados;
	private EmpleadoService listaEmple;

	public List<Usuario> getUsuarios() {
		return Collections.unmodifiableList(usuarios);
	}

	public Optional<Usuario> findUserByUsername(String username) {
		return usuarios.stream()
				.filter(u -> u.getUsername().equals(username))
				.findFirst();
	}
	
	@PostConstruct
	public void init() {
		
		//empleados = listaEmple.findAll();
		
		usuarios = List.of(
				Usuario.builder()
					.username("admin")
					.password("admin")
					.rol("ADMIN")
					.nombre("Pedro")
					.apellidos("Puertas Rodríguez")
					.build()
				);
		
		/*for (Empleado emp : empleados) {
			usuarios.add(
					Usuario.builder()
						.username(emp.getEmail())
						.password(emp.getDni())
						.rol("ADMIN")
						.nombre(emp.getNombre())
						.apellidos(emp.getApellidos())
						.build()
			);
		}*/
	}
	
}
