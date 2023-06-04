document.getElementById("nombre").addEventListener("blur", comprobarNombre);
document.getElementById("apellidos").addEventListener("blur", comprobarApellidos);
document.getElementById("artistico").addEventListener("blur", comprobarNombreArtistico);
document.getElementById("dni").addEventListener("blur", comprobarDNI);
document.getElementById("telefono").addEventListener("blur", comprobarTelefono);
document.getElementById("email").addEventListener("blur", comprobarEmail);
document.getElementById("salario").addEventListener("blur", comprobarSalario);
document.getElementById("seguridad_social").addEventListener("blur", comprobarSegSocial);
document.getElementById("iban").addEventListener("blur", comprobarIBAN);
document.getElementById("foto").addEventListener("blur", comprobarFoto);
document.getElementById("redes").addEventListener("blur", comprobarRedes);

function revisarFormularioEmpleadoAdmin(){
	let resultado = false;

	resultado = comprobarNombre &&
                comprobarApellidos &&
                comprobarNombreArtistico &&
                comprobarDNI &&
                comprobarTelefono &&
                comprobarEmail &&
                comprobarSalario &&
                comprobarSegSocial &&
                comprobarIBAN &&
                comprobarFoto &&
                comprobarRedes;

	formularioEmpleadoAdmin.enviar.className = resultado ? "btn btn-success mb-2" : "btn btn-danger mb-2";

	return resultado;
}

function comprobarNombre(){
    let nombre = formularioEmpleadoAdmin.nombre;
    let resultado = nombre.value!=="";

    cambiarApariencia(nombre, resultado);

    return resultado;
}

function comprobarApellidos(){
    let apellidos = formularioEmpleadoAdmin.apellidos;
    let resultado = apellidos.value!=="";

    cambiarApariencia(apellidos, resultado);

    return resultado;
}

function comprobarNombreArtistico(){
    let nombreA = formularioEmpleadoAdmin.artistico;
    let resultado = nombreA.value!=="";

    cambiarApariencia(nombreA, resultado);

    return resultado;
}

function comprobarDNI(){

    let dni = formularioEmpleadoAdmin.dni;
    let cadena = /^\d{8}[a-zA-Z]$/;
    let resultado = dni.value.test(cadena);

    cambiarApariencia(dni, resultado);

    return resultado;
}

function comprobarTelefono(){
    let telefono = formularioEmpleadoAdmin.telefono;

    let resultado = (telefono.value.length == 9) && (!isNaN(telefono.value));

    cambiarApariencia(telefono, resultado);

    return resultado;
}

function comprobarEmail(){
    let email = formularioEmpleadoAdmin.email;
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

function comprobarSalario(){
    let salario = formularioEmpleadoAdmin.salario;
    let resultado = salario.value > 1000 && !isNaN(salario.value);

    cambiarApariencia(salario, resultado);

    return resultado;
}

function comprobarSegSocial(){
    let segsocial = formularioEmpleadoAdmin.seguridadSocial;
    let resultado = (segsocial.value.length == 12) && (!isNaN(segsocial.value));

    cambiarApariencia(segsocial, resultado);

    return resultado;
}

function comprobarIBAN(){
    let iban = formularioEmpleadoAdmin.iban;
    let cadena = /^[A-Z]{2}\d{2}[A-Z0-9]{4}\d{7}[A-Z0-9]{0,16}$/;
    let resultado = iban.value.test(cadena);

    cambiarApariencia(iban, resultado);

    return resultado;
}

function comprobarRedes(){
    let redes = formularioEmpleadoAdmin.redes;
    let cadena = /^(ftp|http|https):\/\/[^ "]+$/;
    let resultado = redes.value.test(cadena);

    cambiarApariencia(redes, resultado);

    return resultado;
}

function cambiarApariencia(campo, estado){	
	if(estado){
		campo.classList.remove("border-danger");
		campo.classList.add("border-success");
		campo.parentNode.nextElementSibling.style.display = 'none';
	}
	else{
		campo.classList.remove("border-success");
		campo.classList.add("border-danger");
		campo.parentNode.nextElementSibling.style.display = 'block';
	}
		
}

function enviarEmail(){
    Email.send({
        Host : "smtp.gmail.com",
        Username : "pruebatattoodam@gmail.com",
        Password : "trabajofinal",
        To : "pruebatattoodam@gmail.com",
        From : document.getElementById("email").value,
        Subject : "Nueva cita",
        Body : "Hola",
    }).then(
        message => alert("Mensaje enviado")
    );
}