CREATE DATABASE aereopuerto_progra;
USE aereopuerto_progra;

CREATE TABLE `aerolineas` (
  `codigo_aerolinea` varchar(10) NOT NULL,
  `nombre_aerolinea` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo_aerolinea`)
);

CREATE TABLE `boletos` (
  `numero_boleto` varchar(20) NOT NULL,
  `nombre_pasajero` varchar(100) NOT NULL,
  `numero_reserva` varchar(20) NOT NULL,
  PRIMARY KEY (`numero_boleto`),
  KEY `numero_reserva` (`numero_reserva`),
  CONSTRAINT `boletos_ibfk_1` FOREIGN KEY (`numero_reserva`) REFERENCES `reservas` (`numero_reserva`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `pasajeros` (
  `numero_pasajero` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`numero_pasajero`)
);

CREATE TABLE `reservas` (
  `numero_reserva` varchar(20) NOT NULL,
  `ruta` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `hora_abordaje` time NOT NULL,
  `hora_salida` time NOT NULL,
  `hora_llegada` time NOT NULL,
  `numero_vuelo` varchar(10) NOT NULL,
  `asiento` varchar(10) NOT NULL,
  PRIMARY KEY (`numero_reserva`),
  KEY `numero_vuelo` (`numero_vuelo`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`numero_vuelo`) REFERENCES `vuelos` (`numero_vuelo`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `vuelos` (
  `numero_vuelo` varchar(10) NOT NULL,
  `codigo_aerolinea` varchar(10) NOT NULL,
  `ruta_origen` varchar(10) NOT NULL,
  `ruta_destino` varchar(10) NOT NULL,
  PRIMARY KEY (`numero_vuelo`),
  KEY `codigo_aerolinea` (`codigo_aerolinea`),
  CONSTRAINT `vuelos_ibfk_1` FOREIGN KEY (`codigo_aerolinea`) REFERENCES `aerolineas` (`codigo_aerolinea`) ON DELETE CASCADE ON UPDATE CASCADE
);