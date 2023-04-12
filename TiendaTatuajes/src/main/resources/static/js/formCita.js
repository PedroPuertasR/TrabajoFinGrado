document.getElementById("cliente").addEventListener("blur", comprobarCliente);
document.getElementById("fecha").addEventListener("blur", comprobarFecha);
document.getElementById("zona").addEventListener("blur", comprobarZona);
document.getElementById("precioDisenio").addEventListener("blur", comprobarPrecioDisenio);
document.getElementById("descuento").addEventListener("blur", comprobarDescuento);
document.getElementById("tatuador").addEventListener("blur", comprobarTatuador);
document.getElementById("precioTotal").addEventListener("blur", comprobarPrecioTotal);

function revisarFormularioCitaAdmin(){
	let resultado = false;

	resultado = comprobarCliente &&
                comprobarFecha &&
                comprobarZona &&
                comprobarPrecioDisenio &&
                comprobarDescuento &&
                comprobarTatuador &&
                comprobarPrecioTotal;

	formularioCitaAdmin.enviar.className = resultado?"btn btn-success mb-2":"btn btn-danger mb-2";

	return resultado;
}

function comprobarCliente(){
    let nombre = formularioCitaAdmin.cliente;
    let resultado = nombre.value!=="";

    cambiarApariencia(cliente, resultado);

    return resultado;
}

function comprobarFecha(){
    let fecha = formularioCitaAdmin.fecha;

    let hoy = new Date(Date.now());

    hoy.setDate(hoy.getDate() - 1);

    let resultado = Date.parse(fecha.value) > hoy;

    cambiarApariencia(fecha, resultado);

    return resultado;
}

function comprobarZona(){
    let zona = formularioCitaAdmin.zona;

    let resultado = zona.value!=="";

    cambiarApariencia(zona, resultado);

    return resultado;
}

function comprobarPrecioDisenio(){
    let precio = formularioCitaAdmin.precioDisenio;
    let resultado = precio.value > 0 && !isNaN(precio.value);

    cambiarApariencia(precio, resultado);

    return resultado;
}

function comprobarDescuento(){
    let desc = formularioCitaAdmin.descuento;
    let resultado = desc.value >= 0 && desc.value <= 100 && !isNaN(desc.value) && desc.value !=="";

    cambiarApariencia(desc, resultado);

    return resultado;
}

function comprobarTatuador(){
    let tatuador = formularioCitaAdmin.tatuador;

    let resultado = zona.value!=="";

    cambiarApariencia(tatuador, resultado);

    return resultado;
}

function comprobarPrecioTotal(){
    let precio = formularioCitaAdmin.precioTotal;

    let resultado = precio.value > (-1) && !isNaN(precio.value);

    cambiarApariencia(precio, resultado);

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