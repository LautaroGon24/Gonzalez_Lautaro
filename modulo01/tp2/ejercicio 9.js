//EJERCICIO 9
var cantNotas = prompt('Ingrese cantidad de notas a promediar')
var suma=0;
var promedio=0;
for(var i=1;i<= cantNotas ;i++){
let nota = parseInt(prompt('ingresar nota: ' + i));
suma+= nota
}
promedio = suma / 3;
if(promedio<6){
document.write('alumno reprobado, su promedio es ' + promedio);
} else if(promedio<9){
document.write('alumno aprobado, su promedio es ' + promedio);
} else{
document.write('alumno sobresaliente, su promedio ' + promedio);
}
