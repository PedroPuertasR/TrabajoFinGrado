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
public class Zona {

	@Id @GeneratedValue
	private long id;
	private String nombreZona;
	private double precioFianza;
	
}