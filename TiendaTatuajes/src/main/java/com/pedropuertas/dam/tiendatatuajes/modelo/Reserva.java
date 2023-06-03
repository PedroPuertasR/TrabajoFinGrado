package com.pedropuertas.dam.tiendatatuajes.modelo;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Reserva {

	@Id @GeneratedValue
	private long id;
	
	private String cliente;
	
	@OneToOne(cascade= {CascadeType.MERGE})
	@JoinColumn(name="ZONA_ID")
	private Zona zona;
	
	@OneToOne(cascade= {CascadeType.MERGE})
	@JoinColumn(name="SALA_ID")
	private Sala sala;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate fechaReserva;
	
	private double precioDisenio;
	private int descuento;
	private double precioTotal;
	private boolean aceptado;
	
	public double calcularTotal() {
		return (precioDisenio + zona.getPrecioFianza()) - 1 * descuento / 100;
	}
	
}