## Proyecto Base de Datos – Tienda de Ropa

Proyecto integrador de SQL / MySQL que modela la base de datos de una tienda de ropa, permitiendo registrar productos, ventas y gestionar automáticamente el stock.
El objetivo principal del proyecto es practicar el diseño de bases de datos relacionales y el uso de procedimientos almacenados, triggers y cursores a partir de una consigna académica.

## Modelo de datos

La base de datos contempla:
Productos con precio y stock disponible
Ventas asociadas a productos
Registro de múltiples ventas por producto
Actualización automática del stock al realizar una venta
Corrección de ventas erróneas mediante un procedimiento con cursor

## Archivos del proyecto
database.sql → creación de la base de datos
tablas.sql → definición de tablas, claves primarias y foráneas
inserts.sql → carga de datos iniciales (productos y ventas de prueba)
consultas.sql → consultas con sus respectivas consignas 

## Funcionalidades implementadas
Creación de tablas con relaciones entre productos y ventas
Registro de ventas mediante procedimiento almacenado
Inserción automática de la fecha de venta con CURDATE()
Actualización del stock de productos mediante trigger
Corrección de ventas con total incorrecto usando cursores
Procedimientos almacenados
Triggers
Cursores
Funciones de fecha (CURDATE())

## Tecnologías
MySQL
SQL estándar

## Estado del proyecto
Proyecto académico finalizado, utilizado como práctica de bases de datos relacionales.
