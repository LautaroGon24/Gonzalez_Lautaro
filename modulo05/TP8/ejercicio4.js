const fs = require('fs');
const rawdata = fs.readFileSync('./personas.json', 'utf8');
var persona = JSON.parse(rawdata);


function getNombre (array) {
    for(var i=0;i<array['personas'].length;i++){
        let arrays = array['personas'][i]['Localidad'];
        if (array['personas'][i]['Localidad'] === 'Posadas'){
           console.log(array['personas'][i]['nombre'] + ' ' + array['personas'][i]['apellido'] );
    }
  }
}
getNombre(persona);