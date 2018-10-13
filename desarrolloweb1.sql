-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.34-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para desarrolloweb1
CREATE DATABASE IF NOT EXISTS `desarrolloweb1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `desarrolloweb1`;

-- Volcando estructura para tabla desarrolloweb1.tipousuario
CREATE TABLE IF NOT EXISTS `tipousuario` (
  `id_tipousuario` int(11) NOT NULL AUTO_INCREMENT,
  `tipousuario` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tipousuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla desarrolloweb1.tipousuario: ~5 rows (aproximadamente)
DELETE FROM `tipousuario`;
/*!40000 ALTER TABLE `tipousuario` DISABLE KEYS */;
INSERT INTO `tipousuario` (`id_tipousuario`, `tipousuario`) VALUES
	(1, 'Estudiante'),
	(2, 'Docente'),
	(3, 'Administrativo'),
	(4, 'seguridad'),
	(5, 'Conserje');
/*!40000 ALTER TABLE `tipousuario` ENABLE KEYS */;

-- Volcando estructura para tabla desarrolloweb1.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `id_tipousuario` varchar(255) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla desarrolloweb1.usuario: ~17 rows (aproximadamente)
DELETE FROM `usuario`;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `id_tipousuario`) VALUES
	(1, 'Erick', 'Garrido', '2'),
	(2, 'Rodolfo', 'Pardo', '2'),
	(3, 'Marcelo', 'Toledo', '2'),
	(4, 'Tais', 'Melio', '2'),
	(5, 'Rodrigo', 'Bravo', '2'),
	(6, 'Matias', 'Valenzuela', '2'),
	(7, 'Bastian', 'Gonzalez', '2'),
	(8, 'Patricio', 'Tamayo', '2'),
	(9, 'Oscar', 'Caceres', '2'),
	(10, 'Eduard', 'Sandoval', '2'),
	(11, 'Alejandro', 'Galicia', '2'),
	(12, 'Luis', 'Faundez', '2'),
	(13, 'José', 'Acuña', '1'),
	(14, 'Hernan', 'Pineda', '2'),
	(15, 'Cristopher', 'Astorga', '2'),
	(16, 'Patricia', 'Mendez', '1'),
	(35, 'Alejandro', 'Faundez', '5');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
