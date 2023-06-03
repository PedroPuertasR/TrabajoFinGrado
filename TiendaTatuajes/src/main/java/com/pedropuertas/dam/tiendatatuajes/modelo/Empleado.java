package com.pedropuertas.dam.tiendatatuajes.modelo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Empleado {

	@Id @GeneratedValue
	private long id;
	
	private String nombre, apellidos, telefono, email, dni;
	private String seguridadSocial, iban, foto, redes, artistico;
	private double salario;
	
	public String nombreCompleto() {
		return nombre + " " + apellidos;
	}
	
	public String rutaImagen() {
		return "img/" + foto;
	}
	
}
