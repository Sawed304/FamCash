-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-10-2025 a las 17:37:16
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
-- Estructura de tabla para la tabla `conceptos`
--

CREATE TABLE `conceptos` (
  `idConcepto` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` enum('Ingreso','Egreso') NOT NULL,
  `periodo` varchar(20) DEFAULT NULL,
  `estado` enum('Habilitado','Deshabilitado') DEFAULT 'Habilitado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `conceptos`
--

INSERT INTO `conceptos` (`idConcepto`, `idPerfil`, `nombre`, `tipo`, `periodo`, `estado`) VALUES
(1, 1, 'Sueldo', 'Ingreso', NULL, 'Habilitado'),
(2, 1, 'Alimentos', 'Egreso', NULL, 'Habilitado'),
(3, 2, 'Propina', 'Ingreso', NULL, 'Habilitado'),
(4, 2, 'Transporte', 'Egreso', NULL, 'Habilitado'),
(5, 1, 'Comisiones', 'Ingreso', NULL, 'Habilitado'),
(6, 1, 'Bono', 'Ingreso', NULL, 'Habilitado'),
(7, 1, 'Transporte', 'Egreso', NULL, 'Habilitado'),
(8, 2, 'Helado', 'Egreso', NULL, 'Habilitado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `idPerfil` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `nombrePerfil` varchar(50) NOT NULL,
  `contrasenaEncriptada` varchar(255) NOT NULL,
  `rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`idPerfil`, `idUsuario`, `nombrePerfil`, `contrasenaEncriptada`, `rol`) VALUES
(1, 1, 'Papá Julio', '$2y$10$BrZuoMZSaDpv70iBvhny0OWPyUzsjJ7oF9a0EK1VGhP6GiZecofRi', 'Administrador'),
(2, 1, 'Julio Jr', '$2y$10$BrZuoMZSaDpv70iBvhny0OWPyUzsjJ7oF9a0EK1VGhP6GiZecofRi', 'Miembro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transacciones`
--

CREATE TABLE `transacciones` (
  `idTransaccion` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `idConcepto` int(11) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `transacciones`
--

INSERT INTO `transacciones` (`idTransaccion`, `idPerfil`, `idConcepto`, `monto`, `fecha`, `hora`) VALUES
(2, 1, 2, 200.00, '2025-10-10', '09:48:23'),
(3, 2, 3, 30.00, '2025-10-10', '05:13:24'),
(4, 2, 4, 3.00, '2025-10-10', '05:13:24'),
(5, 1, 5, 120.00, '2025-10-06', '05:27:34'),
(6, 1, 6, 130.00, '2025-10-06', '05:27:34'),
(7, 1, 7, 20.00, '2025-10-06', '05:27:34'),
(8, 2, 3, 20.00, '2025-10-06', '05:33:06'),
(9, 2, 8, 4.00, '2025-10-06', '05:33:06'),
(10, 1, 1, 100.00, '2025-10-10', '09:48:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(50) NOT NULL,
  `contrasenaEncriptada` varchar(255) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuario`, `nombreUsuario`, `contrasenaEncriptada`, `nombre`) VALUES
(1, 'Julio Quispe', '$2y$10$BD5wkvpfCh6k9nXBNkDXbefbj.sQj9r/Pi/M5I/IcjNsJ761EQmce', 'Julio Quispe');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD PRIMARY KEY (`idConcepto`),
  ADD KEY `idPerfil` (`idPerfil`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`idPerfil`),
  ADD KEY `idUsuario` (`idUsuario`);

--
-- Indices de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD PRIMARY KEY (`idTransaccion`),
  ADD KEY `idPerfil` (`idPerfil`),
  ADD KEY `idConcepto` (`idConcepto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `nombreUsuario` (`nombreUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `conceptos`
--
ALTER TABLE `conceptos`
  MODIFY `idConcepto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `idPerfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `transacciones`
--
ALTER TABLE `transacciones`
  MODIFY `idTransaccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `conceptos`
--
ALTER TABLE `conceptos`
  ADD CONSTRAINT `conceptos_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles` (`idPerfil`) ON DELETE CASCADE;

--
-- Filtros para la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD CONSTRAINT `perfiles_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `transacciones`
--
ALTER TABLE `transacciones`
  ADD CONSTRAINT `transacciones_ibfk_1` FOREIGN KEY (`idPerfil`) REFERENCES `perfiles` (`idPerfil`) ON DELETE CASCADE,
  ADD CONSTRAINT `transacciones_ibfk_2` FOREIGN KEY (`idConcepto`) REFERENCES `conceptos` (`idConcepto`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
