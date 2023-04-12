document.getElementById("nombre").addEventListener("blur", pasarNombreYApellidosAMayus);
document.getElementById("apellidos").addEventListener("blur", pasarNombreYApellidosAMayus);
document.getElementById("email").addEventListener("blur", comprobarEmail);
document.getElementById("telefono").addEventListener("blur", comprobarTelefono);
document.getElementById("ciudad").addEventListener("blur", comprobarCiudad);
document.getElementById("edad").addEventListener("blur", comprobarEdad);
document.getElementById("tatuador").addEventListener("blur", comprobarTatuador);
document.getElementById("tamanio").addEventListener("blur", comprobarTamanio);
document.getElementById("idea").addEventListener("blur", comprobarIdea);
document.getElementById("foto").addEventListener("blur", comprobarFoto);
//document.getElementById("enviar).addEventListener("click", enviarEmail);

//formularioCita.addEventListener('submit', enviarEmail());

function revisarformularioCita() {
    let resultado = false;

    resultado = pasarNombreYApellidosAMayus() &&
        comprobarEmail() &&
        comprobarTelefono() &&
        comprobarCiudad() &&
        comprobarEdad() &&
        comprobarTatuador() &&
        comprobarTamanio() &&
        comprobarIdea() &&
        comprobarFoto();

    formularioCita.enviar.className = resultado ? "btn btn-success mb-2" : "btn btn-danger mb-2";

    return resultado;
}

function pasarNombreYApellidosAMayus() {

    let campoNombre = formularioCita.nombre;
    let campoApellidos = formularioCita.apellidos;

    let resultado = (campoNombre.value !== "") && (campoApellidos.value !== "");

    if (resultado) {
        campoNombre.value = campoNombre.value.toUpperCase();
        campoApellidos.value = campoApellidos.value.toUpperCase();
    }

    cambiarApariencia(campoNombre, resultado);
    cambiarApariencia(campoApellidos, resultado);

    return resultado;

}

function comprobarEmail() {
    let email = formularioCita.email;
    let resultado = email.value !== "";

    if (resultado) {

        let emailSeparado = email.value.split('@');
        resultado = emailSeparado.length == 2;

        if (resultado) {
            let partesDominio = emailSeparado[1].split('.');
            resultado = partesDominio.length > 1;
        }
    }

    cambiarApariencia(email, resultado);

    return resultado;
}

function comprobarTelefono() {
    let telefono = formularioCita.telefono;

    let resultado = (telefono.value.length == 9) && (!isNaN(telefono.value));

    cambiarApariencia(telefono, resultado);

    return resultado;
}

function comprobarCiudad() {
    let ciudad = formularioCita.ciudad;

    let resultado = ciudad.value !== "";

    cambiarApariencia(ciudad, resultado);

    return resultado;
}

function comprobarEdad() {
    let edad = formularioCita.edad;

    let resultado = edad.value !== 0 && !isNaN(edad.value);
    let resultado2 = edad.value >= 18 && edad.value < 100;
    let resultadoFinal = false;

    if (resultado && resultado2) {
        resultadoFinal = true;
    }

    cambiarApariencia(edad, resultadoFinal);

    return resultadoFinal;
}

function comprobarTatuador() {
    let tatuador = formularioCita.tatuador;
    let opciones = formularioCita.opciones;

    let val = tatuador.value;
    let obj = opciones.find("option[value='" + val + "']");

    let resultado = false;

    if (obj != null && obj.length > 0) {
        resultado = true;
    }

    cambiarApariencia(tatuador, resultado);

    return resultado;

}

function comprobarTamanio() {
    let tam = formularioCita.tamanio;
    let resultado = tam.value > 0 && !isNaN(tam.value) && tam.value < 100;

    cambiarApariencia(tam, resultado);

    return resultado;
}

function comprobarIdea() {
    let idea = formularioCita.idea;
    let resultado = idea.value !== "";

    cambiarApariencia(idea, resultado);

    return resultado;
}

function comprobarFoto() {
    let foto = formularioCita.foto;

    let fotoValor = foto.value;

    let extensiones = /(\.jpg|\.jpeg|\.png)$/i;

    let resultado = false;

    if (extensiones.exec(fotoValor)) {
        resultado = true;
    }

    cambiarApariencia(foto, resultado);

    return resultado;
}

/*function mensaje(){
	let mensaje = "Nombre: " + formularioCita.nombre.value + '.' +
				  "Apellidos: " + document.getElementById("apellidos").value + '.' +
				  "Email: " + document.getElementById("email").value + '.' +
				  "Teléfono: " + document.getElementById("telefono").value + '.' +
				  "Ciudad: " + document.getElementById("ciudad").value + '.' + 
				  "Edad: " + document.getElementById("edad").value + '.' +
				  "Tatuador: "+ document.getElementById("tatuador").value + '.' +
				  "Tamaño: " + document.getElementById("tamanio").value + '.' +
				  "Idea del tatuaje: " + document.getElementById("idea").value;
				  
	return mensaje;
}*/

/*function enviarEmail(){
	
	Email.send({
	    Host : "smtp.elasticemail.com",
	    Username : "ejemplopedropuertas@gmail.com",
	    Password : "05A977C700E0A8A8537DD88328D68BD02953",
	    To : 'puertas.roped22@triana.salesianos.edu',
	    From : "ejemplopedropuertas@gmail.com",
	    Subject : "Nueva cita",
	    Body : mensaje()
	}).then(
	  alert("Mensaje enviado")
	);
	
}*/

function cambiarApariencia(campo, estado) {
    if (estado) {
        campo.classList.remove("border-danger");
        campo.classList.add("border-success");
        campo.parentNode.nextElementSibling.style.visibility = 'hidden';
    }
    else {
        campo.classList.remove("border-success");
        campo.classList.add("border-danger");
        campo.parentNode.nextElementSibling.style.visibility = 'visible';
    }

}