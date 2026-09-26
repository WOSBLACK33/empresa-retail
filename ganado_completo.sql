-- =========================================================
-- 1. CREACIÓN DE TABLAS
-- =========================================================

DROP TABLE IF EXISTS conversion;
DROP TABLE IF EXISTS interaccion;
DROP TABLE IF EXISTS campania;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS canal;

CREATE TABLE canal (
    can_id_canal INT AUTO_INCREMENT PRIMARY KEY,
    can_nombre   VARCHAR(100) NOT NULL,
    can_tipo     VARCHAR(50)  NOT NULL
);

CREATE TABLE campania (
    cam_id_campania     INT AUTO_INCREMENT PRIMARY KEY,
    cam_nombre          VARCHAR(150) NOT NULL,
    cam_presupuesto     DECIMAL(12,2) NOT NULL,
    cam_fecha_inicio    DATE NOT NULL,
    cam_fecha_final     DATE NOT NULL,
    canal_can_id_canal  INT NOT NULL,
    CONSTRAINT fk_campania_canal
        FOREIGN KEY (canal_can_id_canal) REFERENCES canal (can_id_canal)
);

CREATE TABLE cliente (
    cli_id_cliente      INT AUTO_INCREMENT PRIMARY KEY,
    cli_nombre          VARCHAR(100) NOT NULL,
    cli_apellido        VARCHAR(100) NOT NULL,
    cli_correo          VARCHAR(150) NOT NULL,
    cli_telefono        VARCHAR(20),
    cli_ciudad          VARCHAR(100),
    cli_fecha_registro  DATE NOT NULL
);

CREATE TABLE interaccion (
    int_id_interaccion       INT AUTO_INCREMENT PRIMARY KEY,
    int_tipo                 VARCHAR(50) NOT NULL,
    int_fecha                DATE NOT NULL,
    campania_cam_id_campania INT NOT NULL,
    cliente_cli_id_cliente   INT NOT NULL,
    CONSTRAINT fk_interaccion_campania
        FOREIGN KEY (campania_cam_id_campania) REFERENCES campania (cam_id_campania),
    CONSTRAINT fk_interaccion_cliente
        FOREIGN KEY (cliente_cli_id_cliente) REFERENCES cliente (cli_id_cliente)
);

CREATE TABLE conversion (
    con_id_conversion      INT AUTO_INCREMENT PRIMARY KEY,
    con_tipo               VARCHAR(50) NOT NULL,
    con_valor              DECIMAL(12,2) NOT NULL,
    con_fecha              DATE NOT NULL,
    cliente_cli_id_cliente INT NOT NULL,
    CONSTRAINT fk_conversion_cliente
        FOREIGN KEY (cliente_cli_id_cliente) REFERENCES cliente (cli_id_cliente)
);

-- =========================================================
-- 2. INSERCIÓN DE DATOS
-- =========================================================

-- TABLA CANAL
INSERT INTO canal (can_nombre, can_tipo) VALUES
('Facebook Ads', 'Red Social'),
('WhatsApp Business', 'Buscador'),
('Email Marketing', 'Email'),
('Valla', 'Buscador');

