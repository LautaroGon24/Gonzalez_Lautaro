const meses = {
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
var val1 = prompt('Ingrese un número y le devolverá el mes correspondiente', '...');

if (val1 <= 12){
  console.log(meses[val1]);
} else {
  console.log('Ingrese un valor entre 1 - 12');
}

document.querySelector('#header').innerHTML = meses[val1];
