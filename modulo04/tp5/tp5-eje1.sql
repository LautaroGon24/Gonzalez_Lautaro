-- Ejercicio 1 
-- 1. Lista el apellido de todos los empleados.
select apellido from empleados;
-- 2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
select distinctrow apellido from empleados;
-- 3. Lista todas las columnas de la tabla empleados.
select * from empleados;
-- 4. Lista el nombre y apellido de todos los empleados.
select nombre,apellido from empleados;
-- 5. Lista el cuit/cuil de los empleados que aparecen en la tabla empleados.
select cuil_cuit from empleados;
-- 6. Lista el nombre y apellido de los empleados en una única columna.
select concat_ws(' ', nombre, apellido) as Empleado from empleados;
-- 7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
select upper(concat_ws(' ', nombre, apellido)) as Empleado from empleados;
-- 8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
select lower(concat_ws(' ', nombre, apellido)) as Empleado from empleados;
-- 9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de formaascendente.
select nombre, presupuesto from departamentos order by presupuesto asc;
-- 10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
select nombre from departamentos order by nombre asc;
-- 11. Lista el nombre de todos los departamentos ordenados de forma descendente.
select nombre from departamentos order by nombre desc;
-- 12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
select apellido, nombre from empleados order by apellido, nombre asc;
-- 13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto desc limit 3;
-- 14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
select nombre, presupuesto from departamentos order by presupuesto asc limit 3;
-- 15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
select nombre, presupuesto from departamentos where presupuesto >= 150000;
-- 16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto > 100000 and presupuesto < 200000;
-- 17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto < 100000 or presupuesto > 200000;
-- 18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto between 100000 and 200000;
-- 19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
select nombre, presupuesto from departamentos where presupuesto not between 100000 and 200000;
-- 20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
select e.nombre, e.apellido, d.nombre from sistema.empleados e join sistema.departamentos d where e.id_departamento = d.iddepartamento; 
-- 21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
select e.nombre, e.apellido, d.nombre from sistema.empleados e join sistema.departamentos d where e.id_departamento = d.iddepartamento order by d.nombre, e.apellido, e.nombre asc;
-- 22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
select distinctrow d.iddepartamento, d.nombre from sistema.departamentos d join sistema.empleados e where d.iddepartamento = e.id_departamento;
-- 23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
select e.cuil_cuit, d.nombre from sistema.empleados e join sistema.departamentos d where e.id_departamento = d.iddepartamento and e.cuil_cuit= '27-38382980-3';
-- 24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
select concat_ws(' ', e.nombre, e.apellido) as Empleado, d.nombre as Departamento from sistema.empleados e join sistema.departamentos d where e.id_departamento = d.iddepartamento and e.nombre= 'Pepe' and e.apellido= 'Ruiz'; 
-- 25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
select  * from sistema.empleados inner join sistema.departamentos on  sistema.empleados.id_departamento = sistema.departamentos.iddepartamento where sistema.departamentos.nombre= 'I+D' order by sistema.empleados.apellido, sistema.empleados.nombre asc;
-- 26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
select * from sistema.empleados inner join sistema.departamentos on sistema.empleados.id_departamento = sistema.departamentos.iddepartamento where sistema.departamentos.nombre = 'Sistemas' or sistema.departamentos.nombre = 'Contabilidad' or sistema.departamentos.nombre = 'I+D' order by sistema.empleados.apellido, sistema.empleados.nombre asc;
-- 27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
select * from sistema.empleados inner join sistema.departamentos on sistema.empleados.id_departamento = sistema.departamentos.iddepartamento where sistema.departamentos.presupuesto not between 100000 and 200000;