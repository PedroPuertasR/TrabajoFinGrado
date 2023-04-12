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
public class Sala {

	@Id @GeneratedValue
	private long id;
	private String empleado;
	
	/*
	private String foto;
	private String redes;
	*/
}