package com.pedropuertas.dam.tiendatatuajes.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pedropuertas.dam.tiendatatuajes.modelo.Empleado;
import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;

public interface SalaRepository extends JpaRepository <Sala, Long>{

	@Query("select count(s) from Sala s where s.empleado =?1")
	public int findSalaByEmpleado(Empleado empleado);
	
}
