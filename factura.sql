
CREATE TABLE PAIS(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50) UNIQUE,
    CONSTRAINT PK_IDPAIS PRIMARY KEY(ID)
);

CREATE TABLE DEPARTAMENTO(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    IDPAISFK INT(11),
    CONSTRAINT PK_IDDEPARTAMENTO PRIMARY KEY(ID),
    CONSTRAINT FK_IDPAIS FOREIGN KEY (IDPAISFK) REFERENCES PAIS(ID)
);

CREATE TABLE CIUDAD(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    IDDEPARTAMENTOFK INT(11),
    CONSTRAINT PK_IDCIUDAD PRIMARY KEY(ID),
    CONSTRAINT FK_IDDEPARTAMENTO FOREIGN KEY (IDDEPARTAMENTOFK) REFERENCES DEPARTAMENTO(ID)
);

CREATE TABLE TIPOPERSONA(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_IDTIPOPERSONA PRIMARY KEY(ID)
);

CREATE TABLE PRESENTACION(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_IDPRESENTACION PRIMARY KEY(ID)
);

CREATE TABLE ROLPERSONA(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_IDROLPERSONA PRIMARY KEY(ID)
);

CREATE TABLE FORMAPAGO(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_IDFORMAPAGO PRIMARY KEY(ID)
);

CREATE TABLE TIPOMOVINVENTARIO(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_TIPOMOVINVENTARIO PRIMARY KEY(ID)
);

CREATE TABLE TIPOCONTACTO(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_TIPOCONTACTO PRIMARY KEY(ID)
);

CREATE TABLE MARCA (
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_MARCA PRIMARY KEY(ID)
);

CREATE TABLE PRODUCTO(
    COD VARCHAR(10),
    NOMBREPROD VARCHAR(100),
    IDMARCA INT (11),
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (COD),
    CONSTRAINT FK_IDMARCA FOREIGN KEY (IDMARCA) REFERENCES MARCA(ID)
);

CREATE TABLE TIPODOCUMENTO(
    ID INT AUTO_INCREMENT,
    NOMBRE VARCHAR(50),
    CONSTRAINT PK_TIPODOCUMENTO PRIMARY KEY(ID)
);

CREATE TABLE PERSONA(
    ID VARCHAR (20),
    NOMBRE VARCHAR (50),
    FECHAREGISTRO DATE,
    IDDOCUMENTO INT (11),
    IDROLPERSONA INT(11),
    IDTIPOPERSONA INT (11),
    CONSTRAINT PK_PERSONA PRIMARY KEY(ID),
    CONSTRAINT FK_IDDOCUMENTO FOREIGN KEY (IDDOCUMENTO) REFERENCES TIPODOCUMENTO (ID),
    CONSTRAINT FK_IDROLPERSONA FOREIGN KEY (IDROLPERSONA) REFERENCES ROLPERSONA (ID),
    CONSTRAINT FK_IDTIPOPERSONA FOREIGN KEY (IDTIPOPERSONA) REFERENCES TIPOPERSONA (ID)
);

CREATE TABLE UBICACIONPERSONA(
    IDDIRECCION INT AUTO_INCREMENT,
    TIPODEVIA VARCHAR(50),
    NUMEROPRI SMALLINT,
    LETRA CHAR(2),
    BIS CHAR(10),
    LETRASEC CHAR(2),
    CARDINAL CHAR(10),
    NUMEROSEC SMALLINT,
    LETRATER CHAR(2),
    NUMEROTER SMALLINT,
    CARDINALSEC CHAR(10),
    COMPLEMENTO VARCHAR(50),
    IDPERSONA VARCHAR(20),
    IDCIUDAD INT(11),
    CONSTRAINT PK_DIRECCION PRIMARY KEY(IDDIRECCION),
    CONSTRAINT FK_IDPERSONA FOREIGN KEY (IDPERSONA) REFERENCES PERSONA(ID),
    CONSTRAINT FK_IDCIUDAD FOREIGN KEY (IDCIUDAD) REFERENCES CIUDAD(ID)
);

CREATE TABLE CONTACTOPERSONA(
    ID INT AUTO_INCREMENT,
    IDPERSONA VARCHAR(20),
    IDTIPOCONTACTO INT (11),
    CONSTRAINT PK_CONTACTOPERSONA PRIMARY KEY(ID),
    CONSTRAINT FK_IDPERSONACONTACTO FOREIGN KEY (IDPERSONA) REFERENCES PERSONA(ID),
    CONSTRAINT FK_IDTIPOCONTACTO FOREIGN KEY (IDTIPOCONTACTO) REFERENCES TIPOCONTACTO(ID)
);

