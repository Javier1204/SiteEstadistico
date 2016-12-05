-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-11-2016 a las 09:46:13
-- Versión del servidor: 10.1.10-MariaDB
-- Versión de PHP: 5.6.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `investigacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`id`) VALUES
(8),
(9),
(10),
(11),
(12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `id` int(11) NOT NULL,
  `semestre` int(2) NOT NULL,
  `programaAcademico_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`id`, `semestre`, `programaAcademico_id`) VALUES
(6, 9, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudio`
--

CREATE TABLE `estudio` (
  `id` int(11) NOT NULL,
  `titulo` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `tipoEstudio_id` int(11) NOT NULL,
  `docente_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `estudio`
--

INSERT INTO `estudio` (`id`, `titulo`, `tipoEstudio_id`, `docente_id`) VALUES
(1, 'Magister Ciencia de la Computacion', 4, 8),
(2, 'Docencia Universitaria', 5, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `groups`
--

CREATE TABLE `groups` (
  `id` bigint(20) NOT NULL,
  `group_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_authorities`
--

CREATE TABLE `group_authorities` (
  `group_id` bigint(20) NOT NULL,
  `authority` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_members`
--

CREATE TABLE `group_members` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) NOT NULL,
  `group_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL,
  `codigoColciencias` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `lineaDeInvestigacion_id` int(2) NOT NULL,
  `nombreGrupo` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `sigla` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `director_id` int(11) NOT NULL,
  `codirector_id` int(11) NOT NULL,
  `anioCreacion` date NOT NULL,
  `correo` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `ubicacion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `telefono` bigint(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`id`, `codigoColciencias`, `lineaDeInvestigacion_id`, `nombreGrupo`, `sigla`, `director_id`, `codirector_id`, `anioCreacion`, `correo`, `ubicacion`, `telefono`) VALUES
(2, '1120972', 3, 'GRUPO DE INVESTIGACION Y DESARROLLO DE INGENIERIA DE SOFTWARE', 'GIDIS', 8, 11, '2016-11-08', 'gidis@ufps.edu.co', 'Avenida Gran Colombia No. 12E-96 Barrio Colsag', 5776655);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `integrante`
--

CREATE TABLE `integrante` (
  `id` int(11) NOT NULL,
  `codigo` varchar(7) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaIngreso` date NOT NULL,
  `contrasena` varchar(188) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `integrante`
--

INSERT INTO `integrante` (`id`, `codigo`, `nombre`, `apellido`, `fechaIngreso`, `contrasena`, `tipo`) VALUES
(5, '1150406', 'Zuly Colombia', 'Ureña Ortiz', '2016-11-08', '123456', 1),
(6, '1150407', 'Mónica Paola', 'Sandoval García', '2016-11-08', '123456', 3),
(8, '1150514', 'Judith Del Pilar', 'Rodriguez Tenjo', '2016-11-08', '123456', 2),
(11, '1150716', 'Oscar Alberto', 'Gallardo', '2016-11-08', '12345', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasinvestigacion`
--

CREATE TABLE `lineasinvestigacion` (
  `id` int(2) NOT NULL,
  `nombre` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `objetivos` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `lineasinvestigacion`
--

INSERT INTO `lineasinvestigacion` (`id`, `nombre`, `objetivos`, `descripcion`) VALUES
(1, 'Ingeniería del Software', '', ''),
(2, 'LA CONTABILIDAD COLOMBIANA EN EL ENTORNO DE LA GLOBALIZACION', 'Orientar a la realización de proyectos de Investigación y actividades relacionadas en el conocimiento contable y las finanzas del sector Empresarial', '*Investigar sobre los impactos y desafíos que afectan a la información contable y financiera de las empresas del sector privado'),
(3, 'Software Educativo y Sistemas Multimediales', 'Promover el aprendizaje mediante el uso de Herramientas TIC.', 'El software Educativo en conjunto con los Sistemas Multimediales generan un gran impacto en la enseñanza debido a que incrementa el nivel didáctico por medio de herramientas llamativas.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programaacademico`
--

CREATE TABLE `programaacademico` (
  `id` int(11) NOT NULL,
  `codigo` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `programaacademico`
--

INSERT INTO `programaacademico` (`id`, `codigo`, `nombre`) VALUES
(1, '115', 'Ingeniería de Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoestudio`
--

CREATE TABLE `tipoestudio` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tipoestudio`
--

INSERT INTO `tipoestudio` (`id`, `descripcion`) VALUES
(3, 'Pregrado'),
(4, 'Maestría'),
(5, 'Especialización');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `programaAcademico_id` (`programaAcademico_id`);

--
-- Indices de la tabla `estudio`
--
ALTER TABLE `estudio`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipoEstudio` (`tipoEstudio_id`),
  ADD KEY `idIntegrante` (`docente_id`);

--
-- Indices de la tabla `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `group_authorities`
--
ALTER TABLE `group_authorities`
  ADD KEY `fk_group_authorities_group` (`group_id`);

--
-- Indices de la tabla `group_members`
--
ALTER TABLE `group_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_group_members_group` (`group_id`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigoColciencias` (`codigoColciencias`),
  ADD KEY `codigoLinea` (`lineaDeInvestigacion_id`),
  ADD KEY `director_id` (`director_id`),
  ADD KEY `codirector_id` (`codirector_id`);

--
-- Indices de la tabla `integrante`
--
ALTER TABLE `integrante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `lineasinvestigacion`
--
ALTER TABLE `lineasinvestigacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programaacademico`
--
ALTER TABLE `programaacademico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codigo` (`codigo`);

--
-- Indices de la tabla `tipoestudio`
--
ALTER TABLE `tipoestudio`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `docente`
--
ALTER TABLE `docente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `estudio`
--
ALTER TABLE `estudio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `groups`
--
ALTER TABLE `groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `group_members`
--
ALTER TABLE `group_members`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `integrante`
--
ALTER TABLE `integrante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT de la tabla `lineasinvestigacion`
--
ALTER TABLE `lineasinvestigacion`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `programaacademico`
--
ALTER TABLE `programaacademico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tipoestudio`
--
ALTER TABLE `tipoestudio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_1` FOREIGN KEY (`programaAcademico_id`) REFERENCES `programaacademico` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`id`) REFERENCES `integrante` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudio`
--
ALTER TABLE `estudio`
  ADD CONSTRAINT `estudio_ibfk_1` FOREIGN KEY (`docente_id`) REFERENCES `docente` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudio_ibfk_2` FOREIGN KEY (`tipoEstudio_id`) REFERENCES `tipoestudio` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `group_authorities`
--
ALTER TABLE `group_authorities`
  ADD CONSTRAINT `fk_group_authorities_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Filtros para la tabla `group_members`
--
ALTER TABLE `group_members`
  ADD CONSTRAINT `fk_group_members_group` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`lineaDeInvestigacion_id`) REFERENCES `lineasinvestigacion` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
