//EJERCICIO 5
var texto = prompt ('Escribir algo');
function analisisTexto(texto) {
if (texto === texto.toUpperCase()) {
return document.querySelector('#header').innerHTML = ('El texto está en mayúsculas');
}else if (texto === texto.toLowerCase()) {
return document.querySelector('#header').innerHTML = ('El texto está en minúsculas');
}else {
return document.querySelector('#header').innerHTML = ('El texto es una combinación de
minúsculas y mayúsculas');
}
}
console.log(analisisTexto(texto));
