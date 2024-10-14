-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-10-2024 a las 01:21:05
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
-- Base de datos: `sistema de tickets`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_tickets`
--

CREATE TABLE `auditoria_tickets` (
  `id_auditoria` int(11) NOT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(100) DEFAULT NULL,
  `estado_anterior` varchar(50) DEFAULT NULL,
  `estado_nuevo` varchar(50) DEFAULT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cierre_ticket`
--

CREATE TABLE `cierre_ticket` (
  `id_ticket` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `conformidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id_equipo` int(11) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `nombre_equipo` varchar(30) NOT NULL,
  `nivel_equipo` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial_modificacion`
--

CREATE TABLE `historial_modificacion` (
  `estado_ticket` varchar(30) NOT NULL,
  `id_ticket` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `modificacion_de_descripcion` varchar(500) DEFAULT NULL,
  `fecha_modificacion_estado` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `historial_modificacion`
--

INSERT INTO `historial_modificacion` (`estado_ticket`, `id_ticket`, `id_usuario`, `modificacion_de_descripcion`, `fecha_modificacion_estado`) VALUES
('pendiente', 1, 1, 'monitor no anda', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_ticket`
--

CREATE TABLE `informacion_ticket` (
  `id_usuario` int(11) DEFAULT NULL,
  `id_ticket` int(11) DEFAULT NULL,
  `informacion_ticket` varchar(500) DEFAULT NULL,
  `estado_ticket` varchar(30) DEFAULT NULL,
  `cantidad_de_ticket_asignados` int(11) DEFAULT NULL,
  `cantidad_tickets_resueltos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_ticket`
--

INSERT INTO `informacion_ticket` (`id_usuario`, `id_ticket`, `informacion_ticket`, `estado_ticket`, `cantidad_de_ticket_asignados`, `cantidad_tickets_resueltos`) VALUES
(1, 1, 'monitor no anda', 'pendiente', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` text NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `descripcion_ticket` varchar(500) DEFAULT NULL,
  `fecha_reporte_ticket` date DEFAULT NULL,
  `prioridad_ticket` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `id_usuario`, `nombre_usuario`, `email_usuario`, `descripcion_ticket`, `fecha_reporte_ticket`, `prioridad_ticket`) VALUES
(1, 1, '', '', 'monitor no anda', '0000-00-00', 'alta'),
(48, 2, '', '', 'problema monitor', '2024-10-01', 'Alta'),
(49, 2, '', '', 'hola', '2024-09-30', 'Alta'),
(50, 2, 'lucas', 'lucas@gmail.com', 'eee', '2024-10-02', 'Alta'),
(51, 2, 'lucas', 'lucas@gmail.com', 'eee', '2024-10-02', 'Alta'),
(52, 2, 'lucas', 'lucas@gmail.com', 'aaaa', '2024-10-02', 'Alta'),
(53, 2, '', '', 'q', '2024-10-02', 'Alta'),
(54, 2, '', '', 'rrr', '2024-10-02', 'Alta'),
(55, 2, '', '', 'pedilo', '2024-10-14', 'Baja'),
(56, 2, '', '', 'pola', '2024-10-03', 'Alta'),
(57, 1, '', '', 'no anda nada', '2024-10-07', 'Baja'),
(58, 2, '', 'lucas@gmail.com', 'aasasas', '2024-10-08', 'Alta'),
(59, 2, 'lucas', 'lucas@gmail.com', 'pedilo pe', '2024-10-08', 'Alta'),
(60, 2, 'lucas', 'lucas@gmail.com', 'a', '2024-10-01', 'Alta'),
(61, 2, 'lucas', 'lucas@gmail.com', 'ew', '2024-10-08', 'Media'),
(62, 2, 'lucas', 'lucas@gmail.com', 'aaaaaaaaaaaa', '2024-10-08', 'Alta'),
(63, 2, 'lucas', 'lucas@gmail.com', 'hola', '2024-10-08', 'Media'),
(64, 2, 'lucas', 'lucas@gmail.com', 'rgrgergrghergt', '2024-10-09', 'Alta'),
(65, 6, 'eze', 'eze@eze.net', 'AAAAAAAAAAAAAAAAAAA', '2024-10-16', 'Alta'),
(66, 6, 'eze', 'eze@eze.net', 'La pc no da imagen', '2024-10-16', 'Alta'),
(67, 7, 'a', 'a', 'lucas cerra el ogt', '2024-10-23', 'Alta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(20) DEFAULT NULL,
  `contraseña` varchar(30) NOT NULL,
  `email_usuario` varchar(50) DEFAULT NULL,
  `rol_usuario` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `contraseña`, `email_usuario`, `rol_usuario`) VALUES
(1, 'juan', 'hola', 'juan@gmail.com', 'usuario'),
(5, 'nata', 'nata', 'natana_99@hotmail.com', 'Administrador'),
(6, 'eze', 'eze', 'eze@eze.net', 'Usuario Estándar'),
(7, 'a', 'a', 'a', 'Usuario Estándar');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tickets_admin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_tickets_admin` (
`Fecha de Alta` date
,`Ticket N°` int(11)
,`Nombre` varchar(20)
,`eMail` varchar(50)
,`Descripción` varchar(500)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tickets_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_tickets_usuario` (
`Ticket N°` int(11)
,`Fecha de Alta` date
,`Descripción` varchar(500)
,`id_usuario` int(11)
,`Nombre` varchar(20)
,`eMail` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tickets_admin`
--
DROP TABLE IF EXISTS `vista_tickets_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tickets_admin`  AS SELECT `tickets`.`fecha_reporte_ticket` AS `Fecha de Alta`, `tickets`.`id_ticket` AS `Ticket N°`, `usuario`.`nombre_usuario` AS `Nombre`, `usuario`.`email_usuario` AS `eMail`, `tickets`.`descripcion_ticket` AS `Descripción` FROM (`tickets` join `usuario` on(`tickets`.`id_usuario` = `usuario`.`id_usuario`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tickets_usuario`
--
DROP TABLE IF EXISTS `vista_tickets_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tickets_usuario`  AS SELECT `tickets`.`id_ticket` AS `Ticket N°`, `tickets`.`fecha_reporte_ticket` AS `Fecha de Alta`, `tickets`.`descripcion_ticket` AS `Descripción`, `usuario`.`id_usuario` AS `id_usuario`, `usuario`.`nombre_usuario` AS `Nombre`, `usuario`.`email_usuario` AS `eMail` FROM (`tickets` join `usuario` on(`tickets`.`id_usuario` = `usuario`.`id_usuario`)) WHERE `usuario`.`rol_usuario` = 'Usuario Estándar' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria_tickets`
--
ALTER TABLE `auditoria_tickets`
  ADD PRIMARY KEY (`id_auditoria`);

--
-- Indices de la tabla `cierre_ticket`
--
ALTER TABLE `cierre_ticket`
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id_equipo`),
  ADD KEY `id_ticket` (`id_ticket`);

--
-- Indices de la tabla `historial_modificacion`
--
ALTER TABLE `historial_modificacion`
  ADD PRIMARY KEY (`estado_ticket`),
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `informacion_ticket`
--
ALTER TABLE `informacion_ticket`
  ADD KEY `id_ticket` (`id_ticket`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `estado_ticket` (`estado_ticket`);

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria_tickets`
--
ALTER TABLE `auditoria_tickets`
  MODIFY `id_auditoria` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id_equipo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `historial_modificacion`
--
ALTER TABLE `historial_modificacion`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cierre_ticket`
--
ALTER TABLE `cierre_ticket`
  ADD CONSTRAINT `cierre_ticket_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`),
  ADD CONSTRAINT `cierre_ticket_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`);

--
-- Filtros para la tabla `historial_modificacion`
--
ALTER TABLE `historial_modificacion`
  ADD CONSTRAINT `historial_modificacion_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`),
  ADD CONSTRAINT `historial_modificacion_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `informacion_ticket`
--
ALTER TABLE `informacion_ticket`
  ADD CONSTRAINT `informacion_ticket_ibfk_1` FOREIGN KEY (`id_ticket`) REFERENCES `tickets` (`id_ticket`),
  ADD CONSTRAINT `informacion_ticket_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `informacion_ticket_ibfk_3` FOREIGN KEY (`estado_ticket`) REFERENCES `historial_modificacion` (`estado_ticket`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
