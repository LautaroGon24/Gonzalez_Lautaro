//EJERCICIO 4
var num = prompt("Ingrese un número")
function numPar(num) {
if (num%2 === 0) {
return document.querySelector('#header').innerHTML = ('Es PAR');
} else {
return document.querySelector('#header').innerHTML = ('Es IMPAR');
}
}
console.log(numPar(num));
