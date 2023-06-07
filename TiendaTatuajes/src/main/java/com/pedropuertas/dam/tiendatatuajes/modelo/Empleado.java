package com.pedropuertas.dam.tiendatatuajes.modelo;

import javax.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Empleado {

	@Id
	private long id;
	
	private String nombre, apellidos, telefono, email, dni;
	private String seguridadSocial, iban, foto, redes, artistico;
	private double salario;
	
	@MapsId
	@OneToOne(fetch=FetchType.EAGER ,cascade= {CascadeType.ALL}, orphanRemoval = true)
	@JoinColumn(name="USUARIO_ID",foreignKey = @ForeignKey(name = "FK_EMPLEADO_USER"))
	private Usuario usuario;
	
	public String nombreCompleto() {
		return nombre + " " + apellidos;
	}
	
	public String rutaImagen() {
		return "img/" + foto;
	}
	
}
