document.getElementById("nombreEmpleado").addEventListener("blur", comprobarNombreEmpleado);

function revisarFormZona(){
	let resultado = false;

	resultado = comprobarNombreEmpleado;

	formSala.enviar.className = resultado?"btn btn-success mb-2":"btn btn-danger mb-2";

	return resultado;
}

function comprobarNombreEmpleado(){
    let nombre = formSala.nombreEmpleado;

    let resultado = nombre.value!=="";

    cambiarApariencia(nombre, resultado);

    return resultado;
}

function cambiarApariencia(campo, estado){	
	if(estado){
		campo.classList.remove("border-danger");
		campo.classList.add("border-success");
		campo.parentNode.nextElementSibling.style.visibility = 'hidden';
	}
	else{
		campo.classList.remove("border-success");
		campo.classList.add("border-danger");
		campo.parentNode.nextElementSibling.style.visibility = 'visible';
	}
		
}