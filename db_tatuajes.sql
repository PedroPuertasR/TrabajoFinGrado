CREATE TABLE usuarios (
	id					serial,
	nombre				varchar(100) NOT NULL,
	apellidos			varchar(200) NOT NULL,
	dni					varchar(9) NOT NULL UNIQUE,
	telefono			varchar(13) NOT NULL,
	email				varchar(255) NOT NULL UNIQUE,
	iban				varchar(34) NOT NULL UNIQUE,
	CONSTRAINT pk_usuarios PRIMARY KEY(id),
	CONSTRAINT ck_email_arroba CHECK (email ILIKE '%@%'),
	CONSTRAINT ck_dni_longitud CHECK (LENGTH(dni)=9),
	CONSTRAINT ck_iban_longitud CHECK (LENGTH(iban)=34),
	CONSTRAINT ck_dni_letra CHECK (dni ~ '\d{8}[A-Z]|[a-z]')
);

CREATE TABLE departamentos (
	id					serial,
	nombre				varchar(100) NOT NULL,
	CONSTRAINT pk_departamentos PRIMARY KEY(id)
);

CREATE TABLE zonas (
	id					serial,
	nombre				varchar(100) NOT NULL,
	precio_fianza		numeric NOT NULL,
	CONSTRAINT pk_zonas PRIMARY KEY(id)
);

CREATE TABLE empleados (
	id					serial,
	nombre				varchar (100) NOT NULL UNIQUE,
	apellidos			varchar (100) NOT NULL,
	telefono			varchar (13) NOT NULL,
	email				varchar (50) NOT NULL UNIQUE,
	dni					varchar (9) NOT NULL UNIQUE,
	seguridad_social	varchar (12) NOT NULL UNIQUE,
	iban				varchar (34) NOT NULL UNIQUE,
	salario				numeric NOT NULL,
	id_departamento		int NOT NULL,
    foto                varchar(300),
    redes               varchar(100) NOT NULL,
    id_usuario          int NOT NULL,
	CONSTRAINT pk_empleados PRIMARY KEY (id),
	CONSTRAINT ck_email_arroba CHECK (email ILIKE '%@%'),
	CONSTRAINT ck_dni_longitud CHECK (LENGTH(dni)=9),
	CONSTRAINT ck_iban_longitud CHECK (LENGTH(iban)=34),
	CONSTRAINT ck_segsocial_longitud CHECK (LENGTH(seguridad_social)=12),
	CONSTRAINT ck_dni_letra CHECK (dni ~ '\d{8}[A-Z]|[a-z]')
);

CREATE TABLE salas (
    id                  serial,
    empleado            int NOT NULL,
    CONSTRAINT pk_salas PRIMARY KEY (id)
);

CREATE TABLE reserva (
    id                  serial,
    cliente             int NOT NULL,
    descuento           numeric,
    fecha_reserva       date NOT NULL,
    precio_disenio      numeric,
    precio_total        numeric,
    sala_id             int NOT NULL,
    zona_id             int NOT NULL,
    CONSTRAINT pk_reserva PRIMARY KEY (id)
);

ALTER TABLE empleados ADD CONSTRAINT fk_empleados_departamentos FOREIGN KEY (id_departamento) REFERENCES departamentos(id);
ALTER TABLE empleados ADD CONSTRAINT fk_empleados_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id);
ALTER TABLE salas ADD CONSTRAINT fk_salas_empleados FOREIGN KEY (empleado) REFERENCES empleados(id);
ALTER TABLE reserva ADD CONSTRAINT fk_reserva_cliente FOREIGN KEY (cliente) REFERENCES usuarios (id);
ALTER TABLE reserva ADD CONSTRAINT fk_reserva_sala FOREIGN KEY (sala_id) REFERENCES salas (id);
ALTER TABLE reserva ADD CONSTRAINT fk_reserva_zona FOREIGN KEY (zona_id) REFERENCES zonas (id);
ALTER TABLE reserva ALTER COLUMN descuento SET DEFAULT 0;