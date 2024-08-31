-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.6.18-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para controldevisitantes
DROP DATABASE IF EXISTS `controldevisitantes`;
CREATE DATABASE IF NOT EXISTS `controldevisitantes` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `controldevisitantes`;

-- Volcando estructura para tabla controldevisitantes.departamentos
DROP TABLE IF EXISTS `departamentos`;
CREATE TABLE IF NOT EXISTS `departamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `empresafilial_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_departamentos_usuarios` (`usuario_id`),
  KEY `FK2departamento_empresafilial` (`empresafilial_id`),
  CONSTRAINT `FK2departamento_empresafilial` FOREIGN KEY (`empresafilial_id`) REFERENCES `empresas_filialiales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_departamentos_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla controldevisitantes.departamentos: ~0 rows (aproximadamente)
INSERT INTO `departamentos` (`id`, `nombre`, `usuario_id`, `empresafilial_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'informatica', 1, 1, '2024-08-07 18:09:48', '2024-08-07 18:09:50', NULL);

-- Volcando estructura para tabla controldevisitantes.empresas_filialiales
DROP TABLE IF EXISTS `empresas_filialiales`;
CREATE TABLE IF NOT EXISTS `empresas_filialiales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rif` varchar(255) DEFAULT NULL,
  `razon_social` varchar(250) DEFAULT NULL,
  `siglas` varchar(250) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_empresas_filialiales_usuarios` (`usuario_id`),
  CONSTRAINT `FK_empresas_filialiales_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla controldevisitantes.empresas_filialiales: ~6 rows (aproximadamente)
INSERT INTO `empresas_filialiales` (`id`, `rif`, `razon_social`, `siglas`, `usuario_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, 'g11111111', 'corporacion socialista del cemento', 'csc', 1, '2024-08-07 17:56:07', '2024-08-07 17:56:07', NULL),
	(2, 'g22222222', 'cemento andino', 'andino', 1, '2024-08-07 17:56:43', '2024-08-07 17:56:44', NULL),
	(3, 'g3333333', 'venezolana de cemento', 'vencemos', 1, '2024-08-07 17:57:19', '2024-08-07 17:57:19', NULL),
	(4, 'g44444444', 'cemento cerro azul', 'cca', 1, '2024-08-07 17:58:08', '2024-08-07 17:58:09', NULL),
	(5, 'g55555555', 'fabrica nacional de cemento', 'fnc', 1, '2024-08-07 17:59:00', '2024-08-07 17:59:01', NULL),
	(6, 'g6777777', 'empressa nacional de transporte', 'entipi', 1, '2024-08-07 18:00:02', '2024-08-07 18:00:03', NULL);

-- Volcando estructura para tabla controldevisitantes.roles
DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla controldevisitantes.roles: ~3 rows (aproximadamente)
INSERT INTO `roles` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
	(1, 'visitante', 'persona que ingresa a la empresa', '2024-08-07 17:46:36', '2024-08-07 17:46:38'),
	(2, 'auxiliar', 'usuario auxiliar del sistema', '2024-08-07 17:47:26', '2024-08-07 17:47:29'),
	(3, 'administrador', 'usuario administrador', '2024-08-07 17:47:56', '2024-08-07 17:47:58');

-- Volcando estructura para tabla controldevisitantes.usuarios
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` int(8) DEFAULT NULL,
  `esta_activo` int(1) DEFAULT NULL,
  `rol_id` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_usuarios_roles` (`rol_id`),
  CONSTRAINT `FK_usuarios_roles` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla controldevisitantes.usuarios: ~2 rows (aproximadamente)
INSERT INTO `usuarios` (`id`, `username`, `password`, `nombre`, `apellido`, `cedula`, `esta_activo`, `rol_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(1, '1234567890', '1234567890', 'ggggggggg', 'gggggggggg', 12345689, 1, 3, '2024-08-07 17:51:49', '2024-08-07 17:51:57', NULL),
	(2, 'diomar', '1234567890', 'diomar', 'torrealba', 29595148, 1, NULL, '2024-08-13 17:53:02', '2024-08-13 17:53:03', '2024-08-13 17:53:04'),
	(3, 'sada', '1232', 'w3q4', 'q4q4', 12313, NULL, 1, NULL, NULL, NULL),
	(4, 'wicho', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(5, 'adsadsa', 'sadsada', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- Volcando estructura para tabla controldevisitantes.visitantes
DROP TABLE IF EXISTS `visitantes`;
CREATE TABLE IF NOT EXISTS `visitantes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `cedula` int(11) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `departamento_id` int(11) DEFAULT NULL,
  `filial_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_visitantes_departamentos` (`departamento_id`),
  KEY `FK_visitantes_empresas_filialiales` (`filial_id`),
  CONSTRAINT `FK_visitantes_departamentos` FOREIGN KEY (`departamento_id`) REFERENCES `departamentos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_visitantes_empresas_filialiales` FOREIGN KEY (`filial_id`) REFERENCES `empresas_filialiales` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla controldevisitantes.visitantes: ~2 rows (aproximadamente)
INSERT INTO `visitantes` (`id`, `nombre`, `apellido`, `cedula`, `telefono`, `departamento_id`, `filial_id`, `created_at`, `updated_at`, `deleted_at`) VALUES
	(35, 'dio', 'fiio', 85785785, 5785785, NULL, NULL, '2024-08-13 18:11:10', '2024-08-13 18:11:11', NULL),
	(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
