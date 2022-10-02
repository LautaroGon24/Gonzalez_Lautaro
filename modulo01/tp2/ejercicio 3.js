//EJERCICIO 3
var num = prompt("ingrese un número a factorizar")
function factorizar(num) {
if (num === 0 || num === 1)
return 1;
for (var i = num - 1; i >= 1; i--) {
num *= i;
}
return num;
}
document.querySelector('#header').innerHTML = factorizar(num)
console.log(factorizar(num));
