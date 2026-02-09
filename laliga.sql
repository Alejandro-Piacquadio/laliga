-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 01, 2025 at 05:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laliga`
--

-- --------------------------------------------------------

--
-- Table structure for table `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `estadio` varchar(70) DEFAULT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `poblacion` varchar(100) DEFAULT NULL,
  `presupuesto` decimal(6,2) DEFAULT NULL,
  `entrenador` varchar(100) DEFAULT NULL,
  `escudo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `estadio`, `capacidad`, `poblacion`, `presupuesto`, `entrenador`, `escudo`) VALUES
(1, 'Real Madrid', 'Santiago Bernabéu', 84, 'Madrid', 1248.00, 'Xabi Alonso', 'RealMadrid.png'),
(2, 'Barcelona', 'Camp Nou', 105, 'Barcelona', 1075.00, 'Hansi Flick', 'Barcelona.png'),
(3, 'Villarreal', 'La Cerámica', 24, 'Castellón', 143.37, 'Marcelino García\r\n', 'Villarreal.png'),
(4, 'Atlético de Madrid', 'Riyadh Air Metropolitano', 70, 'Madrid', 459.00, 'Diego Simeone', 'AtleticodeMadrid.png'),
(5, 'Real Betis', 'Benito Villamarín', 61, 'Sevilla', 185.00, 'Manuel Pellegrini', 'RealBetis.png'),
(6, 'RCD Espanyol', 'RCDE Stadium', 37, 'Barcelona', 83.00, 'Manolo González', 'RCDEspanyol.png'),
(7, 'Getafe', 'Colisuem', 17, 'Getafe', 216.00, 'José Bordalás', 'Getafe.png'),
(8, 'Deportivo Alavés', 'Estadio de Mendizorroza', 20, 'Huesca', 77.30, 'Eduardo Coudet', 'DeportivoAlaves.png'),
(9, 'Elche', 'Estadio Manuel Martínez Valero', 31, 'Elche', 50.00, 'Eder Sarabia', 'Elche.png'),
(10, 'Rayo Vallecano', 'Estadio de Vallecas', 15, 'Madrid', 50.00, 'Iñigo Pérez', 'RayoVallecano.png'),
(11, 'Atletic Club', 'San Mamés', 53, 'Bilbao', 186.00, 'Ernesto Valverde', 'AtleticClub.png'),
(12, 'Celta de Vigo', 'Abanca Balaídos', 25, 'Vigo', 124.60, 'Claudio Giráldez', 'CeltadeVigo.png'),
(13, 'Sevilla', 'Ramón Sánchez-Pizjuán', 44, 'Sevilla', 120.90, 'Matías Almeyda', 'Sevilla.png'),
(14, 'Real Sociedad', 'Anoeta', 40, 'San Sebastián', 148.00, 'Sergio Francisco Ramos', 'RealSociedad.png'),
(15, 'Osasuna', 'EL SADAR', 24, 'Pamplona', 87.00, 'Alessio Lisci', 'Osasuna.png'),
(16, 'Levante', 'Estadio Ciudad de Valencia', 25, 'Valencia', 80.00, 'Julián Calero', 'Levante.png'),
(17, 'RCD Mallorca', 'Son Moix', 26, 'Mallorca', 64.00, 'Jagoba Arrasate', 'RCDMallorca.png'),
(18, 'Valencia', 'Mestalla', 50, 'Valencia', 99.00, 'Carlos Corberán', 'Valencia.png'),
(19, 'Real Oviedo', 'Carlos Tartiere', 30, 'Oviedo', 80.00, 'Luis Carrión', 'RealOviedo.png'),
(20, 'Girona', 'Montilivi', 14, 'Girona', 113.00, 'Miguel Ángel Sánchez', 'Girona.png');

-- --------------------------------------------------------

--
-- Table structure for table `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `goles` int(11) DEFAULT NULL,
  `salario` decimal(3,1) DEFAULT NULL,
  `posicion` varchar(50) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `equipo_id`, `goles`, `salario`, `posicion`, `nacionalidad`, `edad`, `imagen`) VALUES
