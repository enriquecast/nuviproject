-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-05-2018 a las 09:47:11
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.2

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nuvi`
--
CREATE DATABASE IF NOT EXISTS `nuvi` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `nuvi`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `listarEstadosCasos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarEstadosCasos` ()  SELECT * FROM CASOS WHERE fk_Estado_Caso = 1$$

DROP PROCEDURE IF EXISTS `listarMaterialesRequeridos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMaterialesRequeridos` (`cod_proyecto` INT)  SELECT * FROM materiales_proyecto
WHERE fk_Proyecto=cod_proyecto$$

DROP PROCEDURE IF EXISTS `listarMaterialesRequeridosString`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarMaterialesRequeridosString` (`cod` VARCHAR(45))  SELECT * FROM materiales_proyecto
left JOIN proyectos ON
proyectos.id_Proyecto =  materiales_proyecto.fk_Proyecto
WHERE proyectos.cod_proyecto = cod$$

DROP PROCEDURE IF EXISTS `listarProyectosPorEstado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `listarProyectosPorEstado` (`estado` VARCHAR(45))  SELECT * FROM proyectos WHERE proyectos.Estado_Proyecto = estado$$

DROP PROCEDURE IF EXISTS `sumarTotales`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sumarTotales` (`cod` VARCHAR(45))  SELECT materiales_proyecto.Valor_Total FROM nuvi.materiales_proyecto
INNER JOIN proyectos on proyectos.id_Proyecto = materiales_proyecto.fk_Proyecto 
WHERE proyectos.cod_proyecto = cod$$

DROP PROCEDURE IF EXISTS `sumarTotalesDos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sumarTotalesDos` (`cod` VARCHAR(45))  SELECT sum(materiales_proyecto.Valor_Total) FROM materiales_proyecto
left JOIN proyectos ON
proyectos.id_Proyecto =  materiales_proyecto.fk_Proyecto
WHERE proyectos.cod_proyecto = cod$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

