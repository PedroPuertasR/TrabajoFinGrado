package com.pedropuertas.dam.tiendatatuajes.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.pedropuertas.dam.tiendatatuajes.modelo.Reserva;
import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;
import com.pedropuertas.dam.tiendatatuajes.modelo.Zona;

public interface ReservaRepository extends JpaRepository <Reserva, Long>{
	
	@Query("select count(r) from Reserva r where r.zona =?1")
	public int findNumReservasByZona(Zona zona);
	
	@Query("select count(r) from Reserva r where r.sala=?1")
	public int findNumReservasBySala(Sala sala);
	
}
