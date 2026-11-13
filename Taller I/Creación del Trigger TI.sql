DROP TRIGGER IF EXISTS tr_vigilar_stock ON productos;

CREATE TRIGGER tr_vigilar_stock
AFTER UPDATE ON productos
FOR EACH ROW
EXECUTE FUNCTION fn_registrar_movimiento_stock();