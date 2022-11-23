-- Using PostgreSql 

--CREATE DATABASE domus
--  WITH OWNER = postgres

CREATE DATABASE domus;


--CREATE TABLE CLIENTES 
CREATE TABLE Clientes 
(
  idCliente serial NOT NULL,
  nombreCliente VARCHAR(50) NOT NULL,
  apellidoCliente VARCHAR(50) NOT NULL,
  DNI INTEGER NOT NULL,
  direccionCliente VARCHAR(50) NOT NULL,
  telefonoCliente INTEGER NOT NULL,
  PRIMARY KEY (idCliente)
);

--INSERT CLIENTES 
INSERT INTO Clientes (nombreCliente, apellidoCliente, DNI, direccionCliente, telefonoCliente) VALUES ('Juan', 'Perez', 12345678, 'Av. Siempre Viva 123', 123456789);


--CREATE TABLE PROPIEDADES
CREATE TABLE Propiedades
(
  idPropiedad serial NOT NULL,
  descripcionPropiedad VARCHAR(150) NOT NULL,
  direccionPropiedad VARCHAR(50) NOT NULL,
  idCliente INTEGER NOT NULL,
  CONSTRAINT propiedades_pkey PRIMARY KEY (idPropiedad),
  FOREIGN KEY (idCliente) REFERENCES Clientes(idCliente)
);

--INSERT PROPIEDADES 
INSERT INTO Propiedades (descripcionPropiedad, direccionPropiedad, idCliente) VALUES ('Casa de 3 dormitorios', 'Av. Siempre Viva 123',1);
INSERT INTO Propiedades (descripcionPropiedad, direccionPropiedad, idCliente) VALUES ('Casa de 2 dormitorios', 'French 69',1);



--CREATE TABLE RECLAMOS
CREATE TABLE RECLAMOS
(
    idReclamo serial NOT NULL,
    tituloReclamo VARCHAR(50) NOT NULL,
    descripcionReclamo VARCHAR(150) NOT NULL,
    fechaReclamo TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    estadoReclamo VARCHAR DEFAULT 'pendiente',
    propiedadReclamo INTEGER NOT NULL,
    clienteReclamo INTEGER NOT NULL,
    PRIMARY KEY (idReclamo),
    CONSTRAINT reclamos_propiedadReclamo_fkey FOREIGN KEY (propiedadReclamo)
        REFERENCES Propiedades (idPropiedad) MATCH SIMPLE
        ON UPDATE NO ACTION ON DELETE NO ACTION,
    CONSTRAINT reclamos_clienteReclamo_fkey FOREIGN KEY (clienteReclamo)
        REFERENCES Clientes (idCliente) MATCH SIMPLE
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- INSERT RECLAMOS

INSERT INTO RECLAMOS (tituloReclamo, descripcionReclamo, propiedadReclamo, clienteReclamo) VALUES ('Reclamo 1', 'Reclamo 1', 1, 1);


-- SELECT UN RECLAMO Y la direccion de la propiedad de dicho reclamo

SELECT r.tituloReclamo, r.descripcionReclamo, TO_CHAR(r.fechaReclamo, 'DD/MM/YYYY') AS fechaReclamo, r.estadoReclamo, p.direccionPropiedad FROM RECLAMOS r INNER JOIN Propiedades p ON r.propiedadReclamo = p.idPropiedad WHERE r.idReclamo = 1;



