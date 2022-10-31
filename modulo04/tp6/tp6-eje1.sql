-- 1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia). Tener en cuenta que:
-- ●En un país hay muchas provincias.
-- ●En una provincia hay muchas localidades.
 
 CREATE TABLE `elsistema`.`paises` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nombre` VARCHAR(45) NOT NULL,
   `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

  CREATE TABLE `elsistema`.`provincias` (
  `id` INT NOT NULL AUTO_INCREMENT,
    `nombre` VARCHAR(45) NOT NULL,
   `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
   `idpais` INT NOT NULL references paises(id),
  PRIMARY KEY (`id`));
   
 alter table elsistema.provincias add foreign key(idpais) references elsistema.paises(id); 

   CREATE TABLE `elsistema`.`localidades` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nombre` VARCHAR(45) NOT NULL,
   `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
   `cp` VARCHAR(45) NOT NULL,
   `id_provincia` INT NOT NULL references provincias(id),
   PRIMARY KEY (`id`));
  
 alter table elsistema.localidades add foreign key(id_provincia) references elsistema.provincias(id); 
 
 -- 2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
-- ● direccion (varchar)
-- ● id_localidad (pk localidad) –Esta es un relación con la tabla localidades
-- ● email
-- ● telefono
-- ● fecha_ingreso
-- ● tms (timestamp)

alter table elsistema.empleados add `direccion` varchar(45),
add `id_localidad` int NOT NULL references localidades(id),
add `email` varchar(45),
add `telefono` varchar(45),
add `fecha_ingreso` date,
add `tms` timestamp;

alter table elsistema.empleados add foreign key(id_localidad) references elsistema.localidades(id);

-- 3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos:
-- ● gasto (double)
-- ● tms (timestamp) 

alter table departamentos add `gasto` double,
add `tms` timestamp;
 
alter table elsistema.departamentos add foreign key(id_localidad) references elsistema.localidades(id);

-- 4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos, empleados.

INSERT INTO paises (id, nombre, estado)
VALUES ('1', 'Argentina', 'A'),
('2', 'Brasil', 'A'),
('3', 'Paraguay', 'A'),
('4', 'Chile', 'A'),
('5', 'Uruguay', 'A');

INSERT INTO provincias (id, nombre, estado, idpais)
VALUES ('1', 'Misiones', 'A', '1'),
('2', 'Corrientes', 'A', '1'),
('3', 'Entre Rios', 'A', '1'),
('4', 'Ciudad de Buenos Aires', 'A', '1'),
('5', 'Itapúa', 'A', '3');

INSERT INTO localidades (id, nombre, estado, cp, id_provincia)
VALUES ('1', 'Posadas', 'A', '3300', '1'),
('2', 'Obera', 'A', '3360', '1'),
('3', 'Puerto Iguazu', 'A', '3370', '1'),
('4', 'Encarnación', 'A', '6000', '5'),
('5', 'Parana', 'A', '3100', '3');

INSERT INTO departamentos (iddepartamento, nombre, presupuesto, estado, id_localidad, gasto)
VALUES ('1', 'Ventas', '100000', '1', '1', '5000'),
('2', 'Marketing', '50000', '1', '1', '2000'),
('3', 'Producción', '200000', '1', '2', '3000'),
('4', 'Finanzas', '50000', '1', '1', '5000'),
('5', 'Compras', '200000', '1', '2', '3000');

alter table empleados rename column idemplaedo TO idempleado;

INSERT INTO empleados (idempleado, cuil_cuit, nombre, apellido, id_departamento, estado, direccion, id_localidad, email, telefono, fecha_ingreso)
VALUES ('1', '20-4567-3', 'Eduardo', 'Gonzalez', '1', '1', 'Francisco de Haro 4111', '1', 'Edugonventas@gmail.com', '345677', '2015-01-15'),
('2', '20-54666-4', 'Jose', 'Ramirez', '2', '1', '3 de Febrero 2340', '2', 'Ramirez_josemarketing@gmail.com', '434356', '2019-03-19'),
('3', '20-87908-4', 'Alicia', 'Villa', '4', '1', 'San Martin 3002', '1', 'Aliciavillafinanzas@gmail.com', '232345', '2017-02-25'),
('4', '20-34569-3', 'Carla', 'Garcia', '5', '1', 'Jose Ingenieros 421', '2', 'Garciacarlacompras@gmail.com', '366637', '2017-06-15'),
('5', '20-77889-4', 'Jorge', 'Lopez', '3', '1', 'Sarmiento 360', '2', 'Lopezjor@gmail.com', '232456', '2021-01-10');

 -- 5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE 
 ALTER TABLE pedidos RENAME movimientos;
 
 -- 6. Agregar las entidades:
-- ● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
-- ● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
-- ● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica), cuit,id_localidad fk, estado,tms)
-- ● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)
-- Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos. Un proveedor está en una localidad.
 
  CREATE TABLE `elsistema`.`marcas` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nombre` VARCHAR(45) NOT NULL,
   `descripcion` VARCHAR(45),
   `imagen` varchar(100),
   `id_proveedor` int,
   `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
   `tms` timestamp,
   PRIMARY KEY (`id`));
 
 CREATE TABLE `elsistema`.`productos` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `nombre` VARCHAR(45) NOT NULL,
   `descripcion` VARCHAR(45),
   `id_marca` INT NOT NULL references marcas(id),
   `stock` int,
   `precio` int,
   `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
   `tms` timestamp,
   PRIMARY KEY (`id`));
   
   CREATE TABLE `elsistema`.`proveedores` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `razon_social` VARCHAR(45) NOT NULL,
   `nombre` VARCHAR(45) NOT NULL,
   `apellido` VARCHAR(45) NOT NULL,
   `naturaleza` VARCHAR(45),
   `cuit` varchar(15),
   `id_localidad` INT NOT NULL references localidades(id),
   `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
   `tms` timestamp,
   PRIMARY KEY (`id`));
   
   alter table elsistema.proveedores add foreign key(id_localidad) references elsistema.localidades(id);
   alter table elsistema.productos add foreign key(id_marca) references elsistema.marcas(id);
   alter table elsistema.marcas add foreign key(id_proveedor) references elsistema.proveedores(id);
   
   CREATE TABLE `elsistema`.`cajas` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `horainicio` datetime,
   `horacierre` datetime,
   `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
   `tms` timestamp,
   PRIMARY KEY (`id`));
   
