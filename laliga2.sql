-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2026 at 12:01 PM
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
-- Database: `laliga2`
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
-- Table structure for table `fichajes`
--

CREATE TABLE `fichajes` (
  `id` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `tipo_movimiento` varchar(20) DEFAULT NULL,
  `estado` varchar(8) DEFAULT NULL,
  `equipo_origen_id` int(11) DEFAULT NULL,
  `equipo_destino_id` int(11) NOT NULL,
  `jugador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goles`
--

CREATE TABLE `goles` (
  `id` int(11) NOT NULL,
  `partido_id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `jugador_id` int(11) NOT NULL,
  `minuto` tinyint(3) UNSIGNED NOT NULL,
  `tipo` enum('normal','penal','falta','autogol') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jornadas`
--

CREATE TABLE `jornadas` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `temporada` varchar(9) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'Ante Budimir', 15, 1, 1.5, 'Delantero', 'Croacia', 34, 'ante_budimir.jpeg'),
(2, 'Aimar Oroz', 15, 2, 0.5, 'Centrocmpista', 'España', 23, 'aimar_oroz.jpg'),
(3, 'Victor Muñoz', 15, 3, 1.0, 'Delantero', 'España', 22, 'victor_muñoz.jpg'),
(4, 'Jon Moncayola', 15, 0, 0.6, 'Centrocampista', 'España', 27, 'unknow.webp'),
(5, 'Lucas Torró', 15, 0, 1.0, 'Centrocampista', 'España', 31, 'lucas_torro.jpg'),
(6, 'Abel Bretones', 15, 0, 0.3, 'Defensa', 'España', 25, 'unknow.webp'),
(7, 'Valentin Rosier', 15, 2, 1.7, 'Defensa', 'Francia', 29, 'unknow.webp'),
(8, 'Juan Cruz', 15, 3, 0.4, 'Defensa', 'España', 33, 'juan_cruz.jpeg'),
(9, 'Alejandro Catena', 15, 0, 1.0, 'Defensa', 'España', 30, 'unknow.webp'),
(10, 'Flavien Boyomo', 15, 1, 20.0, 'Defensa', 'Camerún', 23, 'unknow.webp'),
(11, 'Sergio Herrera', 15, 1, 0.5, 'Portero', 'España', 32, 'sergio_herrero.jpeg'),
(12, 'kylian mbappe', 1, 0, 32.0, 'Delantero', 'Francia ', 26, 'mbappe.jpg'),
(13, 'vinicius junior', 1, 0, 20.0, 'Delantero', 'Brasil', 25, 'vinicius.jpg'),
(14, 'rodrygo', 1, 0, 12.0, 'Delantero', 'Brasil', 24, 'rodrygo.jpg'),
(15, 'endrick', 1, 2, 4.0, 'Delantero', 'Brasil', 19, 'endrick.jpg'),
(16, 'jude bellingham', 1, 1, 20.0, 'Centrocampista', 'Inglaterra ', 22, 'bellingham.jpg'),
(17, 'federico valverde', 1, 0, 16.0, 'Centrocampista', 'Uruguay ', 27, 'valverde.jpg'),
(18, 'aurelien tchouameni', 1, 2, 12.0, 'Centrocampista', 'Francia ', 25, 'tchouameni.jpg'),
(19, 'eduardo camavinga', 1, 1, 12.0, 'Centrocampista', 'Francia ', 22, 'camavinga.jpg'),
(20, 'dani ceballos', 1, 1, 10.0, 'Centrocampista', 'España ', 29, 'ceballos.jpg'),
(21, 'franco mastantuono', 1, 1, 4.0, 'Centrocampista', 'Argentina', 18, 'mastantuno.jpg'),
(22, 'brahim diaz', 1, 3, 7.0, 'Centrocampista', 'España ', 26, 'brahim.jpg'),
(23, 'arda guler', 1, 2, 5.0, 'Centrocampista', 'Turquia', 20, 'guler.jpg'),
(24, 'david alaba', 1, 0, 22.0, 'Defensa', 'Austria ', 33, 'alaba.jpg'),
(25, 'antonio rudiger', 1, 2, 14.0, 'Defensa', 'Alemania ', 32, 'rudiger.jpg'),
(26, 'eder militao', 1, 3, 14.0, 'Defensa', 'Brasil ', 27, 'militao.jpg'),
(27, 'ferland mendy', 1, 2, 10.0, 'Defensa', 'Francia ', 30, 'mendy.jpg'),
(28, 'dani carvajal', 1, 1, 10.0, 'Defensa', 'España ', 33, 'carvajal.jpeg'),
(29, 'fran garcia', 1, 2, 5.0, 'Defensa', 'España ', 26, 'fran_garcia.jpg'),
(30, 'thibaut courtois', 1, 0, 15.0, 'Portero', 'Belgica ', 33, 'curtois.jpg'),
(31, 'andriy lunin', 1, 1, 4.0, 'Portero', 'Ucrania ', 26, 'lunin.jpg'),
(32, 'Javi Puado', 6, 0, 0.8, 'Delantero', 'España', 27, 'puado.jpg'),
(33, 'Tyrhys Dolan', 6, 1, 0.3, 'Delantero', 'Reino Unido', 23, 'dolan.jpg'),
(34, 'Roberto Fernández', 6, 0, 1.3, 'Delantero', 'España', 23, 'fernandez.jpg'),
(35, 'Pere Milla', 6, 2, 0.5, 'Centrocampista', 'España', 32, 'milla.jpg'),
(36, 'Marko Dmitrović', 6, 0, 1.2, 'Portero', 'Serbia', 33, 'dimitrovic.jpg'),
(37, 'Charles Pickel', 6, 3, 1.5, 'Centrocampista', 'Rep.Congo', 28, 'pickel.jpg'),
(38, 'Eduardo Expósito', 6, 2, 1.2, 'Centrocampista', 'España', 29, 'expósito.jpg'),
(39, 'Ramón Terrats', 6, 1, 0.6, 'Centrocampista', 'España', 24, 'terrats.jpg'),
(40, 'Omar El Hilali', 6, 1, 1.0, 'Defensa', 'Marruecos', 22, 'hilali.jpg'),
(41, 'Fernando Calero', 6, 0, 0.5, 'Defensa', 'España', 30, 'calero.jpg'),
(42, 'Clemens Riedel', 6, 2, 0.8, 'Defensa', 'Alemania', 22, 'riedel.jpg'),
(43, 'Urko González', 6, 0, 0.4, 'Centrocampista', 'España', 24, 'gonzalez.jpg'),
(44, 'Kike García', 6, 1, 1.3, 'Delantero', 'España', 35, 'garcia.jpg'),
(45, 'Carlos Romero', 6, 0, 0.9, 'Defensa', 'España', 23, 'romero.jpg'),
(46, 'Rubén Sánchez', 6, 0, 0.7, 'Defensa', 'España', 24, 'sanchez.jpg'),
(47, 'Miguel Ángel', 6, 3, 1.0, 'Defensa', 'España', 27, 'rubio.jpg'),
(48, 'Luca Koleosho', 6, 2, 1.0, 'Delantero', 'España', 21, 'koleosho.jpg'),
(49, 'Leandro Cabrera', 6, 1, 1.0, 'Defensa', 'Uruguay', 34, 'cabrera.jpg'),
(50, 'Angel Fortuno', 6, 3, 0.2, 'Portero', 'España', 23, 'fortuno.jpg'),
(51, 'José Salinas', 6, 3, 0.8, 'Defensa', 'España', 24, 'salinas.jpg'),
(52, 'Antoniu Roca', 6, 0, 0.7, 'Delantero', 'España', 23, 'roca.jpg'),
(53, 'Francisco Javier', 6, 3, 0.2, 'Centrocampista', 'España', 21, 'hernández.jpg'),
(54, 'Pol Lozano', 6, 1, 1.1, 'Centrocampista', 'España', 25, 'lozano.jpg'),
(55, 'Jofre Carreras', 6, 3, 1.0, 'Delantero', 'España', 24, 'carreras.jpg'),
(56, 'Pol Tristan', 6, 3, 0.1, 'Portero', 'España', 23, 'tristan.jpg'),
(57, 'Juan Camilo Hernández Suárez', 5, 2, 9.0, 'Delantero', 'Colombia', 26, '1.jpg'),
(58, 'Abdessamad Ezzalzouli', 5, 2, 3.0, 'Delantero', 'Marruecos', 23, '2.jpg'),
(59, 'Antony Matheus dos Santos ', 5, 1, 9.0, 'Delantero', 'Brasil', 25, '3.jpg'),
(60, 'Giovani Lo Celso', 5, 0, 4.0, 'Centrocampista', 'Argentina', 29, '4.jpg'),
(61, 'Sofyan Amrabat', 5, 0, 5.0, 'Centrocampista', 'Marruecos', 29, '5.jpg'),
(62, 'Pablo Fornals Malla', 5, 2, 3.0, 'Defensa', 'España', 29, '6.jpg'),
(63, 'Héctor Junior Firpo Adamés', 5, 2, 4.0, 'Defensa', 'República Dominicana', 29, '7.jpg'),
(64, 'Natan Bernardo de Souza', 5, 0, 2.0, 'Defensa ', 'Brasil', 24, '8.jpg'),
(65, 'Marc Bartra Aregall', 5, 1, 2.0, 'Defensa', 'España', 34, '9.jpg'),
(66, 'Héctor Bellerín Morouno', 5, 3, 3.0, 'Defensa', 'España', 30, '10.jpg'),
(67, 'Pau López Sabata', 5, 3, 3.0, 'Portero', 'España', 30, '11.jpg'),
(68, 'Leander Dendoncker', 19, 3, 3.1, 'Centrocampista', 'Belgica ', 30, 'dendoncker.jpg'),
(69, 'Josip Brekalo', 19, 0, 2.7, 'Delantero', 'Croacia', 27, 'brekalo.jpg'),
(70, 'David Carmo', 19, 0, 2.5, 'Defensa', 'Angola', 26, 'carmo.webp'),
(71, 'Eric Bailly', 19, 3, 1.9, 'Defensa', 'Costa de Marfil', 31, 'eric-bailly.jpg'),
(72, 'Santiago Colombatto', 19, 1, 1.3, 'Centrocampista', 'Argentina', 28, 'colomabtto.jpeg'),
(73, 'Federico Viñas', 19, 1, 1.0, 'Delantero', 'Uruguay', 27, 'Federico-Vinas.webp'),
(74, 'Alberto Reina', 19, 0, 1.0, 'Centrocampista', 'España', 27, 'Alberto-Reina.jpg'),
(75, 'Aarón Escandell', 19, 1, 1.0, 'Portero', 'España', 29, 'escandell.jpeg'),
(76, 'Nacho Vidal', 19, 0, 1.0, 'Defensa', 'España', 30, 'Nacho-vidal.jpeg'),
(77, 'David Costas', 19, 1, 1.0, 'Defensa', 'España', 30, 'costas.jpeg'),
(78, 'Dani Calvo', 19, 0, 1.0, 'Defensa', 'España', 31, 'calvo.jpeg'),
(79, 'Haissem Hassan', 19, 3, 0.8, 'Delantero', 'España', 23, 'Haissem-Hassan.jpeg'),
(80, 'Oier Luengo', 19, 2, 0.8, 'Defensa', 'España', 27, 'luengo.png'),
(81, 'Santi Cazorla', 19, 3, 0.2, 'Centrocampista', 'España', 40, 'cazorla.avif'),
(82, 'Nico Williams', 11, 3, 16.0, 'Delantero', 'España', 23, 'nicowilliams.jpeg'),
(83, 'Iñaki Williams', 11, 3, 11.0, 'Delantero', 'Ghana', 31, 'inakiwilliams.jpg'),
(84, 'Oihan Sancet', 11, 0, 2.0, 'Centrocampista', 'España', 25, 'oihansancet.jpg'),
(85, 'Gorka Guruzeta', 11, 1, 2.0, 'Delantero ', 'España', 28, 'gorkaguruzeta.jpg'),
(86, 'Álex Berenguer', 11, 2, 2.0, 'Delantero', 'España', 30, 'alexberenguer.jpeg'),
(87, 'Robert Navarro', 11, 3, 2.0, 'Delantero', 'España', 23, 'robertnavarro.jpeg'),
(88, 'Maroan Sannadi', 11, 3, 1.0, 'Delantero ', 'España', 24, 'maroansannadi.jpg'),
(89, 'Dani Vivian', 11, 3, 3.0, 'Defensa ', 'España', 26, 'danivivian.jpg'),
(90, 'Aitor Paredes', 11, 1, 2.0, 'Defensa ', 'España', 25, 'aitorparedes.webp'),
(91, 'Yeray Álvarez', 11, 3, 2.0, 'Defensa', 'España', 30, 'yerayalvarez.jpg'),
(92, 'Yuri Berchiche', 11, 1, 4.0, 'Defensa', 'España', 35, 'yuriberchiche.jpg'),
(93, 'Jesús Areso', 11, 1, 2.0, 'Defensa', 'España', 26, 'jesusareso.jpg'),
(94, 'Andoni Gorosabel', 11, 1, 2.0, 'Defensa', 'España', 29, 'andonigorosabel.jpeg'),
(95, 'Mikel Vesga', 11, 0, 2.0, 'Centrocampista', 'España', 32, 'mikelvesga.jpg'),
(96, 'Beñat Prados', 11, 1, 1.0, 'Centrocampista', 'España', 24, 'benatprados.jpg'),
(97, 'Iñigo Ruiz', 11, 3, 2.0, 'Centrocampista', 'España', 32, 'inigoruiz.jpg'),
(98, 'Unai Gómez', 11, 0, 1.0, 'Centrocampista', 'España', 22, 'unaigomez.jpg'),
(99, 'Unai Simón', 11, 2, 4.0, 'Portero', 'España', 28, 'unaisimon.jpg'),
(100, 'Álex Padilla', 11, 1, 0.6, 'Portero', 'España', 22, 'alexpadilla.webp'),
(101, 'Unai Egiluz', 11, 2, 0.6, 'Defensa ', 'España', 23, 'unaiegiluz.jpeg'),
(102, 'Marc-Andre Ter Stegen', 2, 2, 6.3, 'Portero', 'Alemania', 33, 'TerStegen.png'),
(103, 'Alejandro Balde', 2, 2, 1.6, 'Defensa', 'España', 21, 'ABalde.png'),
(104, 'Ronald Araujo', 2, 0, 10.0, 'Defensa', 'Uruguay', 25, 'RAraujo.png'),
(105, 'Pau Cubarsi', 2, 2, 4.7, 'Defensa ', 'España', 19, 'PCubarsi.jpg'),
(106, 'Andreas Christensen', 2, 1, 9.0, 'Defensa', 'Dinamarca', 29, 'Chistensen.png'),
(107, 'Gerard Martin', 2, 1, 0.2, 'Centrocampista', 'España', 20, 'GerdadMartin.png'),
(108, 'Jules Kounde', 2, 0, 5.4, 'Defensa', 'Francia', 25, 'Jkounde.png'),
(109, 'Eric Garcia', 2, 1, 6.0, 'Defensa', 'España', 24, 'EGarcia.png'),
(110, 'Gavi', 2, 3, 9.3, 'Centrocampista', 'España', 20, 'PGavi.png'),
(111, 'Pedri', 2, 2, 12.5, 'Centrocampista', 'España', 22, 'Pedri.png'),
(112, 'Fermin Lopez', 2, 3, 4.0, 'Centrocampista', 'España', 20, 'FerminLopez.png'),
(113, 'Marc Casado', 2, 1, 0.4, 'Centrocampista', 'España', 19, 'MCasado.png'),
(114, 'Dani Olmo', 2, 0, 9.3, 'Centrocampista', 'España', 25, 'DOlmo.png'),
(115, 'Frenkie De Jong', 2, 3, 19.0, 'Centrocampista', 'Holanda', 26, 'FdeJong.png'),
(116, 'Marc Bernal', 2, 2, 0.3, 'Defensa', 'España', 18, 'MarcBernal.jpg'),
(117, 'Ferran Torres', 2, 1, 10.0, 'Delantero', 'España', 23, 'FerranTorres.png'),
(118, 'Robert Lewandowski', 2, 3, 33.3, 'Delantero', 'Polonia', 36, 'Lewandowski.png'),
(119, 'Lamine Yamal', 2, 3, 15.0, 'Delantero', 'España', 18, 'LamineYamal.png'),
(120, 'Raphina', 2, 3, 12.5, 'Delantero', 'Brasil', 27, 'Raphiña.png'),
(121, 'Marcus Rashford', 2, 0, 15.6, 'Delantero', 'Inglaterra ', 26, 'Rashford.png'),
(122, 'Gerard Moreno', 3, 2, 4.0, 'Delantero ', 'España', 33, 'gerardMoreno.JPEG'),
(123, 'Dani Parejo', 3, 2, 3.0, 'Centrocampista', 'España', 36, 'daniParejo.JEPG'),
(124, 'Nicolás Pépé', 3, 1, 3.0, 'Delantero', 'Costa de Marfil', 30, 'nocolasPepe.JEPG'),
(125, 'Pau Navarro', 3, 0, 1.0, 'Defensa', 'España', 20, 'pauNavarro.JEPG'),
(126, 'Alfonso Pedraza', 3, 3, 2.0, 'Defensa', 'España', 29, 'alfonsoPedraza.JEPG'),
(127, 'Ayoze Pérez', 3, 0, 2.0, 'Delantero', 'España', 31, 'ayozePerez.JEPG'),
(128, 'Juan Foyth', 3, 1, 2.0, 'Defensa', 'Argentina', 27, 'juanFoyth.JEPG'),
(129, 'Pape Gueye', 3, 3, 2.0, 'Centrocampista', 'Senegal', 26, 'pepeGueye.JEPG'),
(130, 'Logan Costa', 3, 3, 2.0, 'Defensa ', 'Cabo Verde', 24, 'loganCosta.JEPG'),
(131, 'Luiz Júnior', 3, 0, 1.0, 'Portero', 'Brazil', 23, 'luizJunion.JEPG'),
(132, 'Trevor Buchanan', 3, 2, 2.0, 'Defensa', 'Canada', 26, 'trevorBuchanan.JEPG'),
(133, 'Byran Zaragoza', 12, 1, 4.0, 'Delantero', 'España', 24, 'bryanzaragoza.jpg'),
(134, 'Iago Aspas', 12, 3, 3.0, 'Delantero', 'España', 38, 'iagoaspas.jpg'),
(135, 'Borja Iglesias', 12, 0, 2.0, 'Delantero', 'España', 32, 'borjaiglersias.jpg'),
(136, 'Ferran Jutglà', 12, 0, 2.0, 'Delantero', 'España', 26, 'ferranjutgla.jpg'),
(137, 'Ilaix Moriba', 12, 3, 2.0, 'Centrocampista', 'Guinea', 22, 'ilaixmoriba.jpg'),
(138, 'Carl Starfelt', 12, 2, 2.0, 'Defensa', 'Suecia', 30, 'carlstarfelt.jpg'),
(139, 'Franco Cervi', 12, 2, 1.0, 'Centrocampista', 'Argentina', 31, 'francocervi.jpg'),
(140, 'Fran Beltrán', 12, 0, 1.0, 'Centrocampista', 'España', 26, 'franbeltran.jpg'),
(141, 'Williot Swedberg', 12, 1, 1.0, 'Centrocampista', 'Suecia', 21, 'willotswedberg.jpg'),
(142, 'Hugo Sotelo', 12, 0, 1.0, 'Centrocampista', 'España', 21, 'hugosotelo.jpg'),
(143, 'Óscar Mingueza', 12, 1, 1.0, 'Defensa', 'España', 26, 'oscarmingueza.jpg'),
(144, 'Joseph Aidoo', 12, 3, 1.0, 'Defensa', 'Ghana', 29, 'josephaidoo.jpg'),
(145, 'Marcos Alonso', 12, 3, 1.0, 'Defensa', 'España', 34, 'marcosalonso.jpg'),
(146, 'Mihailo Ristic', 12, 2, 1.0, 'Defensa', 'Serbia', 29, 'mihailo.jpg'),
(147, 'Sergio Carreira', 12, 2, 1.0, 'Defensa', 'España', 24, 'serfiocarreira.jpg'),
(148, 'Carlos Domínguez', 12, 0, 1.0, 'Defensa', 'España', 24, 'dominguez.jpg'),
(149, 'Javi Rodríguez', 12, 0, 1.0, 'Defensa', 'España', 22, 'javirodriguez.jpg'),
(150, 'Iván Villar', 12, 1, 1.0, 'Portero', 'España', 28, 'ivanvillar.jpg'),
(151, 'Andrei Radu', 12, 2, 1.0, 'Portero', 'Rumania', 28, 'andreiradu.jpg'),
(152, 'Pablo Durán', 12, 3, 1.0, 'delantero', 'España', 24, 'pabloduran.jpg'),
(153, 'JUAN AGUSTíN MUSSO', 4, 1, 4.0, 'Portero', 'Argentina', 31, 'jam.png'),
(154, 'JAN OBLAK', 4, 1, 13.0, 'Portero', 'Eslovenia', 32, 'jo.png'),
(155, 'JOSé MARíA GIMéNEZ DE VARGAS', 4, 2, 5.0, 'Defensa', 'Uruguay', 30, 'jmgv.png'),
(156, 'MATTEO RUGGERI', 4, 0, 2.0, 'Defensa', 'Italia', 23, 'mr.png'),
(157, 'CLéMENT NICOLAS LAURENT LENGLET', 4, 2, 4.0, 'Defensa', 'Francia', 30, 'cnll.png'),
(158, 'NAHUEL MOLINA LUCERO', 4, 3, 1.0, 'Defensa', 'Argentina', 27, 'nml.png'),
(159, 'DáVID HANCKO', 4, 1, 2.0, 'Defensa', 'Eslovaquia', 27, 'dh.png'),
(160, 'MARC PUBILL PAGéS', 4, 2, 0.4, 'Defensa', 'España', 22, 'mpp.png'),
(161, 'CONOR GALLAGHER', 4, 3, 0.5, 'Centrocampista', 'Inglaterra ', 25, 'cg.png'),
(162, 'JOãO LUCAS de souz', 4, 1, 0.9, 'Centrocampista', 'Italia', 24, 'jlsc.png'),
(163, 'Thiago Ezequiel Almada', 4, 1, 2.0, 'Delantero ', 'Argentina ', 24, 'tea.png'),
(164, 'Juan carlos', 20, 3, 0.4, 'Portero', 'España', 37, ''),
(165, 'victor reis', 20, 3, 0.1, 'Defensa', 'Brazil', 19, ''),
(166, 'alejandro Frances', 20, 2, 3.0, 'Defensa', 'España', 23, ''),
(167, 'Paulo Gazzaniga', 20, 1, 1.2, 'Portero', 'Argentina', 33, ''),
(168, 'Iván Martín', 20, 3, 1.7, 'Centrocampista', 'España', 26, ''),
(169, 'Jhon Solís', 20, 0, 0.2, 'Centrocampista', 'Colombia', 20, ''),
(170, 'David López', 20, 2, 3.8, 'Defensa', 'España', 36, ''),
(171, 'Daley Blind', 20, 3, 1.8, 'Defensa', 'Países Bajos', 35, ''),
(172, 'Arnau Martínez        ', 20, 3, 1.2, 'Defensa', 'España', 22, ''),
(173, 'Cristhian Stuani', 20, 0, 1.1, 'Delantero', 'Uruguay', 38, ''),
(174, 'Viktor Tsygankov', 20, 2, 1.4, 'Delantero', 'Ucrania', 27, ''),
(175, 'cristian Portu', 20, 0, 1.8, 'Delantero', 'España', 33, ''),
(176, 'Joel Roca        ', 20, 0, 0.3, 'Delantero', 'España', 20, ''),
(177, 'Eric García', 20, 0, 0.3, 'Defensa', 'España', 24, ''),
(178, 'Miguel Gutiérrez', 20, 3, 0.3, 'Defensa', 'España', 24, ''),
(179, 'Yan Couto', 20, 2, 0.2, 'Defensa', 'Brazil', 23, ''),
(180, 'Aleix García', 20, 1, 0.1, 'Centrocampista', 'España', 28, ''),
(181, 'Yangel Herrera', 20, 1, 0.2, 'Centrocampista', 'Venezuela', 27, ''),
(182, 'Borja García', 20, 3, 0.4, 'Centrocampista', 'España', 34, ''),
(183, 'Ibrahima Kébé', 20, 1, 0.3, 'Centrocampista', 'Mali', 25, ''),
(184, 'Javier Guerra', 18, 2, 0.4, 'Centrocampista', 'España', 22, 'jg.jpg'),
(185, 'Jose Luis Garcia', 18, 1, 1.3, 'Centrocampista', 'España', 27, 'jlg.jpg'),
(186, 'Julen Agirrezabala', 18, 1, 0.4, 'Guardameta', 'España', 24, 'ja.jpg'),
(187, 'Arnaut Danjuma', 18, 3, 3.5, 'Delantero', 'Nigeria', 28, 'ad.jpg'),
(188, 'Dani Raba', 18, 2, 0.4, 'Delantero', 'España', 29, 'dr.jpg'),
(189, 'Jose Manuel Arias', 18, 3, 0.2, 'Defensa', 'España', 25, 'jma.jpg'),
(190, 'Hugo Duro', 18, 3, 2.8, 'Delantero', 'España', 25, 'hd.jpg'),
(191, 'Filip Ugrinic', 18, 3, 0.0, 'Centrocampista', 'Suiza', 26, 'fu.jpg'),
(192, 'Andre Almeida', 18, 0, 0.6, 'Centrocampista', 'Portugal', 25, 'aa.jpg'),
(193, 'Jose Luis Gaya', 18, 3, 5.8, 'Defensa', 'España', 30, 'jlgaya.jpg'),
(194, 'Baptiste Santamaria', 18, 1, 2.0, 'Centrocampista', 'Francia', 30, 'bs.jpg'),
(195, 'Vedat muriqi', 17, 3, 0.0, 'Delantero', 'Kosovo', 31, 'vedat_muriqi.jpg'),
(196, 'Leo Román', 17, 2, 0.0, 'Portero', 'España', 25, 'leo_roman.jpg'),
(197, 'Pablo Torre', 17, 1, 0.0, 'Centrocampista', 'España', 22, 'pablo_torre.png'),
(198, 'Dani Rodriguéz', 17, 0, 0.0, 'Centrocampista', 'España', 37, 'dani_rodriguez.jpg'),
(199, 'Pablo Maffeo', 17, 1, 0.0, 'Defensa', 'Argentina', 28, 'pablo_maffeo.webp'),
(200, 'Takuma Asano', 17, 1, 0.0, 'Delantero', 'Japón', 30, 'takuma_asano.jpg'),
(201, 'Johan Mojica', 17, 1, 0.0, 'Defensa', 'Colombia', 33, 'johan_mohica.jpg'),
(202, 'Samuel Costa', 17, 1, 0.0, 'Centrocampista', 'Portugal', 24, 'samuel_costa.jpg'),
(203, 'Antonio Raíllo', 17, 3, 0.0, 'Defensa', 'España', 33, 'antonio_raillo.jpg'),
(204, 'Martin Valjent', 17, 0, 0.0, 'Defensa', 'Eslovaquia', 29, 'martin_valjent.jpg'),
(205, 'Mateo Joseph', 17, 0, 0.0, 'Delantero', 'España', 21, 'mateo_joseph.jpeg'),
(206, 'Etta Yong', 16, 0, 5.0, 'Delantero', 'Camerún', 21, 'etta.jpg'),
(207, 'Iván Romero', 16, 0, 10.0, 'Delantero', 'España', 24, 'romero.jpg'),
(208, 'Carlos Álvarez', 16, 2, 7.3, 'Centrocampista', 'España', 22, 'carlos.jpeg'),
(209, 'Jon Ander', 16, 3, 3.7, 'Centrocampista', 'España', 25, 'jon.jpg'),
(210, 'Pablo Martínez', 16, 0, 9.0, 'Centrocampista', 'España', 26, 'pablo.jpeg'),
(211, 'Oriol Rey', 16, 3, 3.1, 'Centrocampista', 'España', 27, 'oriol.jpeg'),
(212, 'Manu Sánchez', 16, 3, 2.0, 'Defensa', 'España', 25, 'manu.jpg'),
(213, 'Matías Moreno', 16, 3, 11.0, 'Defensa', 'España', 24, 'mati.jpg'),
(214, 'Unai Elgezabal', 16, 0, 8.0, 'Defensa', 'España', 26, 'unai.png'),
(215, 'Jeremy Toljan', 16, 3, 1.8, 'Defensa', 'España', 22, 'toljan.jpg'),
(216, 'Mathew Ryan', 16, 1, 6.0, 'Portero', 'Australia', 28, 'mathew.webp'),
(217, 'M. Dituro', 9, 3, 0.6, 'Portero', 'Argentina', 38, 'md.jpg'),
(218, 'Adrià Pedrosa', 9, 1, 1.1, 'Defensa', 'España', 27, 'ap.jpg'),
(219, 'Bambo Diaby', 9, 2, 0.8, 'Defensa', 'España', 27, 'bd.jpg'),
(220, 'Bigas', 9, 2, 0.9, 'Defensa', 'España', 35, 'b.jpg'),
(221, 'Álvaro Nuñez', 9, 1, 0.3, 'Defensa', 'España', 25, 'an.jpg'),
(222, 'John', 9, 2, 0.5, 'Defensa', 'España', 24, 'j.jpg'),
(223, 'L.Petrot', 9, 1, 0.4, 'Defensa', 'Francia', 28, 'lp.jpg'),
(224, 'F.Redondo', 9, 2, 4.5, 'Centrocampista', 'España', 22, 'fr.jpg'),
(225, 'Y.Santiago', 9, 1, 0.2, 'Centrocampista', 'España', 22, 'ys.jpg'),
(226, 'M. Agudo', 9, 1, 0.4, 'Centrocampista', 'España', 25, 'ma.jpg'),
(227, 'Germán V.', 9, 3, 0.6, 'Centrocampista', 'España', 23, 'gv.jpg'),
(228, 'A.Febas', 9, 3, 0.9, 'Centrocampista', 'España', 29, 'af.jpg'),
(229, 'M. Neto', 9, 3, 2.0, 'Centrocampista', 'Portugal', 22, 'mn.jpg'),
(230, 'André de Silva', 9, 3, 4.1, 'Delantero', 'Portugal', 29, 'as.jpg'),
(231, 'Rafa Mir', 9, 0, 1.9, 'Delantero', 'España', 28, 'rm.jpg'),
(232, 'Álvaro R.', 9, 1, 1.2, 'Delantero', 'Uruguay', 21, 'ar.jpg'),
(233, 'R. Mendoza', 9, 3, 0.2, 'Centrocampista', 'España', 20, 'rm.jpg'),
(234, 'Grady Diangana', 9, 1, 1.4, 'Delantero', 'Congo', 27, 'gd.jpg'),
(235, 'Héctor Fort', 9, 0, 0.9, 'Defensa', 'España', 19, 'hf.jpg'),
(236, 'V. Chust', 9, 3, 0.7, 'Defensa', 'España', 25, 'vc.jpg'),
(237, 'Letacek', 7, 0, 0.6, 'Portero', 'Republica checa', 26, 'letacek.png'),
(238, 'Djene', 7, 2, 1.8, 'Defensa', 'Togo', 33, 'djene.png'),
(239, 'Abdel abkar', 7, 2, 2.5, 'Defensa', 'Marruecos', 26, 'abdel.png'),
(240, 'Neyou', 7, 3, 2.0, 'Centrocampista', 'Camerun', 28, 'neyou.png'),
(241, 'L.milla', 7, 0, 1.5, 'Centrocampista', 'España', 30, 'milla.png'),
(242, 'Mario martin', 7, 1, 0.5, 'Centrocampista', 'España', 21, 'mario.png'),
(243, 'Juanmi', 7, 2, 2.5, 'Delantero', 'España', 32, 'juanmi.png'),
(244, 'Arambarri', 7, 2, 3.7, 'Centrocampista', 'Argentina', 29, 'arambarri.png'),
(245, 'B. mayoral', 7, 0, 4.8, 'Delantero', 'España', 28, 'mayoral.png'),
(246, 'Kamara', 7, 0, 0.5, 'Delantero', 'España', 22, 'kamara.png'),
(247, 'David soria', 7, 1, 2.5, 'Portero', 'España', 32, 'davidsoria.png'),
(248, 'Javi muñoz', 7, 2, 1.7, 'Centrocampista', 'España', 30, 'javi.png'),
(249, 'Rico', 7, 2, 2.0, 'Defensa', 'España', 32, 'rico.png'),
(250, 'Kiko F', 7, 1, 1.2, 'Defensa', 'España', 34, 'kiko.png'),
(251, 'Alex', 7, 1, 1.0, 'Delantero', 'España', 28, 'alex.png'),
(252, 'C. da costa', 7, 0, 0.8, 'Delantero', 'Guinea', 23, 'costa.png'),
(253, 'Iglesias', 7, 3, 0.8, 'Defensa', 'España', 27, 'iglesias.png'),
(254, 'Domingos D.', 7, 0, 1.3, 'Defensa', 'Portugal', 30, 'domingos.png'),
(255, 'Liso', 7, 1, 0.3, 'Delantero', 'España', 20, 'liso.png'),
(256, 'Davinchi', 7, 3, 0.3, 'Defensa', 'España', 17, 'davinchi.png'),
(257, 'Antonio Sivera', 8, 0, 1.6, 'Portero', 'España', 29, 'antonio_sivera.jpg'),
(258, 'Raúl Fernández', 8, 2, 0.6, 'Portero', 'España', 37, 'unknow.webp'),
(259, 'Facundo Garces', 8, 3, 0.9, 'Defensa', 'Argentina', 26, 'facundo_garces.jpg'),
(260, 'Youssef Enriquez', 8, 2, 0.4, 'Defensa', 'Marruecos', 19, 'unknow.webp'),
(261, 'Jon Pacheco', 8, 2, 1.0, 'Defensa', 'España', 24, 'unknow.webp'),
(262, 'Nikola Maras', 8, 1, 0.8, 'Defensa', 'Serbia', 29, 'nikola.jpeg'),
(263, 'Nahuel Tenaglia', 8, 3, 0.9, 'Defensa', 'Argentina', 29, 'unknow.webp'),
(264, 'Jonny Otto', 8, 1, 1.7, 'Defensa', 'España', 31, 'unknow.webp'),
(265, 'Moussa Diarra', 8, 2, 0.8, 'Defensa', 'Malí', 24, 'unknow.webp'),
(266, 'Víctor Parada', 8, 0, 0.4, 'Defensa', 'España', 23, 'unknow.webp'),
(267, 'Denis Suárez', 8, 3, 1.9, 'Centrocampista', 'España', 31, 'denis_suarez.jpg'),
(268, 'Ander Guevara', 8, 3, 1.5, 'Centrocampista', 'España', 28, 'ander_guevara.jpg'),
(269, 'Carlos Vicente', 8, 3, 1.0, 'Centrocampista', 'España', 26, 'carlos_vicente.jpg'),
(270, 'Antonio Blanco', 8, 3, 1.2, 'Centrocampista', 'España', 25, 'antonio_blanco.jpeg'),
(271, 'Carles Aleñá', 8, 1, 1.3, 'Centrocampista', 'España', 27, 'carles_aleña.jpg'),
(272, 'Jon Guiridi', 8, 0, 1.3, 'Centrocampista', 'España', 30, 'jon_guiridi.jpg'),
(273, 'Pablo Ibáñez', 8, 3, 11.0, 'Centrocampista', 'España', 27, 'pablo_ibañez.jpg'),
(274, 'Calebe Gonçalves', 8, 3, 0.5, 'Centrocampista', 'Brazil', 25, 'calebe.webp'),
(275, 'Abederrahmane Rebbach', 8, 1, 0.7, 'Centrocampista', 'Algeria', 27, 'unknow.webp'),
(276, 'Carlos Protesoni', 8, 2, 0.3, 'Centrocampista', 'Uruguay', 27, 'unknow.webp'),
(277, 'Lander Pinillos', 8, 0, 0.0, 'Centrocampista', 'España', 21, 'unknow.webp'),
(278, 'Mariano Díaz', 8, 1, 1.6, 'Delantero', 'R.Dominicana', 32, 'mariano_diaz.jpeg'),
(279, 'Toni Martinez', 8, 2, 1.9, 'Delantero', 'España', 28, 'unknow.webp'),
(280, 'Lucas Boyé', 8, 3, 2.0, 'Delantero', 'Argentina', 29, 'lucas_boye.jpg'),
(281, 'Dani Cárdenas', 10, 2, 0.7, 'Portero', 'España', 27, 'dc.jpg'),
(282, 'Iván Balliu', 10, 0, 1.2, 'Defensa', 'Albania', 32, 'ib.jpg'),
(283, 'Abdul Mumin', 10, 0, 0.9, 'Defensa', 'Ghana', 26, 'am.jpg'),
(284, 'Pep Chavarría', 10, 2, 0.8, 'Defensa', 'España', 26, 'pc.jpg'),
(285, 'Óscar Trejo', 10, 0, 1.5, 'Centrocampista', 'Argentina', 36, 'ot.jpg'),
(286, 'Isi Palazón', 10, 2, 1.5, 'Centrocampista', 'España', 29, 'ip.jpg'),
(287, 'Pathé Ciss', 10, 3, 1.2, 'Centrocampista', 'Senegal', 30, 'pc.jpg'),
(288, 'Álvaro García', 10, 0, 1.8, 'Delantero', 'España', 32, 'ag.jpg'),
(289, 'Sergio Camello', 10, 0, 1.0, 'Delantero', 'España', 24, 'sc.jpg'),
(290, 'Jorge De Frutos', 10, 1, 0.8, 'Delantero', 'España', 29, 'jdf.jpg'),
(291, 'Unai López', 10, 2, 1.2, 'Centrocampista', 'España', 30, 'ul.jpg'),
(292, 'Luiz Felipe Ramos ', 10, 0, 2.0, 'Defensa', 'Brazil', 28, 'lfr.jpg'),
(293, 'Álex Remiro', 14, 1, 1.2, 'Portero', 'España', 30, 'alexremiro.jpg'),
(294, 'Caleta-Car', 14, 3, 11.2, 'Defensa', 'Croacia', 29, 'caletacar.jpg'),
(295, 'Igor Zubeldia', 14, 0, 9.3, 'Defensa', 'España', 28, 'igorzubeldia.jpg'),
(296, 'Aihen Muñoz', 14, 2, 0.4, 'Defensa', 'España', 28, 'aihenmunoz.jpg'),
(297, 'Jon Aramburu', 14, 2, 0.5, 'Defensa', 'Venezuela', 23, 'jonarramburu.jpg'),
(298, 'J. Gorrotxategi', 14, 1, 0.1, 'Centrocampista', 'España', 23, 'jgorrotxategi.jpg'),
(299, 'Carlos Soler', 14, 1, 1.0, 'Centrocampista', 'España', 28, 'carlossoler.jpg'),
(300, 'Pablo Marín', 14, 3, 0.3, 'Centrocampista', 'España', 22, 'pablomarin.jpg'),
(301, 'A. Barrenetxea', 14, 0, 0.8, 'Delantero', 'España', 23, 'abarrenetxea.jpg'),
(302, 'Take Kubo', 14, 1, 1.3, 'Delantero', 'Japón', 24, 'takekubo.jpg'),
(303, 'M. Oyarzabal', 14, 2, 1.5, 'Delantero', 'España', 28, 'oyarzabal.jpg'),
(304, 'Ørjan Nyland', 13, 0, 1.0, 'Portero', 'Noruega', 35, 'orjan.jpg'),
(305, 'José Ángel Carmona', 13, 0, 0.5, 'Defensa', 'España', 23, 'jose_angel_carmona.jpg'),
(306, 'Fabio cardoso', 13, 1, 1.0, 'Defensa', 'Portugal', 31, 'Fabio_cardoso.jpg'),
(307, 'Kike Salas', 13, 3, 0.4, 'Defensa', 'España', 23, 'Kike_salas.jpg'),
(308, 'Gabriel Suazo', 13, 0, 1.0, 'Defensa', 'Chile', 28, 'Gabriel_Suazo.jpg'),
(309, 'Nemanja Gudelj', 13, 3, 2.0, 'Centrocampista ', 'Serbia', 33, 'nemanja.jpg'),
(310, 'Lucien Agoumé', 13, 3, 1.0, 'Centrocampista ', 'Francia', 23, 'lucien.jpg'),
(311, 'Djibril Sow', 13, 0, 2.0, 'Centrocampista', 'Suiza', 28, 'dji.jpg'),
(312, 'Rubén Vargas', 13, 2, 1.0, 'Delantero', 'Suiza', 27, 'ruben.jpg'),
(313, 'Chidera Ejuke', 13, 2, 1.0, 'Delantero', 'Nigeria', 27, 'chi.jpg'),
(314, 'Isaac Romero', 13, 1, 0.3, 'Delantero ', 'España', 25, 'isac.jpg'),
(315, 'Isaac Romero', 13, 3, 0.3, 'Delantero Centro', 'España', 25, '');

-- --------------------------------------------------------

--
-- Table structure for table `partidos`
--

CREATE TABLE `partidos` (
  `id` int(11) NOT NULL,
  `jornada_id` int(11) NOT NULL,
  `equipo_local_id` int(11) NOT NULL,
  `equipo_visitante_id` int(11) NOT NULL,
  `fecha_hora` datetime DEFAULT NULL,
  `gol_visitante` int(11) DEFAULT NULL,
  `fase` enum('ida','vuelta') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `plan` enum('gratis','5','10') NOT NULL DEFAULT 'gratis',
  `equipo_favorito_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `email`, `password`, `plan`, `equipo_favorito_id`) VALUES
(2, 'test@test.com', '123456', '5', 8),
(4, 'alejandro@gmail.com', '123456', '10', 2),
(5, 'samu@gmail.com', '$2y$10$C5Qi5hyp7D1tESX8gHHZUOVGrm5YcuN9OT8khVsOhe4x1kbMW7DnW', 'gratis', 2),
(6, 'qwe@gmai.com', '$2y$10$y9Jb4AuxKhAJs2SRyDX1lOhmHUyTCBRvvqC7HDtQPKsCc4lQWHN0y', 'gratis', 4),
(7, 'test44@gmail.com', '$2y$10$fk9wvLbilZL8jMu0Cf98FefF.qGBf/6IpdtH8kaY57.XUzYSGVBC6', '10', 8);

-- --------------------------------------------------------

--
-- Table structure for table `valoraciones`
--

CREATE TABLE `valoraciones` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `puntuacion` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Indexes for table `fichajes`
--
ALTER TABLE `fichajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_origen_id` (`equipo_origen_id`),
  ADD KEY `equipo_destino_id` (`equipo_destino_id`),
  ADD KEY `jugador_id` (`jugador_id`);

--
-- Indexes for table `goles`
--
ALTER TABLE `goles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partido_id` (`partido_id`),
  ADD KEY `equipo_id` (`equipo_id`),
  ADD KEY `jugador_id` (`jugador_id`);

--
-- Indexes for table `jornadas`
--
ALTER TABLE `jornadas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero` (`numero`),
  ADD UNIQUE KEY `temporada` (`temporada`);

--
-- Indexes for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indexes for table `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jornada_id` (`jornada_id`),
  ADD KEY `equipo_local_id` (`equipo_local_id`),
  ADD KEY `equipo_visitante_id` (`equipo_visitante_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `fk_usuario_equipo` (`equipo_favorito_id`);

--
-- Indexes for table `valoraciones`
--
ALTER TABLE `valoraciones`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `usuario_id` (`usuario_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `fichajes`
--
ALTER TABLE `fichajes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `goles`
--
ALTER TABLE `goles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=959;

--
-- AUTO_INCREMENT for table `jornadas`
--
ALTER TABLE `jornadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT for table `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `valoraciones`
--
ALTER TABLE `valoraciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fichajes`
--
ALTER TABLE `fichajes`
  ADD CONSTRAINT `fichajes_ibfk_1` FOREIGN KEY (`equipo_origen_id`) REFERENCES `equipos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fichajes_ibfk_2` FOREIGN KEY (`equipo_destino_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fichajes_ibfk_3` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `goles`
--
ALTER TABLE `goles`
  ADD CONSTRAINT `goles_ibfk_1` FOREIGN KEY (`partido_id`) REFERENCES `partidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goles_ibfk_2` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goles_ibfk_3` FOREIGN KEY (`jugador_id`) REFERENCES `jugadores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`jornada_id`) REFERENCES `jornadas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_local_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `partidos_ibfk_3` FOREIGN KEY (`equipo_visitante_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_equipo` FOREIGN KEY (`equipo_favorito_id`) REFERENCES `equipos` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `valoraciones`
--
ALTER TABLE `valoraciones`
  ADD CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
