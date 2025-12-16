USE tienda ; 
CREATE TABLE productos (
codigo_producto INT AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DECIMAL(10,2) NOT NULL,
stock INT NOT NULL
); 
CREATE TABLE ventas ( 
id INT AUTO_INCREMENT PRIMARY KEY ,
codigo_producto INT ,
FOREIGN KEY (codigo_producto) REFERENCES productos(codigo_producto) , 
cantidad INT NOT NULL,
total DECIMAL(10,2) DEFAULT 0,
fecha_venta DATE NOT NULL
); 