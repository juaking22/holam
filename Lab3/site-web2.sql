-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Sep 21, 2022 at 03:09 AM
-- Server version: 8.0.29
-- PHP Version: 8.0.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site-web2`
--

-- --------------------------------------------------------

--
-- Table structure for table `habilidades`
--

CREATE TABLE `habilidades` (
  `id` int NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `habilidades`
--

INSERT INTO `habilidades` (`id`, `name`, `description`) VALUES
(1, 'Desarrollo back-end basico', NULL),
(2, 'Desarrollo front-end basico', NULL),
(3, 'Desarrollo back-end avanzado', NULL),
(4, 'Desarrollo front-end avanzado', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `habilidades_usuarios`
--

CREATE TABLE `habilidades_usuarios` (
  `user` int NOT NULL,
  `skill` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `habilidades_usuarios`
--

INSERT INTO `habilidades_usuarios` (`user`, `skill`) VALUES
(1, 3),
(1, 4),
(2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int NOT NULL,
  `name` varchar(80) NOT NULL,
  `email` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `name`, `email`) VALUES
(1, 'super admin', 'admin@wedev2.dev'),
(2, 'Usuario Ejemplo 1', 'user_@wedev2.dev');

-- --------------------------------------------------------

--
-- Table structure for table `usuario_data`
--

CREATE TABLE `usuario_data` (
  `id` int NOT NULL,
  `user` int NOT NULL,
  `birth_date` datetime NOT NULL,
  `description` text NOT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `google` varchar(100) DEFAULT NULL,
  `facebook` varchar(100) DEFAULT NULL,
  `twitter` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario_data`
--

INSERT INTO `usuario_data` (`id`, `user`, `birth_date`, `description`, `telefono`, `google`, `facebook`, `twitter`) VALUES
(1, 1, '1982-09-15 04:46:54', '<p>Lorem Ipsum</p>', NULL, NULL, NULL, NULL),
(2, 2, '1994-07-10 04:46:54', '<p>Lorem Ipsum</p>', NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `habilidades`
--
ALTER TABLE `habilidades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `habilidades_usuarios`
--
ALTER TABLE `habilidades_usuarios`
  ADD KEY `habilidades_usuarios_ibfk_1` (`user`),
  ADD KEY `skill` (`skill`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario_data`
--
ALTER TABLE `usuario_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `habilidades`
--
ALTER TABLE `habilidades`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `usuario_data`
--
ALTER TABLE `usuario_data`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `habilidades_usuarios`
--
ALTER TABLE `habilidades_usuarios`
  ADD CONSTRAINT `habilidades_usuarios_ibfk_1` FOREIGN KEY (`user`) REFERENCES `usuario` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `habilidades_usuarios_ibfk_2` FOREIGN KEY (`skill`) REFERENCES `habilidades` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usuario_data`
--
ALTER TABLE `usuario_data`
  ADD CONSTRAINT `usuario_data_ibfk_1` FOREIGN KEY (`user`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
