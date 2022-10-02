//EJERCICIO 1
var verdadero, char
var valores = [verdadero, false, 2, "hola","mundo", 3, char];
var strings = [];

for(let i=0; i < valores.length; i++ ){
if(typeof valores[i] ==="string"){
strings.push (valores[i])
}
}
console.log(" Ordenamiento de menor a mayor: " + strings.sort(function(a, b){return a.length -
b.length}));

var numeros = valores.filter(Number);
var suma = numeros[0] + numeros[1];
var resta = numeros[0] - numeros[1];
var producto = numeros[0] * numeros[1];
var division = numeros[0] / numeros[1];
console.log("Aplicación de operaciones para los siguientes valores " + numeros + " : la suma es
" + suma + ", resta es " + resta + ", producto es " + producto + ", division es " + division);
