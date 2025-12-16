-- Proyecto: Digital Solutions
-- Archivo: consultas.sql
-- Descripción: Consultas SQL solicitadas en la consigna
USE empresa;
-- 1. Obtener los nombres y apellidos de todos los empleados.
SELECT empleados.nombre, empleados.apellido FROM empleados ;
-- 2. Mostrar los empleados que tienen un salario mayor a 3000 (usd).
SELECT empleados.nombre, empleados.dni FROM empleados WHERE empleados.salario > 3000 ; 
-- 3. Obtener los nombres de los proyectos que se desarrollan en La Plata.
SELECT proyectos.nombre FROM proyectos WHERE proyectos.lugar LIKE "%La Plata%";
-- 4. Mostrar los nombres de departamentos que tienen director asignado.
SELECT departamentos.nombre FROM departamentos WHERE departamentos.dni_director IS NOT NULL;
-- 5. Obtener los nombres de los empleados que no tienen jefe
SELECT empleados.nombre FROM empleados WHERE empleados.dni_jefe IS NULL;
-- 6. Listar los empleados que nacieron después del año 1990.
SELECT empleados.nombre, empleados.dni FROM empleados WHERE fecha_nacimiento > "1990-12-31";
-- 7. Mostrar los empleados cuyo apellido empiece con la letra 'G'.
SELECT empleados.nombre, empleados.apellido, empleados.dni FROM empleados WHERE empleados.apellido LIKE "G%";
-- 8. Listar los familiares que sean hijos (parentesco es 'hijo' o ‘hija’).
SELECT familiares.nombre_familiar FROM familiares WHERE familiares.parentesco LIKE "%hijo%" OR familiares.parentesco LIKE "%hija%";
-- 9. Listar el nombre de los empleados y el nombre del departamento donde trabajan.
SELECT empleados.nombre, departamentos.nombre 
FROM departamentos 
JOIN empleados ON departamentos.codigo = empleados.departamento_codigo;
-- 10. Mostrar los proyectos junto con el nombre del departamento que los supervisa.
SELECT proyectos.nombre, departamentos.nombre FROM departamentos JOIN proyectos ON departamentos.codigo = proyectos.departamento_codigo;
-- 11. Obtener los nombres de los proyectos que supervisa el departamento de Sistemas.
SELECT proyectos.nombre, departamentos.nombre
FROM departamentos 
JOIN proyectos ON departamentos.codigo = proyectos.departamento_codigo WHERE departamentos.nombre LIKE "%Sistemas%"; 
-- 12. Listar el nombre de cada empleado y el nombre de los proyectos en los que trabaja.
SELECT empleados.dni, empleados.nombre, proyectos.nombre
FROM empleados 
JOIN trabaja_en ON empleados.dni = trabaja_en.dni_empleado 
JOIN proyectos ON proyectos.numero = trabaja_en.proyecto_numero;
-- 13. Obtener los familiares de cada empleado (nombre del empleado y nombre del familiar). no lo habiamos hecho 
SELECT empleados.nombre AS empleado, familiares.nombre_familiar
FROM empleados
JOIN familiares ON empleados.dni = familiares.dni_empleado;
-- 14. Mostrar los empleados que están casados (familiares con parentesco ‘esposa’ o ‘esposo’)
SELECT empleados.dni, familiares.nombre_familiar, familiares.parentesco 
FROM empleados 
JOIN familiares ON empleados.dni = familiares.dni_empleado WHERE familiares.parentesco LIKE "%esposo%" or familiares.parentesco LIKE "%esposa%";
-- 15. Listar los empleados que trabajan en más de un proyecto (con DISTINCT). 
SELECT trabaja_en.dni_empleado 
FROM trabaja_en 
GROUP BY dni_empleado HAVING COUNT(DISTINCT proyecto_numero) > 1;
-- 16. Mostrar los empleados junto con las horas dedicadas en cada proyecto.
SELECT trabaja_en.dni_empleado, trabaja_en.proyecto_numero, trabaja_en.horas FROM trabaja_en ; 
-- 17. Listar el nombre de los proyectos donde trabaja algún empleado cuyo salario supere los 3000.
SELECT proyectos.nombre, empleados.dni, empleados.salario
FROM empleados JOIN trabaja_en ON empleados.dni = trabaja_en.dni_empleado
JOIN proyectos ON proyectos.numero = trabaja_en.proyecto_numero WHERE empleados.salario > 3000;
-- 18. Calcular el salario promedio de los empleados.
SELECT AVG(empleados.salario) AS promedio FROM empleados; 
-- 19. Obtener la cantidad total de familiares registrados en la base.
SELECT COUNT(nombre_familiar) AS cantidad_familiares FROM familiares;
-- 20. Mostrar la cantidad de proyectos en los que trabaja cada empleado.
SELECT trabaja_en.dni_empleado, COUNT(proyecto_numero) AS cantidadproyectos FROM trabaja_en GROUP BY trabaja_en.dni_empleado; 
-- 21. Listar la cantidad de empleados por departamento.
SELECT empleados.departamento_codigo, COUNT(empleados.dni) AS total_en_departamento FROM empleados GROUP BY empleados.departamento_codigo;
-- 22. Mostrar la cantidad de horas trabajadas en cada proyecto.
SELECT trabaja_en.proyecto_numero, SUM(horas) AS horas_por_proyecto FROM trabaja_en GROUP BY trabaja_en.proyecto_numero;
-- 23. Obtener el salario promedio por departamento.
SELECT empleados.departamento_codigo, AVG(salario) AS promedio_salario FROM empleados GROUP BY empleados.departamento_codigo; 
-- 24. Mostrar la cantidad de familiares por tipo de parentesco (hijo, esposa, etc.).
SELECT familiares.parentesco, COUNT(familiares.parentesco) AS cantidad_parentesco FROM familiares GROUP BY familiares.parentesco;
-- 25. Listar los departamentos que tengan más de 4 empleados.
SELECT empleados.departamento_codigo, COUNT(empleados.dni) AS total_en_departamento FROM empleados GROUP BY empleados.departamento_codigo
HAVING total_en_departamento > 4;
-- 26. Mostrar los proyectos donde la suma de horas trabajadas supere 1000.
SELECT trabaja_en.proyecto_numero, SUM(horas) AS horas_por_proyecto FROM trabaja_en GROUP BY trabaja_en.proyecto_numero 
HAVING horas_por_proyecto > 1000;
-- 27. Obtener los empleados que trabajen en más de 2 proyectos.
SELECT trabaja_en.dni_empleado, COUNT(proyecto_numero) AS proyectos_por_persona FROM trabaja_en GROUP BY trabaja_en.dni_empleado
HAVING proyectos_por_persona > 2;
-- 28. Listar los tipos de parentesco con más de 3 familiares registrados.
SELECT familiares.parentesco, COUNT(familiares.parentesco) AS cantidad_por_parentesco FROM familiares GROUP BY familiares.parentesco
HAVING cantidad_por_parentesco > 3;