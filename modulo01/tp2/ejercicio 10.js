//EJERCICIO 10
const meses = {
enero:31,
febrero:28,
marzo:31,
abril:30,
mayo:31,
junio:30,
julio:31,
agosto:31,
septiembre:30,
octubre:31,
noviembre:30,
diciembre:31
}
const mesesPorNumero = {
1:"enero",
2:"febrero",
3:"marzo",
4:"abril",
5:"mayo",
6:"junio",
7:"julio",
8:"agosto",
9:"septiembre",
10:"octubre",
11:"noviembre",
12:"diciembre"
}
var numMes = prompt ('Ingrese el número del mes que desea saber');
console.log(mesesPorNumero[numMes] + " tiene " + meses[mesesPorNumero[numMes]] + "
días.");
