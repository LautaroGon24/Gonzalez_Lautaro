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
b.length})) ;
