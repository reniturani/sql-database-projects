USE tienda ;
DROP PROCEDURE IF EXISTS registrarventa ;
DROP TRIGGER IF EXISTS actualizarstock ;
DROP PROCEDURE IF EXISTS corregirventas ;

-- Consulta 1: Realizar un procedimiento almacenado para registrar una nueva venta en el sistema. El procedimiento debe recibir tres parámetros de entrada:
-- i. codigo_producto ii. cantidad iii. total
-- Recordar utilizar CURDATE() para indicar la fecha de la venta.
DELIMITER $$
CREATE PROCEDURE registrarventa(IN codigo_producto INT, IN cantidad INT, IN total DECIMAL(10,2))
BEGIN 
INSERT INTO ventas(codigo_producto, cantidad, total, fecha_venta) 
VALUES (codigo_producto, cantidad, total, curdate()) ; 
END $$ 
DELIMITER ;

-- Consulta 2: Dar de alta las siguientes ventas por medio del procedimiento almacenado creado en el punto 3:
-- Camiseta Básica (Precio: 39.98), Cantidad: 2
-- Pantalón Vaquero (Precio: 39.99), Cantidad: 1
CALL registrarventa(1,2,39.98) ;
CALL registrarventa(2,1,39.99) ; 

-- Consulta 3: Hacer un trigger que se ejecute después de cualquier inserción de datos en la tabla Ventas. 
-- El objetivo es que se actualice automáticamente el stock en ‘Productos’ en función de la cantidad vendida.
DELIMITER $$
CREATE TRIGGER actualizarstock
AFTER INSERT ON Ventas
FOR EACH ROW
BEGIN
    UPDATE Productos
    SET stock = stock - NEW.cantidad
    WHERE codigo_producto = NEW.codigo_producto;
END$$
DELIMITER ;

-- Consulta 4: Por un error inesperado en el sistema, se insertaron ventas con el total igual a 0 en los productos con id entre 5 y 10. 
-- Utilizar un procedimiento almacenado con cursor para lo siguiente:
-- Los parámetros de entrada del procedimiento son el ID de venta de inicio y el ID de venta de fin, y el valor final de la compra (ya que son el mismo
-- producto y la misma cantidad). El procedimiento debe actualizar el total de todas esas ventas y corregir la fecha de actualización al día de hoy.
DELIMITER $$
CREATE PROCEDURE corregirventas(
    IN p_id_inicio INT,
    IN p_id_fin INT,
    IN p_total DECIMAL(10,2)
)
BEGIN
    DECLARE v_id INT;
    DECLARE fin INT DEFAULT 0;
    DECLARE cursorventas CURSOR FOR
        SELECT id FROM Ventas
        WHERE id BETWEEN p_id_inicio AND p_id_fin;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;
    OPEN cursorventas;
    cursorloop: LOOP
        FETCH cursorventas INTO v_id;
        IF fin = 1 THEN
            LEAVE cursorloop;
        END IF;
        UPDATE Ventas
        SET total = p_total,
            fecha_venta = CURDATE()
        WHERE id = v_id;
    END LOOP cursorloop;
    CLOSE cursorventas;
END$$
DELIMITER ;

