-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 21-10-2019 a las 20:06:47
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.19-0ubuntu0.18.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `reserva_aulas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aulas`
--

CREATE TABLE `aulas` (
  `cod_Aula` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aulas`
--

INSERT INTO `aulas` (`cod_Aula`, `descripcion`) VALUES
(101, 'Aula común'),
(102, 'Aula de comercio'),
(110, 'Aula inglés'),
(203, 'Taller Hardware'),
(206, 'Aula 2º DAW'),
(212, 'Aula 1º DAW');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `cod_Hora` int(11) NOT NULL,
  `hora_Inicio` varchar(5) NOT NULL,
  `hora_Finalizar` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`cod_Hora`, `hora_Inicio`, `hora_Finalizar`) VALUES
(1, '08:30', '09:25'),
(2, '09:25', '10:20'),
(3, '10:20', '11:15'),
(4, '11:45', '12:40'),
(5, '12:40', '13:35'),
(6, '13:35', '14:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `cod_Permiso` int(11) NOT NULL,
  `descripcion` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`cod_Permiso`, `descripcion`) VALUES
(1, 'Profesor'),
(2, 'Admin_Aula'),
(3, 'Admin_General');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos_Profesores`
--

CREATE TABLE `permisos_Profesores` (
  `id` int(11) NOT NULL,
  `cod_privilegio` int(11) NOT NULL,
  `cod_Prof` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos_Profesores`
--

INSERT INTO `permisos_Profesores` (`id`, `cod_privilegio`, `cod_Prof`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `codProf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`nombre`, `apellido`, `email`, `password`, `codProf`) VALUES
('Isa', 'de Marcos', 'isademarcos@hotmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1),
('Fernando', 'Aranzabe', 'faranzabe@email.com', 'c4ca4238a0b923820dcc509a6f75849b', 2),
('isa', 'de marcos', 'isa@isa.isa', 'c4ca4238a0b923820dcc509a6f75849b', 3),
('nathan', 'lucas', 'nathan@nathan.nathan', 'c4ca4238a0b923820dcc509a6f75849b', 4),
('cris', 'de marcos', 'cris@cris.cris', 'c4ca4238a0b923820dcc509a6f75849b', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `cod_Prof` int(11) NOT NULL,
  `cod_Aula` int(11) NOT NULL,
  `cod_Hora` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cod_Reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`cod_Prof`, `cod_Aula`, `cod_Hora`, `fecha`, `cod_Reserva`) VALUES
(1, 110, 1, '2019-10-20', 1),
(2, 206, 1, '2019-10-21', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aulas`
--
ALTER TABLE `aulas`
  ADD PRIMARY KEY (`cod_Aula`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`cod_Hora`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`cod_Permiso`);

--
-- Indices de la tabla `permisos_Profesores`
--
ALTER TABLE `permisos_Profesores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`codProf`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`cod_Reserva`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `permisos_Profesores`
--
ALTER TABLE `permisos_Profesores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `codProf` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `cod_Reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
