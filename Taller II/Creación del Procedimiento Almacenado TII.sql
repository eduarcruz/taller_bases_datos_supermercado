-- Creamos el Procedimiento Almacenado para actualizar el inventario
CREATE OR REPLACE PROCEDURE sp_actualizar_stock(
    p_producto_id INT,
    p_nuevo_stock INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    -- Actualizamos el stock del producto
    -- (Esto activará automáticamente el trigger 'tr_vigilar_stock' del taller anterior)
    UPDATE productos
    SET stock_actual = p_nuevo_stock
    WHERE producto_id = p_producto_id;

    -- Validamos si el producto realmente existía
    IF NOT FOUND THEN
        RAISE EXCEPTION 'El producto con ID % no existe en la base de datos.', p_producto_id;
    END IF;

    COMMIT;
END;
$$;