package com.pedropuertas.dam.tiendatatuajes.modelo;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

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
	
	@OneToOne(cascade= {CascadeType.MERGE})
	@JoinColumn(name="EMPLEADO_ID")
	private Empleado empleado;
}