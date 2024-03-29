INSERT INTO USUARIO (id, username, password, rol) VALUES (1, 'pedroro', 'pedroro', 'ADMIN');
INSERT INTO USUARIO (id, username, password, rol) VALUES (2, 'claragar', 'claragar', 'ADMIN');
INSERT INTO USUARIO (id, username, password, rol) VALUES (3, 'sofiamar', 'sofiamar', 'ADMIN');
INSERT INTO USUARIO (id, username, password, rol) VALUES (4, 'alejandrolo', 'alejandrolo', 'ADMIN');
INSERT INTO USUARIO (id, username, password, rol) VALUES (5, 'admin', 'admin','ADMIN');

INSERT INTO EMPLEADO (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico, usuario_id) VALUES('Pedro', 'Rodríguez Martínez', '44363665T', '631406200', 'pedrorodriguez93@hotmail.com', '342146458171', 'ES7330248301408045328675', 1200.0, 'wavebuto.png', 'https://www.instagram.com/wavebuto/', 'WaveButo', 1);
INSERT INTO EMPLEADO (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico, usuario_id) VALUES('Clara', 'García López', '42756159X', '679380814', 'claragarcia89@gmail.com', '065553342250', 'ES8730835851574872414151', 1500.0, 'graceneutral.png', 'https://www.instagram.com/graceneutral/', 'Grace Neutral', 2);
INSERT INTO EMPLEADO (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico, usuario_id) VALUES('Sofía', 'Martínez García', '55878709W', '629113701', 'sofiagarcia.mtz@gmail.com', '273787200759', 'ES3830608332970702997455', 1000.0, 'marlenne.jpg', 'https://www.instagram.com/marlennetattoo/', 'MarlenneTattoos', 3);
INSERT INTO EMPLEADO (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico, usuario_id) VALUES('Alejandro', 'López Rodríguez', '94570231G', '691060346', 'alejandrolr10@yahoo.com', '108228433141', 'ES9820109960100321803729', 1200.0, 'mannytattoo.jpg', 'https://www.instagram.com/mannytatt/', 'MannyTattoos', 4);
INSERT INTO EMPLEADO (nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico, usuario_id) VALUES('Admin', 'Admin admin', '13259798E', '622060346', 'admin@gmail.com', '090033306872', 'ES0600833155515400944674', 2000.0, 'admin.png', 'https://www.instagram.com/admin/', 'Administrador', 5);

INSERT INTO SALA(id, empleado_id) VALUES (1, 1);
INSERT INTO SALA(id, empleado_id) VALUES (2, 3);
INSERT INTO SALA(id, empleado_id) VALUES (3, 4);
INSERT INTO SALA(id, empleado_id) VALUES (4, 2);

INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (1, 'Espalda', 100.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (2, 'Hombro Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (3, 'Hombro Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (4, 'Biceps Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (5, 'Biceps Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (6, 'Triceps Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (7, 'Triceps Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (8, 'Antebrazo Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (9, 'Antebrazo Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (10, 'Cuadriceps Izquierdo', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (11, 'Cuadriceps Derecho', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (12, 'Isquio Derecho', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (13, 'Isquio Izquierdo', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (14, 'Espinilla Izquierda', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (15, 'Espinilla Derecha', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (16, 'Gemelo Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (17, 'Gemelo Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (18, 'Pectoral Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (19, 'Pectoral Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (20, 'Estomago', 80.0);

INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (1, 'Caryl Hollingsbee', 0, '2023-05-03', 125, 185, 3, 13, false);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (2, 'Isaiah Gong', 0, '2024-09-19', 70, 130, 1, 20, false);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (3, 'Price Boar', 0, '2021-09-14', 90, 150, 3, 18, false);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (4, 'Julie Shipsey', 10, '2022-03-21', 212, 244.8, 4, 8, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (5, 'Riobard Ivakin', 0, '2022-09-20', 81, 141, 2, 7, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (6, 'Scarlett Bonnefin', 0, '2024-03-31', 50, 110, 2, 6, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (7, 'Dallis Bush', 15, '2022-04-13', 297, 311.95, 2, 17, false);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (8, 'Demetre Isaacs', 15, '2023-08-13', 396, 396.1, 4, 16, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (9, 'Hershel Coundley', 0, '2023-11-13', 98, 158, 4, 8, false);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (10, 'Heda Penke', 0, '2022-09-11', 35, 95, 3, 6, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (11, 'Saunder Macias', 10, '2024-10-21', 209, 251.1, 2, 14, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (12, 'Nata Gelsthorpe', 10, '2023-10-13', 232, 271.8, 4, 16, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (13, 'Imojean Defont', 10, '2021-11-10', 215, 265.5, 1, 14, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (14, 'Maridel Dochon', 10, '2022-11-25', 175, 211.5, 3, 6, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (15, 'Vida Toxell', 10, '2024-01-28', 239, 278.1, 2, 17, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (16, 'Tailor Isitt', 15, '2024-02-18', 386, 387.6, 1, 17, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (17, 'Morey Boxell', 15, '2022-12-10', 367, 379.95, 2, 20, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (18, 'Berk Vernon', 10, '2024-06-16', 385, 409.5, 1, 14, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (19, 'Darby Kentwell', 10, '2023-03-04', 239, 269.1, 3, 19, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (20, 'Gusti Mulvenna', 0, '2023-03-30', 76, 136, 3, 13, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (21, 'Alexina Morot', 10, '2024-05-01', 362, 415.8, 2, 5, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (22, 'Bevvy Yon', 0, '2024-07-28', 130, 200, 3, 14, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (23, 'Cammi Hallowes', 0, '2023-02-20', 66, 126, 4, 9, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (24, 'Cherish Paumier', 10, '2023-05-19', 224, 264.6, 2, 14, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (25, 'Abie Pendlington', 10, '2024-04-11', 288, 322.2, 3, 16, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (26, 'Anna-diane Guys', 10, '2024-10-31', 309, 332.1, 2, 12, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (27, 'Sean Anders', 0, '2022-12-09', 119, 179, 2, 20, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (28, 'Cassie Rolance', 5, '2021-05-24', 125, 194.75, 4, 4, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (29, 'Ricky Fennick', 10, '2021-10-31', 344, 363.6, 1, 2, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (30, 'Jacqui Smitham', 10, '2024-01-22', 261, 288.9, 1, 8, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (31, 'Sheilah Tenwick', 0, '2023-02-08', 86, 146, 1, 8, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (32, 'Bennett Agneau', 0, '2023-09-06', 89, 149, 1, 2, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (33, 'Malissa Layhe', 10, '2023-08-09', 343, 371.7, 3, 14, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (34, 'Kizzee De Roeck', 10, '2024-08-15', 270, 306, 3, 15, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (35, 'Oralie Bunkle', 0, '2022-12-29', 152, 212, 3, 6, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (36, 'Godart Bampton', 0, '2023-10-21', 52, 122, 2, 17, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (37, 'Lottie Burkinshaw', 0, '2023-06-08', 40, 100, 4, 9, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (38, 'Edgard Corneille', 10, '2021-06-18', 239, 269.1, 4, 3, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (39, 'Seline Gammage', 10, '2023-01-01', 316, 338.4, 2, 8, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (40, 'Misti Etherson', 0, '2024-03-10', 102, 162, 4, 13, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (41, 'Howie Nassie', 10, '2022-08-11', 367, 384.3, 2, 19, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (42, 'Bette Francis', 10, '2024-07-08', 350, 378, 3, 16, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (43, 'Barbie Stanier', 0, '2023-08-28', 45, 105, 2, 7, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (44, 'Innis Goodban', 0, '2023-06-12', 89, 169, 3, 4, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (45, 'Jo-ann Caffery', 15, '2021-11-14', 395, 386.75, 3, 9, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (46, 'Joelynn Dawtre', 10, '2024-07-10', 220, 252, 1, 9, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (47, 'Corinne Matyasik', 10, '2021-08-26', 307, 330.3, 4, 11, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (48, 'Ian Swanbourne', 0, '2023-07-17', 98, 198, 3, 5, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (49, 'Dina Dell ''Orto', 10, '2022-04-18', 237, 267.3, 2, 16, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (50, 'Julian O''Dowd', 0, '2023-07-16', 71, 131, 2, 18, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (51, 'Kev Lillie', 0, '2023-12-25', 67, 127, 2, 12, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (52, 'Simona Dadd', 20, '2024-09-20', 312, 297.6, 4, 6, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (53, 'Freddy Cartmel', 0, '2021-05-19', 110, 190, 2, 20, true);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (54, 'Tawsha Rops', 50, '2022-12-28', 347, 203.5, 3, 2, true);