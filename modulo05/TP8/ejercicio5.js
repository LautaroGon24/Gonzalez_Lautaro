const fs = require('fs');
const rawdata = fs.readFileSync('./departamentos.json', 'utf8');
var departamento = JSON.parse(rawdata);


let empleado = []
let array = departamento.Tecnología;
for (item of array){
  empleado.push(item.nombre + ' ' + item.puesto);
}
console.log(empleado)