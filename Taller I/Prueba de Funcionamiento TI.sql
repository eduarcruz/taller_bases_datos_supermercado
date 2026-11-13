-- Simulamos la venta bajando el stock del producto 1 de 120 a 110
UPDATE productos
SET stock_actual = 110
WHERE producto_id = 1;

-- Consultamos la tabla de movimientos para ver el resultado automático
SELECT * FROM log_movimientos_stock;