package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.pedropuertas.dam.tiendatatuajes.modelo.Empleado;
import com.pedropuertas.dam.tiendatatuajes.modelo.Reserva;
import com.pedropuertas.dam.tiendatatuajes.repositorio.EmpleadoRepository;
import com.pedropuertas.dam.tiendatatuajes.servicio.base.ServicioBaseImpl;

@Service
public class EmpleadoService extends ServicioBaseImpl <Empleado, Long, EmpleadoRepository>{

	public List <Empleado> buscarPorNombre(String nombre, List <Empleado> lista){
		
		List <Empleado> listaFinal = new ArrayList <Empleado>();
		
		for (Empleado e : lista) {
			if(e.getNombre().toLowerCase().contains(nombre.toLowerCase())) {
				listaFinal.add(e);
			}
		}
		
		return listaFinal;
		
	}
	
}
