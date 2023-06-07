package com.pedropuertas.dam.tiendatatuajes.repositorio;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pedropuertas.dam.tiendatatuajes.modelo.Usuario;

@Repository
public class UserRepository {

	@Autowired
	private UsuarioFinder usuario;
	
	@PostConstruct
	public List <Usuario> cargarUsuarios() {
		return usuario.findAll();
	}
	
}
