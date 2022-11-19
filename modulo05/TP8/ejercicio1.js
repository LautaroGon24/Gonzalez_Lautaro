const fs = require('fs');
let rawdata = fs.readFileSync('./personas.json');
let persona = JSON.parse(rawdata);
console.log(persona);
console.log(JSON.stringify(rawdata));
//EJERCICIO 1: 
//¿Qué sucede cuando utilizamos JSON.stringify? el json.stringify me devuelve personas.json con una serie de números.
//¿Por qué? porque es un json, stringify convierte un javascript a json string.

//¿Qué sucede cuando utilizamos JSON.parse? el json.parse me devuelve el json con una serie de números.
//¿Por qué? json.parse deberia parsear el json a un objeto javascript