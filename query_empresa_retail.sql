SET SQL_SAFE_UPDATES = 0; 
/* ==================== CLIENTE ==================== */
insert into cliente (cli_nombre, cli_apellido, cli_correo, cli_telefono, cli_ciudad, cli_fecha_registro) values
('Juan','Pérez','juan.perez@mail.com','3001234567','Popayán','2026-01-10'),
('María','Gómez','maria.gomez@mail.com','3007654321','Cali','2026-01-15'),
('Carlos','Ramírez','carlos.ramirez@mail.com','3009876543','Bogotá','2026-02-01'),
('Ana','Torres','ana.torres@mail.com','3012345678','Medellín','2026-02-10'),
('Luis','Martínez','luis.martinez@mail.com','3019876543','Pasto','2026-02-20');

select cli_id_cliente, cli_nombre, cli_apellido, cli_correo, cli_ciudad
from cliente;

update cliente
set cli_telefono = '3000000000'
where cli_correo = 'maria.gomez@mail.com';


/* ==================== CANAL ==================== */
insert into canal (can_nombre, can_tipo) values
('Facebook','Red Social'),
('Instagram','Red Social'),
('Google Ads','Buscador'),
('Newsletter','Email'),
('TikTok','Red Social');

select can_id_canal, can_nombre, can_tipo
from canal;

update canal
set can_tipo = 'Buscador'
where can_nombre = 'Google Ads';


/* ==================== CAMPANIA ==================== */
insert into campania (cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final, canal_can_id_canal) values
('Campaña Verano', 5000000, '2026-01-05', '2026-02-05', (select can_id_canal from canal where can_nombre = 'Facebook')),
('Campaña Black Friday', 8000000, '2026-11-01', '2026-11-30', (select can_id_canal from canal where can_nombre = 'Instagram')),
('Campaña Lanzamiento', 3000000, '2026-03-01', '2026-03-20', (select can_id_canal from canal where can_nombre = 'Google Ads')),
('Campaña Fidelización', 2000000, '2026-04-01', '2026-04-15', (select can_id_canal from canal where can_nombre = 'Newsletter')),
('Campaña Influencers', 6000000, '2026-05-01', '2026-05-30', (select can_id_canal from canal where can_nombre = 'TikTok'));

select cam_id_campania, cam_nombre, cam_presupuesto, cam_fecha_inicio, cam_fecha_final
from campania;

update campania
set cam_presupuesto = 5500000
where cam_nombre = 'Campaña Verano';
select * from campania;

/* ==================== CONVERSION ==================== */
insert into conversion (con_tipo, con_valor, con_fecha, cliente_cli_id_cliente) values
('Compra', 150000, '2026-01-12', (select cli_id_cliente from cliente where cli_correo = 'juan.perez@mail.com')),
('Registro', 0, '2026-01-16', (select cli_id_cliente from cliente where cli_correo = 'maria.gomez@mail.com')),
('Compra', 320000, '2026-02-03', (select cli_id_cliente from cliente where cli_correo = 'carlos.ramirez@mail.com')),
('Suscripción', 0, '2026-02-12', (select cli_id_cliente from cliente where cli_correo = 'ana.torres@mail.com')),
('Compra', 89000, '2026-02-22', (select cli_id_cliente from cliente where cli_correo = 'luis.martinez@mail.com'));

select con_id_conversion, con_tipo, con_valor, con_fecha
from conversion;

update conversion
set con_valor = 350000
where con_tipo = 'Compra' and con_fecha = '2026-02-03';


/* ==================== INTERACCION ==================== */
insert into interaccion (int_tipo, int_fecha, campania_cam_id_campania, cliente_cli_id_cliente) values
('Click', '2026-01-06', (select cam_id_campania from campania where cam_nombre = 'Campaña Verano'), (select cli_id_cliente from cliente where cli_correo = 'juan.perez@mail.com')),
('Vista', '2026-11-02', (select cam_id_campania from campania where cam_nombre = 'Campaña Black Friday'), (select cli_id_cliente from cliente where cli_correo = 'maria.gomez@mail.com')),
('Click', '2026-03-02', (select cam_id_campania from campania where cam_nombre = 'Campaña Lanzamiento'), (select cli_id_cliente from cliente where cli_correo = 'carlos.ramirez@mail.com')),
('Apertura correo', '2026-04-02', (select cam_id_campania from campania where cam_nombre = 'Campaña Fidelización'), (select cli_id_cliente from cliente where cli_correo = 'ana.torres@mail.com')),
('Vista', '2026-05-02', (select cam_id_campania from campania where cam_nombre = 'Campaña Influencers'), (select cli_id_cliente from cliente where cli_correo = 'luis.martinez@mail.com'));

select int_id_interaccion, int_tipo, int_fecha
from interaccion;

update interaccion
set int_tipo = 'Click confirmado'
where int_tipo = 'Click' and int_fecha = '2026-01-06';