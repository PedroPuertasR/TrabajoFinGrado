package com.pedropuertas.dam.tiendatatuajes.seguridad;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Usuario {

	private String username, password, rol;
	private String nombre, apellidos;
	
	/*public String getAvatar() {
		return "https://robohash.org/" + nombreUsuario;
	}*/
	
}
