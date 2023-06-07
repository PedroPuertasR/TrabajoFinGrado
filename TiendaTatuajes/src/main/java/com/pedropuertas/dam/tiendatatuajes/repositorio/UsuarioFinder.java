package com.pedropuertas.dam.tiendatatuajes.repositorio;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;

public interface UsuarioFinder extends JpaRepository<Usuario, Long>{

	Optional<Usuario> findUserByUsername(String username);
	
	/*@PostConstruct
	public void init() {
		
		usuarios = List.of(
				Usuario.builder()
					.username("admin")
					.password("admin")
					.rol("ADMIN")
					.nombre("Pedro")
					.apellidos("Puertas Rodríguez")
					.build()
				);
	}
	*/
	
}
