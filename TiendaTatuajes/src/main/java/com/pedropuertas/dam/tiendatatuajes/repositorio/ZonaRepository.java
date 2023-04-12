package com.pedropuertas.dam.tiendatatuajes.repositorio;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pedropuertas.dam.tiendatatuajes.modelo.Zona;

public interface ZonaRepository extends JpaRepository <Zona, Long>{

	public List <Zona> findByPrecioFianza(Optional <Double> precio);
	
}
