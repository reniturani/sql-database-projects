-- Proyecto: Digital Solutions
-- Archivo: tables.sql
-- Descripción: Creación de tablas, claves primarias y claves foráneas
-- del sistema de gestión de la empresa
USE empresa; 

CREATE TABLE departamentos (
  codigo INT PRIMARY KEY,
  nombre VARCHAR(60) NOT NULL,
  dni_director INT NULL,
  fecha_inicio_director DATE NULL);

CREATE TABLE empleados (
  dni INT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido VARCHAR(100) NOT NULL,
  fecha_nacimiento DATE NULL,
  direccion VARCHAR(150) NULL,
  salario DECIMAL(10,2) NOT NULL,
  dni_jefe INT NULL,
  departamento_codigo INT NOT NULL,
  CONSTRAINT fk_jefe FOREIGN KEY (dni_jefe) REFERENCES empleados (dni),
  CONSTRAINT fk_depto FOREIGN KEY (departamento_codigo) REFERENCES departamentos (codigo));

ALTER TABLE departamentos ADD CONSTRAINT fk_director_dni FOREIGN KEY (dni_director) REFERENCES empleados (dni);


CREATE table proyectos (
numero INT PRIMARY KEY,
nombre VARCHAR(100),
lugar VARCHAR(100),
departamento_codigo INT NOT NULL,
FOREIGN KEY (departamento_codigo) REFERENCES departamentos(codigo)
); 
CREATE table trabaja_en(
dni_empleado INT,
proyecto_numero INT,
horas INT,
PRIMARY KEY (dni_empleado, proyecto_numero),
FOREIGN KEY (dni_empleado) REFERENCES empleados(dni),
FOREIGN KEY (proyecto_numero) REFERENCES proyectos(numero)
); 
CREATE table familiares(
dni_empleado INT, 
nombre_familiar VARCHAR(100),
fecha_nacimiento DATE NOT NULL,
parentesco VARCHAR(150) NOT NULL,
PRIMARY KEY(dni_empleado, nombre_familiar),
FOREIGN KEY (dni_empleado) REFERENCES empleados(dni)
); 



 