DROP TABLE IF EXISTS `casos`;
CREATE TABLE `casos` (
  `id_Caso` int(11) NOT NULL,
  `Nombre_Usuario` varchar(45) DEFAULT NULL,
  `Email_Usuario` varchar(45) DEFAULT NULL,
  `Detalle_Problema` varchar(300) DEFAULT NULL,
  `Detalle_Solucion` varchar(300) DEFAULT NULL,
  `Estado_Caso` varchar(30) DEFAULT NULL,
  `fk_Usuario` int(11) DEFAULT NULL,
  `Calificacion` enum('1','2','3','4','5') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donaciones`
--

DROP TABLE IF EXISTS `donaciones`;
CREATE TABLE `donaciones` (
  `id_Donacion` int(11) NOT NULL,
  `Valor_Donacion` int(11) DEFAULT NULL,
  `Fecha_Donacion` date DEFAULT NULL,
  `fk_Proyecto` int(11) DEFAULT NULL,
  `img_Comporbante` varchar(45) DEFAULT NULL,
  `fk_Donador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `donaciones`
--

INSERT INTO `donaciones` (`id_Donacion`, `Valor_Donacion`, `Fecha_Donacion`, `fk_Proyecto`, `img_Comporbante`, `fk_Donador`) VALUES
(2, 90000, NULL, 1, '/Proyecto NUVi/Archivos/Logotipo_Nuvi_2.png', 2),
(4, 2000000, NULL, 83, '/Proyecto NUVi/Archivos/AVATAR1.png', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `donador`
--

DROP TABLE IF EXISTS `donador`;
CREATE TABLE `donador` (
  `id_Donador` int(11) NOT NULL,
  `nombre_Donador` varchar(45) DEFAULT NULL,
  `fk_TipoDocum` int(11) DEFAULT NULL,
  `Docu_Donador` int(11) DEFAULT NULL,
  `fecha_Ingreso` date DEFAULT NULL,
  `Contac_Donador` varchar(45) DEFAULT NULL,
  `Email_Donador` varchar(45) DEFAULT NULL,
  `Direccion_Residencia` varchar(30) DEFAULT NULL,
  `Ciudad_Residencia` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `donador`
--

INSERT INTO `donador` (`id_Donador`, `nombre_Donador`, `fk_TipoDocum`, `Docu_Donador`, `fecha_Ingreso`, `Contac_Donador`, `Email_Donador`, `Direccion_Residencia`, `Ciudad_Residencia`) VALUES
(1, 'Camilo Torres', NULL, 98887777, NULL, '(888) 888-8888', 'alejo@gmail.com', 'Cl 1234', 'Bogota'),
(2, 'Diego Leguizamon', NULL, 9090909, NULL, '(888) 888-8888', 'alejo@gmail.com', 'Cl 123', 'Bogota'),
(3, 'Carlos', NULL, 12345111, NULL, '(315) 345-5677', 'nhrodrigueza@misena.edu.co', 'calle123', 'Bogota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `familias`
--

DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `id_Familia` int(11) NOT NULL,
  `Nombre_Cde_Familia` varchar(45) DEFAULT NULL,
  `Apellido_Cde_Familia` varchar(45) DEFAULT NULL,
  `Fecha_Visita` date DEFAULT NULL,
  `fk_TipoDocum` int(11) DEFAULT NULL,
  `Docum_Cde_Familia` varchar(45) DEFAULT NULL,
  `Integrantes_Familia` int(11) DEFAULT NULL,
  `Barrio_Familia` varchar(45) DEFAULT NULL,
  `Direccion_Familia` varchar(45) DEFAULT NULL,
  `ciudad_Familia` varchar(45) DEFAULT NULL,
  `fk_Problematica` int(11) DEFAULT NULL,
  `imgHogar` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `familias`
--

INSERT INTO `familias` (`id_Familia`, `Nombre_Cde_Familia`, `Apellido_Cde_Familia`, `Fecha_Visita`, `fk_TipoDocum`, `Docum_Cde_Familia`, `Integrantes_Familia`, `Barrio_Familia`, `Direccion_Familia`, `ciudad_Familia`, `fk_Problematica`, `imgHogar`) VALUES
(1, 'Diego', 'Le', '2018-05-02', 1, '4231', 3, 'Villa', 'cl 123', 'Bogota', 1, NULL),
(2, '', '', NULL, 1, '', NULL, '', '', '', 1, NULL),
(3, 'Cindy', 'Carlos', '2018-05-17', 1, '3456789', 5, 'Kennedy', 'calle 123', 'Bogota', 2, NULL),
(4, 'Camilo Andres', 'Perez Ortega', '2018-05-20', 1, '1019077632', 5, 'La Villa', 'Cl 123 SiempreViva', 'Bogotá', 1, NULL),
(5, 'Diego Ortencio', 'Torres Perez', '2018-05-20', 1, '1019000', 7, 'Villas', 'Cl 234', 'Bogotá', 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales`
--

DROP TABLE IF EXISTS `materiales`;
CREATE TABLE `materiales` (
  `id_Material` int(11) NOT NULL,
  `Nombre_Material` varchar(45) DEFAULT NULL,
  `Unidad_Medida` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiales`
--

INSERT INTO `materiales` (`id_Material`, `Nombre_Material`, `Unidad_Medida`, `Descripcion`) VALUES
(1, 'Madera', 'Tabla', '10X10\r'),
(2, 'Cemento', 'Bulto', '30Kg\r'),
(3, 'Ladrillo', 'Unidades', '10X30'),
(4, 'Madera', 'Tabla', '10X10\r'),
(5, 'Cemento', 'Bulto', '30Kg\r'),
(6, 'Ladrillo', 'Unidad', '10X30'),
(8, 'Puntillas', 'Decena', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materiales_proyecto`
--

DROP TABLE IF EXISTS `materiales_proyecto`;
CREATE TABLE `materiales_proyecto` (
  `id_Material_Proyecto` int(11) NOT NULL,
  `fk_Proyecto` int(11) DEFAULT NULL,
  `fk_Material` int(11) DEFAULT NULL,
  `Cantidad_Material` float DEFAULT NULL,
  `Valor_Unitario` float DEFAULT NULL,
  `Valor_Total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `materiales_proyecto`
--

INSERT INTO `materiales_proyecto` (`id_Material_Proyecto`, `fk_Proyecto`, `fk_Material`, `Cantidad_Material`, `Valor_Unitario`, `Valor_Total`) VALUES
(1, 17, 1, 10, 10000, 100000),
(2, 17, 2, 10, 90909, 909090),
(3, 20, 1, 10, 101, 10),
(4, 20, 2, 10, NULL, NULL),
(5, 20, 3, 1, NULL, NULL),
(6, 20, 2, NULL, NULL, NULL),
(7, 20, 1, 10, NULL, NULL),
(8, 20, 1, 10, NULL, NULL),
(9, 20, 1, 10, NULL, NULL),
(10, 20, 2, 7, NULL, NULL),
(11, 21, 1, 10, NULL, NULL),
(12, 21, 2, 70, NULL, NULL),
(13, 22, 1, 6, NULL, NULL),
(14, 23, 1, 10, NULL, NULL),
(15, 23, 1, 10, NULL, NULL),
(16, 23, 3, 3, NULL, NULL),
(17, 27, 1, 9, NULL, NULL),
(18, 27, 2, 2, NULL, NULL),
(19, 30, 1, 2, NULL, NULL),
(20, 30, 2, 1, NULL, NULL),
(21, 30, 3, 500, NULL, NULL),
(22, 33, 1, 7, NULL, NULL),
(23, 33, 2, 4, NULL, NULL),
(24, 34, 1, 45, NULL, NULL),
(25, 34, 1, 2, NULL, NULL),
(26, 36, 1, 4, NULL, NULL),
(27, 36, 1, 4, NULL, NULL),
(28, 37, 2, 4, NULL, NULL),
(29, 39, 1, 4, NULL, NULL),
(30, 39, 2, 7, NULL, NULL),
(31, 40, 1, 2, NULL, NULL),
(32, 41, 2, 1, NULL, NULL),
(33, 41, 1, 8, NULL, NULL),
(34, 44, 2, 8, 1, 8),
(35, 44, 1, 8, 1, 8),
(36, 44, 3, 1, 10, 10),
(38, 46, 3, NULL, NULL, NULL),
(39, 48, 3, NULL, NULL, NULL),
(41, 48, 3, 56, NULL, NULL),
(42, 48, 3, 56, NULL, NULL),
(43, 48, 3, 56, NULL, NULL),
(44, 48, 3, 56, NULL, NULL),
(45, 48, 3, 56, NULL, NULL),
(46, 48, 3, 56, NULL, NULL),
(47, 48, 3, 56, NULL, NULL),
(48, 48, 3, 56, NULL, NULL),
(49, 48, 3, 56, NULL, NULL),
(50, 48, 3, 56, NULL, NULL),
(51, 48, 3, 56, NULL, NULL),
(52, 48, 3, 56, NULL, NULL),
(53, 48, 3, 56, NULL, NULL),
(54, 48, 3, 56, NULL, NULL),
(55, 52, 3, NULL, NULL, NULL),
(56, 52, 3, NULL, NULL, NULL),
(57, 52, 3, NULL, NULL, NULL),
(58, 52, 3, NULL, NULL, NULL),
(59, 52, 3, NULL, NULL, NULL),
(60, 52, 3, NULL, NULL, NULL),
(61, 52, 4, NULL, NULL, NULL),
(62, 52, 4, 9.9009e26, NULL, NULL),
(63, 53, 1, 9, NULL, NULL),
(64, 53, 1, 0, NULL, NULL),
(65, 53, 1, 9, NULL, NULL),
(66, 53, 1, 8, NULL, NULL),
(67, 56, 1, 2, NULL, NULL),
(68, 61, 1, 8, NULL, NULL),
(69, 61, 1, 13, NULL, NULL),
(70, NULL, NULL, NULL, NULL, NULL),
(71, NULL, NULL, NULL, NULL, NULL),
(72, NULL, NULL, NULL, 0, NULL),
(73, NULL, NULL, NULL, 0, NULL),
(74, NULL, NULL, NULL, 0, NULL),
(75, 68, 1, 2, NULL, NULL),
(76, 68, 3, 5, NULL, NULL),
(77, 68, 2, 6, NULL, NULL),
(78, 68, 4, 1, NULL, NULL),
(79, 68, 3, 300, NULL, NULL),
(80, 69, 1, 3, NULL, NULL),
(81, 69, 1, NULL, NULL, NULL),
(82, 69, 1, 2, NULL, NULL),
(86, 69, 2, NULL, NULL, NULL),
(88, 70, 1, 12, NULL, NULL),
(89, 71, 1, 10, 1, 10),
(91, 71, 2, 15, 1, 15),
(92, 71, 3, 400, 50, 20000),
(93, 74, 2, 10, NULL, NULL),
(94, 74, 4, 8, NULL, NULL),
(95, 75, 1, 1, 0, 0),
(96, 75, 2, 14, 0, 0),
(97, 75, 3, 300, 0, 0),
(98, 78, 1, 100, 3, 300),
(99, 78, 2, 6000, 120, 720000),
(100, 78, 4, 500, 1, 500),
(101, 79, 1, 12, 23, 276),
(102, 79, 2, 10000, 45, 450000),
(104, 82, 2, 10, 30000, 300000),
(105, 82, 3, 300, 500, 150000),
(106, 82, 1, 80, 99, 7920),
(107, 83, 2, 2, 30000, 60000),
(108, 83, 8, 100, 100, 10000),
(110, 83, 1, 20, 2000, 40000),
(111, 83, 5, 13, 30000, 390000),
(112, 84, 1, 10, NULL, NULL),
(115, 141, 2, 56, NULL, NULL),
(117, 141, 3, NULL, NULL, NULL),
(118, 141, 3, 145, NULL, NULL),
(119, 141, 3, 12, NULL, NULL),
(120, 141, 3, 343, NULL, NULL),
(124, 145, 3, 909, NULL, NULL),
(139, 155, 2, 90, NULL, NULL),
(140, 155, 2, 90, NULL, NULL),
(141, 156, 2, 12, NULL, NULL),
(142, 156, 1, 34, NULL, NULL),
(143, 156, 6, 67, NULL, NULL),
(144, 157, 1, 100, 2000, 200000),
(145, 157, 3, 500, 500, 250000),
(147, 157, 5, 3, 30000, 90000),
(148, 158, 1, 10, 5000, 50000),
(149, 158, 2, 35, 35000, 1225000),
(150, 158, 3, 500, 1000, 500000),
(151, 158, 8, 800, 2500, 2000000),
(152, 162, 1, 80, NULL, NULL),
(153, 162, 2, 15, NULL, NULL),
(154, 162, 3, 1000, NULL, NULL),
(155, 164, 1, 10, NULL, NULL),
(157, 164, 2, 9, NULL, NULL),
(158, 164, 3, 500, NULL, NULL),
(159, 166, 1, 90, NULL, NULL),
(160, 166, 2, 15, NULL, NULL),
(161, 166, 3, 1500, NULL, NULL),
(162, 166, 8, 40, NULL, NULL),
(163, 168, 1, 4, NULL, NULL),
(164, 168, 3, 7, NULL, NULL),
(165, 168, 5, 18, NULL, NULL),
(166, 169, 8, 18, NULL, NULL),
(168, 170, 1, 18, NULL, NULL),
(169, 170, 2, 60, NULL, NULL),
(171, 170, 8, 1500, NULL, NULL),
(172, 171, 2, NULL, NULL, NULL),
(173, 171, 1, 10, NULL, NULL),
(174, 171, 8, 1000, NULL, NULL),
(175, 171, 2, 66, NULL, NULL),
(176, 171, 1, 66, NULL, NULL),
(177, 171, 6, 80, NULL, NULL),
(178, 172, 1, 78, NULL, NULL),
(179, 173, 2, 10, NULL, NULL),
(180, 173, 4, 80, NULL, NULL),
(181, 175, 2, 80, NULL, NULL),
(182, 175, 2, 90, NULL, NULL),
(183, 176, 1, 90, NULL, NULL),
(184, 176, 2, 90, NULL, NULL),
(185, 176, 5, 90, NULL, NULL),
(186, 177, 1, 32, NULL, NULL),
(187, 177, 3, 13, NULL, NULL),
(188, 177, 5, 91, NULL, NULL),
(189, 178, 2, 100, 99, 9900),
(190, 181, 1, 10, NULL, NULL),
(191, 181, 4, 90, NULL, NULL),
(192, 181, 5, 90, NULL, NULL),
(193, 182, 2, 1, NULL, NULL),
(195, 198, 1, NULL, NULL, NULL),
(197, 209, 1, 100, NULL, NULL),
(198, 209, 2, 80, NULL, NULL),
(199, 209, 6, 100, NULL, NULL),
(254, 223, 2, 80, NULL, NULL),
(255, 223, 2, 90, NULL, NULL),
(257, 224, 2, 90, NULL, NULL),
(262, 225, 8, 1500, NULL, NULL),
(263, 225, 8, 9000, NULL, NULL),
(264, 226, 1, 90, NULL, NULL),
(265, 226, 8, 1000, NULL, NULL),
(266, 226, 5, 90, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `id_Permiso` int(11) NOT NULL,
  `Nombre_Permiso` varchar(100) DEFAULT NULL,
  `url` text,
  `icon` varchar(45) DEFAULT NULL,
  `Permiso_padre` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_Permiso`, `Nombre_Permiso`, `url`, `icon`, `Permiso_padre`) VALUES
(1, 'Gestión de Proyectos', NULL, 'fa fa-child', NULL),
(2, 'Iniciar Proyecto', '../Proyectos/RegistroProyecto.xhtml', 'fa fa-angle-double-right', 1),
(3, 'Gestión de Familias', NULL, 'fas fa-users', NULL),
(4, 'Registro de familias', '../Familias/RegistroFamilia.xhtml', 'fa fa-angle-double-right', 3),
(5, 'Cerrar proyecto', '../Proyectos/CerrarProyecto.xhtml', 'fa fa-angle-double-right', 1),
(6, 'Generar reportes', '../Grafica/GraficaTProblematicas.xhtml', 'fa fa-angle-double-right', NULL),
(7, 'Asignar costo a materiales', '../Proyectos/CostoMaterial.xhtml', 'fa fa-angle-double-right', 1),
(8, 'Consultas', NULL, NULL, NULL),
(9, 'Lista Proyectos', '../Proyectos/ListaProyectos.xhtml', 'fa fa-angle-double-right', 8),
(10, 'Reportes', NULL, 'fa fa-angle-double-right', NULL),
(11, 'Problematicas', '../Grafica/GraficaTProblematicas.xhtml', 'fa fa-angle-double-right', 10),
(12, 'Gestión de Voluntarios', NULL, 'fa fa-angle-double-right', NULL),
(13, 'Registro de Personal Contratado', '../Voluntarios/RegistrarPersonalContratado.xhtml', NULL, 12),
(14, 'Asignación de Personal', '../Voluntarios/ListaVoluntarios.xhtml', NULL, 12),
(15, 'Gestión de Donaciones', NULL, 'fas fa-hand-holding-heart', NULL),
(16, 'Asignación de Donaciones', '../Donaciones/ListaDonaciones.xhtml', NULL, 15),
(17, 'Prueba', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisosroles`
--

DROP TABLE IF EXISTS `permisosroles`;
CREATE TABLE `permisosroles` (
  `fk_Rol` int(11) DEFAULT NULL,
  `fk_Permiso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `permisosroles`
--

INSERT INTO `permisosroles` (`fk_Rol`, `fk_Permiso`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 1),
(2, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 12),
(2, 13),
(2, 14),
(2, 15),
(2, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

DROP TABLE IF EXISTS `personal`;
CREATE TABLE `personal` (
  `id_Personal` int(11) NOT NULL,
  `Nombre_Personal` varchar(45) DEFAULT NULL,
  `Apellido_Personal` varchar(45) DEFAULT NULL,
  `Profesion_Personal` varchar(45) DEFAULT NULL,
  `fecha_Nacimiento` date DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `Categoria_Personal` varchar(45) DEFAULT NULL,
  `fk_TipoDocum` int(11) DEFAULT NULL,
  `Docum_Personal` varchar(45) DEFAULT NULL,
  `Contac_Personal` varchar(45) DEFAULT NULL,
  `Email_Personal` varchar(45) DEFAULT NULL,
  `Costo` int(11) DEFAULT NULL,
  `Disponibilidad` varchar(45) DEFAULT NULL,
  `fk_Proyecto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id_Personal`, `Nombre_Personal`, `Apellido_Personal`, `Profesion_Personal`, `fecha_Nacimiento`, `fecha_ingreso`, `Categoria_Personal`, `fk_TipoDocum`, `Docum_Personal`, `Contac_Personal`, `Email_Personal`, `Costo`, `Disponibilidad`, `fk_Proyecto`) VALUES
(1, 'Camilo', 'Torres', 'Estudiante', '2018-05-09', NULL, 'Voluntario', NULL, '1019077632', '(777) 777-7777', 'ale@gmail.com', NULL, 'No disponible', 3),
(2, 'Diego Alejandro', 'Leguizamon', 'Estudiante', '2018-05-12', NULL, 'Contratado', 1, '1019077632', '(333) 333-3333', 'alejandrohuertas1992@gmail.com', 7000, NULL, 82),
(3, 'Camilo', 'Torres', 'Estudiante', '2018-05-09', NULL, 'Voluntario', 1, '1019077632', '(777) 777-7777', 'ale@gmail.com', 7000, 'Disponible', 82),
(4, 'Diego', 'Perez', 'Aux', '2018-05-12', NULL, 'Voluntario', NULL, '109900999', '(888) 888-8888', 'alejandrohuertas1992@gmail.com', NULL, 'No disponible', 81),
(5, 'Diego ', 'Leguizamon', 'Estudiante', '2018-05-01', NULL, 'Voluntario', NULL, '12121212', '(444) 444-4444', 'ale@gmail.com', NULL, 'No disponible', 77),
(6, 'Andrea', 'Torres', 'Estudiante', '2018-05-09', NULL, 'Voluntario', 1, '1019077632', '(777) 777-7777', 'ale@gmail.com', 7000, 'No disponible', 3),
(7, 'Diego ', 'Leguizamon', 'Estudiante', '2018-05-01', NULL, 'Voluntario', 1, '12121212', '(444) 444-4444', 'ale@gmail.com', 455, 'No disponible', 71),
(8, 'Andres ', 'Quintero', 'Vendedor', '2018-05-04', NULL, 'Contratado', 1, '8989898', '(888) 888-8888', 'alejandrohuertas1992@gmail.com', 7000, 'No disponible', 3),
(9, 'Carlos', 'Cely', 'Arquitecto', '2018-05-17', NULL, 'Voluntario', NULL, '18099909', '(310) 456-7567', 'nhrodrigueza@misena.edu.co', NULL, 'No disponible', 83),
(10, 'Diego ', 'Rueda', 'Estudiante', '2015-11-03', NULL, 'Voluntario', NULL, '191919191', '(222) 222-2222', 'alejandrohuertas1992@gmail.com', NULL, 'No disponible', 3),
(11, 'fsaf', 'fsadf', 'fasdfa', '2018-05-15', NULL, 'fasdfaf', 1, '5534', '534523', 'alejandro@gmail.com', 5, 'No disponible', 157),
(12, 'Camilo', 'Torres', 'Est', '2018-05-01', NULL, 'Voluntario', NULL, '191919', '(777) 777-7777', 'colaborador@gmail.com', NULL, 'Disponible', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `problematicas`
--

DROP TABLE IF EXISTS `problematicas`;
CREATE TABLE `problematicas` (
  `id_Problematica` int(11) NOT NULL,
  `Problematica` varchar(45) DEFAULT NULL,
  `Detalle_Problematica` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `problematicas`
--

INSERT INTO `problematicas` (`id_Problematica`, `Problematica`, `Detalle_Problematica`) VALUES
(1, 'Violencia Familias', NULL),
(2, 'Salubridad', NULL),
(3, 'Espacios no adecuados', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
CREATE TABLE `proyectos` (
  `id_Proyecto` int(11) NOT NULL,
  `cod_proyecto` varchar(15) DEFAULT NULL,
  `Nombre_Proyecto` varchar(45) DEFAULT NULL,
  `FechaInicio_Proyecto` date DEFAULT NULL,
  `FechaFin_Proyecto` date DEFAULT NULL,
  `Costo_Material` float DEFAULT NULL,
  `Costo_Personal` float DEFAULT NULL,
  `Costo_Proyecto` float DEFAULT NULL,
  `Cantidad_Voluntarios` int(11) DEFAULT NULL,
  `Dinero_Recaudado` float DEFAULT NULL,
  `Solucion_Proyecto` varchar(1000) DEFAULT NULL,
  `fk_Familia` int(11) DEFAULT NULL,
  `Estado_Proyecto` varchar(10) DEFAULT NULL,
  `imgCierreProyecto` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `proyectos`
--

INSERT INTO `proyectos` (`id_Proyecto`, `cod_proyecto`, `Nombre_Proyecto`, `FechaInicio_Proyecto`, `FechaFin_Proyecto`, `Costo_Material`, `Costo_Personal`, `Costo_Proyecto`, `Cantidad_Voluntarios`, `Dinero_Recaudado`, `Solucion_Proyecto`, `fk_Familia`, `Estado_Proyecto`, `imgCierreProyecto`) VALUES
(1, 'fsadf', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', ''),
(2, 'ABD123', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '', ''),
(3, 'COD78787', 'Familia Le', '2017-12-11', '2018-12-11', NULL, NULL, NULL, 5, NULL, 'hkjhkjhkjhkjh', 1, 'hkjhkjhkj', ''),
(4, 'fsdfa', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(5, 'iiuiiiu', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(6, 'uiuiuoiou', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(7, 'uiuiuoiou', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(8, 'hkjkjhkjh', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(9, 'uuyyuuy', 'Pepito', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(10, 'jijijiji', 'Pepito', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(11, 'jijijiji', 'Pepito', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(12, 'opopopopopo', 'Casitas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(13, 'ioioioioi', 'Casitas', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(14, 'yyyyyyy', 'Casa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(15, 'yuyuyu', 'Patio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(16, 'yuyuyu', 'Patio', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(17, 'uiu78787', 'Casita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(18, 'oop7879', 'Bosita', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(19, 'ioioioi78787', 'Pepitos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(20, 'ioioioi78787', 'Pepitos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(21, 'ioioioi78787', 'Pepitos', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(22, 'Cod878', 'Familia Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(23, 'Cod878', 'Familia Perez', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(24, 'yyy', 'Pi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(25, 'yyy', 'Pi', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(26, 'yyy', 'Prueba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, '', ''),
(27, 'Cod123', 'Prueba', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', 1, NULL, NULL),
(28, 'Cod345', 'Prueba1', '2018-05-02', '2018-05-02', NULL, NULL, NULL, 45, NULL, 'Arreglo de casa', 1, 'Creado', NULL),
(29, 'COD8998', 'Prueba6', '2018-05-02', '2018-05-02', NULL, NULL, NULL, 6, NULL, 'Remodelación de Cocina', 1, 'Creado', NULL),
(30, 'COD8998', 'Prueba6', '2018-05-02', '2018-05-02', NULL, NULL, NULL, 6, NULL, 'Remodelación de Cocina', 1, 'Creado', NULL),
(31, 'COD789', 'Proyecto Famila Perez', '2018-05-02', '2018-05-02', NULL, NULL, NULL, 56, NULL, 'Remodelación de Casa', 1, 'Creado', NULL),
(32, 'COD789', 'Proyecto Famila Perez', '2018-05-02', '2018-05-02', NULL, NULL, NULL, 56, NULL, 'Remodelación de Casa', 1, 'Creado', NULL),
(33, 'COD789', 'Proyecto Famila Perez', '2018-05-02', '2018-05-02', NULL, NULL, NULL, 56, NULL, 'Remodelación de Casa', 1, 'Creado', NULL),
(34, 'hhjjh', '', NULL, '2018-05-02', NULL, NULL, NULL, NULL, NULL, 'fasdfa', 1, 'Creado', NULL),
(35, 'DOG', 'Pepitos', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 6, NULL, 'FASDFAs', 1, 'Creado', NULL),
(36, 'DOG', 'Pepitos', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 6, NULL, 'FASDFAs', 1, 'Creado', NULL),
(37, 'fsf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'fasfasdfa', 1, 'Creado', NULL),
(38, 'fasdfa', 'Proyecto Prueba', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'fasfa', 1, 'Creado', NULL),
(39, 'Cod6768', 'Proyecto Prueba', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'fasfa', 1, 'Creado', NULL),
(40, 'Cod6768', 'Proyecto Prueba', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'fasfa', 1, 'Creado', NULL),
(41, 'COD7878', 'Prueba8989', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 3, NULL, 'Arreglo de cocina', 1, 'Creado', NULL),
(42, 'COD8989', 'FamiliaPerez', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 78, NULL, 'Arreglo de casa', 1, 'Creado', NULL),
(43, 'COD8989', 'FamiliaPerez', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 78, NULL, 'Arreglo de casa', 1, 'Creado', NULL),
(44, 'COD8989', 'FamiliaPerez', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 78, NULL, 'Arreglo de casa', 1, 'Creado', NULL),
(45, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(46, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(47, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(48, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(49, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(50, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(51, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(52, 'fasdf', 'fasdf', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'afsdf', 1, 'Creado', NULL),
(53, 'Cod3412', 'fsadfas', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'fasdfas', 1, 'Creado', NULL),
(54, 'Cod3412', 'fsadfas', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'fasdfas', 1, 'Creado', NULL),
(55, 'Cod3412', 'fsadfas', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'fasdfas', 1, 'Creado', NULL),
(56, 'Cod3412', 'fsadfas', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'fasdfas', 1, 'Creado', NULL),
(57, 'yuyyuy', 'Prueba ', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 8, NULL, 'fasdfas', 1, 'Creado', NULL),
(58, 'yuyyuy', 'Prueba ', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 8, NULL, 'fasdfas', 1, 'Creado', NULL),
(59, 'yuyyuy', 'Prueba ', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 8, NULL, 'fasdfas', 1, 'Creado', NULL),
(60, 'yuyyuy', 'Prueba ', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 8, NULL, 'fasdfas', 1, 'Creado', NULL),
(61, 'yuyyuy', 'Prueba ', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 8, NULL, 'fasdfas', 1, 'Creado', NULL),
(62, 'uuu', 'iuiuiu', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'dfasd', 1, 'Creado', NULL),
(63, 'uuu', 'iuiuiu', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'dfasd', 1, 'Creado', NULL),
(64, 'uuu', 'iuiuiu', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 4, NULL, 'dfasd', 1, 'Creado', NULL),
(65, 'cod', 'yuyuy', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'asfdasd', 1, 'Creado', NULL),
(66, 'cod', 'yuyuy', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'asfdasd', 1, 'Creado', NULL),
(67, 'cod', 'yuyuy', '2018-05-03', '2018-05-03', NULL, NULL, NULL, 5, NULL, 'asfdasd', 1, 'Creado', NULL),
(68, 'rrr', 'rrr', '2018-05-04', '2018-05-04', NULL, NULL, NULL, 5, NULL, 'fasdfas', 1, 'Creado', NULL),
(69, 'rer', 'rers', '2018-05-04', '2018-05-04', NULL, NULL, NULL, 4, NULL, 'fasdfasfd', 1, 'Creado', NULL),
(70, 'ddd', 'ddd', '2018-05-05', '2018-05-05', NULL, NULL, NULL, 4, NULL, '\r\nffasdfas', 1, 'Creado', NULL),
(71, 'cod', 'lkj', '2018-05-08', '2018-05-08', 657945, NULL, NULL, 2, NULL, 'fasdfa', 1, 'Creado', NULL),
(72, 'COD676', 'Camilo', '2018-05-09', '2018-05-09', NULL, NULL, NULL, 8, NULL, 'Arreglo de baño', 1, 'Creado', NULL),
(73, 'COD676', 'Camilo', '2018-05-09', '2018-05-09', NULL, NULL, NULL, 8, NULL, 'Arreglo de baño', 1, 'Creado', NULL),
(74, 'COD676', 'Camilo', '2018-05-09', '2018-05-09', NULL, NULL, NULL, 8, NULL, 'Arreglo de baño', 1, 'Creado', NULL),
(75, '', '', '2018-05-09', '2018-05-09', NULL, NULL, NULL, NULL, NULL, 'Arreglo', 2, 'Creado', NULL),
(76, 'PruebaDiego', 'jkjlkj', '2018-05-10', '2018-05-10', NULL, NULL, NULL, 5, NULL, 'asdfas', 1, 'Creado', NULL),
(77, '123456', 'kkk', '2018-05-10', '2018-05-10', NULL, NULL, NULL, 10, NULL, 'asdfa', 1, 'Creado', NULL),
(78, '123456', 'kkk', '2018-05-10', '2018-05-10', NULL, NULL, NULL, 10, NULL, 'asdfa', 1, 'Creado', NULL),
(79, '121212', 'dafsa', '2018-05-10', '2018-05-10', NULL, NULL, NULL, 3, NULL, 'fsdf', 1, 'Creado', NULL),
(80, NULL, NULL, NULL, NULL, 150000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, NULL, NULL, NULL, NULL, 10938000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'cod', 'Familia Perez', '2018-05-12', '2018-05-12', 9667020, NULL, NULL, 3, NULL, 'Arreglo Casa', 1, 'Creado', NULL),
(83, 'P003', 'Alameda', '2018-05-17', '2018-06-21', NULL, NULL, NULL, 12, NULL, 'Moodificacion Cocina', 3, 'Creado', NULL),
(84, 'COD12345', 'fasdf', '2018-05-01', '2018-05-22', NULL, NULL, NULL, 12, NULL, 'Arreglo Cocina', 1, 'Creado', NULL),
(85, 'COD1234', 'Familia Perez', '2018-03-06', '2018-05-17', NULL, NULL, NULL, 12, NULL, 'Remodelación de Cocina y separación de habitaciones', 3, 'Creado', NULL),
(86, 'Prueba de cod', 'Familia Pru', '2018-05-17', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'Arreglo', 1, 'Creado', NULL),
(87, 'Prueba de cod', 'Familia Pru', '2018-05-17', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'Arreglo', 2, 'Creado', NULL),
(88, 'Prueba de cod', 'Familia Pru', '2018-05-17', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'Arreglo', 2, 'Creado', NULL),
(89, 'Prueba de cod', 'ddddd', '2018-05-17', '2018-05-17', NULL, NULL, NULL, 12, NULL, 'afafafafafafaf', 1, 'Creado', NULL),
(90, 'Prueba de cod', 'ddddd', '2018-05-17', '2018-05-17', NULL, NULL, NULL, 12, NULL, 'afafafafafafaf', 1, 'Creado', NULL),
(91, 'Prueba de cod', 'ddddd', '2018-05-17', '2018-05-17', NULL, NULL, NULL, 12, NULL, 'afafafafafafaf', 1, 'Creado', NULL),
(92, 'Prueba de cod', 'ddddd', '2018-05-17', '2018-05-17', NULL, NULL, NULL, 12, NULL, 'afafafafafafaf', 1, 'Creado', NULL),
(93, 'Prueba de cod', 'ddddd', '2018-05-17', '2018-05-17', NULL, NULL, NULL, 12, NULL, 'afafafafafafaf', 1, 'Creado', NULL),
(94, 'PrePru', '44434fadff', '2018-05-16', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'afdafafafafafaf', 1, 'Creado', NULL),
(95, 'PrePru', '44434fadff', '2018-05-16', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'afdafafafafafaf', 1, 'Creado', NULL),
(96, 'PrePru', '44434fadff', '2018-05-16', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'afdafafafafafaf', 1, 'Creado', NULL),
(97, 'PrePru', '44434fadff', '2018-05-16', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'afdafafafafafaf', 1, 'Creado', NULL),
(98, 'PrePru', '44434fadff', '2018-05-16', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'afdafafafafafaf', 1, 'Creado', NULL),
(99, 'PrePru', '44434fadff', '2018-05-16', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'afdafafafafafaf', 1, 'Creado', NULL),
(100, 'Prueba de cod', 'dsds', '2018-05-18', '2018-05-18', NULL, NULL, NULL, 32, NULL, 'fasdfasd', 1, 'Creado', NULL),
(101, 'COD123456', 'uiuiuiuiu', '2018-05-18', '2018-05-18', NULL, NULL, NULL, 12, NULL, 'jkjkjkjkjjk8989', 1, 'Creado', NULL),
(102, 'COD123456', 'iuiuiuiui', '2018-05-18', '2018-05-18', NULL, NULL, NULL, 23, NULL, 'jijijojojojoj23', 1, 'Creado', NULL),
(103, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(104, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(105, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(106, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(107, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(108, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(109, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(110, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(111, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(112, 'COD123456', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(113, 'COD11111', 'opopopo', '2018-05-18', '2018-09-25', NULL, NULL, NULL, 90, NULL, 'jlkjl8989', 1, 'Creado', NULL),
(114, 'Cod23433', 'totototootot', '2018-05-18', '2018-05-18', NULL, NULL, NULL, 56, NULL, 'afdasdfarreqwe35434', 1, 'Creado', NULL),
(115, '111111111', 'uiouiuooiu', '2018-05-18', '2018-05-18', NULL, NULL, NULL, 9, NULL, '7987uoiuoiu', 3, 'Creado', NULL),
(116, '11111111', 'uiouiuooiu', '2018-05-18', '2018-05-18', NULL, NULL, NULL, 9, NULL, '7987uoiuoiu', 3, 'Creado', NULL),
(117, '1010101', '9090\'9\'9\'9', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 12, NULL, 'jlkjfaslkdjfldkf', 3, 'Creado', NULL),
(118, '1', '9090\'9\'9\'9', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 12, NULL, 'jlkjfaslkdjfldkf', 3, 'Creado', NULL),
(119, '2', '9090\'9\'9\'9', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 12, NULL, 'jlkjfaslkdjfldkf', 3, 'Creado', NULL),
(120, '3', 'fadsfas', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 32, NULL, 'fafasdfasdf42134', 3, 'Creado', NULL),
(121, '4', 'fadsfas', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 32, NULL, 'fafasdfasdf42134', 3, 'Creado', NULL),
(122, '5', 'fadsfas', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 32, NULL, 'fafasdfasdf42134', 3, 'Creado', NULL),
(123, '12', 'fadsfas', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 32, NULL, 'fafasdfasdf42134', 3, 'Creado', NULL),
(124, '7', 'lkjlkj', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 89, NULL, 'jlkjlk|j3124123', 3, 'Creado', NULL),
(125, '8', 'lkjlkj', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 89, NULL, 'jlkjlk|j3124123', 3, 'Creado', NULL),
(126, '9', 'lkjlkj', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 89, NULL, 'jlkjlk|j3124123', 3, 'Creado', NULL),
(127, '10', 'lkjlkj', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 89, NULL, 'jlkjlk|j3124123', 3, 'Creado', NULL),
(128, '11', 'jlkjlk', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'kñlkñlkñlk', 3, 'Creado', NULL),
(129, '14', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(130, '15', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(131, '16', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(132, '17', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(133, '18', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(134, '19', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(135, '20', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(136, '21', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(137, '22', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(138, '23', '98098', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 78, NULL, 'jlkjlkj', 3, 'Creado', NULL),
(139, '24', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(140, '25', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(141, '26', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(142, '27', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(143, '28', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(144, '29', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(145, '30', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(146, '31', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(147, '32', 'oiuoiuoi', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(148, 'COD32', 'Familia prueba', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(149, 'COD33', 'Familia prueba', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(150, 'COD35', 'Familia prueba', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(151, 'COD36', 'Familia prueba', '2018-05-19', '2018-05-19', NULL, NULL, NULL, 9, NULL, 'fadfasdfas', 3, 'Creado', NULL),
(152, 'ASN1231', 'fasfas', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 43, NULL, 'fjasdfasd', 3, 'Creado', NULL),
(153, 'ASN123', 'fasfas', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 43, NULL, 'fjasdfasd', 3, 'Creado', NULL),
(154, 'ASN12', 'fasfas', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 43, NULL, 'fjasdfasd', 3, 'Creado', NULL),
(155, 'ASN1', 'fasfas', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 43, NULL, 'fjasdfasd', 3, 'Creado', NULL),
(156, 'ASN13', 'fasfas', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 43, NULL, 'fjasdfasd', 3, 'Creado', NULL),
(157, 'COD898', 'Familia Prueba', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 78, NULL, 'Arreglo de cocina', 1, 'Creado', NULL),
(158, 'COD101010', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-09-12', NULL, NULL, NULL, 12, NULL, 'Construcción de nueva vivienda para la familia Torres, residentes de la localidad Ciudad Bolivar.', 5, 'Creado', NULL),
(159, 'COD10101', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-09-12', NULL, NULL, NULL, 12, NULL, 'Construcción de nueva vivienda para la familia Torres, residentes de la localidad Ciudad Bolivar.', 5, 'Creado', NULL),
(160, 'COD1010', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-09-12', NULL, NULL, NULL, 12, NULL, 'Construcción de nueva vivienda para la familia Torres, residentes de la localidad Ciudad Bolivar.', 5, 'Creado', NULL),
(161, 'COD10102', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-09-12', NULL, NULL, NULL, 12, NULL, 'Construcción de nueva vivienda para la familia Torres, residentes de la localidad Ciudad Bolivar.', 5, 'Creado', NULL),
(162, 'COD10103', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 8, NULL, 'Construcción de vivienda. Residente de la localidad de Usme. Lote aportado por la constructora Danos', 3, 'Creado', NULL),
(163, 'COD10104', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 8, NULL, 'Construcción de vivienda. Residente de la localidad de Usme. Lote aportado por la constructora Danos', 3, 'Creado', NULL),
(164, 'COD10105', 'Vivienda Nueva Familia Torres', '2018-05-20', '2018-05-20', NULL, NULL, NULL, 8, NULL, 'Construcción de vivienda. Residente de la localidad de Usme. Lote aportado por la constructora Danos', 3, 'Creado', NULL),
(165, 'VIS676', 'Remodelación Famlia Perez', '2018-05-20', '2019-10-10', NULL, NULL, NULL, 15, NULL, 'Remodelación de Cocina puesto que presentan problemas de violencia familiar', 4, 'Creado', NULL),
(166, 'VIS677', 'Remodelación Famlia Perez', '2018-05-20', '2019-10-10', NULL, NULL, NULL, 15, NULL, 'Remodelación de Cocina puesto que presentan problemas de violencia familiar', 4, 'Creado', NULL),
(167, 'Codi84848', 'fasdfa', '2018-05-23', '2018-05-23', NULL, NULL, NULL, 1, NULL, 'hfasjkdh', 1, 'Creado', NULL),
(168, 'COD9898989898', 'fasf', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 5, NULL, 'Casa', 4, 'Creado', NULL),
(169, 'COD98989898988', 'fasf', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 5, NULL, 'Casa', 4, 'Creado', NULL),
(170, 'COD98989898', 'fasf', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 5, NULL, 'Casa', 4, 'Creado', NULL),
(171, 'COD9898989', 'fasf', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 5, NULL, 'Casa', 4, 'Creado', NULL),
(172, 'dggsgs', 'gsdfs', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 6, NULL, 'Casa', 4, 'Creado', NULL),
(173, 'yuyuyuyuyuy123', 'fsdfa', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 4, NULL, 'Casa', 3, 'Creado', NULL),
(174, 'yuyuyuyuyuy1234', 'fsdfa', '2018-05-26', '2018-05-31', 0, NULL, NULL, 4, NULL, 'Casa', 3, 'Creado', NULL),
(175, 'Cioioi', 'fasf', '2018-05-26', '2018-05-30', NULL, NULL, NULL, 3, NULL, 'safasfsa', 3, 'Creado', NULL),
(176, 'Cioioi1', 'fasf', '2018-05-26', '2018-05-30', 0, NULL, NULL, 3, NULL, 'safasfsa', 3, 'Creado', NULL),
(177, 'tytytyty', 'fasdf', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 32, NULL, 'Casa', 5, 'Creado', NULL),
(178, 'CODD', 'fasd', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 56, NULL, 'Casa', 3, 'Creado', NULL),
(179, 'CODD1', 'fasd', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 56, NULL, 'Casa', 3, 'Creado', NULL),
(180, 'CODD12', 'fasf', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 2, NULL, 'Casa', 3, 'Creado', NULL),
(181, 'CODO', 'safas', '2018-05-26', '2018-05-26', NULL, NULL, NULL, 2, NULL, 'Casa', 4, 'Creado', NULL),
(182, 'CODDD', 'fasdfsa', '2018-05-26', '2018-05-31', NULL, NULL, NULL, 3, NULL, 'Casa', 5, 'Creado', NULL),
(183, NULL, NULL, NULL, NULL, 90000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, NULL, NULL, NULL, NULL, 1113580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, NULL, NULL, NULL, NULL, 1113580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, NULL, NULL, NULL, NULL, 1113580, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, NULL, NULL, NULL, NULL, 90000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, NULL, NULL, NULL, NULL, 90000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, '8989oioi', 'hkjh', '2018-05-27', '2018-05-31', NULL, NULL, NULL, 8, NULL, 'CAlle i423', 4, 'Creado', NULL),
(190, 'ffsdf', 'fasdf', '2018-05-27', '2018-05-30', NULL, NULL, NULL, 34, NULL, 'ffds', 4, 'Creado', NULL),
(191, 'GOOGOG', 'fsdfa', '2018-05-21', '2018-05-30', NULL, NULL, NULL, 90, NULL, 'ffsafdds', 4, 'Creado', NULL),
(192, 'radioGAGA', 'fasdfasf', '2018-05-08', '2018-05-22', NULL, NULL, NULL, 56, NULL, 'fasdfa', 3, 'Creado', NULL),
(193, 'dADADada', 'lkñkl', '2018-05-27', '2018-05-28', NULL, NULL, NULL, 89, NULL, 'gjhgjhg', 3, 'Creado', NULL),
(194, 'jlkj', 'ljkjlkjlkj', '2018-05-27', '2018-05-30', NULL, NULL, NULL, 89, NULL, 'afsdfaf', 3, 'Creado', NULL),
(195, 'jlkj1234', 'ljkjlkjlkj', '2018-05-27', '2018-05-30', NULL, NULL, NULL, 89, NULL, 'afsdfaf', 3, 'Creado', NULL),
(196, 'jlkj12347', 'ljkjlkjlkj', '2018-05-27', '2018-05-30', NULL, NULL, NULL, 89, NULL, 'afsdfaf', 3, 'Creado', NULL),
(197, 'gogogogogo', 'khjkjhk', '2018-05-27', '2018-05-30', NULL, NULL, NULL, 45, NULL, 'asfdasdfa', 4, 'Creado', NULL),
(198, 'rtrtrtt', 'fsdfasf', '2018-05-22', '2018-05-30', NULL, NULL, NULL, 67, NULL, 'fasdfadsa', 3, 'Creado', NULL),
(199, NULL, NULL, NULL, NULL, 90000, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'luuiuuu', 'gsdfgs', '2018-05-23', '2018-05-26', NULL, NULL, NULL, 9, NULL, 'Casa casaa', 4, 'Creado', NULL),
(201, '5645634554', 'ghsdfhfg', '2018-05-02', '2018-05-17', NULL, NULL, NULL, 4, NULL, 'gdsfgsdf', 3, 'Creado', NULL),
(202, '5645554seses', 'ghsdfhfg', '2018-05-02', '2018-05-17', NULL, NULL, NULL, 4, NULL, 'gdsfgsdf', 3, 'Creado', NULL),
(203, '5645554sesesy', 'ghsdfhfg', '2018-05-02', '2018-05-17', NULL, NULL, NULL, 4, NULL, 'gdsfgsdf', 3, 'Creado', NULL),
(204, '5645554sesesyo', 'ghsdfhfg', '2018-05-02', '2018-05-17', NULL, NULL, NULL, 4, NULL, 'gdsfgsdf', 3, 'Creado', NULL),
(205, '5645554sesesp', 'ghsdfhfg', '2018-05-02', '2018-05-17', NULL, NULL, NULL, 4, NULL, 'gdsfgsdf', 3, 'Creado', NULL),
(206, 'ererer4343', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(207, 'ererr4343', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(208, 'ererr43431', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(209, 'errr43431', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(210, 'errr43432', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(211, 'err43432', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(212, 'err4432', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(213, 'err44321', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(214, 'err4431', 'dgsdfg', '2018-05-10', '2018-05-24', NULL, NULL, NULL, 45, NULL, 'fasdfasfas', 4, 'Creado', NULL),
(215, 'elele', 'sfasdfas', '2018-05-09', '2018-05-24', NULL, NULL, NULL, 23, NULL, 'fasdgadgsdf', 4, 'Creado', NULL),
(216, 'elele12', 'sfasdfas', '2018-05-09', '2018-05-24', NULL, NULL, NULL, 23, NULL, 'fasdgadgsdf', 4, 'Creado', NULL),
(217, 'OOS11223', 'sdgsdfg', '2018-05-02', '2018-05-17', NULL, NULL, NULL, 4, NULL, 'fsfasdf', 3, 'Creado', NULL),
(218, 'sadfasfff', 'fsadf', '2018-05-02', '2018-05-16', NULL, NULL, NULL, 4, NULL, 'asfafs', 1, 'Creado', NULL),
(219, 'asfas', 'afsasdf', '2018-05-16', '2018-05-17', NULL, NULL, NULL, 3, NULL, 'fasdfasdfasdf', 4, 'Creado', NULL),
(220, 'dasfas', 'fasdf', '2018-05-03', '2018-05-16', NULL, NULL, NULL, 3, NULL, 'fasdfas', 4, 'Creado', NULL),
(221, 'YOYOYOYOy', '4654654', '2018-05-27', '2018-05-29', NULL, NULL, NULL, 6, NULL, 'gsdgsdfgsdfgsd', 4, 'Creado', NULL),
(222, 'YOYOYOYOy1', '4654654', '2018-05-27', '2018-05-29', NULL, NULL, NULL, 6, NULL, 'gsdgsdfgsdfgsd', 4, 'Creado', NULL),
(223, 'YOYOYOYOy12', '4654654', '2018-05-27', '2018-05-29', NULL, NULL, NULL, 6, NULL, 'gsdgsdfgsdfgsd', 4, 'Creado', NULL),
(224, 'YOYOYOYOy13', '4654654', '2018-05-27', '2018-05-29', NULL, NULL, NULL, 6, NULL, 'gsdgsdfgsdfgsd', 4, 'Creado', NULL),
(225, 'YOYOYOYOy14', '4654654', '2018-05-27', '2018-05-29', NULL, NULL, NULL, 6, NULL, 'gsdgsdfgsdfgsd', 4, 'Creado', NULL),
(226, 'YOYOYOYOy143', '4654654', '2018-05-27', '2018-05-29', NULL, NULL, NULL, 6, NULL, 'gsdgsdfgsdfgsd', 4, 'Creado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyectos_usuarios`
--

DROP TABLE IF EXISTS `proyectos_usuarios`;
CREATE TABLE `proyectos_usuarios` (
  `id_Proyecto_Usuario` int(11) NOT NULL,
  `fk_Proyecto` int(11) DEFAULT NULL,
  `fk_Usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(45) DEFAULT NULL,
  `Detalle_Rol` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_Rol`, `Nombre_Rol`, `Detalle_Rol`) VALUES
(1, 'Adm Proyectos', NULL),
(2, 'Adm Costos', NULL),
(3, 'Adm Sistema', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seguimiento`
--

DROP TABLE IF EXISTS `seguimiento`;
CREATE TABLE `seguimiento` (
  `fk_Proyecto` int(11) DEFAULT NULL,
  `fk_Visita` int(11) DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipodocumentos`
--

DROP TABLE IF EXISTS `tipodocumentos`;
CREATE TABLE `tipodocumentos` (
  `id_TipoDocum` int(11) NOT NULL,
  `Tipo_Docum` varchar(10) DEFAULT NULL,
  `Descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipodocumentos`
--

INSERT INTO `tipodocumentos` (`id_TipoDocum`, `Tipo_Docum`, `Descripcion`) VALUES
(1, 'CC', 'Cedula de ciudadania');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id_Usuario` int(11) NOT NULL,
  `Nombre_Usuario` varchar(45) DEFAULT NULL,
  `Apellido_Usuario` varchar(45) DEFAULT NULL,
  `fk_TipoDocum` int(11) DEFAULT NULL,
  `Docum_Usuario` int(11) DEFAULT NULL,
  `Clave_Usuario` varchar(45) DEFAULT NULL,
  `Contac_Usuario` varchar(45) DEFAULT NULL,
  `Email_Usuario` varchar(45) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `fk_roles` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_Usuario`, `Nombre_Usuario`, `Apellido_Usuario`, `fk_TipoDocum`, `Docum_Usuario`, `Clave_Usuario`, `Contac_Usuario`, `Email_Usuario`, `Estado`, `fk_roles`) VALUES
(1, 'Cindy Julieth', 'Carlos', 1, 1, '1', '9898989', 'j@gmail.com', NULL, 1),
(2, 'Diego Alejandro', 'Leguizamón', 1, 2, '2', '6555656', 'd@gmail.com', NULL, 2),
(3, 'Jose Enrique', 'Casteblanco', 1, 3, '3', '5545555', 'je@gmail.com', NULL, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `visita`
--

DROP TABLE IF EXISTS `visita`;
CREATE TABLE `visita` (
  `id_Visita` int(11) NOT NULL,
  `visita_Numero` int(11) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `item_Uno` varchar(45) DEFAULT NULL,
  `detalle_Uno` varchar(45) DEFAULT NULL,
  `item_Dos` varchar(45) DEFAULT NULL,
  `detalle_Dos` varchar(45) DEFAULT NULL,
  `item_Tres` varchar(45) DEFAULT NULL,
  `detalle_Tres` varchar(45) DEFAULT NULL,
  `item_Cuatro` varchar(45) DEFAULT NULL,
  `detalle_Cuatro` varchar(45) DEFAULT NULL,
  `persona` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `visita`
--

INSERT INTO `visita` (`id_Visita`, `visita_Numero`, `fecha`, `item_Uno`, `detalle_Uno`, `item_Dos`, `detalle_Dos`, `item_Tres`, `detalle_Tres`, `item_Cuatro`, `detalle_Cuatro`, `persona`) VALUES
(1, NULL, NULL, '', '', '', '', '', '', '', '', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`id_Caso`),
  ADD KEY `fk_Usuario` (`fk_Usuario`);

--
-- Indices de la tabla `donaciones`
--
ALTER TABLE `donaciones`
  ADD PRIMARY KEY (`id_Donacion`),
  ADD KEY `fk_Proyecto` (`fk_Proyecto`),
  ADD KEY `fk_Donador` (`fk_Donador`);

--
-- Indices de la tabla `donador`
--
ALTER TABLE `donador`
  ADD PRIMARY KEY (`id_Donador`),
  ADD KEY `fk_TipoDocum` (`fk_TipoDocum`);

--
-- Indices de la tabla `familias`
--
ALTER TABLE `familias`
  ADD PRIMARY KEY (`id_Familia`),
  ADD KEY `fk_TipoDocum` (`fk_TipoDocum`),
  ADD KEY `fk_Problematica` (`fk_Problematica`);

--
-- Indices de la tabla `materiales`
--
ALTER TABLE `materiales`
  ADD PRIMARY KEY (`id_Material`);

--
-- Indices de la tabla `materiales_proyecto`
--
ALTER TABLE `materiales_proyecto`
  ADD PRIMARY KEY (`id_Material_Proyecto`),
  ADD KEY `fk_Material` (`fk_Material`),
  ADD KEY `fk_Proyecto` (`fk_Proyecto`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_Permiso`),
  ADD KEY `Permiso_padre` (`Permiso_padre`);

--
-- Indices de la tabla `permisosroles`
--
ALTER TABLE `permisosroles`
  ADD KEY `fk_Rol` (`fk_Rol`),
  ADD KEY `fk_Permiso` (`fk_Permiso`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id_Personal`),
  ADD KEY `fk_TipoDocum` (`fk_TipoDocum`),
  ADD KEY `fk_Proyecto` (`fk_Proyecto`);

--
-- Indices de la tabla `problematicas`
--
ALTER TABLE `problematicas`
  ADD PRIMARY KEY (`id_Problematica`);

--
-- Indices de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD PRIMARY KEY (`id_Proyecto`),
  ADD KEY `fk_Familia` (`fk_Familia`);

--
-- Indices de la tabla `proyectos_usuarios`
--
ALTER TABLE `proyectos_usuarios`
  ADD PRIMARY KEY (`id_Proyecto_Usuario`),
  ADD KEY `fk_Proyecto` (`fk_Proyecto`),
  ADD KEY `fk_Usuario` (`fk_Usuario`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_Rol`);

--
-- Indices de la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD KEY `fk_Proyecto` (`fk_Proyecto`),
  ADD KEY `fk_Visita` (`fk_Visita`);

--
-- Indices de la tabla `tipodocumentos`
--
ALTER TABLE `tipodocumentos`
  ADD PRIMARY KEY (`id_TipoDocum`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_Usuario`),
  ADD KEY `fk_TipoDocum` (`fk_TipoDocum`),
  ADD KEY `fk_roles` (`fk_roles`);

--
-- Indices de la tabla `visita`
--
ALTER TABLE `visita`
  ADD PRIMARY KEY (`id_Visita`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `casos`
--
ALTER TABLE `casos`
  MODIFY `id_Caso` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `donaciones`
--
ALTER TABLE `donaciones`
  MODIFY `id_Donacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `donador`
--
ALTER TABLE `donador`
  MODIFY `id_Donador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `familias`
--
ALTER TABLE `familias`
  MODIFY `id_Familia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `materiales`
--
ALTER TABLE `materiales`
  MODIFY `id_Material` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `materiales_proyecto`
--
ALTER TABLE `materiales_proyecto`
  MODIFY `id_Material_Proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=267;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id_Personal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `problematicas`
--
ALTER TABLE `problematicas`
  MODIFY `id_Problematica` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proyectos`
--
ALTER TABLE `proyectos`
  MODIFY `id_Proyecto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT de la tabla `proyectos_usuarios`
--
ALTER TABLE `proyectos_usuarios`
  MODIFY `id_Proyecto_Usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tipodocumentos`
--
ALTER TABLE `tipodocumentos`
  MODIFY `id_TipoDocum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `visita`
--
ALTER TABLE `visita`
  MODIFY `id_Visita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`fk_Usuario`) REFERENCES `usuarios` (`id_Usuario`);

--
-- Filtros para la tabla `donaciones`
--
ALTER TABLE `donaciones`
  ADD CONSTRAINT `donaciones_ibfk_1` FOREIGN KEY (`fk_Proyecto`) REFERENCES `proyectos` (`id_Proyecto`),
  ADD CONSTRAINT `donaciones_ibfk_2` FOREIGN KEY (`fk_Donador`) REFERENCES `donador` (`id_Donador`);

--
-- Filtros para la tabla `donador`
--
ALTER TABLE `donador`
  ADD CONSTRAINT `donador_ibfk_1` FOREIGN KEY (`fk_TipoDocum`) REFERENCES `tipodocumentos` (`id_TipoDocum`);

--
-- Filtros para la tabla `familias`
--
ALTER TABLE `familias`
  ADD CONSTRAINT `familias_ibfk_1` FOREIGN KEY (`fk_TipoDocum`) REFERENCES `tipodocumentos` (`id_TipoDocum`),
  ADD CONSTRAINT `familias_ibfk_2` FOREIGN KEY (`fk_Problematica`) REFERENCES `problematicas` (`id_Problematica`);

--
-- Filtros para la tabla `materiales_proyecto`
--
ALTER TABLE `materiales_proyecto`
  ADD CONSTRAINT `materiales_proyecto_ibfk_1` FOREIGN KEY (`fk_Material`) REFERENCES `materiales` (`id_Material`),
  ADD CONSTRAINT `materiales_proyecto_ibfk_2` FOREIGN KEY (`fk_Proyecto`) REFERENCES `proyectos` (`id_Proyecto`);

--
-- Filtros para la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD CONSTRAINT `permisos_ibfk_1` FOREIGN KEY (`Permiso_padre`) REFERENCES `permisos` (`id_Permiso`);

--
-- Filtros para la tabla `permisosroles`
--
ALTER TABLE `permisosroles`
  ADD CONSTRAINT `permisosroles_ibfk_1` FOREIGN KEY (`fk_Rol`) REFERENCES `roles` (`id_Rol`),
  ADD CONSTRAINT `permisosroles_ibfk_2` FOREIGN KEY (`fk_Permiso`) REFERENCES `permisos` (`id_Permiso`);

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`fk_TipoDocum`) REFERENCES `tipodocumentos` (`id_TipoDocum`),
  ADD CONSTRAINT `personal_ibfk_2` FOREIGN KEY (`fk_Proyecto`) REFERENCES `proyectos` (`id_Proyecto`);

--
-- Filtros para la tabla `proyectos`
--
ALTER TABLE `proyectos`
  ADD CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`fk_Familia`) REFERENCES `familias` (`id_Familia`);

--
-- Filtros para la tabla `proyectos_usuarios`
--
ALTER TABLE `proyectos_usuarios`
  ADD CONSTRAINT `proyectos_usuarios_ibfk_1` FOREIGN KEY (`fk_Proyecto`) REFERENCES `proyectos` (`id_Proyecto`),
  ADD CONSTRAINT `proyectos_usuarios_ibfk_2` FOREIGN KEY (`fk_Usuario`) REFERENCES `usuarios` (`id_Usuario`);

--
-- Filtros para la tabla `seguimiento`
--
ALTER TABLE `seguimiento`
  ADD CONSTRAINT `seguimiento_ibfk_1` FOREIGN KEY (`fk_Proyecto`) REFERENCES `proyectos` (`id_Proyecto`),
  ADD CONSTRAINT `seguimiento_ibfk_2` FOREIGN KEY (`fk_Visita`) REFERENCES `visita` (`id_Visita`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`fk_TipoDocum`) REFERENCES `tipodocumentos` (`id_TipoDocum`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`fk_roles`) REFERENCES `roles` (`id_Rol`);


--
-- Metadatos
--
USE `phpmyadmin`;

--
-- Metadatos para la tabla casos
--

--
-- Metadatos para la tabla donaciones
--

--
-- Metadatos para la tabla donador
--

--
-- Metadatos para la tabla familias
--

--
-- Metadatos para la tabla materiales
--

--
-- Metadatos para la tabla materiales_proyecto
--

--
-- Metadatos para la tabla permisos
--

--
-- Metadatos para la tabla permisosroles
--

--
-- Metadatos para la tabla personal
--

--
-- Metadatos para la tabla problematicas
--

--
-- Metadatos para la tabla proyectos
--

--
-- Metadatos para la tabla proyectos_usuarios
--

--
-- Metadatos para la tabla roles
--

--
-- Metadatos para la tabla seguimiento
--

--
-- Metadatos para la tabla tipodocumentos
--

--
-- Metadatos para la tabla usuarios
--

--
-- Metadatos para la tabla visita
--

--
-- Metadatos para la base de datos nuvi
--
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
