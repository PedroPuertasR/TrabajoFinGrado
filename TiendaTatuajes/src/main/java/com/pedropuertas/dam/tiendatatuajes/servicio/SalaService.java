package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.pedropuertas.dam.tiendatatuajes.modelo.Empleado;
import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;
import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;
import com.pedropuertas.dam.tiendatatuajes.repositorio.SalaRepository;
import com.pedropuertas.dam.tiendatatuajes.servicio.base.ServicioBaseImpl;

@Service
public class SalaService extends ServicioBaseImpl <Sala, Long, SalaRepository>{	
	
	public List <Sala> buscarPorNombre(String nombre, List <Sala> lista){
		List <Sala> listaFinal = new ArrayList<Sala>();
		
		for (Sala s : lista) {
			if(s.getEmpleado().getNombre().toLowerCase().contains(nombre.toLowerCase())) {
				listaFinal.add(s);
			}
		}
		
		return listaFinal;
	}
	
	public int buscarPorEmpleado(Empleado e) {
		return repositorio.findSalaByEmpleado(e);
	}
	
	public void settearEmpleado(Sala a, List <Empleado> lista) {

		List <Sala> salas = repositorio.findAll();
		
		Empleado tmp = null;
		boolean encontrado = false;
		boolean masDos = false;
		
		Iterator <Empleado> it = lista.iterator();
		
		while(it.hasNext() && !encontrado) {
			tmp = it.next();
			if(tmp.getId() == a.getEmpleado().getId()) {
				encontrado = true;
			}
		}
		
		for (Sala sala : salas) {
			if(sala.getEmpleado().getId() == tmp.getId() && sala.getId() != a.getId()) {
				masDos = true;
			}
		}
		
		if(!masDos) {
			a.setEmpleado(tmp);
		}
		
	}
	
	public Sala edit(Sala a, List <Empleado> lista) {
		settearEmpleado(a, lista);
		
		return super.edit(a);
	}
	
	public List <Sala> findSalaUsuario(List <Sala> lista, Optional <Usuario> user){
		
		if(user.get().getUsername().equalsIgnoreCase("admin")) {
			return lista;
		}else {
			return lista.stream()
					.filter(x -> x.getEmpleado().getId() == user.get().getId())
					.collect(Collectors.toList());
		}
	}

	
}
