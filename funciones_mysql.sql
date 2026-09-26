-- =========================================================
-- Actividad: Ejemplo de cada función de MySQL
-- Se usan datos reales de la tabla cliente para los ejemplos
-- (funciona igual en el schema empresa_retail o en el de ganado)
-- =========================================================

-- 1. REPLACE(str, cadena_buscar, cadena_reemplazo)
-- Reemplaza una parte de un texto por otra
SELECT cli_correo,
       REPLACE(cli_correo, '@', ' [arroba] ') AS correo_enmascarado
FROM cliente
LIMIT 5;

-- 2. REVERSE(str)
-- Invierte el orden de los caracteres de un texto
SELECT cli_nombre,
       REVERSE(cli_nombre) AS nombre_invertido
FROM cliente
LIMIT 5;

-- 3. RIGHT(str, n)
-- Devuelve los últimos n caracteres de un texto
SELECT cli_telefono,
       RIGHT(cli_telefono, 4) AS ultimos_4_digitos
FROM cliente
LIMIT 5;

-- 4. SPACE(n)
-- Devuelve una cadena con n espacios en blanco
SELECT CONCAT(cli_nombre, SPACE(5), cli_apellido) AS nombre_espaciado
FROM cliente
LIMIT 5;

-- 5. SUBSTR(str, posicion, longitud)
-- Extrae una parte del texto (alias de SUBSTRING)
SELECT cli_ciudad,
       SUBSTR(cli_ciudad, 1, 3) AS abreviatura_ciudad
FROM cliente
LIMIT 5;

-- 6. SUBSTRING(str, posicion, longitud)
-- Igual que SUBSTR, extrae una parte del texto
SELECT cli_fecha_registro,
       SUBSTRING(cli_fecha_registro, 1, 4) AS anio_registro
FROM cliente
LIMIT 5;

-- 7. UPPER(str)
-- Convierte el texto a mayúsculas
SELECT cli_nombre,
       UPPER(cli_nombre) AS nombre_mayusculas
FROM cliente
LIMIT 5;

-- 8. CONCAT(str1, str2, ...)
-- Une varios textos en uno solo
SELECT CONCAT(cli_nombre, ' ', cli_apellido, ' - ', cli_ciudad) AS cliente_completo
FROM cliente
LIMIT 5;

-- 9. FIELD(str, valor1, valor2, ...)
-- Devuelve la posición (índice) del texto dentro de una lista de valores
SELECT cli_ciudad,
       FIELD(cli_ciudad, 'Popayán', 'Cali', 'Bogotá', 'Medellín', 'Pasto') AS posicion_en_lista
FROM cliente
LIMIT 5;

-- 10. FORMAT(numero, decimales)
-- Da formato a un número con separador de miles y n decimales
SELECT cam_nombre,
       cam_presupuesto,
       FORMAT(cam_presupuesto, 2) AS presupuesto_formateado
FROM campania
LIMIT 5;

-- 11. LCASE(str)
-- Convierte el texto a minúsculas (alias de LOWER)
SELECT cli_correo,
       LCASE(cli_correo) AS correo_minusculas
FROM cliente
LIMIT 5;

-- 12. LEFT(str, n)
-- Devuelve los primeros n caracteres de un texto
SELECT cli_nombre,
       LEFT(cli_nombre, 3) AS iniciales
FROM cliente
LIMIT 5;

-- 13. LENGTH(str)
-- Devuelve la longitud (en bytes) de un texto
SELECT cli_correo,
       LENGTH(cli_correo) AS longitud_correo
FROM cliente
LIMIT 5;

-- 14. LOWER(str)
-- Convierte el texto a minúsculas
SELECT cli_apellido,
       LOWER(cli_apellido) AS apellido_minusculas
FROM cliente
LIMIT 5;

-- 15. REPEAT(str, n)
-- Repite un texto n veces
SELECT cli_nombre,
       REPEAT('*', 10) AS separador,
       REPEAT(cli_nombre, 2) AS nombre_repetido
FROM cliente
LIMIT 5;