CREATE TABLE INVENTARIO(
    ID VARCHAR(10),
    NOMBRE VARCHAR(50),
    PRECIO DOUBLE(11, 2),
    STOCK SMALLINT,
    STOCKMIN SMALLINT,
    STOCKMAX SMALLINT,
    CODPRODUCTO VARCHAR(10),
    IDPRESENTACION INT(11),
    CONSTRAINT PK_IDINVENTARIO PRIMARY KEY (ID),
    CONSTRAINT FK_CODPRODUCTO FOREIGN KEY (CODPRODUCTO) REFERENCES PRODUCTO(COD),
    CONSTRAINT FK_IDPRESENTACION FOREIGN KEY (IDPRESENTACION) REFERENCES PRESENTACION(ID)
);

CREATE TABLE FACTURA(
    ID INT AUTO_INCREMENT,
    FACTURAINICIAL INT,
    FACTURAFINAL INT,
    FACTURAACTUAL INT,
    NRORESOLUCION VARCHAR(10),
    CONSTRAINT PK_IDFACTURA PRIMARY KEY (ID)
);

CREATE TABLE MOVIMIENTOINVENTARIO(
    ID VARCHAR(10),
    IDRESPONSABLE VARCHAR(20),
    IDRECEPTOR VARCHAR(20),
    FECHAMOVIMIENTO DATE,
    FECHAVENCIMIENTO DATE,
    IDTIPOMOVINV INT(11),
    CONSTRAINT PK_IDMOVINV PRIMARY KEY(ID),
    CONSTRAINT FK_IDRESPONSABLE FOREIGN KEY (IDRESPONSABLE) REFERENCES PERSONA(ID),
    CONSTRAINT FK_IDRECEPTOR FOREIGN KEY (IDRECEPTOR) REFERENCES PERSONA(ID),
    CONSTRAINT FK_IDTIPOMOVINV FOREIGN KEY (IDTIPOMOVINV) REFERENCES TIPOMOVINVENTARIO(ID)
);

CREATE TABLE DETALLEMOVINVENTARIO(
    IDINVENTARIO VARCHAR(10),
    IDMOVINV VARCHAR(10),
    CANTIDAD TINYINT,
    PRECIO DOUBLE(11, 2),
    CONSTRAINT PK_IDINVENTARIO_IDMOVINV PRIMARY KEY (IDINVENTARIO, IDMOVINV),
    CONSTRAINT FK_IDINVENTARIO FOREIGN KEY (IDINVENTARIO) REFERENCES INVENTARIO(ID),
    CONSTRAINT FK_IDMOVINV FOREIGN KEY (IDMOVINV) REFERENCES MOVIMIENTOINVENTARIO(ID)
);

ALTER TABLE MOVIMIENTOINVENTARIO ADD IDFORMAPAGO INT(11);

ALTER TABLE MOVIMIENTOINVENTARIO ADD FOREIGN KEY (IDFORMAPAGO) REFERENCES FORMAPAGO(ID);

ALTER TABLE PAIS MODIFY COLUMN NOMBRE VARCHAR(50) UNIQUE;

INSERT INTO pais(NOMBRE) VALUES ('Colombia'),('Ecuador'),('Panama');
INSERT INTO DEPARTAMENTO(NOMBRE, IDPAISFK) VALUES ('Amazonas',1),('Antioquia',1),('Arauca',1),('Atlantico',1),('Bolivar',1),('Boyaca',1),('Caldas',1),('Caqueta',1),('Casanare',1),('Cauca',1),('Cesar',1),('Choco',1),('Cordoba',1),('Cundinamarca',1),('Guainia',1),('Guaviare',1),('Huila',1),('La Guajira',1),('Magdalena',1),('Meta',1),('Nariño',1),('Norte De Santander',1),('Putumayo',1),('Quindio',1),('Risaralda',1),('San Andres',1),('Santander',1),('Sucre',1),('Tolima',1),('Valle Del Cauca',1),('Vaupes',1),('Vichada',1);

