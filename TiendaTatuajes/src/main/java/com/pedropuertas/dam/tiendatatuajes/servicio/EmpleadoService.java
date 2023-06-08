package com.pedropuertas.dam.tiendatatuajes.servicio;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pedropuertas.dam.tiendatatuajes.modelo.Empleado;
import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;
import com.pedropuertas.dam.tiendatatuajes.repositorio.EmpleadoRepository;
import com.pedropuertas.dam.tiendatatuajes.servicio.base.ServicioBaseImpl;

@Service
public class EmpleadoService extends ServicioBaseImpl <Empleado, Long, EmpleadoRepository>{
	
	public static String UPLOAD_DIRECTORY = System.getProperty("user.dir") + "\\src\\main\\resources\\static\\img\\";
	
	public List <Empleado> buscarPorNombre(String nombre, List <Empleado> lista){
		
		List <Empleado> listaFinal = new ArrayList <Empleado>();
		
		for (Empleado e : lista) {
			if(e.getNombre().toLowerCase().contains(nombre.toLowerCase())) {
				listaFinal.add(e);
			}
		}
		
		return listaFinal;
		
	}
	
	public Empleado cambiarFoto(Empleado a, MultipartFile file) throws IOException {
		StringBuilder fileNames = new StringBuilder();
        Path fileNameAndPath = Paths.get(UPLOAD_DIRECTORY, file.getOriginalFilename());
        fileNames.append(file.getOriginalFilename());
        Files.write(fileNameAndPath, file.getBytes());
        a.setFoto(file.getOriginalFilename());
        
        return a;
	}
	
	public Empleado edit(Empleado a, MultipartFile file) throws IOException {
		return save(a, file);
	}
	
	public Empleado save(Empleado a, MultipartFile file) throws IOException {
		
		if(file.getSize() == 0) {
			return super.save(a);
		}else {
			return super.save(cambiarFoto(a, file));
		}
	}
	
	public List <Empleado> findEmpleadoUsuario(List <Empleado> lista, Optional <Usuario> user){
		if(user.get().getUsername().equalsIgnoreCase("admin")) {
			return lista;
		}else {
			return lista.stream()
					.filter(x -> x.getId() == user.get().getId())
					.collect(Collectors.toList());
		}
	}
	
}
