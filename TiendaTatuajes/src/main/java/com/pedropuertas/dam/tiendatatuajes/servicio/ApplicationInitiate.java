package com.pedropuertas.dam.tiendatatuajes.servicio;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ApplicationInitiate {

	@Autowired
	private ZonaService zona;
	
	@Autowired
	private ReservaService reserva;
	
	@PostConstruct
	public void reiniciarZonaSeq() {
		zona.reiniciarSecuencia();
	}
	
	@PostConstruct
	public void reiniciarCitaSeq() {
		reserva.reiniciarSecuencia();
	}
	
}
