-- 1. Verificamos que el producto 1 haya actualizado su stock a 105
SELECT * FROM productos WHERE producto_id = 1;

-- 2. Verificamos que el trigger haya insertado automáticamente el movimiento de venta/ajuste en el log
SELECT * FROM log_movimientos_stock ORDER BY fecha_movimiento DESC;