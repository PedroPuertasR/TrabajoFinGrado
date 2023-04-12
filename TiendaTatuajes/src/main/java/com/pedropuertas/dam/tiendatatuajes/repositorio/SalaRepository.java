package com.pedropuertas.dam.tiendatatuajes.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;

public interface SalaRepository extends JpaRepository <Sala, Long>{

	List <Sala> findByEmpleadoContainsIgnoreCase(String nombre);
	
}
