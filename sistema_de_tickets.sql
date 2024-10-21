-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-10-2024 a las 22:22:54
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

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
-- Estructura de tabla para la tabla `auditoria_ticket`
--

CREATE TABLE `auditoria_ticket` (
  `id_ticket` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `email_usuario` varchar(100) DEFAULT NULL,
  `descripcion_ticket` varchar(500) DEFAULT NULL,
  `devolucion_ticket` varchar(500) DEFAULT NULL,
  `fecha_reporte_ticket` datetime DEFAULT NULL,
  `prioridad_ticket` varchar(20) DEFAULT NULL,
  `estado_ticket` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria_ticket`
--

INSERT INTO `auditoria_ticket` (`id_ticket`, `id_usuario`, `nombre_usuario`, `email_usuario`, `descripcion_ticket`, `devolucion_ticket`, `fecha_reporte_ticket`, `prioridad_ticket`, `estado_ticket`) VALUES
(115, 11, 'pepe', 'pepe@pepe-net', 'Descripción modificada', 'Nueva devolución', '2024-10-13 20:05:00', 'Alta', 'Pendiente'),
(115, 11, 'pepe', 'pepe@pepe-net', 'Descripción modificada', 'no se puede', '2024-10-13 20:05:00', 'Alta', 'Abierto'),
(115, 11, 'pepe', 'pepe@pepe-net', 'Descripción modificada', 'Nueva devolución', '2024-10-13 20:05:00', 'Alta', 'Abierto'),
(115, 11, 'pepe', 'pepe@pepe-net', 'Descripción modificada', 'Nueva devolución', '2024-10-13 20:05:00', 'Alta', 'Abierto'),
(116, 10, 'natanael', 'nata@gmail.com', 'Descripción modificada', 'Nueva devolución', '2024-10-14 20:36:00', 'Alta', 'Pendiente'),
(116, 10, 'natanael', 'nata@gmail.com', 'Descripción modificada', 'Nueva devolución', '2024-10-14 20:36:00', 'Alta', 'Pendiente'),
(116, 10, 'natanael', 'nata@gmail.com', 'Descripción modificada', 'a', '2024-10-14 20:36:00', 'Alta', 'Abierto'),
(117, 11, 'pepe', 'pepe@pepe-net', 'o', 'reinice la computadora y vuelva a intentar', '2024-10-14 20:46:00', 'Alta', 'Abierto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria_usuario`
--

CREATE TABLE `auditoria_usuario` (
  `id_usuario` int(11) DEFAULT NULL,
  `nombre_usuario` varchar(50) DEFAULT NULL,
  `email_usuario` varchar(100) DEFAULT NULL,
  `contraseña` varchar(30) DEFAULT NULL,
  `rol_usuario` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tickets`
--

CREATE TABLE `tickets` (
  `id_ticket` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` text NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `descripcion_ticket` varchar(500) DEFAULT NULL,
  `devolucion_ticket` text NOT NULL,
  `fecha_reporte_ticket` datetime NOT NULL,
  `prioridad_ticket` varchar(30) DEFAULT NULL,
  `estado_ticket` enum('Pendiente','En Espera','Abierto','Cerrado') DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tickets`
--

INSERT INTO `tickets` (`id_ticket`, `id_usuario`, `nombre_usuario`, `email_usuario`, `descripcion_ticket`, `devolucion_ticket`, `fecha_reporte_ticket`, `prioridad_ticket`, `estado_ticket`) VALUES
(105, 10, 'natanael', 'nata@gmail.com', 'Se me desconecto el hdmi', '', '2024-10-12 18:13:00', 'Alta', 'Cerrado'),
(106, 12, 'agustin', 'agustin@afsf.com', 'se me quemo la placa de red', 'Se cambio la misma', '2024-10-12 18:13:00', 'Media', 'Cerrado'),
(107, 11, 'pepe', 'pepe@pepe-net', 'Se me cayo el monitor', '', '2024-10-12 18:14:00', 'Alta', 'Cerrado'),
(108, 13, 'jose', 'jose@live.com', 'Desconexion de wifi', 'Se habia quemado la placa de red, se cambio la misma.', '2024-10-12 18:14:00', 'Alta', 'Cerrado'),
(109, 13, 'jose', 'jose@live.com', 'Cambiar perifericos', '', '2024-10-12 19:11:00', 'Alta', 'Cerrado'),
(110, 11, 'pepe', 'pepe@pepe-net', 'El teclado perdio todas las teclas, en especial el enter', 'adasdsda', '2024-10-13 13:03:00', 'Alta', 'Cerrado'),
(111, 11, 'pepe', 'pepe@pepe-net', 'Cambiar; mouse y monitor', 'Fue cambiado yt conectado', '2024-10-13 17:38:00', 'Alta', 'Cerrado'),
(112, 11, 'pepe', 'pepe@pepe-net', 'Mi pantalla muestra lineas negras', 'Cambie el monitorr', '2024-10-13 17:40:00', 'Media', 'Cerrado'),
(113, 11, 'pepe', 'pepe@pepe-net', 'Mi pantalla muestra lineas negras', '', '2024-10-13 19:32:00', 'Alta', 'Cerrado'),
(114, 11, 'pepe', 'pepe@pepe-net', 'Se me desconecto el hdmi', 'conectalo', '2024-10-13 20:00:00', 'Media', 'Cerrado'),
(115, 11, 'pepe', 'pepe@pepe-net', 'Descripción modificada', 'Nueva devolución', '2024-10-13 20:05:00', 'Alta', 'Cerrado'),
(116, 10, 'natanael', 'nata@gmail.com', 'Descripción modificada', 'a', '2024-10-14 20:36:00', 'Alta', 'Cerrado'),
(117, 11, 'pepe', 'pepe@pepe-net', 'o', 'reinice la computadora y vuelva a intentar', '2024-10-14 20:46:00', 'Alta', 'Cerrado'),
(118, 11, 'pepe', 'pepe@pepe-net', 'no me anda el monitor', '', '2024-10-14 21:16:00', 'Media', 'Pendiente');

--
-- Disparadores `tickets`
--
DELIMITER $$
CREATE TRIGGER `trigger_auditoria_ticket` AFTER UPDATE ON `tickets` FOR EACH ROW BEGIN
    IF OLD.devolucion_ticket != NEW.devolucion_ticket THEN

        INSERT INTO auditoria_ticket (
            id_ticket, 
            id_usuario, 
            nombre_usuario, 
            email_usuario, 
            descripcion_ticket, 
            devolucion_ticket, 
            fecha_reporte_ticket, 
            prioridad_ticket, 
            estado_ticket
        ) 
        VALUES (
            NEW.id_ticket, 
            NEW.id_usuario, 
            (SELECT nombre_usuario FROM usuario WHERE id_usuario = NEW.id_usuario), 
            (SELECT email_usuario FROM usuario WHERE id_usuario = NEW.id_usuario), 
            NEW.descripcion_ticket, 
            NEW.devolucion_ticket, 
            NEW.fecha_reporte_ticket, 
            NEW.prioridad_ticket, 
            NEW.estado_ticket
        );
    END IF;
END
$$
DELIMITER ;

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
(0, 'lucas', 'lucas', 'lucas@hotmail', 'Administrador'),
(6, 'a', 'a', 'a', 'Administrador'),
(10, 'natanael', 'natanael', 'nata@gmail.com', 'Administrador'),
(11, 'pepe', 'pepe', 'pepe@pepe-net', 'Usuario Estándar'),
(12, 'agustin', 'agustin', 'agustin@afsf.com', 'Administrador'),
(13, 'jose', 'jose', 'jose@live.com', 'Usuario Estándar');

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `trigger_auditoria_usuario` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
    IF OLD.nombre_usuario != NEW.nombre_usuario 
        OR OLD.email_usuario != NEW.email_usuario 
        OR OLD.contraseña != NEW.contraseña THEN

        INSERT INTO auditoria_usuario (
            id_usuario, 
            nombre_usuario, 
            email_usuario, 
            contraseña, 
            rol_usuario
        ) 
        VALUES (
            NEW.id_usuario, 
            NEW.nombre_usuario, 
            NEW.email_usuario, 
            NEW.contraseña, 
            NEW.rol_usuario
        );
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tickets_admin`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_tickets_admin` (
`Ticket N°` int(11)
,`Fecha de Alta` datetime
,`Descripción` varchar(500)
,`Estado` enum('Pendiente','En Espera','Abierto','Cerrado')
,`Devolución` text
,`id_usuario` int(11)
,`Nombre` varchar(20)
,`eMail` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_tickets_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_tickets_usuario` (
`Ticket N°` int(11)
,`Fecha de Alta` datetime
,`Descripción` varchar(500)
,`Estado` enum('Pendiente','En Espera','Abierto','Cerrado')
,`Devolución` text
,`id_usuario` int(11)
,`Nombre` varchar(20)
,`eMail` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tickets_admin`
--
DROP TABLE IF EXISTS `vista_tickets_admin`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tickets_admin`  AS SELECT `tickets`.`id_ticket` AS `Ticket N°`, `tickets`.`fecha_reporte_ticket` AS `Fecha de Alta`, `tickets`.`descripcion_ticket` AS `Descripción`, `tickets`.`estado_ticket` AS `Estado`, `tickets`.`devolucion_ticket` AS `Devolución`, `usuario`.`id_usuario` AS `id_usuario`, `usuario`.`nombre_usuario` AS `Nombre`, `usuario`.`email_usuario` AS `eMail` FROM (`tickets` join `usuario` on(`tickets`.`id_usuario` = `usuario`.`id_usuario`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_tickets_usuario`
--
DROP TABLE IF EXISTS `vista_tickets_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_tickets_usuario`  AS SELECT `tickets`.`id_ticket` AS `Ticket N°`, `tickets`.`fecha_reporte_ticket` AS `Fecha de Alta`, `tickets`.`descripcion_ticket` AS `Descripción`, `tickets`.`estado_ticket` AS `Estado`, `tickets`.`devolucion_ticket` AS `Devolución`, `usuario`.`id_usuario` AS `id_usuario`, `usuario`.`nombre_usuario` AS `Nombre`, `usuario`.`email_usuario` AS `eMail` FROM (`tickets` join `usuario` on(`tickets`.`id_usuario` = `usuario`.`id_usuario`)) WHERE `usuario`.`rol_usuario` = 'Usuario Estándar' ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id_ticket`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id_ticket` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
