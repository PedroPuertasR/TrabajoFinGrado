package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.util.List;

import org.springframework.stereotype.Service;

import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;
import com.pedropuertas.dam.tiendatatuajes.repositorio.SalaRepository;
import com.pedropuertas.dam.tiendatatuajes.servicio.base.ServicioBaseImpl;

@Service
public class SalaService extends ServicioBaseImpl <Sala, Long, SalaRepository>{	
	
	public List<Sala> buscarPorNombre(String nombre) {
		return repositorio.findByEmpleadoContainsIgnoreCase(nombre);
	}
	
}
