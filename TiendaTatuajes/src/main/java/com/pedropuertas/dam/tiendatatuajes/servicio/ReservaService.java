package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;

import com.pedropuertas.dam.tiendatatuajes.modelo.Reserva;
import com.pedropuertas.dam.tiendatatuajes.modelo.Sala;
import com.pedropuertas.dam.tiendatatuajes.modelo.Zona;
import com.pedropuertas.dam.tiendatatuajes.repositorio.ReservaRepository;
import com.pedropuertas.dam.tiendatatuajes.servicio.base.ServicioBaseImpl;

@Service
public class ReservaService extends ServicioBaseImpl <Reserva, Long, ReservaRepository>{
	
	private static final int numCitas = 2;
	private static final double numDisenio = 200.0;
	private static final int numDescuento = 10;
	
	public List <Reserva> buscarTatuadores(String nombre, List <Reserva> lista){		
		List <Reserva> listaFinal = new ArrayList <Reserva>();
		
		for (Reserva r : lista) {
			if(r.getSala().getEmpleado().toLowerCase().contains(nombre.toLowerCase())) {
				listaFinal.add(r);
			}
		}
		
		return listaFinal;

	}
	
	public int numeroReservasZona(Zona z) {
		return repositorio.findNumReservasByZona(z);
	}
	
	public int numeroReservasSala(Sala s) {
		return repositorio.findNumReservasBySala(s);
	}
	
	public boolean comprobarFecha(Reserva a, List <Reserva> lista, List <Sala> listaSala) {
		settearSala(a, listaSala);
		
		List <Reserva> listaCita = lista
				.stream()
				.filter(x -> x.getSala().getEmpleado().toLowerCase().equalsIgnoreCase(a.getSala().getEmpleado().toLowerCase()))
				.filter(x -> x.getFechaReserva().isEqual(a.getFechaReserva()))
				.collect(Collectors.toList());
		
		if(listaCita.size()>=numCitas) {
			return true;
		}else {
			return false;
		}
		
	}
	
	public void settearZona(Reserva a, List <Zona> lista) {
		Zona tmp = null;
		boolean encontrado = false;
		
		Iterator <Zona> it = lista.iterator();
		
		while(it.hasNext() && !encontrado) {
			tmp = it.next();
			if(tmp.getId() == a.getZona().getId()) {
				encontrado = true;
			}
		}
		
		a.getZona().setNombreZona(tmp.getNombreZona());
		a.getZona().setPrecioFianza(tmp.getPrecioFianza());
	}
	
	public void settearSala(Reserva a, List <Sala> lista) {
		Sala tmp = null;
		boolean encontrado = false;
		
		Iterator <Sala> it = lista.iterator();
		
		while(it.hasNext() && !encontrado) {
			tmp = it.next();
			if(tmp.getId() == a.getSala().getId()) {
				encontrado = true;
			}
		}
		
		a.getSala().setEmpleado(tmp.getEmpleado());
	}
	
	public void settearPrecioTotal(Reserva a) {
		if(a.getPrecioDisenio() >= numDisenio && a.getDescuento() < numDescuento) {
			a.setDescuento(numDescuento);
		}
		a.setPrecioTotal((a.getPrecioDisenio() + a.getZona().getPrecioFianza()) - 
				(a.getPrecioDisenio() + a.getZona().getPrecioFianza()) * a.getDescuento() / 100);
	}

	public Reserva save(Reserva a, List <Zona> listaZona, List <Sala> listaSala) {
		
		settearZona(a, listaZona);
		
		settearPrecioTotal(a);
		
		return super.save(a);
	}
	
	public Reserva edit(Reserva a, List <Zona> listaZona, List <Sala> listaSala) {
		
		settearZona(a, listaZona);
		
		settearSala(a, listaSala);
		
		settearPrecioTotal(a);
		
		return super.edit(a);
	}
	
}