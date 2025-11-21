-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-11-2025 a las 05:21:49
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `famcash_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `concepto`
--

CREATE TABLE `concepto` (
  `id_concepto` int(11) NOT NULL,
  `nombre_concepto` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `concepto`
--

INSERT INTO `concepto` (`id_concepto`, `nombre_concepto`, `tipo`) VALUES
(4, 'Alimentos', 'Egreso'),
(12, 'Cobro Alquiler', 'Ingreso'),
(9, 'ConceptoPapa', 'Ingreso'),
(15, 'Dictado de clases', 'Ingreso'),
(11, 'Mascotas', 'Egreso'),
(14, 'Otros egresos', 'Egreso'),
(3, 'Otros ingresos', 'Ingreso'),
(8, 'Salud', 'Egreso'),
(7, 'Servicios', 'Egreso'),
(1, 'Sueldo', 'Ingreso'),
(5, 'Transporte', 'Egreso'),
(10, 'Varios', 'Egreso'),
(2, 'Venta', 'Ingreso'),
(13, 'Venta Tortas', 'Ingreso'),
(6, 'Vivienda', 'Egreso');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familia`
--

CREATE TABLE `familia` (
  `id_familia` int(11) NOT NULL,
  `nombre_familia` varchar(50) NOT NULL,
  `contraseña_familia` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `familia`
--

INSERT INTO `familia` (`id_familia`, `nombre_familia`, `contraseña_familia`) VALUES
(1, 'Familia García', '$2y$10$dj1e2QNP8G.k6msRcR2q4.B40lG4MKZlNFglKCXggIoOzcwENEHJW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil`
--

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL,
  `id_familia_Familia` int(11) NOT NULL,
  `nombre_perfil` varchar(50) NOT NULL,
  `contraseña_perfil` varchar(255) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `rol` varchar(20) NOT NULL,
  `estado` varchar(20) NOT NULL DEFAULT 'Habilitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `id_familia_Familia`, `nombre_perfil`, `contraseña_perfil`, `alias`, `rol`, `estado`) VALUES
(1, 1, 'Gustavo', '$2y$10$fqdde7MBNJBcpmH1cPhqweUQmzL3Z6FWstQU3hzJCDSxP0QJsW6ZG', NULL, 'Admin', 'habilitado'),
(2, 1, 'Miriam', '$2y$10$RTGVffFm6Iqd0P0C2sHTMOhZelyhggURp7lXtmxgmVJfZ4cezHB0C', NULL, 'Miembro', 'Habilitado'),
(3, 1, 'Leonardo', '$2y$10$bizfP7kJCR7AJ0cNDKsXse4teZ45TnYUg/pZv0iCo.SgRWC6zoUjC', NULL, 'Miembro', 'Habilitado'),
(4, 1, 'Elizabeth', '$2y$10$YaFy2dAliGTb5qrFSaHMquHVFKsORprTDryCNqodnlvdlek7CvTbe', NULL, 'Miembro', 'Habilitado'),
(5, 1, 'George', '$2y$10$VgCYg6n5WuJr96eS3qhRuuJ1v2HalKKa0hripVpKnq/98d6xqdMZu', NULL, 'Miembro', 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfil_concepto`
--

CREATE TABLE `perfil_concepto` (
  `id_perfil_Perfil` int(11) NOT NULL,
  `id_familia_Familia` int(11) NOT NULL,
  `id_concepto_Concepto` int(11) NOT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `alias_concepto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil_concepto`
--

INSERT INTO `perfil_concepto` (`id_perfil_Perfil`, `id_familia_Familia`, `id_concepto_Concepto`, `activo`, `alias_concepto`) VALUES
(1, 1, 1, 1, 'Salario'),
(1, 1, 2, 1, 'Venta'),
(1, 1, 3, 1, 'Otros ingresos'),
(1, 1, 4, 1, 'Alimentos'),
(1, 1, 5, 1, 'Transporte'),
(1, 1, 6, 1, 'Vivienda'),
(1, 1, 7, 1, 'Servicios'),
(1, 1, 8, 1, 'Salud'),
(1, 1, 11, 1, 'Mascotas'),
(1, 1, 12, 1, 'Cobro Alquiler'),
(2, 1, 1, 1, 'Salario'),
(2, 1, 2, 1, 'Venta Productos'),
(2, 1, 3, 1, 'Otros ingresos'),
(2, 1, 4, 1, 'Comida'),
(2, 1, 5, 1, 'Transporte'),
(2, 1, 6, 1, 'Vivienda'),
(2, 1, 7, 1, 'Servicios'),
(2, 1, 8, 1, 'Medicina'),
(2, 1, 13, 1, 'Venta Tortas'),
(2, 1, 14, 1, 'Otros egresos'),
(3, 1, 1, 1, 'Trabajo freelance'),
(3, 1, 2, 1, 'Ventas online'),
(3, 1, 3, 1, 'Mesada'),
(3, 1, 4, 1, 'Comida'),
(3, 1, 5, 1, 'Movilidad'),
(3, 1, 6, 1, 'Vivienda'),
(3, 1, 7, 1, 'Servicios'),
(3, 1, 8, 1, 'Salud'),
(3, 1, 15, 1, 'Dictado de clases'),
(4, 1, 1, 1, 'Salario'),
(4, 1, 2, 1, 'Venta'),
(4, 1, 3, 1, 'Propina'),
(4, 1, 4, 1, 'Antojos'),
(4, 1, 5, 1, 'Pasajes'),
(4, 1, 6, 1, 'Vivienda'),
(4, 1, 7, 1, 'Servicios'),
(4, 1, 8, 1, 'Salud'),
(5, 1, 1, 1, 'Salario'),
(5, 1, 2, 1, 'Venta'),
(5, 1, 3, 1, 'Propina semanal'),
(5, 1, 4, 1, 'Comida chatarra'),
(5, 1, 5, 1, 'Pasajes'),
(5, 1, 6, 1, 'Vivienda'),
(5, 1, 7, 1, 'Servicios'),
(5, 1, 8, 1, 'Salud');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recordatorio`
--

CREATE TABLE `recordatorio` (
  `id_recordatorio` int(11) NOT NULL,
  `id_perfil_Perfil` int(11) NOT NULL,
  `id_familia_Familia_Perfil` int(11) NOT NULL,
  `nombre_recordatorio` varchar(100) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `periodo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `recordatorio`
--

INSERT INTO `recordatorio` (`id_recordatorio`, `id_perfil_Perfil`, `id_familia_Familia_Perfil`, `nombre_recordatorio`, `fecha_creacion`, `fecha_inicio`, `periodo`) VALUES
(1, 4, 1, 'Comprar productos de higiene', '2025-11-20 22:38:31', '2025-11-20 00:00:00', 'semanal'),
(2, 5, 1, 'Comprar Cartulina', '2025-11-20 23:08:23', '2025-11-20 00:00:00', 'mensual'),
(3, 1, 1, 'Cobrar Alquiler', '2025-11-20 23:11:10', '2025-11-20 00:00:00', 'quincenal'),
(4, 1, 1, 'Comida para gato', '2025-11-20 23:13:06', '2025-11-20 00:00:00', 'semanal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id_transaccion` int(11) NOT NULL,
  `id_perfil_Perfil` int(11) NOT NULL,
  `id_concepto_Concepto` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `detalle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`id_transaccion`, `id_perfil_Perfil`, `id_concepto_Concepto`, `fecha`, `monto`, `detalle`) VALUES
(1, 1, 5, '2025-11-01 07:30:00', 80.00, 'Gasolina inicio mes'),
(2, 1, 4, '2025-11-03 18:00:00', 125.00, 'Supermercado semanal'),
(3, 1, 1, '2025-11-05 09:00:00', 3500.00, 'Salario mensual noviembre'),
(4, 1, 7, '2025-11-06 10:00:00', 95.00, 'Pago luz y agua'),
(5, 1, 4, '2025-11-08 17:30:00', 135.00, 'Compras del mercado'),
(6, 1, 6, '2025-11-10 08:00:00', 450.00, 'Pago alquiler noviembre'),
(7, 1, 5, '2025-11-11 08:15:00', 75.00, 'Gasolina semanal'),
(8, 1, 8, '2025-11-12 15:30:00', 75.00, 'Medicamentos recetados'),
(9, 1, 4, '2025-11-14 19:00:00', 110.00, 'Despensa familiar'),
(10, 1, 5, '2025-11-15 08:00:00', 85.00, 'Gasolina quincenal'),
(11, 1, 7, '2025-11-17 11:00:00', 65.00, 'Pago internet cable'),
(12, 1, 4, '2025-11-18 19:15:00', 95.50, 'Compras del mercado'),
(13, 1, 7, '2025-11-20 10:30:00', -95.00, 'Servicios básicos'),
(14, 1, 8, '2025-11-21 16:00:00', -80.00, 'Consulta médica familiar'),
(15, 1, 4, '2025-11-23 18:30:00', 88.00, 'Supermercado fin semana'),
(16, 1, 5, '2025-11-25 07:45:00', 80.00, 'Gasolina fin mes'),
(17, 1, 4, '2025-11-26 17:00:00', 105.00, 'Compras variadas'),
(18, 1, 4, '2025-11-28 18:00:00', 125.00, 'Despensa mensual'),
(19, 1, 7, '2025-11-29 15:00:00', 45.00, 'Pago streaming servicios'),
(20, 1, 5, '2025-11-30 08:00:00', 70.00, 'Gasolina cierre mes'),
(21, 2, 4, '2025-11-02 16:00:00', 65.00, 'Frutas y verduras'),
(22, 2, 4, '2025-11-04 17:30:00', 45.50, 'Pan y lácteos'),
(23, 2, 1, '2025-11-05 09:30:00', 2800.00, 'Salario mensual noviembre'),
(24, 2, 4, '2025-11-07 16:15:00', 68.00, 'Verduras y hortalizas'),
(25, 2, 4, '2025-11-09 18:00:00', 52.00, 'Carnes y pollo'),
(26, 2, 4, '2025-11-10 17:00:00', 48.00, 'Panadería y pastelería'),
(27, 2, 8, '2025-11-13 11:00:00', 95.00, 'Laboratorio análisis clínicos'),
(28, 2, 4, '2025-11-15 16:30:00', 60.00, 'Compras variadas'),
(29, 2, 4, '2025-11-16 18:30:00', 72.00, 'Pescado y mariscos'),
(30, 2, 7, '2025-11-18 15:30:00', 35.00, 'Recarga celular'),
(31, 2, 8, '2025-11-19 14:00:00', 120.00, 'Consulta ginecológica'),
(32, 2, 4, '2025-11-21 16:45:00', 65.00, 'Productos de higiene'),
(33, 2, 4, '2025-11-22 17:00:00', 70.00, 'Productos de limpieza'),
(34, 2, 4, '2025-11-24 17:30:00', 55.00, 'Compras menores'),
(35, 2, 8, '2025-11-26 14:00:00', 110.00, 'Consulta dermatológica'),
(36, 2, 4, '2025-11-27 16:00:00', 58.00, 'Frutas frescas'),
(37, 2, 4, '2025-11-28 18:15:00', 58.00, 'Frutas y snacks'),
(38, 2, 8, '2025-11-29 10:00:00', 85.00, 'Medicinas preventivas'),
(39, 2, 7, '2025-11-29 15:00:00', 35.00, 'Pago teléfono celular'),
(40, 2, 4, '2025-11-30 17:45:00', 60.00, 'Compras fin mes'),
(41, 3, 5, '2025-11-01 07:30:00', 15.00, 'Pasajes bus universidad'),
(42, 3, 2, '2025-11-03 15:00:00', 180.00, 'Venta libros usados'),
(43, 3, 4, '2025-11-04 13:00:00', 25.00, 'Almuerzo con amigos'),
(44, 3, 3, '2025-11-05 17:00:00', 100.00, 'Mesada semanal'),
(45, 3, 5, '2025-11-07 08:00:00', 15.00, 'Pasajes bus'),
(46, 3, 4, '2025-11-08 12:30:00', 30.00, 'Comida rápida'),
(47, 3, 4, '2025-11-10 13:30:00', 28.00, 'Pizza con amigos'),
(48, 3, 3, '2025-11-12 16:00:00', 100.00, 'Mesada semanal'),
(49, 3, 5, '2025-11-12 07:45:00', 15.00, 'Transporte universidad'),
(50, 3, 4, '2025-11-15 19:00:00', 35.00, 'Cena con novia'),
(51, 3, 5, '2025-11-17 08:00:00', 15.00, 'Pasajes universidad'),
(52, 3, 3, '2025-11-19 17:00:00', 100.00, 'Mesada semanal'),
(53, 3, 1, '2025-11-22 16:00:00', 350.00, 'Trabajo freelance diseño'),
(54, 3, 4, '2025-11-24 13:00:00', 32.00, 'Almuerzo especial'),
(55, 3, 3, '2025-11-26 16:30:00', 100.00, 'Mesada semanal'),
(56, 3, 5, '2025-11-28 07:30:00', 15.00, 'Transporte público'),
(57, 4, 4, '2025-11-01 17:30:00', 18.00, 'Snacks escolares'),
(58, 4, 3, '2025-11-04 15:00:00', 80.00, 'Propina semanal papá'),
(59, 4, 4, '2025-11-06 18:00:00', 24.00, 'Comida rápida'),
(60, 4, 5, '2025-11-08 16:30:00', 10.00, 'Taxi al colegio'),
(61, 4, 3, '2025-11-11 15:00:00', 80.00, 'Propina semanal papá'),
(62, 4, 4, '2025-11-13 17:00:00', 25.00, 'Helados con amigas'),
(63, 4, 4, '2025-11-15 18:00:00', 20.00, 'Snacks y dulces'),
(64, 4, 3, '2025-11-18 15:00:00', 80.00, 'Propina semanal papá'),
(65, 4, 4, '2025-11-20 18:30:00', -22.00, 'Café y merienda'),
(66, 4, 5, '2025-11-22 16:00:00', 12.00, 'Pasaje bus'),
(67, 4, 3, '2025-11-25 15:00:00', 80.00, 'Propina semanal papá'),
(68, 4, 4, '2025-11-28 17:00:00', 26.00, 'Salida con amigas'),
(69, 5, 4, '2025-11-02 17:00:00', 19.00, 'Dulces y helado'),
(70, 5, 3, '2025-11-04 15:30:00', 80.00, 'Propina semanal papá'),
(71, 5, 5, '2025-11-06 15:30:00', 8.00, 'Pasaje colegio'),
(72, 5, 4, '2025-11-07 16:30:00', 21.00, 'Comida chatarra'),
(73, 5, 3, '2025-11-11 15:30:00', 80.00, 'Propina semanal papá'),
(74, 5, 4, '2025-11-14 17:30:00', 22.00, 'Hamburguesa con amigos'),
(75, 5, 4, '2025-11-16 16:00:00', 18.00, 'Golosinas y refrescos'),
(76, 5, 3, '2025-11-18 15:30:00', 80.00, 'Propina semanal papá'),
(77, 5, 4, '2025-11-21 16:30:00', 20.00, 'Snacks y bebidas'),
(78, 5, 5, '2025-11-23 15:00:00', 10.00, 'Taxi escuela'),
(79, 5, 3, '2025-11-25 15:30:00', 80.00, 'Propina semanal papá'),
(80, 5, 4, '2025-11-29 17:30:00', 23.00, 'Pizza fin mes'),
(81, 1, 4, '2025-11-20 00:00:00', -50.00, 'Comida para gatos'),
(83, 1, 3, '2025-11-20 00:00:00', 200.00, 'Regalo de cumpleaños'),
(84, 1, 12, '2025-11-20 00:00:00', 750.00, 'Familia Vargas'),
(85, 1, 12, '2025-11-20 00:00:00', 750.00, 'Familia Quispe'),
(86, 1, 12, '2025-11-20 00:00:00', 350.00, 'Inquilino Zeballos'),
(87, 1, 3, '2025-11-20 00:00:00', 200.00, 'Bono trabajo'),
(88, 2, 1, '2025-11-20 00:00:00', 1500.00, 'Trabajo'),
(89, 2, 2, '2025-11-20 00:00:00', 250.00, 'Vestido TEMU'),
(90, 2, 13, '2025-11-20 00:00:00', 320.00, '40 porciones'),
(91, 2, 3, '2025-11-20 00:00:00', 750.00, 'Pollada'),
(92, 2, 14, '2025-11-20 00:00:00', -200.00, 'Spa'),
(93, 2, 4, '2025-11-20 00:00:00', -16.50, 'Starbucks'),
(94, 2, 5, '2025-11-20 00:00:00', -90.00, 'Gasolina'),
(95, 2, 8, '2025-11-20 00:00:00', -5.00, 'Paracetamol'),
(96, 2, 4, '2025-11-20 00:00:00', -15.00, 'Almuerzo'),
(97, 2, 13, '2025-11-19 00:00:00', 296.00, '37 porciones'),
(98, 2, 4, '2025-11-19 00:00:00', -215.00, 'Compra polladas'),
(99, 2, 5, '2025-11-19 00:00:00', -50.00, 'Gasolina'),
(100, 2, 2, '2025-11-19 00:00:00', 75.00, 'Mochila TEMU'),
(101, 2, 13, '2025-11-19 00:00:00', 160.00, '2 tortas enteras'),
(102, 2, 4, '2025-11-18 00:00:00', -16.50, 'Starbucks'),
(103, 2, 4, '2025-11-18 00:00:00', -15.00, 'Almuerzo'),
(104, 2, 4, '2025-11-19 00:00:00', -15.00, 'Almuerzo'),
(105, 2, 5, '2025-11-18 00:00:00', -30.00, 'Gasolina'),
(106, 2, 13, '2025-11-18 00:00:00', 336.00, '42'),
(107, 2, 2, '2025-11-18 00:00:00', 47.00, 'Collares TEMU'),
(108, 2, 13, '2025-11-18 00:00:00', 80.00, '1 torta entera'),
(109, 3, 1, '2025-11-20 00:00:00', 70.00, 'Trabajo Noche'),
(110, 3, 2, '2025-11-20 00:00:00', 35.00, 'Libro \"Hábitos Atómicos\"'),
(111, 3, 2, '2025-11-20 00:00:00', 15.00, 'Audio libro \"Hábitos Atómicos\"'),
(112, 3, 15, '2025-11-20 00:00:00', 40.00, 'Gemelos Vargas'),
(113, 3, 4, '2025-11-20 00:00:00', -12.00, 'Desayuno'),
(114, 3, 4, '2025-11-20 00:00:00', -15.00, 'Almuerzo'),
(115, 3, 4, '2025-11-20 00:00:00', -10.00, 'Cena'),
(116, 3, 5, '2025-11-20 00:00:00', -8.00, 'Transporte'),
(117, 3, 7, '2025-11-20 00:00:00', -30.00, 'Recarga Celular'),
(118, 3, 15, '2025-11-19 00:00:00', 20.00, 'Joven Zeballos'),
(119, 3, 1, '2025-11-19 00:00:00', 70.00, 'Trabajo Noche'),
(120, 3, 2, '2025-11-19 00:00:00', 35.00, 'Curso de Ingles'),
(121, 3, 2, '2025-11-19 00:00:00', 40.00, 'Curso de Frances'),
(122, 3, 4, '2025-11-19 00:00:00', -12.00, 'Desayuno'),
(123, 3, 4, '2025-11-19 00:00:00', -15.00, 'Almuerzo'),
(124, 3, 4, '2025-11-19 00:00:00', -10.00, 'Cena'),
(125, 3, 5, '2025-11-19 00:00:00', -8.00, 'Transporte'),
(126, 3, 15, '2025-11-18 00:00:00', 15.00, 'Joven Pinto'),
(127, 3, 1, '2025-11-18 00:00:00', 70.00, 'Trabajo Noche'),
(128, 3, 2, '2025-11-18 00:00:00', 25.00, 'Curso Guitarra'),
(129, 3, 2, '2025-11-18 00:00:00', 25.00, 'Curso Piano'),
(130, 3, 4, '2025-11-18 00:00:00', -12.00, 'Desayuno'),
(131, 3, 4, '2025-11-18 00:00:00', -15.00, 'Almuerzo'),
(132, 3, 4, '2025-11-18 00:00:00', -10.00, 'Cena'),
(133, 3, 5, '2025-11-18 00:00:00', -8.00, 'Transporte'),
(134, 4, 3, '2025-11-18 00:00:00', 60.00, 'Propina semanal mamá'),
(135, 4, 4, '2025-11-18 00:00:00', -8.00, 'Pastelito'),
(136, 4, 5, '2025-11-18 00:00:00', -12.00, 'Transporte'),
(137, 4, 8, '2025-11-18 00:00:00', -15.00, 'Toallitas'),
(138, 4, 8, '2025-11-20 00:00:00', -20.00, 'Productos de higiene'),
(139, 4, 4, '2025-11-19 00:00:00', -5.00, 'Chocolate'),
(140, 4, 5, '2025-11-19 00:00:00', -12.00, 'Transporte'),
(141, 4, 7, '2025-11-19 00:00:00', -15.00, 'Recargar Celular'),
(142, 4, 5, '2025-11-20 00:00:00', -15.00, 'Transporte'),
(143, 5, 3, '2025-11-18 00:00:00', 60.00, 'Propina semanal mamá'),
(144, 5, 4, '2025-11-18 00:00:00', -1.00, 'Chisito'),
(145, 5, 5, '2025-11-18 00:00:00', -5.00, 'Combi'),
(146, 5, 8, '2025-11-18 00:00:00', -8.00, 'Desororante'),
(147, 5, 4, '2025-11-19 00:00:00', -5.00, 'Empanada'),
(148, 5, 5, '2025-11-19 00:00:00', -5.00, 'Combi'),
(149, 5, 4, '2025-11-19 00:00:00', -3.00, 'Gaseosa'),
(150, 5, 7, '2025-11-20 00:00:00', -1.00, 'Cartulina'),
(151, 5, 4, '2025-11-20 00:00:00', -6.00, 'Sandwich'),
(152, 5, 5, '2025-11-20 00:00:00', -5.00, 'Combi');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`),
  ADD UNIQUE KEY `nombre_concepto_tipo` (`nombre_concepto`,`tipo`);

--
-- Indices de la tabla `familia`
--
ALTER TABLE `familia`
  ADD PRIMARY KEY (`id_familia`),
  ADD UNIQUE KEY `nombre_familia` (`nombre_familia`);

--
-- Indices de la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id_perfil`),
  ADD UNIQUE KEY `idx_perfil_familia` (`id_familia_Familia`,`nombre_perfil`),
  ADD KEY `id_familia_Familia` (`id_familia_Familia`);

--
-- Indices de la tabla `perfil_concepto`
--
ALTER TABLE `perfil_concepto`
  ADD PRIMARY KEY (`id_perfil_Perfil`,`id_concepto_Concepto`),
  ADD KEY `id_familia_Familia` (`id_familia_Familia`),
  ADD KEY `id_concepto_Concepto` (`id_concepto_Concepto`);

--
-- Indices de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD PRIMARY KEY (`id_recordatorio`),
  ADD KEY `id_perfil_Perfil` (`id_perfil_Perfil`),
  ADD KEY `id_familia_Familia_Perfil` (`id_familia_Familia_Perfil`);

--
-- Indices de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD PRIMARY KEY (`id_transaccion`),
  ADD KEY `id_perfil_Perfil` (`id_perfil_Perfil`),
  ADD KEY `id_concepto_Concepto` (`id_concepto_Concepto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `concepto`
--
ALTER TABLE `concepto`
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_familia_Familia`) REFERENCES `familia` (`id_familia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `perfil_concepto`
--
ALTER TABLE `perfil_concepto`
  ADD CONSTRAINT `perfil_concepto_ibfk_1` FOREIGN KEY (`id_perfil_Perfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE CASCADE,
  ADD CONSTRAINT `perfil_concepto_ibfk_2` FOREIGN KEY (`id_familia_Familia`) REFERENCES `familia` (`id_familia`) ON DELETE CASCADE,
  ADD CONSTRAINT `perfil_concepto_ibfk_3` FOREIGN KEY (`id_concepto_Concepto`) REFERENCES `concepto` (`id_concepto`) ON DELETE CASCADE;

--
-- Filtros para la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  ADD CONSTRAINT `recordatorio_ibfk_1` FOREIGN KEY (`id_perfil_Perfil`) REFERENCES `perfil` (`id_perfil`) ON UPDATE CASCADE,
  ADD CONSTRAINT `recordatorio_ibfk_2` FOREIGN KEY (`id_familia_Familia_Perfil`) REFERENCES `perfil` (`id_familia_Familia`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `transaccion`
--
ALTER TABLE `transaccion`
  ADD CONSTRAINT `transaccion_ibfk_1` FOREIGN KEY (`id_perfil_Perfil`) REFERENCES `perfil` (`id_perfil`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transaccion_ibfk_2` FOREIGN KEY (`id_concepto_Concepto`) REFERENCES `concepto` (`id_concepto`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
