-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2019 a las 23:42:31
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `venta`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idclient` int(11) NOT NULL COMMENT 'Este campo es el identificador del cliente registrado',
  `nomClient` varchar(70) DEFAULT NULL COMMENT 'contiene los nombres del cliente',
  `apeClient` varchar(100) DEFAULT NULL COMMENT 'contiene los apellidos del cliente',
  `dniClient` char(8) DEFAULT NULL COMMENT 'contiene el numero de DNI del cliente',
  `dirClient` varchar(100) NOT NULL COMMENT 'contiene la direccion del domicilio del cliente'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabla contiene toda la informacion de los clientes ';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProd` int(11) NOT NULL COMMENT 'contiene el identificador de cada producto',
  `descProd` varchar(150) DEFAULT NULL COMMENT 'contiene la descripcion del producto',
  `precunitProd` decimal(6,2) DEFAULT NULL COMMENT 'precio unitario por producto'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene toda la informacon de los productos que se van a ve';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `codVent` int(4) NOT NULL COMMENT 'Va a tener codigo 0001',
  `fecVent` date DEFAULT NULL COMMENT 'Contiene la fecha de las ventas'
) ENGINE=InnoDB DEFAULT CHARSET=ascii COMMENT='aqui se registran las ventas';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `idVentDet` int(11) NOT NULL COMMENT 'Contiene el identificador de cada producto vendido'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Contiene el detalle de cada producto vendido';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idclient`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProd`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`codVent`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`idVentDet`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idclient` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Este campo es el identificador del cliente registrado';

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProd` int(11) NOT NULL AUTO_INCREMENT COMMENT 'contiene el identificador de cada producto';

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `codVent` int(4) NOT NULL AUTO_INCREMENT COMMENT 'Va a tener codigo 0001';

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `idVentDet` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Contiene el identificador de cada producto vendido';

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idclient`) REFERENCES `venta` (`codVent`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idProd`) REFERENCES `venta_detalle` (`idVentDet`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`codVent`) REFERENCES `venta_detalle` (`idVentDet`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