-- TABLA CAMPAÑAS
INSERT INTO campania (cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final, canal_can_id_canal) VALUES
('Remate de Novillos 2026', 250000, '2026-01-15', '2026-02-15', 1),
('Promoción Inseminación Artificial', 1200000, '2026-02-01', '2026-03-30', 2),
('Boletín Técnico Agro', 450000, '2026-01-01', '2026-12-31', 3),
('Lanzamiento Potrero Sur', 800000, '2026-03-01', '2026-04-15', 4),
('Subasta Elite Cauca', 450000, '2026-04-10', '2026-04-20', 1),
('Plan Vacunación Aftosa Ciclo I', 300000, '2026-05-01', '2026-06-15', 3),
('Descuento Fertilizantes Mayo', 120000, '2026-05-10', '2026-05-30', 2),
('Seminario Ganadería Sostenible', 850000, '2026-06-05', '2026-06-06', 1),
('Promo Inseminación Holstein', 2100000, '2026-06-15', '2026-07-15', 2),
('Venta Terneros de Levante', 3500000, '2026-07-01', '2026-08-01', 4),
('Día de Campo - Hacienda La Paz', 60000, '2026-07-20', '2026-07-21', 2),
('Oferta Silo de Maíz Premium', 180000, '2026-08-05', '2026-09-05', 1),
('Equipos de Ordeño Alfa', 5000000, '2026-08-15', '2026-09-30', 3),
('Genética Angus de Exportación', 750000, '2026-09-01', '2026-10-15', 1),
('Cursos Manejo de Pasturas', 400000, '2026-09-10', '2026-09-25', 3),
('Gran Remate de Estrellas', 1000000, '2026-10-01', '2026-10-10', 4),
('ExpoCebú 2026 - Stand Principal', 650000, '2026-11-15', '2026-11-25', 1),
('Alimento Balanceado Invierno', 280000, '2026-11-01', '2026-12-15', 2),
('Software de Gestión Agro 360', 150000, '2026-01-10', '2026-03-10', 3),
('Créditos Línea Blanca Agro', 900000, '2026-02-15', '2026-04-15', 2),
('Taurinas de Media Montaña', 320000, '2026-03-20', '2026-05-20', 4),
('Sal Mineralizada Plus', 110000, '2026-04-01', '2026-04-30', 1),
('Ruedas de Negocio Regional', 200000, '2026-05-15', '2026-05-17', 2),
('Festival del Queso y Leche', 130000, '2026-06-10', '2026-06-12', 3),
('Trazabilidad Animal 360', 700000, '2026-07-15', '2026-08-15', 1),
('Implementos para Cerca Eléctrica', 2400000, '2026-08-20', '2026-09-20', 4),
('Subasta Online Novillas', 4800000, '2026-09-15', '2026-09-16', 1),
('Renovación de Praderas', 160000, '2026-10-10', '2026-11-10', 2),
('Gran Cierre de Año Ganadero', 900000, '2026-12-01', '2026-12-31', 1);

-- TABLA CLIENTES
INSERT INTO cliente (cli_nombre, cli_apellido, cli_correo, cli_telefono, cli_ciudad, cli_fecha_registro) VALUES
('Roberto', 'Sánchez', 'roberto.s@ganadero.com', '3157778899', 'Popayán', '2026-01-20'),
('Elena', 'Restrepo', 'elena_agro@hacienda.co', '3104445566', 'Medellín', '2026-02-05'),
('Marco', 'Tulio', 'marcot@veterinaria.net', '3002223344', 'Cali', '2026-02-18'),
('Patricia', 'Duarte', 'p.duarte@finca.com', '3128889900', 'Buga', '2026-03-01'),
('Ganadería San José', 'LTDA', 'gerencia@sanjose.com', '6015554433', 'Bogotá', '2026-03-05'),
('Andrés', 'García', 'andres.garcia@ganado.co', '3109988771', 'Montería', '2026-01-05'),
('Marta', 'Lucía', 'mlucia@hacienda.com', '3152233445', 'Pereira', '2026-01-12'),
('Javier', 'Hernández', 'j.hernandez@finca.net', '3201122334', 'Villavicencio', '2026-01-18'),
('Isabel', 'Castaño', 'isabel.c@agro.com', '3115566778', 'Manizales', '2026-01-22'),
('Ricardo', 'Pérez', 'ricardo.p@lecheria.co', '3189900112', 'Sonsón', '2026-01-28'),
('Sofía', 'Ramírez', 'sofia_r@export.com', '3143344556', 'Barranquilla', '2026-02-01'),
('Fernando', 'Torres', 'f.torres@carne.net', '3006677889', 'Bucaramanga', '2026-02-03'),
('Gloria', 'Valencia', 'gvalencia@campo.org', '3124455667', 'Armenia', '2026-02-07'),
('Diego', 'Mejía', 'diego.mejia@progan.co', '3178899001', 'Sincelejo', '2026-02-10'),
('Adriana', 'Orozco', 'a.orozco@tierras.com', '3102233445', 'Espinal', '2026-02-14'),
('Luis', 'Bernal', 'lbernal@veterinaria.co', '3156677889', 'Duitama', '2026-02-16'),
('Paola', 'Guzmán', 'paola.g@feria.net', '3113344556', 'Pasto', '2026-02-20'),
('Oscar', 'Muñoz', 'omunoz@agroz.com', '3215566778', 'Tuluá', '2026-02-22'),
('Beatriz', 'López', 'b.lopez@pasto.co', '3139900112', 'Yopal', '2026-02-25'),
('Gabriel', 'Ruiz', 'gruiz@ganaderia.co', '3162233445', 'Florencia', '2026-02-28'),
('Camila', 'Vargas', 'cvargas@bio.com', '3196677889', 'Neiva', '2026-03-02'),
('Héctor', 'Salazar', 'hsalazar@campo.net', '3103344556', 'Fusagasugá', '2026-03-04'),
('Tatiana', 'Suárez', 't.suarez@semillas.co', '3155566778', 'Ibagué', '2026-03-06'),
('Juan', 'Quintero', 'jquintero@fincas.com', '3128899001', 'Cartago', '2026-03-08'),
('Mónica', 'Ríos', 'mrios@agronegocios.co', '3142233445', 'Valledupar', '2026-03-09');