(2, 'Ante Budimir', 15, 0, 1.5, 'Delantero', 'Croacia', 34, 'ante_budimir.jpeg'),
(3, 'Aimar Oroz', 15, 0, 0.5, 'Medio', 'España', 23, 'aimar_oroz.jpg'),
(4, 'Victor Muñoz', 15, 0, 1.0, 'Delantero', 'España', 22, 'victor_muñoz.jpg'),
(5, 'Jon Moncayola', 15, 0, 0.6, 'Medio', 'España', 27, 'unknow.webp'),
(6, 'Lucas Torró', 15, 0, 1.0, 'Medio', 'España', 31, 'lucas_torro.jpg'),
(7, 'Abel Bretones', 15, 0, 0.3, 'Defensa', 'España', 25, 'unknow.webp'),
(8, 'Valentin Rosier', 15, 0, 1.7, 'Defensa', 'Francia', 29, 'unknow.webp'),
(9, 'Juan Cruz', 15, 0, 0.4, 'Defensa', 'España', 33, 'juan_cruz.jpeg'),
(10, 'Alejandro Catena', 15, 0, 1.0, 'Defensa', 'España', 30, 'unknow.webp'),
(11, 'Flavien Boyomo', 15, 0, 20.0, 'Defensa', 'Camerún', 23, 'unknow.webp'),
(12, 'Sergio Herrera', 15, 0, 0.5, 'Portero', 'España', 32, 'sergio_herrero.jpeg'),
(13, 'kylian mbappe', 1, 0, 32.0, 'delantero', 'Francia ', 26, ''),
(14, 'vinicius junior', 1, 0, 20.0, 'delantero', 'Brasil', 25, ''),
(15, 'rodrygo', 1, 0, 12.0, 'delantero', 'Brasil', 24, ''),
(16, 'endrick', 1, 0, 4.0, 'delantero', 'Brasil', 19, ''),
(17, 'jude bellingham', 1, 0, 20.0, 'centrocampista', 'Inglaterra ', 22, ''),
(18, 'federico valverde', 1, 0, 16.0, 'centrocampista', 'Uruguay ', 27, ''),
(19, 'aurelien tchouameni', 1, 0, 12.0, 'centrocampista', 'Francia ', 25, ''),
(20, 'eduardo camavinga', 1, 0, 12.0, 'centrocampista', 'Francia ', 22, ''),
(21, 'dani ceballos', 1, 0, 10.0, 'centrocampista', 'España ', 29, ''),
(22, 'franco mastantuono', 1, 0, 4.0, 'centrocampista', 'Argentina', 18, ''),
(23, 'brahim diaz', 1, 0, 7.0, 'centrocampista', 'España ', 26, ''),
(24, 'arda guler', 1, 0, 5.0, 'centrocampista', 'Turquia', 20, ''),
(25, 'david alaba', 1, 0, 22.0, 'defensa', 'Austria ', 33, ''),
(26, 'antonio rudiger', 1, 0, 14.0, 'defensa', 'Alemania ', 32, ''),
(27, 'eder militao', 1, 0, 14.0, 'defensa', 'Brasil ', 27, ''),
(28, 'ferland mendy', 1, 0, 10.0, 'defensa', 'Francia ', 30, ''),
(29, 'dani carvajal', 1, 0, 10.0, 'defensa', 'España ', 31, ''),
(30, 'fran garcia', 1, 0, 5.0, 'defensa', 'España ', 26, ''),
(31, 'thibaut courtois', 1, 0, 15.0, 'portero', 'Belgica ', 33, ''),
(32, 'andriy lunin', 1, 0, 4.0, 'portero', 'Ucrania ', 26, ''),
(33, 'Javi Puado', 6, 0, 0.8, 'Delantero', 'España', 27, ''),
(34, 'Tyrhys Dolan', 6, 0, 0.3, 'Delantero', 'Reino Unido', 23, ''),
(35, 'Roberto Fernández', 6, 0, 1.3, 'Delantero', 'España', 23, ''),
(36, 'Pere Milla', 6, 0, 0.5, 'Centrocampista', 'España', 32, ''),
(37, 'Marko Dmitrović', 6, 0, 1.2, 'Portero', 'Serbia', 33, ''),
(38, 'Charles Pickel', 6, 0, 1.5, 'Centrocampista', 'Rep.Congo', 28, ''),
(39, 'Eduardo Expósito', 6, 0, 1.2, 'Centrocampista', 'España', 29, ''),
(40, 'Ramón Terrats', 6, 0, 0.6, 'Centrocampista', 'España', 24, ''),
(41, 'Omar El Hilali', 6, 0, 1.0, 'Defensa', 'Marruecos', 22, ''),
(42, 'Fernando Calero', 6, 0, 0.5, 'Defensa', 'España', 30, ''),
(43, 'Clemens Riedel', 6, 0, 0.8, 'Defensa', 'Alemania', 22, ''),
(44, 'Urko González', 6, 0, 0.4, 'Centrocampista', 'España', 24, ''),
(45, 'Kike García', 6, 0, 1.3, 'Delantero', 'España', 35, ''),
(46, 'Carlos Romero', 6, 0, 0.9, 'Defensa', 'España', 23, ''),
(47, 'Rubén Sánchez', 6, 0, 0.7, 'Defensa', 'España', 24, ''),
(48, 'Miguel Ángel', 6, 0, 1.0, 'Defensa', 'España', 27, ''),
(49, 'Luca Koleosho', 6, 0, 1.0, 'Delantero', 'España', 21, ''),
(50, 'Leandro Cabrera', 6, 0, 1.0, 'Defensa', 'Uruguay', 34, ''),
(51, 'Angel Fortuno', 6, 0, 0.2, 'Portero', 'España', 23, ''),
(52, 'José Salinas', 6, 0, 0.8, 'Defensa', 'España', 24, ''),
(53, 'Antoniu Roca', 6, 0, 0.7, 'Delantero', 'España', 23, ''),
(54, 'Francisco Javier', 6, 0, 0.2, 'Centrocampista', 'España', 21, ''),
(55, 'Pol Lozano', 6, 0, 1.1, 'Centrocampista', 'España', 25, ''),
(56, 'Jofre Carreras', 6, 0, 1.0, 'Delantero', 'España', 24, ''),
(57, 'Pol Tristan', 6, 0, 0.1, 'Portero', 'España', 23, ''),
(58, 'Juan Camilo Hernández Suárez', 5, 0, 9.0, 'Delantero', 'Colombia', 26, ''),
(59, 'Abdessamad Ezzalzouli', 5, 0, 3.0, 'Delantero', 'Marruecos', 23, ''),
(60, 'Antony Matheus dos Santos ', 5, 0, 9.0, 'Delantero', 'Brasil', 25, ''),
(61, 'Giovani Lo Celso', 5, 0, 4.0, 'Mediocentro', 'Argentina', 29, ''),
(62, 'Sofyan Amrabat', 5, 0, 5.0, 'Mediocentro', 'Marruecos', 29, ''),
(63, 'Pablo Fornals Malla', 5, 0, 3.0, 'Defensa', 'España', 29, ''),
(64, 'Héctor Junior Firpo Adamés', 5, 0, 4.0, 'Defensa', 'República Dominicana', 29, ''),
(65, 'Natan Bernardo de Souza', 5, 0, 2.0, 'Defensa izquierdo', 'Brasil', 24, ''),
(66, 'Marc Bartra Aregall', 5, 0, 2.0, 'Defensa central', 'España', 34, ''),
(67, 'Héctor Bellerín Morouno', 5, 0, 3.0, 'Lateral derecho', 'España', 30, ''),
(68, 'Pau López Sabata', 5, 0, 3.0, 'Portero', 'España', 30, ''),
(69, 'Leander Dendoncker', 19, 0, 3.1, 'Centrocampista', 'Belgica ', 30, ''),
(70, 'Josip Brekalo', 19, 0, 2.7, 'Delantero', 'Croacia', 27, ''),
(71, 'David Carmo', 19, 0, 2.5, 'Defensa', 'Angola', 26, ''),
(72, 'Eric Bailly', 19, 0, 1.9, 'Defensa', 'Costa de Marfil', 31, ''),
(73, 'Santiago Colombatto', 19, 0, 1.3, 'Centrocampista', 'Argentina', 28, ''),
(74, 'Federico Viñas', 19, 0, 1.0, 'Delantero', 'Uruguay', 27, ''),
(75, 'Alberto Reina', 19, 0, 1.0, 'Centrocampista', 'España', 27, ''),
(76, 'Aarón Escandell', 19, 0, 1.0, 'Portero', 'España', 29, ''),
(77, 'Nacho Vidal', 19, 0, 1.0, 'Defensa', 'España', 30, ''),
(78, 'David Costas', 19, 0, 1.0, 'Defensa', 'España', 30, ''),
(79, 'Dani Calvo', 19, 0, 1.0, 'Defensa', 'España', 31, ''),
(80, 'Haissem Hassan', 19, 0, 0.8, 'Delantero', 'España', 23, ''),
(81, 'Oier Luengo', 19, 0, 0.8, 'Defensa', 'España', 27, ''),
(82, 'Santi Cazorla', 19, 0, 0.2, 'Centrocampista', 'España', 40, ''),
(83, 'Nico Williams', 11, 0, 16.0, 'Extremo Izquierdo', 'España', 23, ''),
(84, 'Iñaki Williams', 11, 0, 11.0, 'Extreo Derecho', 'Ghana', 31, ''),
(85, 'Oihan Sancet', 11, 0, 2.0, 'Mediocentro Ofensivo', 'España', 25, ''),
(86, 'Gorka Guruzeta', 11, 0, 2.0, 'Delantero Centro', 'España', 28, ''),
(87, 'Álex Berenguer', 11, 0, 2.0, 'Extremo Izquierdo', 'España', 30, ''),
(88, 'Robert Navarro', 11, 0, 2.0, 'Extremo Derecho', 'España', 23, ''),
(89, 'Maroan Sannadi', 11, 0, 1.0, 'Delantero Centro', 'España', 24, ''),
(90, 'Dani Vivian', 11, 0, 3.0, 'Defensa Central', 'España', 26, ''),
(91, 'Aitor Paredes', 11, 0, 2.0, 'Defensa Central', 'España', 25, ''),
(92, 'Yeray Álvarez', 11, 0, 2.0, 'Defensa Central', 'España', 30, ''),
(93, 'Yuri Berchiche', 11, 0, 4.0, 'Lateral Izquierdo', 'España', 35, ''),
(94, 'Jesús Areso', 11, 0, 2.0, 'Lateral Derecho', 'España', 26, ''),
(95, 'Andoni Gorosabel', 11, 0, 2.0, 'Lateral Derecho', 'España', 29, ''),
(96, 'Mikel Vesga', 11, 0, 2.0, 'Mediocentro Defensivo', 'España', 32, ''),
(97, 'Beñat Prados', 11, 0, 1.0, 'Mediocentro', 'España', 24, ''),
(98, 'Iñigo Ruiz', 11, 0, 2.0, 'Mediocentro', 'España', 32, ''),
(99, 'Unai Gómez', 11, 0, 1.0, 'Mediocentro Ofensivo', 'España', 22, ''),
(100, 'Unai Simón', 11, 0, 4.0, 'Portero', 'España', 28, ''),
(101, 'Álex Padilla', 11, 0, 0.6, 'Portero', 'España', 22, ''),
(102, 'Unai Egiluz', 11, 0, 0.6, 'Defensa Central', 'España', 23, ''),
(103, 'Marc-Andre Ter Stegen', 2, 0, 6.3, 'Portero', 'Alemania', 33, ''),
(104, 'Alejandro Balde', 2, 0, 1.6, 'Defensa', 'España', 21, ''),
(105, 'Ronald Araujo', 2, 0, 10.0, 'Defensa', 'Uruguay', 25, ''),
(106, 'Pau Cubarsi', 2, 0, 4.7, 'Defensa ', 'España', 23, ''),
(107, 'Andreas Christensen', 2, 0, 9.0, 'Defensa', 'Dinamarca', 29, ''),
(108, 'Gerard Martin', 2, 0, 0.2, 'Centrocampista', 'España', 20, ''),
(109, 'Jules Kounde', 2, 0, 5.4, 'Defensa', 'Francia', 25, ''),
(110, 'Eric Garcia', 2, 0, 6.0, 'Defensa', 'España', 24, ''),
(111, 'Gavi', 2, 0, 9.3, 'Centrocampista', 'España', 20, ''),
(112, 'Pedri', 2, 0, 12.5, 'Centrocampista', 'España', 22, ''),
(113, 'Fermin Lopez', 2, 0, 4.0, 'Centrocampista', 'España', 20, ''),
(114, 'Marc Casado', 2, 0, 0.4, 'Centrocampista', 'España', 19, ''),
(115, 'Dani Olmo', 2, 0, 9.3, 'Centrocampista', 'España', 25, ''),
(116, 'Frenkie De Jong', 2, 0, 19.0, 'Centrocampista', 'Holanda', 26, ''),
(117, 'Marc Bernal', 2, 0, 0.3, 'Defensa', 'España', 18, ''),
(118, 'Ferran Torres', 2, 0, 10.0, 'Delantero', 'España', 23, ''),
(119, 'Robert Lewandowski', 2, 0, 33.3, 'Delantero', 'Polonia', 36, ''),
(120, 'Lamine Yamal', 2, 0, 15.0, 'Delantero', 'España', 16, ''),
(121, 'Raphina', 2, 0, 12.5, 'Delantero', 'Brasil', 27, ''),
(122, 'Marcus Rashford', 2, 0, 15.6, 'Delantero', 'Inglaterra ', 26, ''),
(123, 'Gerard Moreno', 3, 0, 4.0, 'Delantero central', 'España', 33, ''),
(124, 'Dani Parejo', 3, 0, 3.0, 'Mediocentro', 'España', 36, ''),
(125, 'Nicolás Pépé', 3, 0, 3.0, 'Extremo derecho', 'Costa de Marfil', 30, ''),
(126, 'Pau Navarro', 3, 0, 1.0, 'Defensa central', 'España', 20, ''),
(127, 'Alfonso Pedraza', 3, 0, 2.0, 'Lateral izquierdo', 'España', 29, ''),
(128, 'Ayoze Pérez', 3, 0, 2.0, 'Extremo / segundo', 'España', 31, ''),
(129, 'Juan Foyth', 3, 0, 2.0, 'Lateral derecho', 'Argentina', 27, ''),
(130, 'Pape Gueye', 3, 0, 2.0, 'Mediocentro defensivo', 'Senegal', 26, ''),
(131, 'Logan Costa', 3, 0, 2.0, 'Defensa central', 'Cabo Verde', 24, ''),
(132, 'Luiz Júnior', 3, 0, 1.0, 'Portero', 'Brasil', 23, ''),
(133, 'Trevor Buchanan', 3, 0, 2.0, 'Lateral derecho', 'Canada', 26, ''),
(134, 'Byran Zaragoza', 12, 0, 4.0, 'delantero', 'España', 24, ''),
(135, 'Iago Aspas', 12, 0, 3.0, 'delantero', 'España', 38, ''),
(136, 'Borja Iglesias', 12, 0, 2.0, 'delantero', 'España', 32, ''),
(137, 'Ferran Jutglà', 12, 0, 2.0, 'delantero', 'España', 26, ''),
(138, 'Ilaix Moriba', 12, 0, 2.0, 'mediocampista', 'Guinea', 22, ''),
(139, 'Carl Starfelt', 12, 0, 2.0, 'defensa', 'Suecia', 30, ''),
(140, 'Franco Cervi', 12, 0, 1.0, 'mediocampista', 'Argentina', 31, ''),
(141, 'Fran Beltrán', 12, 0, 1.0, 'mediocampista', 'España', 26, ''),
(142, 'Williot Swedberg', 12, 0, 1.0, 'mediocampista', 'Suecia', 21, ''),
(143, 'Hugo Sotelo', 12, 0, 1.0, 'mediocampista', 'España', 21, ''),
(144, 'Óscar Mingueza', 12, 0, 1.0, 'defensa', 'España', 26, ''),
(145, 'Joseph Aidoo', 12, 0, 1.0, 'defensa', 'Ghana', 29, ''),
(146, 'Marcos Alonso', 12, 0, 1.0, 'defensa', 'España', 34, ''),
(147, 'Mihailo Ristic', 12, 0, 1.0, 'defensa', 'Serbia', 29, ''),
(148, 'Sergio Carreira', 12, 0, 1.0, 'defensa', 'España', 24, ''),
(149, 'Carlos Domínguez', 12, 0, 1.0, 'defensa', 'España', 24, ''),
(150, 'Javi Rodríguez', 12, 0, 1.0, 'defensa', 'España', 22, ''),
(151, 'Iván Villar', 12, 0, 1.0, 'portero', 'España', 28, ''),
(152, 'Andrei Radu', 12, 0, 1.0, 'portero', 'Rumania', 28, ''),
(153, 'Pablo Durán', 12, 0, 1.0, 'delantero', 'España', 24, ''),
(154, 'JUAN AGUSTíN MUSSO', 4, 0, 4.0, 'Portero', 'Argentina', 31, ''),
(155, 'JAN OBLAK', 4, 0, 13.0, 'Portero', 'Eslovenia', 32, ''),
(156, 'JOSé MARíA GIMéNEZ DE VARGAS', 4, 0, 5.0, 'Defensa', 'Uruguay', 30, ''),
(157, 'MATTEO RUGGERI', 4, 0, 2.0, 'Defensa', 'Italia', 23, ''),
(158, 'CLéMENT NICOLAS LAURENT LENGLET', 4, 0, 4.0, 'Defensa', 'Francia', 30, ''),
(159, 'NAHUEL MOLINA LUCERO', 4, 0, 1.0, 'Defensa', 'Argentina', 27, ''),
(160, 'DáVID HANCKO', 4, 0, 2.0, 'Defensa', 'Eslovaquia', 27, ''),
(161, 'MARC PUBILL PAGéS', 4, 0, 0.4, 'Defensa', 'España', 22, ''),
(162, 'CONOR GALLAGHER', 4, 0, 0.5, 'centrocampista', 'Inglaterra ', 25, ''),
(163, 'JOãO LUCAS de souz', 4, 0, 0.9, 'centrocampista', 'Italia', 24, ''),
(164, 'Thiago Ezequiel Almada', 4, 0, 2.0, 'delantero ', 'Argentina ', 24, ''),
(165, 'Juan carlos', 20, 0, 0.4, 'portero', 'España', 37, ''),
(166, 'victor reis', 20, 0, 0.1, 'defensa', 'Brasil', 19, ''),
(167, 'alejandro Frances', 20, 0, 3.0, 'defensa', 'España', 23, ''),
(168, 'Paulo Gazzaniga', 20, 0, 1.2, 'portero', 'Argentina', 33, ''),
(169, 'Iván Martín', 20, 0, 1.7, 'centrocampista', 'España', 26, ''),
(170, 'Jhon Solís', 20, 0, 0.2, 'centrocampista', 'Colombia', 20, ''),
(171, 'David López', 20, 0, 3.8, 'defensa', 'España', 36, ''),
(172, 'Daley Blind', 20, 0, 1.8, 'defensa', 'Países Bajos', 35, ''),
(173, 'Arnau Martínez ', 20, 0, 1.2, 'defensa', 'España', 22, ''),
(174, 'Cristhian Stuani', 20, 0, 1.1, 'delantero', 'Uruguay', 38, ''),
(175, 'Viktor Tsygankov', 20, 0, 1.4, 'delantero', 'Ucrania', 27, ''),
(176, 'cristian Portu', 20, 0, 1.8, 'delantero', 'España', 33, ''),
(177, 'Joel Roca ', 20, 0, 0.3, 'delantero ', 'España', 20, ''),
(178, 'Eric García', 20, 0, 0.3, 'defensa', 'España', 24, ''),
(179, 'Miguel Gutiérrez', 20, 0, 0.3, 'defensa', 'España', 24, ''),
(180, 'Yan Couto', 20, 0, 0.2, 'defensa', 'Brasil', 23, ''),
(181, 'Aleix García', 20, 0, 0.1, 'centrocampista', 'España', 28, ''),
(182, 'Yangel Herrera', 20, 0, 0.2, 'centrocampista', 'Venezuela', 27, ''),
(183, 'Borja García', 20, 0, 0.4, 'centrocampista', 'España', 34, ''),
(184, 'Ibrahima Kébé', 20, 0, 0.3, 'centrocampista', 'Mali', 25, ''),
(185, 'Javier Guerra', 18, 0, 0.4, 'Centrocampista', 'España', 22, ''),
(186, 'Jose Luis Garcia', 18, 0, 1.3, 'Centrocampista', 'España', 27, ''),
(187, 'Julen Agirrezabala', 18, 0, 0.4, 'Guardameta', 'España', 24, ''),
(188, 'Arnaut Danjuma', 18, 0, 3.5, 'Delantero', 'Nigeria', 28, ''),
(189, 'Dani Raba', 18, 0, 0.4, 'Delantero', 'España', 29, ''),
(190, 'Jose Manuel Arias', 18, 0, 0.2, 'Defensa', 'España', 25, ''),
(191, 'Hugo Duro', 18, 0, 2.8, 'Delantero', 'España', 25, ''),
(192, 'Filip Ugrinic', 18, 0, 0.0, 'Centrocampista', 'Suiza', 26, ''),
(193, 'Andre Almeida', 18, 0, 0.6, 'centrocampista', 'Portugal', 25, ''),
(194, 'Jose Luis Gaya', 18, 0, 5.8, 'Defensa', 'España', 30, ''),
(195, 'Baptiste Santamaria', 18, 0, 2.0, 'centrocampista', 'Francia', 30, ''),
(196, 'Vedat muriqi', 17, 0, 0.0, 'Delantero', 'Kosovo', 31, ''),
(197, 'Leo Román', 17, 0, 0.0, 'Portero', 'España', 25, ''),
(198, 'Pablo Torre', 17, 0, 0.0, 'Centrocampista', 'España', 22, ''),
(199, 'Dani Rodriguéz', 17, 0, 0.0, 'Centrocampista', 'España', 37, ''),
(200, 'Pablo Maffeo', 17, 0, 0.0, 'Defensa', 'Argentina', 28, ''),
(201, 'Takuma Asano', 17, 0, 0.0, 'Delantero', 'Japón', 30, ''),
(202, 'Johan Mojica', 17, 0, 0.0, 'Defensa', 'Colombia', 33, ''),
(203, 'Samuel Costa', 17, 0, 0.0, 'Centrocampista', 'Portugal', 24, ''),
(204, 'Antonio Raíllo', 17, 0, 0.0, 'Defensa', 'España', 33, ''),
(205, 'Martin Valjent', 17, 0, 0.0, 'Defensa', 'Eslovaquia', 29, ''),
(206, 'Mateo Joseph', 17, 0, 0.0, 'Delantero', 'España', 21, ''),
(207, 'Etta Yong', 16, 0, 5.0, 'delantero', 'Camerún', 21, ''),
(208, 'Iván Romero', 16, 0, 10.0, 'delantero', 'España', 24, ''),
(209, 'Carlos Álvarez', 16, 0, 7.3, 'centrocampista', 'España', 22, ''),
(210, 'Jon Ander', 16, 0, 3.7, 'centrocampista', 'España', 25, ''),
(211, 'Pablo Martínez', 16, 0, 9.0, 'centrocampista', 'España', 27, ''),
(212, 'Oriol Rey', 16, 0, 3.1, 'centrocampista', 'España', 27, ''),
(213, 'Manu Sánchez', 16, 0, 2.0, 'defensor', 'España', 25, ''),
(214, 'Matías Moreno', 16, 0, 11.0, 'defensor', 'España', 24, ''),
(215, 'Unai Elgezabal', 16, 0, 8.0, 'defensor', 'España', 26, ''),
(216, 'Jeremy Toljan', 16, 0, 1.8, 'defensor', 'España', 22, ''),
(217, 'Mathew Ryan', 16, 0, 6.0, 'portero', 'Australia', 28, ''),
(218, 'M. Dituro', 9, 0, 0.6, 'portero', 'Argentina', 38, ''),
(219, 'Adrià Pedrosa', 9, 0, 1.1, 'defensa', 'España', 27, ''),
(220, 'Bambo Diaby', 9, 0, 0.8, 'defensa', 'España', 27, ''),
(221, 'Bigas', 9, 0, 0.9, 'defensa', 'España', 35, ''),
(222, 'Álvaro Nuñez', 9, 0, 0.3, 'defensa', 'España', 25, ''),
(223, 'John', 9, 0, 0.5, 'defensa', 'España', 24, ''),
(224, 'L.Petrot', 9, 0, 0.4, 'defensa', 'Francia', 28, ''),
(225, 'F.Redondo', 9, 0, 4.5, 'centrocampista', 'España', 22, ''),
(226, 'Y.Santiago', 9, 0, 0.2, 'centrocampista', 'España', 22, ''),
(227, 'M. Agudo', 9, 0, 0.4, 'centrocampista', 'España', 25, ''),
(228, 'Germán V.', 9, 0, 0.6, 'centrocampista', 'España', 23, ''),
(229, 'A.Febas', 9, 0, 0.9, 'centrocampista', 'España', 29, ''),
(230, 'M. Neto', 9, 0, 2.0, 'centrocampista', 'Portugal', 22, ''),
(231, 'André de Silva', 9, 0, 4.1, 'delantero', 'Portugal', 29, ''),
(232, 'Rafa Mir', 9, 0, 1.9, 'delantero', 'España', 28, ''),
(233, 'Álvaro R.', 9, 0, 1.2, 'delantero', 'Uruguay', 21, ''),
(234, 'R. Mendoza', 9, 0, 0.2, 'centrocampista', 'España', 20, ''),
(235, 'Grady Diangana', 9, 0, 1.4, 'delantero', 'Congo', 27, ''),
(236, 'Héctor Fort', 9, 0, 0.9, 'defensa', 'España', 19, ''),
(237, 'V. Chust', 9, 0, 0.7, 'defensa', 'España', 25, ''),
(238, 'Letacek', 7, 0, 0.6, 'Portero', 'República Checa', 26, ''),
(239, 'Djene', 7, 0, 1.8, 'Defensa', 'Togo', 33, ''),
(240, 'Abdel abkar', 7, 0, 2.5, 'Defensa', 'Marruecos', 26, ''),
(241, 'Neyou', 7, 0, 2.0, 'Centrocampista', 'Camerun', 28, ''),
(242, 'L.milla', 7, 0, 1.5, 'Centrocampista', 'España', 30, ''),
(243, 'Mario martin', 7, 0, 0.5, 'Centrocampista', 'España', 21, ''),
(244, 'Juanmi', 7, 0, 2.5, 'Delantero', 'España', 32, ''),
(245, 'Arambarri', 7, 0, 3.7, 'Centrocampista', 'Argentina', 29, ''),
(246, 'B. mayoral', 7, 0, 4.8, 'Delantero', 'España', 28, ''),
(247, 'Kamara', 7, 0, 0.5, 'Delantero', 'España', 22, ''),
(248, 'David soria', 7, 0, 2.5, 'Portero', 'España', 32, ''),
(249, 'Javi muñoz', 7, 0, 1.7, 'Centrocampista', 'España', 30, ''),
(250, 'Rico', 7, 0, 2.0, 'Defensa', 'España', 32, ''),
(251, 'Kiko F', 7, 0, 1.2, 'Defensa', 'España', 34, ''),
(252, 'Alex', 7, 0, 1.0, 'Delantero', 'España', 28, ''),
(253, 'C. da costa', 7, 0, 0.8, 'Delantero', 'Guinea', 23, ''),
(254, 'Iglesias', 7, 0, 0.8, 'Defensa', 'España', 27, ''),
(255, 'Domingos D.', 7, 0, 1.3, 'Defensa', 'Portugal', 30, ''),
(256, 'Liso', 7, 0, 0.3, 'Delantero', 'España', 20, ''),
(257, 'Davinchi', 7, 0, 0.3, 'Defensa', 'España', 17, ''),
(258, 'Antonio Sivera', 8, 0, 1.6, 'Portero', 'España', 29, ''),
(259, 'Raúl Fernández', 8, 0, 0.6, 'Portero', 'España', 37, ''),
(260, 'Facundo Garces', 8, 0, 0.9, 'Defensa', 'Argentina', 26, ''),
(261, 'Youssef Enriquez', 8, 0, 0.4, 'Defensa', 'Marruecos', 19, ''),
(262, 'Jon Pacheco', 8, 0, 1.0, 'Defensa', 'España', 24, ''),
(263, 'Nikola Maras', 8, 0, 0.8, 'Defensa', 'Serbia', 29, ''),
(264, 'Nahuel Tenaglia', 8, 0, 0.9, 'Defensa', 'Argentina', 29, ''),
(265, 'Jonny Otto', 8, 0, 1.7, 'Defensa', 'España', 31, ''),
(266, 'Moussa Diarra', 8, 0, 0.8, 'Defensa', 'Malí', 24, ''),
(267, 'Víctor Parada', 8, 0, 0.4, 'Defensa', 'España', 23, ''),
(268, 'Denis Suárez', 8, 0, 1.9, 'Centrocampista', 'España', 31, ''),
(269, 'Ander Guevara', 8, 0, 1.5, 'Centrocampista', 'España', 28, ''),
(270, 'Carlos Vicente', 8, 0, 1.0, 'Centrocampista', 'España', 26, ''),
(271, 'Antonio Blanco', 8, 0, 1.2, 'Centrocampista', 'España', 25, ''),
(272, 'Carles Aleñá', 8, 0, 1.3, 'Centrocampista', 'España', 27, ''),
(273, 'Jon Guiridi', 8, 0, 1.3, 'Centrocampista', 'España', 30, ''),
(274, 'Pablo Ibáñez', 8, 0, 11.0, 'Centrocampista', 'España', 27, ''),
(275, 'Calebe Gonçalves', 8, 0, 0.5, 'Centrocampista', 'Brasil', 25, ''),
(276, 'Abederrahmane Rebbach', 8, 0, 0.7, 'Centrocampista', 'Algeria', 27, ''),
(277, 'Carlos Protesoni', 8, 0, 0.3, 'Centrocampista', 'Uruguay', 27, ''),
(278, 'Lander Pinillos', 8, 0, 0.0, 'Centrocampista', 'España', 21, ''),
(279, 'Mariano Díaz', 8, 0, 1.6, 'Delantero', 'República Dominicana', 32, ''),
(280, 'Toni Martinez', 8, 0, 1.9, 'Delantero', 'España', 28, ''),
(281, 'Lucas Boyé', 8, 0, 2.0, 'Delantero', 'Argentina', 29, ''),
(282, 'Dani Cárdenas', 10, 0, 0.7, 'Portero', 'España', 27, ''),
(283, 'Iván Balliu', 10, 0, 1.2, 'Defensa', 'Albania', 32, ''),
(284, 'Abdul Mumin', 10, 0, 0.9, 'Defensa', 'Ghana', 26, ''),
(285, 'Pep Chavarría', 10, 0, 0.8, 'Defensa', 'España', 26, ''),
(286, 'Óscar Trejo', 10, 0, 1.5, 'Mediocampista', 'Argentina', 36, ''),
(287, 'Isi Palazón', 10, 0, 1.5, 'Mediocampista', 'España', 29, ''),
(288, 'Pathé Ciss', 10, 0, 1.2, 'Mediocampista', 'Senegal', 30, ''),
(289, 'Álvaro García', 10, 0, 1.8, 'Delantero', 'España', 32, ''),
(290, 'Sergio Camello', 10, 0, 1.0, 'Delantero', 'España', 24, ''),
(291, 'Jorge De Frutos', 10, 0, 0.8, 'Delantero', 'España', 29, ''),
(292, 'Unai López', 10, 0, 1.2, 'Mediocampista', 'España', 30, ''),
(293, 'Luiz Felipe Ramos ', 10, 0, 2.0, 'Defensa', 'Brasil', 28, ''),
(294, 'Álex Remiro', 14, 0, 1.2, 'Portero', 'España', 30, ''),
(295, 'Caleta-Car', 14, 0, 11.2, 'Defensa', 'Croacia', 29, ''),
(296, 'Igor Zubeldia', 14, 0, 9.3, 'Defensa', 'España', 28, ''),
(297, 'Aihen Muñoz', 14, 0, 0.4, 'Defensa', 'España', 28, ''),
(298, 'Jon Aramburu', 14, 0, 0.5, 'Defensa', 'Venezuela', 23, ''),
(299, 'J. Gorrotxategi', 14, 0, 0.1, 'Centrocampista', 'España', 23, ''),
(300, 'Carlos Soler', 14, 0, 1.0, 'Centrocampista', 'España', 28, ''),
(301, 'Pablo Marín', 14, 0, 0.3, 'Centrocampista', 'España', 22, ''),
(302, 'A. Barrenetxea', 14, 0, 0.8, 'Delantero', 'España', 23, ''),
(303, 'Take Kubo', 14, 0, 1.3, 'Delantero', 'Japón', 24, ''),
(304, 'M. Oyarzabal', 14, 0, 1.5, 'Delantero', 'España', 28, ''),
(305, 'Ørjan Nyland', 13, 0, 1.0, 'Portero', 'Noruega', 35, ''),
(306, 'José Ángel Carmona', 13, 0, 0.5, 'Lateral Derecho', 'España', 23, ''),
(307, 'Fabio cardoso', 13, 0, 1.0, 'Central', 'Portugal', 31, ''),
(308, 'Kike Salas', 13, 0, 0.4, 'Central', 'España', 23, ''),
(309, 'Gabriel Suazo', 13, 0, 1.0, 'Lateral Izquierdo', 'Chile', 28, ''),
(310, 'Nemanja Gudelj', 13, 0, 2.0, 'Centrocampista def.', 'Serbia', 33, ''),
(311, 'Lucien Agoumé', 13, 0, 1.0, 'Centrocampista def.', 'Francia', 23, ''),
(312, 'Djibril Sow', 13, 0, 2.0, 'Centrocampista', 'Suiza', 28, ''),
(313, 'Rubén Vargas', 13, 0, 1.0, 'Extremo izquierdo', 'Suiza', 27, ''),
(314, 'Chidera Ejuke', 13, 0, 1.0, 'Extremo Izquierdo', 'Nigeria', 27, ''),
(315, 'Isaac Romero', 13, 0, 0.3, 'Delantero Centro', 'España', 25, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indexes for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=316;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
