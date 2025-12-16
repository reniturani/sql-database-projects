USE tienda ;
INSERT INTO Productos (nombre, precio, stock) VALUES
('Camiseta Básica', 19.99, 50),
('Pantalón Vaquero', 39.99, 30),
('Chaqueta de Cuero', 99.99, 20);

-- Insertar ventas
INSERT INTO Ventas (codigo_producto, cantidad, total, fecha_venta) VALUES
(1, 2, 39.98, '2023-10-01'),  -- Camiseta Básica
(2, 1, 39.99, '2023-10-02'),  -- Pantalón Vaquero
(3, 1, 99.99, '2023-10-03'),  -- Chaqueta de Cuero
(1, 3, 59.97, '2023-10-04'),  -- Camiseta Básica
(1, 1, 0, '2024-10-05'),  -- Camiseta Básica
(2, 1, 0, '2025-10-06'),  -- Pantalón Vaquero
(3, 1, 0, '2025-10-07'),  -- Chaqueta de Cuero
(1, 2, 0, '2025-10-08'),  -- Camiseta Básica
(2, 1, 0, '2023-10-09'),  -- Pantalón Vaquero
(2, 2, 0, '2024-10-05'),  -- Pantalón Vaquero
(3, 1, 99.99, '2024-10-06'),  -- Chaqueta de Cuero
(1, 1, 19.99, '2024-10-07'),  -- Camiseta Básica
(2, 3, 119.97, '2024-10-08'), -- Pantalón Vaquero
(3, 1, 99.99, '2024-10-09'),  -- Chaqueta de Cuero
(1, 1, 19.99, '2024-10-10'),  -- Camiseta Básica
(2, 2, 79.98, '2024-10-11'),  -- Pantalón Vaquero
(3, 1, 99.99, '2025-10-12'),  -- Chaqueta de Cuero
(1, 3, 59.97, '2025-10-13'),  -- Camiseta Básica
(2, 1, 39.99, '2025-10-14'),  -- Pantalón Vaquero
(3, 1, 99.99, '2025-10-15');  -- Chaqueta de Cuero


