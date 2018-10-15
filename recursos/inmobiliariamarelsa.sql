-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-10-2018 a las 03:19:27
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 5.6.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inmobiliariamarelsa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `accesos`
--

CREATE TABLE `accesos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `url` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `accesos`
--

INSERT INTO `accesos` (`id`, `nombre`, `url`) VALUES
(1, 'Gestionar Personas', 'administracion/gestionar-personas'),
(2, 'Gestionar Empleados', 'administracion/gestionar-empleados'),
(3, 'Gestionar Clientes', 'administracion/gestionar-clientes'),
(4, 'Gestionar Administradores', 'administracion/gestionar-administradores'),
(5, 'Gestion Inmuebles', 'administracion/gestion-inmuebles'),
(6, 'Aprobar Inmuebles', 'administracion/aprobar-inmueble'),
(7, 'Gestion Inmueble-Cliente', 'cliente/gestion-inmuebles'),
(9, 'Gestion Ventas-Arriendos', 'administracion/gestion-ventas-arriendos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivo_inmueble`
--

CREATE TABLE `archivo_inmueble` (
  `id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL,
  `nombre` varchar(300) NOT NULL,
  `inmueble` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arriendo`
--

CREATE TABLE `arriendo` (
  `id` int(11) NOT NULL,
  `contrato` int(11) NOT NULL,
  `empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Contador', 'es el que cuenta'),
(2, 'Administrador Ventas', 'es el que administra las ventas'),
(3, 'Secretario', 'es el que secretarea'),
(4, 'Auxiliar de Visitas', 'es el que realiza las visitas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caucion`
--

CREATE TABLE `caucion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `arriendo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cita_desalojo`
--

CREATE TABLE `cita_desalojo` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `arriendo` int(11) NOT NULL,
  `empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciudades`
--

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ciudades`
--

INSERT INTO `ciudades` (`id`, `nombre`, `departamento`) VALUES
(1, 'Calarca', 1),
(2, 'Circacia', 1),
(3, 'Filandia', 1),
(4, 'Pereira', 2),
(5, 'Manizales', 2),
(6, 'Dos Quebradas', 2),
(7, 'Sanra rosa del cabal', 2),
(8, 'Bogota', 3),
(9, 'Fusagasuga', 3),
(10, 'Cajica', 3),
(11, 'Cota', 3),
(12, 'Medellin', 4),
(13, 'Zaragoza', 4),
(14, 'La ceja', 4),
(15, 'Puerto berrio', 4),
(16, 'Pasto', 5),
(17, 'Tumaco', 5),
(18, 'La union', 5),
(19, 'El peñol', 5),
(20, 'Nariño', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contrato`
--

CREATE TABLE `contrato` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(1000) DEFAULT NULL,
  `empleado` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `visita` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `fecha_finalizacion` date DEFAULT NULL,
  `fecha_solicitud` date NOT NULL,
  `file_certificacion` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`) VALUES
(1, 'Quindio'),
(2, 'Risaralda'),
(3, 'Cundinamarca'),
(4, 'Antioquia'),
(5, 'Nariño');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `usuario` int(11) NOT NULL,
  `salario` int(11) NOT NULL,
  `cargo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`usuario`, `salario`, `cargo`) VALUES
(2, 1200000, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `experiencias`
--

CREATE TABLE `experiencias` (
  `id` int(11) NOT NULL,
  `empresa` varchar(200) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL,
  `empresa_telefono` varchar(100) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `file_certificacion` varchar(200) NOT NULL,
  `empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formaciones`
--

CREATE TABLE `formaciones` (
  `id` int(11) NOT NULL,
  `institucion` varchar(100) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `file_certificacion` varchar(300) NOT NULL,
  `empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formato_ventas`
--

CREATE TABLE `formato_ventas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `inmueble` int(11) NOT NULL,
  `empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informe`
--

CREATE TABLE `informe` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `arriendo_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inmueble`
--

CREATE TABLE `inmueble` (
  `id` int(11) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `area` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `banios` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  `tipoav` int(11) NOT NULL,
  `garajes` int(11) NOT NULL,
  `habitaciones` int(11) NOT NULL,
  `detalles` varchar(400) NOT NULL,
  `aÒoconstruccion` varchar(20) NOT NULL,
  `ascensor` char(1) NOT NULL,
  `canchas_deportivas` char(1) NOT NULL,
  `zonas_humedas` char(1) NOT NULL,
  `zona_infantil` char(1) NOT NULL,
  `jardines` char(1) NOT NULL,
  `transporte_publico_cercano` char(1) NOT NULL,
  `precio_negociable` char(1) NOT NULL,
  `zona_ropas` char(1) NOT NULL,
  `parqueadero` char(1) NOT NULL,
  `deposito` char(1) NOT NULL,
  `estudio` char(1) DEFAULT NULL,
  `tipo_cortinas` varchar(100) NOT NULL,
  `cuarto_servicio` char(1) NOT NULL,
  `chimenea` char(1) NOT NULL,
  `cocinaac` char(1) NOT NULL,
  `comedorIndependiente` char(1) NOT NULL,
  `vista_exterior_interior` char(1) NOT NULL,
  `zona` int(11) NOT NULL,
  `numero_matricula` varchar(100) NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `aprobacion_fecha` date DEFAULT NULL,
  `tipo` int(11) NOT NULL,
  `ciudad` int(11) NOT NULL,
  `usuario` int(11) NOT NULL,
  `administrador` int(11) DEFAULT NULL,
  `promocion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `inmueble`
--

INSERT INTO `inmueble` (`id`, `direccion`, `area`, `valor`, `banios`, `estado`, `tipoav`, `garajes`, `habitaciones`, `detalles`, `aÒoconstruccion`, `ascensor`, `canchas_deportivas`, `zonas_humedas`, `zona_infantil`, `jardines`, `transporte_publico_cercano`, `precio_negociable`, `zona_ropas`, `parqueadero`, `deposito`, `estudio`, `tipo_cortinas`, `cuarto_servicio`, `chimenea`, `cocinaac`, `comedorIndependiente`, `vista_exterior_interior`, `zona`, `numero_matricula`, `latitud`, `longitud`, `aprobacion_fecha`, `tipo`, `ciudad`, `usuario`, `administrador`, `promocion`) VALUES
(1, '1', 1, 1, 1, 1, 1, 1, 1, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', 1, '1', 1, 1, '0000-00-00', 1, 1, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `id` int(11) NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `latitud` double NOT NULL,
  `longitud` double NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`id`, `cedula`, `nombre`, `apellido`, `fecha_nacimiento`, `latitud`, `longitud`, `telefono`, `direccion`, `rol`) VALUES
(0, '1095', 'ZCX', 'FSD', '1993-12-12', 0, 0, '12312', 'sfsd', 2),
(1, '1094', 'Sebastian', 'Salazar', '1989-02-02', 0, 0, '3138920011', 'carrera 14 #4567', 1),
(2, '1090', 'david', 'ramirez', '1992-12-12', 0, 0, '3178860805', 'cra 15 10 n21', 3),
(3, '1091', 'pedro', 'perez', '1989-02-03', 0, 0, '3214567', 'calle 2 Norte', 2),
(4, '1092', 'camilo', 'zapata', '1989-04-03', 0, 0, '3314567', 'calle 2 Norte', 2),
(5, '1093', 'laura', 'posada', '1989-07-03', 0, 0, '3214133345', 'calle 2 Norte', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promocion`
--

CREATE TABLE `promocion` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `porcentaje` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reportes_visitas`
--

CREATE TABLE `reportes_visitas` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `inmueble` int(11) NOT NULL,
  `usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservar_visita`
--

CREATE TABLE `reservar_visita` (
  `id` int(11) NOT NULL,
  `mensaje` varchar(600) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` int(11) NOT NULL,
  `inmueble` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `empleado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reunion`
--

CREATE TABLE `reunion` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(1000) NOT NULL,
  `persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `descripcion` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'administrador'),
(2, 'Cliente', 'cliente'),
(3, 'Empleado', 'empleado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_accesos`
--

CREATE TABLE `rol_accesos` (
  `rol` int(11) NOT NULL,
  `acceso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `rol_accesos`
--

INSERT INTO `rol_accesos` (`rol`, `acceso`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 6),
(1, 9),
(2, 7),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_inmueble`
--

CREATE TABLE `tipo_inmueble` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_inmueble`
--

INSERT INTO `tipo_inmueble` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Casa', 'casa'),
(2, 'Apartamento', 'apartamento'),
(3, 'Finca', 'Finca'),
(4, 'Oficina', 'Oficina'),
(5, 'Local comercial', 'Local comercial'),
(6, 'Bodega', 'Bodega'),
(7, 'Chalet', 'Chalet');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `persona` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`persona`, `username`, `password`) VALUES
(0, 'sti', '123'),
(1, 'admin', '123'),
(2, 'camila', 'torres123'),
(5, 'lau', '123');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` int(11) NOT NULL,
  `contrato` int(11) NOT NULL,
  `empleado` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `accesos`
--
ALTER TABLE `accesos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `archivo_inmueble`
--
ALTER TABLE `archivo_inmueble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fotos_inmueble_inmueble_fk` (`inmueble`);

--
-- Indices de la tabla `arriendo`
--
ALTER TABLE `arriendo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arriendo_contrato_fk` (`contrato`),
  ADD KEY `empleadov3` (`empleado`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `caucion`
--
ALTER TABLE `caucion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arriendo` (`arriendo`);

--
-- Indices de la tabla `cita_desalojo`
--
ALTER TABLE `cita_desalojo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cita_desalojo_arriendo_fk` (`arriendo`),
  ADD KEY `empleadov5` (`empleado`);

--
-- Indices de la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ciudades_departamentos_fk` (`departamento`);

--
-- Indices de la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personav1` (`empleado`),
  ADD KEY `personav3` (`cliente`),
  ADD KEY `reservar_visita` (`visita`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`usuario`),
  ADD KEY `empleados_cargos_fk` (`cargo`);

--
-- Indices de la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experiencias_empleados_fk` (`empleado`);

--
-- Indices de la tabla `formaciones`
--
ALTER TABLE `formaciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formaciones_empleados_fk` (`empleado`);

--
-- Indices de la tabla `formato_ventas`
--
ALTER TABLE `formato_ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empleadov6` (`empleado`),
  ADD KEY `inmueble` (`inmueble`);

--
-- Indices de la tabla `informe`
--
ALTER TABLE `informe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `arriendov2` (`arriendo_id`);

--
-- Indices de la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inmueble_ciudades_fk` (`ciudad`),
  ADD KEY `inmueble_promocion_fk` (`promocion`),
  ADD KEY `inmueble_usuarios_fk` (`usuario`),
  ADD KEY `inmueble_usuarios_fkv2` (`administrador`),
  ADD KEY `tipo_inmueble_fk` (`tipo`);

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personas__un` (`cedula`),
  ADD KEY `personas_roles_fk` (`rol`);

--
-- Indices de la tabla `promocion`
--
ALTER TABLE `promocion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reportes_visitas`
--
ALTER TABLE `reportes_visitas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservar_visita`
--
ALTER TABLE `reservar_visita`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empleado` (`empleado`),
  ADD KEY `res_visita_inm_fk` (`inmueble`),
  ADD KEY `visita_personas_fk` (`cliente`);

--
-- Indices de la tabla `reunion`
--
ALTER TABLE `reunion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `persona` (`persona`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rol_accesos`
--
ALTER TABLE `rol_accesos`
  ADD PRIMARY KEY (`rol`,`acceso`),
  ADD KEY `acceso` (`acceso`);

--
-- Indices de la tabla `tipo_inmueble`
--
ALTER TABLE `tipo_inmueble`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`persona`),
  ADD UNIQUE KEY `usuario__un` (`persona`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contraro` (`contrato`),
  ADD KEY `empleadov2` (`empleado`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `archivo_inmueble`
--
ALTER TABLE `archivo_inmueble`
  ADD CONSTRAINT `fotos_inmueble_inmueble_fk` FOREIGN KEY (`inmueble`) REFERENCES `inmueble` (`id`);

--
-- Filtros para la tabla `arriendo`
--
ALTER TABLE `arriendo`
  ADD CONSTRAINT `arriendo_contrato_fk` FOREIGN KEY (`contrato`) REFERENCES `contrato` (`id`),
  ADD CONSTRAINT `empleadov3` FOREIGN KEY (`empleado`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `caucion`
--
ALTER TABLE `caucion`
  ADD CONSTRAINT `arriendo` FOREIGN KEY (`arriendo`) REFERENCES `arriendo` (`id`);

--
-- Filtros para la tabla `cita_desalojo`
--
ALTER TABLE `cita_desalojo`
  ADD CONSTRAINT `cita_desalojo_arriendo_fk` FOREIGN KEY (`arriendo`) REFERENCES `arriendo` (`id`),
  ADD CONSTRAINT `empleadov5` FOREIGN KEY (`empleado`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `ciudades`
--
ALTER TABLE `ciudades`
  ADD CONSTRAINT `ciudades_departamentos_fk` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`);

--
-- Filtros para la tabla `contrato`
--
ALTER TABLE `contrato`
  ADD CONSTRAINT `personav1` FOREIGN KEY (`empleado`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `personav3` FOREIGN KEY (`cliente`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `reservar_visita` FOREIGN KEY (`visita`) REFERENCES `reservar_visita` (`id`);

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `empleados_cargos_fk` FOREIGN KEY (`cargo`) REFERENCES `cargos` (`id`),
  ADD CONSTRAINT `empleados_usuarios_fk` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`persona`);

--
-- Filtros para la tabla `experiencias`
--
ALTER TABLE `experiencias`
  ADD CONSTRAINT `experiencias_empleados_fk` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`usuario`);

--
-- Filtros para la tabla `formaciones`
--
ALTER TABLE `formaciones`
  ADD CONSTRAINT `formaciones_empleados_fk` FOREIGN KEY (`empleado`) REFERENCES `empleados` (`usuario`);

--
-- Filtros para la tabla `formato_ventas`
--
ALTER TABLE `formato_ventas`
  ADD CONSTRAINT `empleadov6` FOREIGN KEY (`empleado`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `inmueble` FOREIGN KEY (`inmueble`) REFERENCES `inmueble` (`id`);

--
-- Filtros para la tabla `informe`
--
ALTER TABLE `informe`
  ADD CONSTRAINT `arriendov2` FOREIGN KEY (`arriendo_id`) REFERENCES `arriendo` (`id`);

--
-- Filtros para la tabla `inmueble`
--
ALTER TABLE `inmueble`
  ADD CONSTRAINT `inmueble_ciudades_fk` FOREIGN KEY (`ciudad`) REFERENCES `ciudades` (`id`),
  ADD CONSTRAINT `inmueble_promocion_fk` FOREIGN KEY (`promocion`) REFERENCES `promocion` (`id`),
  ADD CONSTRAINT `inmueble_usuarios_fk` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`persona`),
  ADD CONSTRAINT `inmueble_usuarios_fkv2` FOREIGN KEY (`administrador`) REFERENCES `usuarios` (`persona`),
  ADD CONSTRAINT `tipo_inmueble_fk` FOREIGN KEY (`tipo`) REFERENCES `tipo_inmueble` (`id`);

--
-- Filtros para la tabla `personas`
--
ALTER TABLE `personas`
  ADD CONSTRAINT `personas_roles_fk` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `reservar_visita`
--
ALTER TABLE `reservar_visita`
  ADD CONSTRAINT `empleado` FOREIGN KEY (`empleado`) REFERENCES `personas` (`id`),
  ADD CONSTRAINT `res_visita_inm_fk` FOREIGN KEY (`inmueble`) REFERENCES `inmueble` (`id`),
  ADD CONSTRAINT `visita_personas_fk` FOREIGN KEY (`cliente`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `reunion`
--
ALTER TABLE `reunion`
  ADD CONSTRAINT `persona` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `rol_accesos`
--
ALTER TABLE `rol_accesos`
  ADD CONSTRAINT `acceso` FOREIGN KEY (`acceso`) REFERENCES `accesos` (`id`),
  ADD CONSTRAINT `rol` FOREIGN KEY (`rol`) REFERENCES `roles` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuario_personas_fk` FOREIGN KEY (`persona`) REFERENCES `personas` (`id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `contraro` FOREIGN KEY (`contrato`) REFERENCES `contrato` (`id`),
  ADD CONSTRAINT `empleadov2` FOREIGN KEY (`empleado`) REFERENCES `personas` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