-- 7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.

INSERT INTO marcas (id, nombre, descripcion, id_proveedor, estado)
VALUES ('1', 'Cordones', 'cordones de zapatos negros', '1', 'A'),
('2', 'cuero', 'cuero vacuno', '4', 'A'),
('3', 'suela', 'suela de goma', '3', 'A'),
('4', 'hilo', 'hilo blanco', '4', 'A'),
('5', 'pegamento', 'pegamento de contacto', '2', 'A');

INSERT INTO productos (id, nombre, descripcion, id_marca, stock, precio, estado)
VALUES ('1', 'cordones negros', 'cordones de zapatos negros', '1', '500', '200', 'A'),
('2', 'cuero marron', 'cuero vacuno', '4', '2000', '2000', 'A'),
('3', 'suela goma', 'suela de goma', '3', '500', '500', 'A'),
('4', 'hilo cocer', 'hilo blanco', '4', '200', '100', 'A'),
('5', 'pegamento', 'pegamento de contacto', '2', '50', '100', 'A');

INSERT INTO proveedores (id, razon_social, nombre, apellido, cuit, id_localidad, estado)
VALUES ('1', 'cordones negros s.a', 'Pedro', 'Ramirez', '20-202020-3', '2', 'A'),
('2', 'Poxi s.r.l', 'Hugo', 'Rivero', '20-244025-3', '2', 'A'),
('3', 'el rey de la goma s.a', 'Carlos', 'Gimenez', '20-192250-4', '1', 'A'),
('4', 'todo cueros s.a', 'Cecilia', 'Bosch', '20-274520-4', '3', 'A'),
('5', 'La cuerina s.r.l', 'Jorge', 'Bianchi', '20-204433-3', '3', 'A');

INSERT INTO cajas (id, horainicio, horacierre, estado)
VALUES ('1', '2020-01-04 06:00:00', '2020-01-04 15:00:00', 'A'),
('2', '2020-01-05 06:00:00', '2020-01-05 15:00:00', 'A'),
('3', '2020-02-04 06:00:00', '2020-01-04 15:00:00', 'A'),
('4', '2021-03-05 06:00:00', '2021-03-05 15:00:00', 'A'),
('5', '2022-01-06 06:00:00', '2022-01-06 15:00:00', 'A');

-- 8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.

 select elsistema.departamentos.nombre, elsistema.departamentos.presupuesto, elsistema.departamentos.presupuesto - elsistema.departamentos.gasto as 'Diferencia' from elsistema.departamentos where departamentos.estado = '1';

-- 9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad

select elsistema.localidades.nombre as 'localidad', elsistema.paises.nombre as 'Pais' from elsistema.localidades inner join	elsistema.provincias on localidades.id_provincia = provincias.id inner join elsistema.paises on provincias.idpais = paises.id order by elsistema.paises.nombre asc;

-- 10. Modificar (UPDATE):
-- ● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
-- ● el fecha_ingreso y la localidad de otro empleado.

UPDATE empleados SET empleados.telefono = '123456' WHERE empleados.idempleado = 1;

UPDATE empleados SET empleados.fecha_ingreso = '2017-04-20', empleados.id_localidad = '4' WHERE empleados.idempleado = 3;