-- TABLA INTERACCIONES
INSERT INTO interaccion (int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente) VALUES
('clic', '2026-01-25', 1, 1),
('comentario', '2026-02-10', 2, 2),
('descarga', '2026-02-20', 3, 3),
('visita', '2026-03-02', 4, 4),
('clic', '2026-04-12', 5, 6),
('comentario', '2026-05-15', 7, 7),
('descarga', '2026-06-05', 8, 8),
('clic', '2026-01-20', 3, 9),
('comentario', '2026-04-15', 5, 10),
('visita', '2026-11-20', 17, 11),
('descarga', '2026-09-12', 15, 12),
('clic', '2026-08-10', 12, 13),
('comentario', '2026-02-15', 2, 14),
('descarga', '2026-07-20', 11, 15),
('clic', '2026-10-02', 16, 16),
('comentario', '2026-05-12', 7, 17),
('clic', '2026-03-05', 19, 18),
('comentario', '2026-09-20', 14, 19),
('descarga', '2026-12-05', 29, 20),
('visita', '2026-03-15', 4, 21),
('clic', '2026-06-25', 9, 22),
('descarga', '2026-08-05', 12, 23),
('comentario', '2026-01-28', 1, 24),
('clic', '2026-09-15', 15, 25);

-- TABLA CONVERSIONES
INSERT INTO conversion (con_tipo, con_valor, con_fecha, cliente_cli_id_cliente) VALUES
('compra', 1550000, '2026-02-12', 1),
('registro', 120000, '2026-02-25', 2),
('suscripcion', 35000, '2026-03-05', 5),
('registro', 1250000, '2026-04-18', 6),
('compra', 240000, '2026-05-20', 7),
('suscripcion', 150000, '2026-06-05', 8),
('suscripcion', 45000, '2026-03-10', 18),
('compra', 320000, '2026-02-25', 14),
('registro', 890000, '2026-07-28', 15),
('compra', 1570000, '2026-10-15', 16),
('compra', 580000, '2026-09-25', 19),
('compra', 110000, '2026-08-15', 13),
('suscripcion', 120000, '2026-01-25', 9);

-- =========================================================
-- 3. PROCEDIMIENTOS ALMACENADOS - SELECT
-- =========================================================

-- Procedimiento Almacenado Canal
DROP PROCEDURE IF EXISTS sp_select_canal;
DELIMITER //
CREATE PROCEDURE sp_select_canal()
BEGIN
   SELECT can_id_canal, can_nombre, can_tipo
   FROM canal;
END //
DELIMITER ;

-- Procedimiento Almacenado Campania
DROP PROCEDURE IF EXISTS sp_select_campania;
DELIMITER //
CREATE PROCEDURE sp_select_campania()
BEGIN
   SELECT cam_id_campania, cam_nombre, cam_presupuesto,
          cam_fecha_inicio, cam_fecha_final, canal_can_id_canal
   FROM campania;
END //
DELIMITER ;

-- Procedimiento Almacenado Cliente
DROP PROCEDURE IF EXISTS sp_select_cliente;
DELIMITER //
CREATE PROCEDURE sp_select_cliente()
BEGIN
   SELECT cli_id_cliente, cli_nombre, cli_apellido, cli_correo,
          cli_telefono, cli_ciudad, cli_fecha_registro
   FROM cliente;
END //
DELIMITER ;

