DROP TABLE IF EXISTS log_movimientos_stock CASCADE;
DROP TABLE IF EXISTS productos CASCADE;

CREATE TABLE productos (
    producto_id SERIAL PRIMARY KEY,
    nombre_producto VARCHAR(100) NOT NULL,
    precio NUMERIC(10,2) NOT NULL,
    stock_actual INT NOT NULL
);

CREATE TABLE log_movimientos_stock (
    movimiento_id SERIAL PRIMARY KEY,
    producto_id INT NOT NULL,
    tipo_movimiento VARCHAR(20) NOT NULL,
    cantidad_afectada INT NOT NULL,
    fecha_movimiento TIMESTAMP DEFAULT NOW(),
    CONSTRAINT fk_producto_movimiento
        FOREIGN KEY (producto_id)
        REFERENCES productos(producto_id)
        ON DELETE CASCADE
);