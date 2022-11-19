'use strict';
let jsonData = require('./personas.json');
//console.log(jsonData);
console.log(JSON.stringify(jsonData));

//¿Qué sucede cuando utilizamos JSON.stringify? ordena todo el json en una sola linea
//Por que? json.stringify convierte un objeto o valor de JavaScript en una cadena de texto JSON. 

console.log(JSON.parse(jsonData));
//¿Qué sucede cuando utilizamos JSON.parse? analisa el json.