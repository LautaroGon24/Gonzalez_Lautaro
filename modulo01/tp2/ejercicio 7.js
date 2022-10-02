//EJERCICIO 7
var texto = prompt('Ingrese texto')
function revesTexto(texto) {
return texto.split("").reverse().join("");
}
revesTexto(texto);
document.querySelector('#header').innerHTML = revesTexto(texto)
console.log(revesTexto(texto));
