document.getElementById("nombreZona").addEventListener("blur", comprobarNombreZona);
document.getElementById("precioFianza").addEventListener("blur", comprobarPrecioFianza);

function revisarFormZona(){
	let resultado = false;

	resultado = comprobarNombreZona &&
                comprobarPrecioFianza;

	formZona.enviar.className = resultado?"btn btn-success mb-2":"btn btn-danger mb-2";

	return resultado;
}

function comprobarNombreZona(){
    let nombre = formZona.nombreZona;
    let resultado = nombre.value !=="";

    cambiarApariencia(nombre, resultado);

    return resultado;
}

function comprobarPrecioFianza(){
    let precio = formZona.precioFianza;

    let resultado = precio.value > 20 && precio.value <= 100 && !isNaN(precio.value);

    cambiarApariencia(precio, resultado);

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