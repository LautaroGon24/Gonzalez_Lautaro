'use strict';
const fs = require('fs');
fs.readFile('personas.json', (err, data) => {
if (err) throw err;
console.log(JSON.stringify(data));
console.log(data);
});
//¿Qué sucede cuando utilizamos JSON.stringify? me devuelve el json con una serie de numeros.
//¿Qué sucede? agregando console.log(data) devuelve una serie de números.