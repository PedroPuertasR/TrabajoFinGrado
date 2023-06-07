package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.pedropuertas.dam.tiendatatuajes.modelo.Zona;
import com.pedropuertas.dam.tiendatatuajes.repositorio.ZonaRepository;
import com.pedropuertas.dam.tiendatatuajes.servicio.base.ServicioBaseImpl;

@Service
public class ZonaService extends ServicioBaseImpl <Zona, Long, ZonaRepository>{

	public List<Zona> buscarPorPrecio(Optional <Double> precio) {
		return repositorio.findByPrecioFianza(precio);
	}
}
