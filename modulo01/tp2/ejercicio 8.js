//EJERCICIO 8
function randomNum() {
var cantidadNumeros = 100;
var numeros = []
while(numeros.length < cantidadNumeros ){
var numeroAleatorio = Math.ceil(Math.random()*cantidadNumeros);
var existe = false;
for(var i=0;i<numeros.length;i++){
if(numeros[i] === numeroAleatorio){
  existe = true;
break;
}
}
if(!existe){
numeros[numeros.length] = numeroAleatorio;
}
}
return document.write("números aleatorios : " + numeros);
}
console.log(randomNum(numeros));