INSERT INTO CIUDAD(NOMBRE, IDDEPARTAMENTOFK) VALUES ('Leticia',1),('La Victorio',1),('Puerto Nariño',1),('Medellin',2),('Ituango',2),('Andes',2),('Arauca',3),('Arauquita',3),('Puerto Rondon',3),('Barranquilla',4),('Puerto Colombia',4),('Candelaria',4),('Cartagena',5),('Santa Catalinas',5),('Margarita',5),('Tunja',6),('	Chiquinquira',6),('Garagoa',6),('Manizales',7),('Pensilvania',7),('Filadelfia',7),('Florencia',8),('Solano',8),('Morelia',8),('Yopal',9),('Mani',9),('Monterrey',9),('Popayan',10),('El Tambo',10),('Argelia',10),('Valledupar',11),('San Martin',11),('Agua Chica',11),('Quibdo',12),('Rio Sucio',12),('Bojaya',12),('Monteria',13),('Valencia',13),('San Antero',13),('Bogota',14),('Guapes',14),('Venecia',14),('Inirida',15),('Puerto Colombia',15),('Pana Pana',15),('San Jose del Guaviare',16),('Miraflores',16),('Calamar',16),('Neiva',17),('Palermo',17),('san Agustin',17),('Rioacha',18),('Uribia',18),('Maicao',18),('Santa Marta',19),('El Piñon',19),('Algarrobo',19),('Villavicencio',20),('Puerto Galan',20),('Puerto Rico',20),('Pasto',21),('Santacruz',21),('Los Andes',21),('Cucuta',22),('Cucutilla',22),('Chitaga',22),('Mocoa',23),('Orito',23),('Colon',23),('Armenia',24),('Calarca',24),('Montenegro',24),('Pereira',25),('Dosquebradas',25),('La Virginia',25),('San Andres',26),('Providencia',26),('Santa Catalina',26),('Bucaramanga',27),('Floridablanca',27),('Piedecuesta',27),('Sincelejo',28),('San Marcos',28),('Since',28),('Ibague',29),('Chaparral',29),('Guamo',29),('Cali',30),('Palmira',30),('Buga',30),('Mitu',31),('Pacoa',31),('Taraira',31),('Puerto Carreño',32),('La Primavera',32),('Santa Rosalia',32);


-- DML
-- INSERT (CREAR NUEVOS REGISTROS)
-- INSERT INTO [TABLA](C1,C2,TC..) VALUES ();
-- VC -> ''
-- FECHA -> ''
-- NUMERICOS -> 4345
pais
INSERT INTO pais(nombre) VALUES ('Peru'),('Ecuador'),('Panama'); 
DELETE
UPDATE

-- DQL 
SELECT id, nombre
FROM pais;
ALTER TABLE pais ADD UNIQUE(nombre);

INSERT INTO departamento(nombre,idpaisFk) VALUES ('Santander',1);
-- +------------------+-------------+------+-----+---------+----------------+
-- | Field            | Type        | Null | Key | Default | Extra          |
-- +------------------+-------------+------+-----+---------+----------------+
-- | id               | int         | NO   | PRI | NULL    | auto_increment |
-- | nombre           | varchar(50) | YES  |     | NULL    |                |
-- | iddepartamentoFk | int         | YES  | MUL | NULL    |                |
-- +------------------+-------------+------+-----+---------+----------------+
INSERT INTO ciudad(nombre,iddepartamentoFk) VALUES ('Bucaramanga',1),('Giron',1),('Piedecuesta',1)
,('Floridablanca',1);

-- SELECT C1,C2,C3.....
-- FROM TABLA
-- INNER JOIN TBL1 ON PK = FK


SELECT p.id,p.nombre As NombrePais ,d.nombre As NombreDep
FROM pais AS p
JOIN departamento AS d ON p.id = d.idpaisFk;

SELECT p.id,p.nombre As NombrePais ,d.nombre As NombreDep,
c.nombre AS NombreCiud
FROM pais AS p
JOIN departamento AS d ON p.id = d.idpaisFk
JOIN ciudad AS c ON d.id = c.iddepartamentoFk
ORDER BY c.nombre ASC;

-- CLAUSULAS
-- - WHERE -> CONDICIONES DE CONSULTA
-- OPERADORES COMPARACION
-- =, <, >, >=, <=, <>
-- OPERADORES DE PATRON 
-- like '%xxx%'
--  '%xxx'
--  'xxx%'
-- OPERADORES LOGICOS
-- AND, OR, NOT

SELECT p.id,p.nombre As NombrePais ,d.nombre As NombreDep,
c.nombre AS NombreCiud
FROM pais AS p
JOIN departamento AS d ON p.id = d.idpaisFk
JOIN ciudad AS c ON d.id = c.iddepartamentoFk
WHERE c.nombre LIKE 'MANGA%';

SELECT p.id,p.nombre As NombrePais ,d.nombre As NombreDep,
c.nombre AS NombreCiud
FROM pais AS p
JOIN departamento AS d ON p.id = d.idpaisFk
JOIN ciudad AS c ON d.id = c.iddepartamentoFk
WHERE c.nombre LIKE '%MANGA';

SELECT p.id,p.nombre As NombrePais ,d.nombre As NombreDep,
c.nombre AS NombreCiud
FROM pais AS p
JOIN departamento AS d ON p.id = d.idpaisFk
JOIN ciudad AS c ON d.id = c.iddepartamentoFk
WHERE c.nombre LIKE '%MANGA%';

------------------------------------------------------
-- UPDATE
-- UPDATE {TBL} SET C=V WHERE CONDICION
INSERT INTO pais(nombre) VALUES ('Benezuela');
UPDATE pais SET nombre='Venezuela' WHERE id = 6;
------------------------------------------------------
-- DELETE
-- DELETE FROM TBL WHERE CONDICION
DELETE FROM pais WHERE id = 6;


