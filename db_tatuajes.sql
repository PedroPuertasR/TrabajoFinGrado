DROP TABLE reserva;
DROP TABLE sala;
DROP TABLE zona;
DROP TABLE empleado;
DROP TABLE usuario;

CREATE TABLE usuario (
	id					serial,
	nombre				varchar(100) NOT NULL,
	apellidos			varchar(200) NOT NULL,
	dni					varchar(9) NOT NULL UNIQUE,
	email				varchar(255) NOT NULL UNIQUE,
	CONSTRAINT pk_usuario PRIMARY KEY(id),
	CONSTRAINT ck_email_arroba CHECK (email ILIKE '%@%'),
	CONSTRAINT ck_dni_longitud CHECK (LENGTH(dni)=9),
	CONSTRAINT ck_dni_letra CHECK (dni ~ '\d{8}[A-Z]|[a-z]')
);

CREATE TABLE zona (
	id					serial,
	nombre_zona			varchar(100) NOT NULL,
	precio_fianza		numeric NOT NULL,
	CONSTRAINT pk_zona PRIMARY KEY(id)
);

CREATE TABLE empleado (
	id					serial,
	nombre				varchar (100) NOT NULL UNIQUE,
	apellidos			varchar (100) NOT NULL,
	telefono			varchar (13) NOT NULL,
	email				varchar (100) NOT NULL UNIQUE,
	dni					varchar (9) NOT NULL UNIQUE,
	seguridad_social	varchar (12) NOT NULL UNIQUE,
	iban				varchar (34) NOT NULL UNIQUE,
	salario				numeric NOT NULL,
    foto                varchar(300),
    redes               varchar(100) NOT NULL,
    id_usuario          int NOT NULL,
	CONSTRAINT pk_empleado PRIMARY KEY (id),
	CONSTRAINT ck_email_arroba CHECK (email ILIKE '%@%'),
	CONSTRAINT ck_dni_longitud CHECK (LENGTH(dni)=9),
	CONSTRAINT ck_iban_longitud CHECK (LENGTH(iban)=24),
	CONSTRAINT ck_segsocial_longitud CHECK (LENGTH(seguridad_social)=12),
	CONSTRAINT ck_dni_letra CHECK (dni ~ '\d{8}[A-Z]|[a-z]')
);

CREATE TABLE sala (
    id                  serial,
    empleado            int NOT NULL,
    CONSTRAINT pk_sala PRIMARY KEY (id)
);

CREATE TABLE reserva (
    id                  serial,
    cliente             varchar (200) NOT NULL,
    descuento           numeric,
    fecha_reserva       date NOT NULL,
    precio_disenio      numeric,
    precio_total        numeric,
    sala_id             int NOT NULL,
    zona_id             int NOT NULL,
	tatuador			int NOT NULL,
    CONSTRAINT pk_reserva PRIMARY KEY (id)
);


ALTER TABLE empleado ADD CONSTRAINT fk_empleado_usuario FOREIGN KEY (id_usuario) REFERENCES usuario(id);

ALTER TABLE sala ADD CONSTRAINT fk_sala_empleado FOREIGN KEY (empleado) REFERENCES empleado(id);

ALTER TABLE reserva ADD CONSTRAINT fk_reserva_sala FOREIGN KEY (sala_id) REFERENCES sala (id);
ALTER TABLE reserva ADD CONSTRAINT fk_reserva_zona FOREIGN KEY (zona_id) REFERENCES zona (id);
ALTER TABLE reserva ADD CONSTRAINT fk_reserva_empleado FOREIGN KEY (tatuador) REFERENCES empleado (id);
ALTER TABLE reserva ALTER COLUMN descuento SET DEFAULT 0;

INSERT INTO usuario (nombre, apellidos, dni, email) VALUES ('Pedro', 'Rodríguez Martínez', '44363665T', 'pablorodriguez93@hotmail.com');
INSERT INTO usuario (nombre, apellidos, dni, email) VALUES ('Clara', 'García López', '42756159X', 'claragarcia89@gmail.com');
INSERT INTO usuario (nombre, apellidos, dni, email) VALUES ('Sofía', 'Martínez García', '55878709W', 'sofiagarcia.mtz@gmail.com');
INSERT INTO usuario (nombre, apellidos, dni, email) VALUES ('Alejandro', 'López Rodríguez', '94570231G', 'alejandrolr10@yahoo.com');

INSERT INTO empleado (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, id_usuario) VALUES('Pedro', 'Rodríguez Martínez', '44363665T', '631406200', 'pablorodriguez93@hotmail.com', '342146458171', 'ES7330248301408045328675', 1200.0, 'wavebuto.png', 'https://www.instagram.com/wavebuto/', 1);
INSERT INTO empleado (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, id_usuario) VALUES('Clara', 'García López', '42756159X', '679380814', 'claragarcia89@gmail.com', '065553342250', 'ES8730835851574872414151', 1500.0, 'graceneutral.png', 'https://www.instagram.com/graceneutral/', 2);
INSERT INTO empleado (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, id_usuario) VALUES('Sofía', 'Martínez García', '55878709W', '629113701', 'sofiagarcia.mtz@gmail.com', '273787200759', 'ES3830608332970702997455', 1000.0, 'marlenne.jpg', 'https://www.instagram.com/marlennetattoo/', 3);
INSERT INTO empleado (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, id_usuario) VALUES('Alejandro', 'López Rodríguez', '94570231G', '691060346', 'alejandrolr10@yahoo.com', '108228433141', 'ES9820109960100321803729', 1200.0, 'mannytattoo.jpg', 'https://www.instagram.com/mannytatt/', 4);