-- Procedimiento Almacenado Interaccion
DROP PROCEDURE IF EXISTS sp_select_interaccion;
DELIMITER //
CREATE PROCEDURE sp_select_interaccion()
BEGIN
   SELECT int_id_interaccion, int_tipo, int_fecha,
          campania_cam_id_campania, cliente_cli_id_cliente
   FROM interaccion;
END //
DELIMITER ;

-- Procedimiento Almacenado Conversion
DROP PROCEDURE IF EXISTS sp_select_conversion;
DELIMITER //
CREATE PROCEDURE sp_select_conversion()
BEGIN
   SELECT con_id_conversion, con_tipo, con_valor, con_fecha,
          cliente_cli_id_cliente
   FROM conversion;
END //
DELIMITER ;

-- =========================================================
-- 4. PROCEDIMIENTOS ALMACENADOS - INSERT
-- =========================================================

-- Procedimiento Almacenado: INSERT CANAL
DROP PROCEDURE IF EXISTS sp_insert_canal;
DELIMITER //
CREATE PROCEDURE sp_insert_canal(
    IN p_can_nombre VARCHAR(80),
    IN p_can_tipo   VARCHAR(15)
)
BEGIN
   INSERT INTO canal (can_nombre, can_tipo)
   VALUES (p_can_nombre, p_can_tipo);
END //
DELIMITER ;

-- Procedimiento Almacenado: INSERT CAMPANIA
DROP PROCEDURE IF EXISTS sp_insert_campania;
DELIMITER //
CREATE PROCEDURE sp_insert_campania(
    IN p_cam_nombre        VARCHAR(100),
    IN p_cam_presupuesto   DECIMAL(12,2),
    IN p_cam_fecha_inicio  DATE,
    IN p_cam_fecha_final   DATE,
    IN p_canal_can_id_canal INT
)
BEGIN
   INSERT INTO campania (cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final, canal_can_id_canal)
   VALUES (p_cam_nombre, p_cam_presupuesto, p_cam_fecha_inicio, p_cam_fecha_final, p_canal_can_id_canal);
END //
DELIMITER ;

-- Procedimiento Almacenado: INSERT CLIENTE
DROP PROCEDURE IF EXISTS sp_insert_cliente;
DELIMITER //
CREATE PROCEDURE sp_insert_cliente(
    IN p_cli_nombre         VARCHAR(80),
    IN p_cli_apellido       VARCHAR(80),
    IN p_cli_correo         VARCHAR(100),
    IN p_cli_telefono       VARCHAR(20),
    IN p_cli_ciudad         VARCHAR(60),
    IN p_cli_fecha_registro DATE
)
BEGIN
   INSERT INTO cliente (cli_nombre, cli_apellido, cli_correo, cli_telefono, cli_ciudad, cli_fecha_registro)
   VALUES (p_cli_nombre, p_cli_apellido, p_cli_correo, p_cli_telefono, p_cli_ciudad, p_cli_fecha_registro);
END //
DELIMITER ;

-- Procedimiento Almacenado: INSERT INTERACCION
DROP PROCEDURE IF EXISTS sp_insert_interaccion;
DELIMITER //
CREATE PROCEDURE sp_insert_interaccion(
    IN p_int_tipo                 VARCHAR(20),
    IN p_int_fecha                DATE,
    IN p_campania_cam_id_campania INT,
    IN p_cliente_cli_id_cliente   INT
)
BEGIN
   INSERT INTO interaccion (int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente)
   VALUES (p_int_tipo, p_int_fecha, p_campania_cam_id_campania, p_cliente_cli_id_cliente);
END //
DELIMITER ;

-- Procedimiento Almacenado: INSERT CONVERSION
DROP PROCEDURE IF EXISTS sp_insert_conversion;
DELIMITER //
CREATE PROCEDURE sp_insert_conversion(
    IN p_con_tipo               VARCHAR(20),
    IN p_con_valor              DECIMAL(12,2),
    IN p_con_fecha              DATE,
    IN p_cliente_cli_id_cliente INT
)
BEGIN
   INSERT INTO conversion (con_tipo, con_valor, con_fecha, cliente_cli_id_cliente)
   VALUES (p_con_tipo, p_con_valor, p_con_fecha, p_cliente_cli_id_cliente);
END //
DELIMITER ;
