INSERT INTO EMPLEADO (id, nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico) VALUES(1, 'Pedro', 'Rodríguez Martínez', '44363665T', '631406200', 'pedrorodriguez93@hotmail.com', '342146458171', 'ES7330248301408045328675', 1200.0, 'wavebuto.png', 'https://www.instagram.com/wavebuto/', 'WaveButo');
INSERT INTO EMPLEADO (id, nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico) VALUES(2, 'Clara', 'García López', '42756159X', '679380814', 'claragarcia89@gmail.com', '065553342250', 'ES8730835851574872414151', 1500.0, 'graceneutral.png', 'https://www.instagram.com/graceneutral/', 'Grace Neutral');
INSERT INTO EMPLEADO (id, nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico) VALUES(3, 'Sofía', 'Martínez García', '55878709W', '629113701', 'sofiagarcia.mtz@gmail.com', '273787200759', 'ES3830608332970702997455', 1000.0, 'marlenne.jpg', 'https://www.instagram.com/marlennetattoo/', 'MarlenneTattoos');
INSERT INTO EMPLEADO (id, nombre, apellidos, dni, telefono, email, seguridad_social, iban, salario, foto, redes, artistico) VALUES(4, 'Alejandro', 'López Rodríguez', '94570231G', '691060346', 'alejandrolr10@yahoo.com', '108228433141', 'ES9820109960100321803729', 1200.0, 'mannytattoo.jpg', 'https://www.instagram.com/mannytatt/', 'MannyTattoos');

INSERT INTO SALA(id, empleado_id) VALUES (NEXTVAL('hibernate_sequence'), 1);
INSERT INTO SALA(id, empleado_id) VALUES (NEXTVAL('hibernate_sequence'), 3);
INSERT INTO SALA(id, empleado_id) VALUES (NEXTVAL('hibernate_sequence'), 4);
INSERT INTO SALA(id, empleado_id) VALUES (NEXTVAL('hibernate_sequence'), 2);

INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Espalda', 100.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Hombro Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Hombro Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Biceps Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Biceps Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Triceps Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Triceps Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Antebrazo Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Antebrazo Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Cuadriceps Izquierdo', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Cuadriceps Derecho', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Isquio Derecho', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Isquio Izquierdo', 70.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Espinilla Izquierda', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Espinilla Derecha', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Gemelo Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Gemelo Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Pectoral Izquierdo', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Pectoral Derecho', 60.0);
INSERT INTO ZONA (id, nombre_zona, precio_fianza) VALUES (NEXTVAL('hibernate_sequence'), 'Estomago', 80.0);

--UPDATE RESERVA SET precio_total = ((precio_disenio + (SELECT precio_disenio FROM ZONA WHERE id = zona_id)) - 1 * descuento / 100) WHERE precio_total = 0.0;

INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Caryl Hollingsbee', 0, '2023-05-03', 125, 185, 3, 13, FALSE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Isaiah Gong', 0, '2024-09-19', 70, 130, 1, 21, FALSE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Price Boar', 0, '2021-09-14', 90, 150, 3, 18, FALSE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Julie Shipsey', 10, '2022-03-21', 212, 244.8, 4, 8, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Riobard Ivakin', 0, '2022-09-20', 81, 141, 2, 7, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Scarlett Bonnefin', 0, '2024-03-31', 50, 110, 2, 6, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Dallis Bush', 15, '2022-04-13', 297, 311.95, 2, 17, FALSE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Demetre Isaacs', 15, '2023-08-13', 396, 396.1, 4, 16, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Hershel Coundley', 0, '2023-11-13', 98, 158, 4, 8, FALSE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Heda Penke', 0, '2022-09-11', 35, 95, 3, 6, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Saunder Macias', 10, '2024-10-21', 209, 251.1, 2, 14, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Nata Gelsthorpe', 10, '2023-10-13', 232, 271.8, 4, 16, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Imojean Defont', 10, '2021-11-10', 215, 265.5, 1, 24, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Maridel Dochon', 10, '2022-11-25', 175, 211.5, 3, 6, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Vida Toxell', 10, '2024-01-28', 239, 278.1, 2, 17, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Tailor Isitt', 15, '2024-02-18', 386, 387.6, 1, 17, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Morey Boxell', 15, '2022-12-10', 367, 379.95, 2, 24, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Berk Vernon', 10, '2024-06-16', 385, 409.5, 1, 14, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Darby Kentwell', 10, '2023-03-04', 239, 269.1, 3, 19, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Gusti Mulvenna', 0, '2023-03-30', 76, 136, 3, 13, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Alexina Morot', 10, '2024-05-01', 362, 415.8, 2, 5, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Bevvy Yon', 0, '2024-07-28', 130, 200, 3, 14, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Cammi Hallowes', 0, '2023-02-20', 66, 126, 4, 9, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Cherish Paumier', 10, '2023-05-19', 224, 264.6, 2, 14, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Abie Pendlington', 10, '2024-04-11', 288, 322.2, 3, 16, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Anna-diane Guys', 10, '2024-10-31', 309, 332.1, 2, 12, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Sean Anders', 0, '2022-12-09', 119, 179, 2, 21, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Cassie Rolance', 5, '2021-05-24', 125, 194.75, 4, 24, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Ricky Fennick', 10, '2021-10-31', 344, 363.6, 1, 22, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Jacqui Smitham', 10, '2024-01-22', 261, 288.9, 1, 8, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Sheilah Tenwick', 0, '2023-02-08', 86, 146, 1, 8, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Bennett Agneau', 0, '2023-09-06', 89, 149, 1, 22, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Malissa Layhe', 10, '2023-08-09', 343, 371.7, 3, 14, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Kizzee De Roeck', 10, '2024-08-15', 270, 306, 3, 15, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Oralie Bunkle', 0, '2022-12-29', 152, 212, 3, 6, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Godart Bampton', 0, '2023-10-21', 52, 122, 2, 17, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Lottie Burkinshaw', 0, '2023-06-08', 40, 100, 4, 9, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Edgard Corneille', 10, '2021-06-18', 239, 269.1, 4, 23, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Seline Gammage', 10, '2023-01-01', 316, 338.4, 2, 8, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Misti Etherson', 0, '2024-03-10', 102, 162, 4, 23, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Howie Nassie', 10, '2022-08-11', 367, 384.3, 2, 19, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Bette Francis', 10, '2024-07-08', 350, 378, 3, 16, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Barbie Stanier', 0, '2023-08-28', 45, 105, 2, 7, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Innis Goodban', 0, '2023-06-12', 89, 169, 3, 24, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Jo-ann Caffery', 15, '2021-11-14', 395, 386.75, 3, 9, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Joelynn Dawtre', 10, '2024-07-10', 220, 252, 1, 9, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Corinne Matyasik', 10, '2021-08-26', 307, 330.3, 4, 11, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Ian Swanbourne', 0, '2023-07-17', 98, 198, 3, 5, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Dina Dell ''Orto', 10, '2022-04-18', 237, 267.3, 2, 16, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Julian O''Dowd', 0, '2023-07-16', 71, 131, 2, 18, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Kev Lillie', 0, '2023-12-25', 67, 127, 2, 22, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Simona Dadd', 20, '2024-09-20', 312, 297.6, 4, 6, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Freddy Cartmel', 0, '2021-05-19', 110, 190, 2, 24, TRUE);
INSERT INTO RESERVA (id, cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado) VALUES (NEXTVAL('hibernate_sequence'), 'Tawsha Rops', 50, '2022-12-28', 347, 203.5, 3, 22, TRUE);

--UPDATE RESERVA SET precio_total = (SELECT (precio_disenio + precio_fianza) - 1 * descuento / 100 FROM RESERVA JOIN ZONA) [WHERE ...] precio_total = 0; 


--into
--        reserva
--        (cliente, descuento, fecha_reserva, precio_disenio, precio_total, sala_id, zona_id, aceptado, id) 
--    VALUES
--        (?, ?, ?, ?, ?, ?, ?, ?)

--INSERT INTO RESERVA (id, cliente, zona_id, sala_id, fecha_reserva, precio_disenio, descuento, precio_total, TRUE) 
--VALUES (NEXTVAL('hibernate_sequence'), 'Pedro Puertas', 1, 1, (2022-05-25), 100, 0, 0);


--UPDATE RESERVA SET precio_total = ((SELECT precio_fianza FROM ZONA) + precio_disenio) - 1 * descuento / 100 WHERE precio_total = 0;
