-- =========================================================
-- empresa-retail-db
-- Creación de tablas según el diagrama EER (MySQL Workbench)
-- Compatible con el script de datos de ejemplo (cliente, canal,
-- campania, conversion, interaccion)
-- =========================================================

SET SQL_SAFE_UPDATES = 0;

DROP TABLE IF EXISTS interaccion;
DROP TABLE IF EXISTS conversion;
DROP TABLE IF EXISTS campania;
DROP TABLE IF EXISTS cliente;
DROP TABLE IF EXISTS canal;

-- ================= CANAL =================
CREATE TABLE canal (
    can_id_canal   INT AUTO_INCREMENT PRIMARY KEY,
    can_nombre     VARCHAR(80) NOT NULL,
    can_tipo       ENUM('Red Social', 'Buscador', 'Email') NOT NULL
);

-- ================= CLIENTE =================
CREATE TABLE cliente (
    cli_id_cliente       INT AUTO_INCREMENT PRIMARY KEY,
    cli_nombre           VARCHAR(100) NOT NULL,
    cli_apellido         VARCHAR(100) NOT NULL,
    cli_correo           VARCHAR(100) NOT NULL,
    cli_telefono         VARCHAR(25),
    cli_ciudad           VARCHAR(45),
    cli_fecha_registro   DATE NOT NULL
);

-- ================= CAMPANIA =================
CREATE TABLE campania (
    cam_id_campania      INT AUTO_INCREMENT PRIMARY KEY,
    cam_nombre           VARCHAR(120) NOT NULL,
    cam_presupuesto      DECIMAL(12,2) NOT NULL,
    cam_fecha_inicio     DATE NOT NULL,
    cam_fecha_final      DATE NOT NULL,
    canal_can_id_canal   INT NOT NULL,
    CONSTRAINT fk_campania_canal
        FOREIGN KEY (canal_can_id_canal) REFERENCES canal (can_id_canal)
);

-- ================= CONVERSION =================
CREATE TABLE conversion (
    con_id_conversion      INT AUTO_INCREMENT PRIMARY KEY,
    con_tipo               ENUM('Compra', 'Registro', 'Suscripción') NOT NULL,
    con_valor               DECIMAL(12,2) NOT NULL,
    con_fecha               DATE NOT NULL,
    cliente_cli_id_cliente  INT NOT NULL,
    CONSTRAINT fk_conversion_cliente
        FOREIGN KEY (cliente_cli_id_cliente) REFERENCES cliente (cli_id_cliente)
);

-- ================= INTERACCION =================
CREATE TABLE interaccion (
    int_id_interaccion        INT AUTO_INCREMENT PRIMARY KEY,
    int_tipo                  ENUM('Click', 'Vista', 'Apertura correo', 'Click confirmado') NOT NULL,
    int_fecha                 DATE NOT NULL,
    campania_cam_id_campania  INT NOT NULL,
    cliente_cli_id_cliente    INT NOT NULL,
    CONSTRAINT fk_interaccion_campania
        FOREIGN KEY (campania_cam_id_campania) REFERENCES campania (cam_id_campania),
    CONSTRAINT fk_interaccion_cliente
        FOREIGN KEY (cliente_cli_id_cliente) REFERENCES cliente (cli_id_cliente)
);
