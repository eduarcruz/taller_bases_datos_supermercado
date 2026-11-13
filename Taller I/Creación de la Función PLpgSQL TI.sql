CREATE OR REPLACE FUNCTION fn_registrar_movimiento_stock()
RETURNS TRIGGER AS $$
BEGIN
    IF OLD.stock_actual <> NEW.stock_actual THEN
        INSERT INTO log_movimientos_stock (producto_id, tipo_movimiento, cantidad_afectada)
        VALUES (
            NEW.producto_id,
            CASE
                WHEN NEW.stock_actual > OLD.stock_actual THEN 'ENTREGA_INVENTARIO'
                ELSE 'VENTA_ONLINE'
            END,
            ABS(NEW.stock_actual - OLD.stock_actual)
        );
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;