-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-10-2025 a las 13:26:23
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
(1, 'Varios', 'Egreso'),
(2, 'Sueldo', 'Ingreso'),
(3, 'Venta', 'Ingreso'),
(4, 'Otros ingresos', 'Ingreso'),
(5, 'Alimentos', 'Egreso'),
(6, 'Transporte', 'Egreso'),
(7, 'Vivienda', 'Egreso'),
(8, 'Servicios', 'Egreso'),
(9, 'Salud', 'Egreso');

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
(1, 'Sante', '$2y$10$eAdlEO0ARJnIN1vQfo//Z.b.yulTiKoDWtellKz1z1AxGCvFRiIwW'),
(2, 'lulu', '$2y$10$5r4Ri9mmUxJpc6Zp3rVLBOeR3rtqNZUYFL4fBXeB8d4gx8BvQpRru'),
(3, 'Messi', '$2y$10$fTfcBd7DZ1lcdWpLENzd6.yBfbwIKoockYe.IjorE/nOMM6vai1Eq'),
(4, 'Nina', '$2y$10$XM1pUQB78QOJqBi9X0Qpz.Okn332U5Azx4hrcuMeRsmVkfpLeus5u');

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
(1, 1, 'Sante304', '$2y$10$LAQN0UClYF3o7wrYWTxP5.lFe2D0yPcwE2PiKC7JsxSQAktyUzGy.', NULL, 'Administrador', 'Habilitado'),
(2, 1, 'Santo', '$2y$10$LAQN0UClYF3o7wrYWTxP5.lFe2D0yPcwE2PiKC7JsxSQAktyUzGy.', 'NULL', 'Estandar', 'Habilitado'),
(3, 2, 'Messi', '$2y$10$/S2Wk8eqId0XjzmZu50nF.Rw9Ls7BnRfWWDiou97HBtWLFUBHE92.', NULL, 'Admin', 'Habilitado'),
(4, 3, 'mATIAS', '$2y$10$MMUv09PZirIemMhsbzC3B.y1rawsCChCCk9HSgtLiY0bTHeukYxYW', NULL, 'Admin', 'Habilitado'),
(5, 3, 'Lulu', '$2y$10$VHRJV5K6MYiAOHY90lpv9.EzHjQYIEBJVTLcMy5Rb6f9apQ2XU4Yq', NULL, 'Admin', 'Habilitado'),
(6, 4, 'mimi', '$2y$10$SgfSxRkLc.Z3jOGWC0O3r.xcUXa8iFLuTcyRI6kEuQKmUrDrqVh06', NULL, 'Admin', 'Habilitado'),
(7, 4, 'susu', '$2y$10$Lgu1PyE7NRlmmCRJX8ZHNuU7JoUNKU2dgR.n/EnF4oEhH9eisVS7G', NULL, 'Miembro', 'Habilitado');

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
  `fecha` datetime NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `detalle` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transaccion`
--

INSERT INTO `transaccion` (`id_transaccion`, `id_perfil_Perfil`, `id_concepto_Concepto`, `fecha`, `monto`, `detalle`) VALUES
(2, 6, 5, '2025-10-31 00:00:00', -10.00, 'fresas'),
(8, 6, 3, '2025-10-30 00:00:00', 2000.00, 'la casa'),
(14, 6, 2, '2025-10-31 00:00:00', 100.00, 'de guardia'),
(22, 6, 9, '2025-10-31 00:00:00', -200.00, 'accidente'),
(26, 6, 9, '2025-10-31 00:00:00', -100.00, 'leproflaxacino'),
(32, 7, 2, '2025-10-31 00:00:00', 100.00, 'chamba'),
(33, 7, 6, '2025-10-31 00:00:00', -3.00, 'mi pasaje'),
(34, 7, 9, '2025-10-31 00:00:00', -12.00, 'me cai :c');

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
  MODIFY `id_concepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `familia`
--
ALTER TABLE `familia`
  MODIFY `id_familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `perfil`
--
ALTER TABLE `perfil`
  MODIFY `id_perfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `recordatorio`
--
ALTER TABLE `recordatorio`
  MODIFY `id_recordatorio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `transaccion`
--
ALTER TABLE `transaccion`
  MODIFY `id_transaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
