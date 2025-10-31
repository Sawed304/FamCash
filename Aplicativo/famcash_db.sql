-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2025 a las 03:23:54
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
(1, 'Sante', '$2y$10$eAdlEO0ARJnIN1vQfo//Z.b.yulTiKoDWtellKz1z1AxGCvFRiIwW');

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
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfil`
--

INSERT INTO `perfil` (`id_perfil`, `id_familia_Familia`, `nombre_perfil`, `contraseña_perfil`, `alias`, `rol`) VALUES
(1, 1, 'Sante304', '$2y$10$LAQN0UClYF3o7wrYWTxP5.lFe2D0yPcwE2PiKC7JsxSQAktyUzGy.', NULL, 'Administrador'),
(2, 1, 'Santo', '$2y$10$LAQN0UClYF3o7wrYWTxP5.lFe2D0yPcwE2PiKC7JsxSQAktyUzGy.', 'NULL', 'Estandar');

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

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transaccion`
--

CREATE TABLE `transaccion` (
  `id_transaccion` int(11) NOT NULL,
  `id_perfil_Perfil` int(11) NOT NULL,
  `id_concepto_Concepto` int(11) NOT NULL,
  `numero_transaccion` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `detalle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `concepto`
--
ALTER TABLE `concepto`
  ADD PRIMARY KEY (`id_concepto`),
  ADD UNIQUE KEY `nombre_concepto` (`nombre_concepto`);

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
  ADD UNIQUE KEY `nombre_perfil` (`nombre_perfil`),
  ADD KEY `id_familia_Familia` (`id_familia_Familia`);

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
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `perfil_ibfk_1` FOREIGN KEY (`id_familia_Familia`) REFERENCES `familia` (`id_familia`) ON UPDATE CASCADE;

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