-- 11. Insertar 5 vendedores.
INSERT INTO vendedores (id, nombre, apellido, cuitcuil, comisión)
VALUES ('1', 'Daniel', 'Saez', '24-38481296-3', '0.15'),
('2', 'Juan', 'Gomez', '20-39231523-3', '0.13'),
('3', 'Diego', 'Flores', '20-38481221-3', '0.11'),
('4', 'Marta', 'Herrera', '27-40481736-1', '0.14'),
('5', 'Antonia', 'Carretero', '20-31481370-7', '0.12');

-- 12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado, tms(timestamp), tipo_movimiento (ingreso, egreso, pedido)
alter table elsistema.movimientos add `estado` VARCHAR(45) NOT NULL DEFAULT 'A',
add `id_producto` int NOT NULL references productos(id),
add `tipo_movimiento` varchar(7),
add `tms` timestamp;

alter table elsistema.movimientos add foreign key(id_producto) references elsistema.productos(id);

-- 13. Insertar 5 movimientos distintos.
INSERT INTO clientes (id, nombre, apellido, cuitcuil, ciudad)
VALUES ('1', 'Manuel', 'Dominguez', '20-29876342-3', 'Posadas'),
('2', 'Antonio', 'Vega', '20-32521596-3', 'Apostoles'),
('3', 'Alfredo', 'Ruiz', '20-42436477-3', 'Corrientes'),
('4', 'Marta', 'Gallardo', '24-44484730-2', 'Santo Tome'),
('5', 'Maria', 'Santos', '22-31501355-7', 'San Salvador');

INSERT INTO movimientos (id, cantidad, fecha, id_cliente, id_vendedor, estado, id_producto, tipo_movimiento)
VALUES ('1', '200', '2019-01-10', '1', '1', 'A', '1', 'Pedido'),
('2', '200', '2019-01-17', '1', '1', 'A', '1', 'Egreso'),
('3', '300', '2019-02-11', '3', '2', 'A', '3', 'Pedido'),
('4', '300', '2019-02-18', '3', '2', 'A', '3', 'Egreso'),
('5', '50', '2019-02-20', '1', '1', 'A', '1', 'Ingreso');

-- 14. Borrar lógicamente (UPDATE de la columna estado):
-- ● 2 movimientos que fueron cargados mal
-- ● un pais que tenga al menos 3 localidades

UPDATE movimientos SET movimientos.estado = 'B' WHERE movimientos.id = 1;
UPDATE movimientos SET movimientos.estado = 'B' WHERE movimientos.id = 2;

UPDATE paises SET paises.estado = 'B' WHERE paises.id = 1;

-- 15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.

-- insert de nuevos movimientos para realizar el punto.
INSERT INTO movimientos (id, cantidad, fecha, id_cliente, id_vendedor, estado, id_producto, tipo_movimiento)
VALUES ('6', '100', '2019-03-10', '3', '3', 'A', '4', 'Pedido'),
('7', '100', '2019-03-17', '3', '3', 'A', '4', 'Egreso'),
('8', '50', '2019-03-20', '3', '3', 'A', '4', 'Ingreso');

UPDATE productos SET productos.stock = '300' WHERE productos.id = 1;
UPDATE productos SET productos.stock = '200' WHERE productos.id = 3;
UPDATE productos SET productos.stock = '350' WHERE productos.id = 1;
UPDATE productos SET productos.stock = '100' WHERE productos.id = 4;
UPDATE productos SET productos.stock = '150' WHERE productos.id = 4;

-- 16. Crear la tabla parametros (id, tms,cosas(json), id_usuario.

CREATE TABLE `elsistema`.`parametros` (
   `id` INT NOT NULL AUTO_INCREMENT,
   `tms` timestamp,
   `cosas` json,
   `id_usuario` INT NOT NULL references usuarios(id),
  PRIMARY KEY (`id`));
  
-- 17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
-- ● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
-- ● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}
-- ● {"zonaHoraria": "America/Argentina/BuenosAires"}
-- ● {"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}
-- ● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}
-- Nota: Rellenar a criterio los campos id, tms, id_usuario.

INSERT INTO parametros (`id`, `cosas`, `tms`, `id_usuario`)
VALUES ('1', '{"idDeLaCosa": 101, "permisos": "PUT, GET"}', '2020-01-09 09:02:07', '1');
INSERT INTO parametros (`id`, `cosas`, `tms`, `id_usuario`)
VALUES ('2', '{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente","grupo": "ventas"}', '2020-01-09 09:05:07', '1');
INSERT INTO parametros (`id`, `cosas`, `tms`, `id_usuario`)
VALUES ('3', '{"zonaHoraria": "America/Argentina/BuenosAires"}', '2020-01-09 09:07:07', '1');
INSERT INTO parametros (`id`, `cosas`, `tms`, `id_usuario`)
VALUES ('4', '{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}', '2020-01-09 09:10:07', '1');
INSERT INTO parametros (`id`, `cosas`, `tms`, `id_usuario`)
VALUES ('5', '{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso": "3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso": "31634912,57","egreso": "9757142,66"}}}', '2020-01-09 09:15:07', '1');
