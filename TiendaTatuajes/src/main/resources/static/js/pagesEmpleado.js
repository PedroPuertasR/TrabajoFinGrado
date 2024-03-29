let $table = document.getElementById("tablaEmpleados"),
$n = 11,
$rowCount = $table.rows.length,
$firstRow = $table.rows[0].firstElementChild.tagName,
$hasHead = ($firstRow === "TH"),
$tr = [],
$i,$ii,$j = ($hasHead)?1:0,
$th = ($hasHead?$table.rows[(0)].outerHTML:"");
let $pageCount = Math.ceil($rowCount / $n);

if ($pageCount > 1) {
		for ($i = $j,$ii = 0; $i < $rowCount; $i++, $ii++)
		$tr[$ii] = $table.rows[$i].outerHTML;
		$table.insertAdjacentHTML("afterend","<div id='buttons'></div");
		sort(1);
}

function sort($p) {
	let $rows = $th,$s = (($n * $p)-$n);
	for ($i = $s; $i < ($s+$n) && $i < $tr.length; $i++)
		$rows += $tr[$i];
	
		$table.innerHTML = $rows;
		document.getElementById("buttons").innerHTML = pageButtons($pageCount,$p);
		document.getElementById("id"+$p).setAttribute("class","active");
}


function pageButtons($pCount,$cur) {
	let	$prevDis = ($cur == 1)?"disabled":"",
		$nextDis = ($cur == $pCount)?"disabled":"",
		$buttons = "<input class='boton-pag' type='button' value='<< Anterior' onclick='sort("+($cur - 1)+")' "+$prevDis+">";
	for ($i=1; $i<=$pCount;$i++)
		$buttons += "<input class='boton-pag' type='button' id='id"+$i+"'value='"+$i+"' onclick='sort("+$i+")'>";
	$buttons += "<input class='boton-pag' type='button' value='Siguiente >>' onclick='sort("+($cur + 1)+")' "+$nextDis+">";
	return $buttons;
}