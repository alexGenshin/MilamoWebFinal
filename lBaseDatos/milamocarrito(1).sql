-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 09-12-2021 a las 04:52:35
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `milamocarrito`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

DROP TABLE IF EXISTS `compras`;
CREATE TABLE IF NOT EXISTS `compras` (
  `idCompras` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) UNSIGNED NOT NULL,
  `idPago` int(11) UNSIGNED NOT NULL,
  `FechaCompras` varchar(11) DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `Compras_FKIndex1` (`idPago`),
  KEY `Compras_FKIndex2` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompras`, `idUsuario`, `idPago`, `FechaCompras`, `Monto`, `Estado`) VALUES
(1, 12, 1, '2021-12-07', 122, 'cancelado'),
(2, 3, 2, '2021-12-07', 46, 'cancelado'),
(3, 1, 3, '2021-12-08', 61, 'cancelado'),
(4, 3, 3, '2021-12-08', 58, 'cancelado'),
(5, 3, 3, '2021-12-08', 61, 'cancelado'),
(6, 3, 3, '2021-12-08', 0, 'cancelado'),
(7, 3, 3, '2021-12-08', 0, 'cancelado'),
(8, 3, 3, '2021-12-08', 0, 'cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consulta`
--

DROP TABLE IF EXISTS `consulta`;
CREATE TABLE IF NOT EXISTS `consulta` (
  `idConsulta` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL,
  `correo` varchar(50) NOT NULL,
  `mensaje` varchar(255) NOT NULL,
  PRIMARY KEY (`idConsulta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
CREATE TABLE IF NOT EXISTS `detalle_compras` (
  `idDetalle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) UNSIGNED NOT NULL,
  `idCompras` int(11) UNSIGNED NOT NULL,
  `Cantidad` int(11) UNSIGNED DEFAULT NULL,
  `PrecioCompra` double DEFAULT NULL,
  PRIMARY KEY (`idDetalle`,`idProducto`,`idCompras`),
  KEY `Producto_has_Compras_FKIndex1` (`idProducto`),
  KEY `Producto_has_Compras_FKIndex2` (`idCompras`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `detalle_compras`
--

INSERT INTO `detalle_compras` (`idDetalle`, `idProducto`, `idCompras`, `Cantidad`, `PrecioCompra`) VALUES
(1, 1, 1, 2, 16),
(2, 2, 1, 2, 29),
(3, 3, 1, 2, 16),
(4, 4, 2, 1, 19),
(5, 5, 2, 1, 12),
(6, 6, 2, 1, 15),
(7, 1, 3, 1, 16),
(8, 2, 3, 1, 29),
(9, 3, 3, 1, 16),
(10, 2, 4, 2, 29),
(11, 1, 5, 1, 16),
(12, 2, 5, 1, 29),
(13, 3, 5, 1, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pago`
--

DROP TABLE IF EXISTS `pago`;
CREATE TABLE IF NOT EXISTS `pago` (
  `idPago` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Monto` double DEFAULT NULL,
  PRIMARY KEY (`idPago`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pago`
--

INSERT INTO `pago` (`idPago`, `Monto`) VALUES
(1, 122),
(2, 46),
(3, 61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

DROP TABLE IF EXISTS `producto`;
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(255) DEFAULT NULL,
  `Imagen` varchar(250) DEFAULT NULL,
  `Descripcion` varchar(255) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  `Stock` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `Nombre`, `Imagen`, `Descripcion`, `Precio`, `Stock`) VALUES
(1, 'Torta Bomba Brownie con Frutos', 'http://localhost:80/carrito1/torta_arand.jpg', 'Es la combinacion perfecta de lo chicloso del brownie, dulce de leche y merengue, con lo fresquito de las frutillas y arandanos.', 16, 7),
(2, 'Torta de Suspiro', 'http://localhost:80/carrito1/torta_suspiro.jpg', 'Es un tipo de postre, hecho con clara de huevo batida y azucar, a los que se les puede aÃ±adir vainilla, avellana o almendras.', 29, 7),
(3, 'Galletas de Chocolate', 'http://localhost:80/carrito1/galletas_choco.jpg', 'Son un tipo especial de galletas de chocolate que contiene manjar blanco', 16, 7),
(4, 'Pastel de Limon y Arandanos', 'http://localhost:80/carrito1/pastel_limon.jpg', 'Este es un pastel de limon y arandanos casera y nutritivos. Este es una eleccion geninal ya que es nutritiva', 19, 9),
(5, 'Snacks', 'http://localhost:80/carrito1/snacks.jpg', 'Estos son nuestros Snacks ideales para cualquier fiesta o evento.Como el cumpleaños de un familiar por ejemplo.Se que te facinaran.', 12, 9),
(6, 'Torta de Chocolate', 'http://localhost/carrito1/torta_choco.jpg', 'Esta torta es un clasico de clasicos. Pero esta torta a diferencia delresto esta hecha con cacao 100% y casero.Te lo recomendamos', 20, 10),
(10, 'Gelatina', 'http://localhost/carrito1/gelatina.jpg', 'Gelatina', 10, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `Dni` varchar(9) DEFAULT NULL,
  `Nombres` varchar(255) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `rol` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `Dni`, `Nombres`, `Direccion`, `Email`, `Password`, `rol`) VALUES
(1, '4949', 'carlos', 'chosica', 'carlos@gmail.com', '12345', 'admin'),
(3, '76905492', 'Cielo', 'Lima Peru', 'cielo@gmail.com', '12345', 'cliente'),
(4, '01536954', 'Ximena', 'Lima - San Isidro', 'ximena@gmail.com', '123', 'cliente'),
(5, '02584266', 'Angela ', 'Piura', 'angela@gmail.com', '12345', 'cliente'),
(7, '15252313', 'Juan', 'Lima ', 'juan@gmail.com', '12345', 'cliente'),
(10, '1591599 ', 'Victoria ', 'Lima ', 'victoria@gmail.com ', '12345 ', 'cliente'),
(11, '159464', 'Alex', 'Ate', 'alex@gmail.com', '12345', 'cliente'),
(12, '123456', 'Jose', 'Ate', 'jose@gmail.com', '12345', 'admin'),
(13, '0000000', 'admin', 'anonimo', 'admin@gmail.com', 'admin', 'admin');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `detalle_compras`
--
ALTER TABLE `detalle_compras`
  ADD CONSTRAINT `detalle_compras_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `detalle_compras_ibfk_2` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