INSERT INTO sala (empleado) VALUES (1);
INSERT INTO sala (empleado) VALUES (3);
INSERT INTO sala (empleado) VALUES (4);
INSERT INTO sala (empleado) VALUES (2);

INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Espalda', 100.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Hombro Izquierdo', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Hombro Derecho', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Biceps Izquierdo', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Biceps Derecho', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Triceps Izquierdo', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Triceps Derecho', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Antebrazo Izquierdo', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Antebrazo Derecho', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Cuadriceps Izquierdo', 70.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Cuadriceps Derecho', 70.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Isquio Derecho', 70.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Isquio Izquierdo', 70.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Espinilla Izquierda', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Espinilla Derecha', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Gemelo Derecho', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Gemelo Izquierdo', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Pectoral Izquierdo', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Pectoral Derecho', 60.0);
INSERT INTO zona (nombre_zona, precio_fianza) VALUES ('Estomago', 80.0);

INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Caryl Hollingsbee', 0, '2023-05-03', 125, 185, 3, 13, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Isaiah Gong', 0, '2024-09-19', 70, 130, 1, 19, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Price Boar', 0, '2021-09-14', 90, 150, 3, 18, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Julie Shipsey', 10, '2022-03-21', 212, 244.8, 4, 8, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Riobard Ivakin', 0, '2022-09-20', 81, 141, 2, 7, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Scarlett Bonnefin', 0, '2024-03-31', 50, 110, 2, 6, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Dallis Bush', 15, '2022-04-13', 297, 311.95, 2, 17, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Demetre Isaacs', 15, '2023-08-13', 396, 396.1, 4, 16, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Hershel Coundley', 0, '2023-11-13', 98, 158, 4, 8, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Heda Penke', 0, '2022-09-11', 35, 95, 3, 6, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Saunder Macias', 10, '2024-10-21', 209, 251.1, 2, 14, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Nata Gelsthorpe', 10, '2023-10-13', 232, 271.8, 4, 16, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Imojean Defont', 10, '2021-11-10', 215, 265.5, 1, 4, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Maridel Dochon', 10, '2022-11-25', 175, 211.5, 3, 6, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Vida Toxell', 10, '2024-01-28', 239, 278.1, 2, 17, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Tailor Isitt', 15, '2024-02-18', 386, 387.6, 1, 17, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Morey Boxell', 15, '2022-12-10', 367, 379.95, 2, 4, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Berk Vernon', 10, '2024-06-16', 385, 409.5, 1, 14, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Darby Kentwell', 10, '2023-03-04', 239, 269.1, 3, 19, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Gusti Mulvenna', 0, '2023-03-30', 76, 136, 3, 13, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Alexina Morot', 10, '2024-05-01', 362, 415.8, 2, 5, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Bevvy Yon', 0, '2024-07-28', 130, 200, 3, 14, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Cammi Hallowes', 0, '2023-02-20', 66, 126, 4, 9, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Cherish Paumier', 10, '2023-05-19', 224, 264.6, 2, 14, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Abie Pendlington', 10, '2024-04-11', 288, 322.2, 3, 16, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Anna-diane Guys', 10, '2024-10-31', 309, 332.1, 2, 12, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Sean Anders', 0, '2022-12-09', 119, 179, 2, 19, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Cassie Rolance', 5, '2021-05-24', 125, 194.75, 4, 15, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Ricky Fennick', 10, '2021-10-31', 344, 363.6, 1, 10, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Jacqui Smitham', 10, '2024-01-22', 261, 288.9, 1, 8, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Sheilah Tenwick', 0, '2023-02-08', 86, 146, 1, 8, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Bennett Agneau', 0, '2023-09-06', 89, 149, 1, 2, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Malissa Layhe', 10, '2023-08-09', 343, 371.7, 3, 14, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Kizzee De Roeck', 10, '2024-08-15', 270, 306, 3, 15, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Oralie Bunkle', 0, '2022-12-29', 152, 212, 3, 6, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Godart Bampton', 0, '2023-10-21', 52, 122, 2, 17, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Lottie Burkinshaw', 0, '2023-06-08', 40, 100, 4, 9, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Edgard Corneille', 10, '2021-06-18', 239, 269.1, 4, 9, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Seline Gammage', 10, '2023-01-01', 316, 338.4, 2, 8, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Misti Etherson', 0, '2024-03-10', 102, 162, 4, 3, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Howie Nassie', 10, '2022-08-11', 367, 384.3, 2, 19, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Bette Francis', 10, '2024-07-08', 350, 378, 3, 16, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Barbie Stanier', 0, '2023-08-28', 45, 105, 2, 7, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Innis Goodban', 0, '2023-06-12', 89, 169, 3, 2, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Jo-ann Caffery', 15, '2021-11-14', 395, 386.75, 3, 9, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Joelynn Dawtre', 10, '2024-07-10', 220, 252, 1, 9, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Corinne Matyasik', 10, '2021-08-26', 307, 330.3, 4, 11, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Ian Swanbourne', 0, '2023-07-17', 98, 198, 3, 5, 4);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Dina Dell ''Orto', 10, '2022-04-18', 237, 267.3, 2, 16, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Julian O''Dowd', 0, '2023-07-16', 71, 131, 2, 18, 1);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Kev Lillie', 0, '2023-12-25', 67, 127, 2, 5, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Simona Dadd', 20, '2024-09-20', 312, 297.6, 4, 6, 2);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Freddy Cartmel', 0, '2021-05-19', 110, 190, 2, 14, 3);
INSERT INTO reserva (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, tatuador) VALUES ('Tawsha Rops', 50, '2022-12-28', 347, 203.5, 3, 12, 3);