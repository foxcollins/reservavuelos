-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         8.0.30 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para reservavuelos
CREATE DATABASE IF NOT EXISTS `reservavuelos` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `reservavuelos`;

-- Volcando estructura para tabla reservavuelos.bookings
CREATE TABLE IF NOT EXISTS `bookings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tickets` int NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `flight_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookings_user_id_foreign` (`user_id`),
  KEY `bookings_flight_id_foreign` (`flight_id`),
  CONSTRAINT `bookings_flight_id_foreign` FOREIGN KEY (`flight_id`) REFERENCES `flights` (`id`),
  CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.bookings: ~0 rows (aproximadamente)
DELETE FROM `bookings`;

-- Volcando estructura para tabla reservavuelos.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.failed_jobs: ~0 rows (aproximadamente)
DELETE FROM `failed_jobs`;

-- Volcando estructura para tabla reservavuelos.flights
CREATE TABLE IF NOT EXISTS `flights` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `hometown` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `destination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departure_at` timestamp NOT NULL,
  `arrival_at` timestamp NOT NULL,
  `capacity` int NOT NULL,
  `price` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.flights: ~200 rows (aproximadamente)
DELETE FROM `flights`;
INSERT INTO `flights` (`id`, `hometown`, `destination`, `departure_at`, `arrival_at`, `capacity`, `price`, `created_at`, `updated_at`) VALUES
	(1, 'Medellín', 'Ibagué', '2023-06-21 09:37:45', '2023-06-21 19:41:27', 28, 88.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(2, 'Cali', 'Barranquilla', '2023-06-25 21:58:46', '2023-06-25 23:32:51', 39, 192.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(3, 'Cartagena', 'Barranquilla', '2023-06-23 14:03:59', '2023-06-23 17:18:08', 28, 98.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(4, 'Santa Marta', 'Manizales', '2023-06-26 03:14:12', '2023-06-26 04:56:38', 37, 135.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(5, 'Ibagué', 'Cartagena', '2023-06-25 15:49:29', '2023-06-25 22:39:06', 29, 198.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(6, 'Bogotá', 'Santa Marta', '2023-06-24 02:59:57', '2023-06-24 07:29:50', 34, 75.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(7, 'Bogotá', 'Santa Marta', '2023-06-24 23:19:38', '2023-06-25 07:29:02', 30, 95.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(8, 'Cartagena', 'Barranquilla', '2023-06-21 05:58:05', '2023-06-21 10:39:54', 32, 93.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(9, 'Medellín', 'Cali', '2023-06-22 03:57:15', '2023-06-22 10:28:37', 34, 400.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(10, 'Bucaramanga', 'Barranquilla', '2023-06-20 13:11:11', '2023-06-20 20:40:17', 33, 133.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(11, 'Pereira', 'Santa Marta', '2023-06-21 21:11:18', '2023-06-22 04:46:43', 28, 332.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(12, 'Pereira', 'Santa Marta', '2023-06-24 13:03:47', '2023-06-24 16:16:03', 37, 278.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(13, 'Cartagena', 'Cali', '2023-06-20 22:11:23', '2023-06-21 07:50:54', 33, 206.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(14, 'Medellín', 'Santa Marta', '2023-06-23 22:52:54', '2023-06-23 23:44:04', 22, 210.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(15, 'Barranquilla', 'Santa Marta', '2023-06-21 00:12:06', '2023-06-21 03:25:56', 39, 47.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(16, 'Medellín', 'Cartagena', '2023-06-26 04:35:58', '2023-06-26 13:12:54', 20, 67.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(17, 'Medellín', 'Manizales', '2023-06-20 14:40:03', '2023-06-20 19:56:32', 27, 366.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(18, 'Santa Marta', 'Cali', '2023-06-22 00:02:46', '2023-06-22 07:16:26', 39, 323.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(19, 'Santa Marta', 'Cartagena', '2023-06-24 03:58:37', '2023-06-24 13:54:10', 22, 112.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(20, 'Medellín', 'Barranquilla', '2023-06-20 15:15:30', '2023-06-20 16:44:42', 25, 161.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(21, 'Bucaramanga', 'Cali', '2023-06-25 19:15:28', '2023-06-25 21:27:35', 20, 365.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(22, 'Manizales', 'Bogotá', '2023-06-26 17:45:13', '2023-06-27 04:56:53', 36, 123.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(23, 'Santa Marta', 'Cali', '2023-06-26 06:08:20', '2023-06-26 08:26:28', 34, 373.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(24, 'Barranquilla', 'Pereira', '2023-06-20 19:07:54', '2023-06-21 06:24:21', 23, 150.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(25, 'Pereira', 'Cali', '2023-06-23 22:22:45', '2023-06-24 03:52:43', 20, 270.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(26, 'Cali', 'Medellín', '2023-06-23 06:58:37', '2023-06-23 14:41:25', 32, 164.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(27, 'Barranquilla', 'Santa Marta', '2023-06-27 02:28:08', '2023-06-27 09:53:47', 22, 400.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(28, 'Santa Marta', 'Pereira', '2023-06-24 19:59:40', '2023-06-24 21:49:29', 20, 250.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(29, 'Manizales', 'Pereira', '2023-06-26 16:05:59', '2023-06-26 22:16:07', 25, 249.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(30, 'Pereira', 'Barranquilla', '2023-06-20 22:34:04', '2023-06-21 08:39:43', 32, 28.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(31, 'Cartagena', 'Manizales', '2023-06-23 17:24:03', '2023-06-23 20:07:46', 36, 393.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(32, 'Pereira', 'Cartagena', '2023-06-24 09:13:45', '2023-06-24 18:03:01', 37, 157.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(33, 'Cali', 'Barranquilla', '2023-06-25 22:45:10', '2023-06-26 00:06:11', 27, 63.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(34, 'Pereira', 'Barranquilla', '2023-06-25 17:33:10', '2023-06-26 02:29:27', 24, 292.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(35, 'Santa Marta', 'Bucaramanga', '2023-06-23 01:23:54', '2023-06-23 09:53:21', 28, 376.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(36, 'Cali', 'Ibagué', '2023-06-23 00:02:58', '2023-06-23 08:25:02', 33, 240.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(37, 'Bucaramanga', 'Cartagena', '2023-06-26 05:33:27', '2023-06-26 14:31:39', 21, 137.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(38, 'Cartagena', 'Pereira', '2023-06-22 18:50:29', '2023-06-22 18:52:53', 22, 299.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(39, 'Barranquilla', 'Pereira', '2023-06-23 05:01:22', '2023-06-23 15:23:04', 31, 196.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(40, 'Manizales', 'Medellín', '2023-06-20 13:18:32', '2023-06-20 19:03:14', 25, 131.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(41, 'Cartagena', 'Santa Marta', '2023-06-22 05:00:13', '2023-06-22 12:49:31', 25, 235.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(42, 'Cartagena', 'Barranquilla', '2023-06-26 04:36:21', '2023-06-26 08:45:46', 21, 369.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(43, 'Ibagué', 'Medellín', '2023-06-21 15:34:22', '2023-06-22 02:16:29', 24, 118.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(44, 'Pereira', 'Manizales', '2023-06-26 12:08:41', '2023-06-26 23:08:03', 31, 181.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(45, 'Cali', 'Bucaramanga', '2023-06-26 20:34:14', '2023-06-27 06:24:27', 21, 304.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(46, 'Manizales', 'Cartagena', '2023-06-21 08:05:38', '2023-06-21 15:11:22', 33, 374.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(47, 'Ibagué', 'Cali', '2023-06-25 02:00:09', '2023-06-25 09:15:41', 25, 383.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(48, 'Medellín', 'Pereira', '2023-06-21 02:52:07', '2023-06-21 13:15:02', 27, 101.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(49, 'Santa Marta', 'Medellín', '2023-06-21 13:17:10', '2023-06-21 13:38:04', 21, 56.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(50, 'Barranquilla', 'Ibagué', '2023-06-21 00:17:36', '2023-06-21 07:59:05', 34, 283.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(51, 'Bogotá', 'Bucaramanga', '2023-06-24 12:31:18', '2023-06-24 12:38:59', 33, 182.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(52, 'Barranquilla', 'Cartagena', '2023-06-22 13:45:25', '2023-06-23 00:02:25', 40, 44.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(53, 'Cali', 'Bogotá', '2023-06-22 12:51:42', '2023-06-22 21:50:56', 39, 382.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(54, 'Cartagena', 'Ibagué', '2023-06-27 02:05:19', '2023-06-27 03:53:35', 21, 370.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(55, 'Cali', 'Barranquilla', '2023-06-25 04:19:07', '2023-06-25 09:55:53', 35, 349.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(56, 'Santa Marta', 'Cali', '2023-06-22 09:10:19', '2023-06-22 10:49:10', 26, 274.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(57, 'Medellín', 'Santa Marta', '2023-06-25 12:10:35', '2023-06-25 19:54:04', 31, 126.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(58, 'Bogotá', 'Medellín', '2023-06-24 04:30:07', '2023-06-24 12:20:15', 32, 167.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(59, 'Santa Marta', 'Bogotá', '2023-06-25 10:19:54', '2023-06-25 13:34:45', 30, 310.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(60, 'Cartagena', 'Bucaramanga', '2023-06-23 19:06:00', '2023-06-24 03:35:02', 40, 361.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(61, 'Medellín', 'Cali', '2023-06-27 06:13:18', '2023-06-27 16:12:33', 24, 79.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(62, 'Medellín', 'Barranquilla', '2023-06-25 20:26:39', '2023-06-26 00:03:13', 28, 231.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(63, 'Cartagena', 'Bogotá', '2023-06-25 12:28:53', '2023-06-25 20:21:26', 28, 327.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(64, 'Manizales', 'Medellín', '2023-06-26 00:19:00', '2023-06-26 07:51:33', 23, 105.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(65, 'Manizales', 'Bucaramanga', '2023-06-27 03:16:03', '2023-06-27 03:22:01', 25, 227.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(66, 'Santa Marta', 'Pereira', '2023-06-27 04:38:13', '2023-06-27 10:03:51', 39, 340.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(67, 'Santa Marta', 'Barranquilla', '2023-06-24 19:02:16', '2023-06-25 06:31:16', 26, 318.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(68, 'Ibagué', 'Manizales', '2023-06-22 00:43:49', '2023-06-22 06:57:04', 21, 274.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(69, 'Santa Marta', 'Pereira', '2023-06-21 00:52:34', '2023-06-21 12:38:41', 28, 167.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(70, 'Bucaramanga', 'Cali', '2023-06-22 14:35:00', '2023-06-22 15:56:32', 21, 127.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(71, 'Manizales', 'Bucaramanga', '2023-06-23 04:10:43', '2023-06-23 09:43:28', 36, 266.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(72, 'Medellín', 'Ibagué', '2023-06-23 07:43:55', '2023-06-23 16:58:40', 34, 339.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(73, 'Cartagena', 'Bucaramanga', '2023-06-27 06:08:57', '2023-06-27 08:50:26', 28, 59.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(74, 'Bucaramanga', 'Ibagué', '2023-06-22 02:12:18', '2023-06-22 09:46:42', 28, 223.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(75, 'Pereira', 'Cartagena', '2023-06-21 08:12:05', '2023-06-21 12:47:33', 40, 275.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(76, 'Manizales', 'Cartagena', '2023-06-21 10:32:46', '2023-06-21 22:29:40', 27, 154.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(77, 'Bogotá', 'Manizales', '2023-06-23 05:42:08', '2023-06-23 17:41:11', 23, 214.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(78, 'Manizales', 'Bogotá', '2023-06-22 20:14:31', '2023-06-23 06:03:15', 28, 42.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(79, 'Pereira', 'Medellín', '2023-06-25 00:01:17', '2023-06-25 09:13:13', 34, 282.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(80, 'Medellín', 'Barranquilla', '2023-06-25 04:33:25', '2023-06-25 06:49:28', 33, 106.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(81, 'Barranquilla', 'Bogotá', '2023-06-21 06:30:45', '2023-06-21 06:34:25', 29, 372.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(82, 'Barranquilla', 'Bogotá', '2023-06-24 00:32:29', '2023-06-24 11:03:01', 36, 235.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(83, 'Bucaramanga', 'Pereira', '2023-06-26 07:32:58', '2023-06-26 18:10:03', 38, 204.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(84, 'Bogotá', 'Barranquilla', '2023-06-23 10:23:52', '2023-06-23 15:22:19', 34, 334.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(85, 'Barranquilla', 'Bogotá', '2023-06-25 04:25:23', '2023-06-25 07:04:31', 36, 313.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(86, 'Bucaramanga', 'Cartagena', '2023-06-20 13:15:35', '2023-06-21 00:11:29', 40, 367.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(87, 'Bogotá', 'Bucaramanga', '2023-06-26 14:00:23', '2023-06-26 20:23:57', 20, 202.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(88, 'Pereira', 'Santa Marta', '2023-06-21 08:38:24', '2023-06-21 15:51:34', 38, 336.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(89, 'Santa Marta', 'Manizales', '2023-06-26 17:42:58', '2023-06-27 04:46:23', 25, 107.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(90, 'Manizales', 'Cartagena', '2023-06-23 00:27:32', '2023-06-23 10:56:48', 34, 223.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(91, 'Ibagué', 'Cartagena', '2023-06-26 01:34:27', '2023-06-26 06:31:24', 29, 134.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(92, 'Ibagué', 'Cali', '2023-06-21 02:36:00', '2023-06-21 14:31:29', 21, 38.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(93, 'Medellín', 'Ibagué', '2023-06-23 08:03:06', '2023-06-23 19:53:28', 25, 360.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(94, 'Medellín', 'Pereira', '2023-06-23 06:35:38', '2023-06-23 11:57:30', 35, 110.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(95, 'Bucaramanga', 'Bogotá', '2023-06-21 13:32:09', '2023-06-21 14:35:22', 33, 199.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(96, 'Pereira', 'Santa Marta', '2023-06-23 03:04:31', '2023-06-23 09:38:31', 33, 361.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(97, 'Ibagué', 'Medellín', '2023-06-21 08:41:59', '2023-06-21 16:39:19', 27, 226.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(98, 'Barranquilla', 'Pereira', '2023-06-22 14:09:02', '2023-06-22 16:41:30', 39, 360.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(99, 'Ibagué', 'Barranquilla', '2023-06-27 11:31:29', '2023-06-27 16:14:31', 24, 182.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(100, 'Barranquilla', 'Santa Marta', '2023-06-22 01:42:58', '2023-06-22 12:55:34', 30, 69.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(101, 'Cartagena', 'Cali', '2023-06-24 05:21:03', '2023-06-24 07:36:43', 20, 147.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(102, 'Bogotá', 'Ibagué', '2023-06-27 04:31:01', '2023-06-27 11:55:56', 31, 297.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(103, 'Bogotá', 'Cali', '2023-06-23 18:13:23', '2023-06-24 04:30:50', 22, 302.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(104, 'Barranquilla', 'Cartagena', '2023-06-26 11:00:02', '2023-06-26 11:08:29', 29, 58.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(105, 'Pereira', 'Barranquilla', '2023-06-25 16:59:36', '2023-06-25 18:13:49', 24, 60.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(106, 'Pereira', 'Manizales', '2023-06-20 14:44:42', '2023-06-20 23:51:45', 22, 165.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(107, 'Santa Marta', 'Pereira', '2023-06-20 12:21:24', '2023-06-20 16:01:26', 24, 114.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(108, 'Santa Marta', 'Manizales', '2023-06-23 08:51:54', '2023-06-23 17:42:54', 21, 321.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(109, 'Medellín', 'Santa Marta', '2023-06-21 13:49:59', '2023-06-22 00:01:35', 26, 336.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(110, 'Cartagena', 'Bogotá', '2023-06-25 18:09:55', '2023-06-25 23:52:46', 31, 342.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(111, 'Bogotá', 'Cali', '2023-06-24 05:38:01', '2023-06-24 06:54:51', 21, 234.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(112, 'Cartagena', 'Bogotá', '2023-06-27 02:42:04', '2023-06-27 06:25:16', 29, 317.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(113, 'Manizales', 'Bucaramanga', '2023-06-27 02:39:37', '2023-06-27 05:14:59', 38, 353.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(114, 'Cali', 'Pereira', '2023-06-26 16:05:42', '2023-06-26 21:29:11', 27, 124.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(115, 'Manizales', 'Bogotá', '2023-06-25 21:25:15', '2023-06-26 00:50:50', 37, 94.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(116, 'Barranquilla', 'Manizales', '2023-06-22 15:14:22', '2023-06-22 17:11:40', 22, 98.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(117, 'Ibagué', 'Manizales', '2023-06-26 19:08:36', '2023-06-27 00:42:04', 30, 147.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(118, 'Cartagena', 'Ibagué', '2023-06-21 23:55:09', '2023-06-22 11:05:52', 26, 183.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(119, 'Pereira', 'Ibagué', '2023-06-25 21:34:15', '2023-06-26 09:04:51', 25, 69.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(120, 'Santa Marta', 'Bogotá', '2023-06-24 10:54:13', '2023-06-24 15:28:47', 35, 160.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(121, 'Pereira', 'Bogotá', '2023-06-22 20:57:13', '2023-06-23 02:01:32', 35, 255.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(122, 'Cartagena', 'Bogotá', '2023-06-26 05:25:34', '2023-06-26 07:54:02', 40, 389.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(123, 'Bucaramanga', 'Cartagena', '2023-06-21 15:39:37', '2023-06-21 20:39:25', 23, 283.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(124, 'Cali', 'Santa Marta', '2023-06-25 09:03:32', '2023-06-25 09:48:59', 21, 20.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(125, 'Barranquilla', 'Pereira', '2023-06-20 20:46:49', '2023-06-21 00:32:54', 23, 246.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(126, 'Cali', 'Bucaramanga', '2023-06-27 00:25:22', '2023-06-27 04:42:54', 35, 202.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(127, 'Bogotá', 'Barranquilla', '2023-06-21 21:22:35', '2023-06-22 06:39:09', 28, 59.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(128, 'Bucaramanga', 'Manizales', '2023-06-24 20:38:37', '2023-06-24 21:01:08', 36, 97.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(129, 'Barranquilla', 'Ibagué', '2023-06-22 19:28:57', '2023-06-23 02:48:53', 28, 302.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(130, 'Manizales', 'Cali', '2023-06-22 08:11:23', '2023-06-22 19:19:24', 35, 270.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(131, 'Bucaramanga', 'Barranquilla', '2023-06-21 15:46:45', '2023-06-21 16:00:28', 27, 386.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(132, 'Bucaramanga', 'Manizales', '2023-06-25 12:35:24', '2023-06-25 22:52:18', 35, 190.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(133, 'Barranquilla', 'Pereira', '2023-06-24 12:19:18', '2023-06-24 15:51:15', 28, 85.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(134, 'Bogotá', 'Pereira', '2023-06-27 00:38:07', '2023-06-27 02:33:10', 28, 108.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(135, 'Cartagena', 'Bogotá', '2023-06-25 02:00:34', '2023-06-25 13:15:14', 33, 271.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(136, 'Medellín', 'Cali', '2023-06-21 04:55:00', '2023-06-21 11:20:49', 24, 336.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(137, 'Bucaramanga', 'Bogotá', '2023-06-26 17:06:31', '2023-06-27 01:59:49', 34, 35.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(138, 'Cartagena', 'Pereira', '2023-06-21 16:17:27', '2023-06-21 21:47:40', 21, 276.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(139, 'Medellín', 'Ibagué', '2023-06-23 13:11:50', '2023-06-23 15:37:10', 20, 63.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(140, 'Cali', 'Bucaramanga', '2023-06-25 09:45:08', '2023-06-25 19:26:27', 26, 214.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(141, 'Manizales', 'Bogotá', '2023-06-21 18:15:09', '2023-06-21 21:32:35', 26, 48.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(142, 'Santa Marta', 'Ibagué', '2023-06-27 09:53:32', '2023-06-27 16:44:47', 28, 291.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(143, 'Barranquilla', 'Cali', '2023-06-24 03:09:34', '2023-06-24 11:24:26', 40, 339.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(144, 'Ibagué', 'Bogotá', '2023-06-21 18:14:06', '2023-06-21 23:08:49', 25, 265.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(145, 'Santa Marta', 'Medellín', '2023-06-21 08:49:21', '2023-06-21 18:23:13', 37, 373.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(146, 'Santa Marta', 'Bogotá', '2023-06-20 23:07:33', '2023-06-21 02:01:52', 35, 335.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(147, 'Ibagué', 'Bucaramanga', '2023-06-25 02:36:13', '2023-06-25 13:34:17', 25, 129.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(148, 'Bucaramanga', 'Bogotá', '2023-06-23 08:22:18', '2023-06-23 12:20:13', 25, 195.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(149, 'Ibagué', 'Bucaramanga', '2023-06-22 18:19:41', '2023-06-23 03:30:53', 35, 56.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(150, 'Cartagena', 'Medellín', '2023-06-26 01:00:39', '2023-06-26 07:55:43', 36, 76.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(151, 'Cali', 'Medellín', '2023-06-26 01:34:54', '2023-06-26 05:34:34', 22, 309.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(152, 'Cali', 'Ibagué', '2023-06-25 03:08:37', '2023-06-25 08:42:38', 22, 31.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(153, 'Manizales', 'Medellín', '2023-06-24 02:34:46', '2023-06-24 11:12:51', 31, 330.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(154, 'Pereira', 'Manizales', '2023-06-26 18:05:35', '2023-06-26 23:51:05', 32, 199.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(155, 'Manizales', 'Medellín', '2023-06-24 15:37:51', '2023-06-24 20:16:15', 35, 320.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(156, 'Cali', 'Bucaramanga', '2023-06-25 00:37:19', '2023-06-25 04:30:29', 24, 236.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(157, 'Santa Marta', 'Medellín', '2023-06-23 15:12:59', '2023-06-23 17:06:19', 22, 47.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(158, 'Ibagué', 'Manizales', '2023-06-25 08:30:36', '2023-06-25 08:46:20', 35, 56.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(159, 'Pereira', 'Manizales', '2023-06-23 05:46:36', '2023-06-23 13:16:09', 21, 334.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(160, 'Ibagué', 'Cartagena', '2023-06-24 10:43:43', '2023-06-24 19:02:09', 39, 307.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(161, 'Medellín', 'Barranquilla', '2023-06-21 23:25:10', '2023-06-22 00:10:59', 31, 146.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(162, 'Bucaramanga', 'Bogotá', '2023-06-24 07:17:09', '2023-06-24 15:42:51', 36, 142.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(163, 'Medellín', 'Cali', '2023-06-26 07:51:33', '2023-06-26 14:56:18', 40, 255.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(164, 'Medellín', 'Ibagué', '2023-06-24 19:35:34', '2023-06-25 06:03:51', 33, 392.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(165, 'Manizales', 'Cali', '2023-06-23 13:52:53', '2023-06-23 18:47:54', 22, 364.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(166, 'Santa Marta', 'Barranquilla', '2023-06-24 05:54:32', '2023-06-24 13:22:07', 34, 155.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(167, 'Cartagena', 'Bucaramanga', '2023-06-21 06:21:23', '2023-06-21 07:08:05', 32, 175.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(168, 'Bogotá', 'Cali', '2023-06-22 12:37:20', '2023-06-22 21:02:44', 27, 128.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(169, 'Cali', 'Ibagué', '2023-06-24 03:37:22', '2023-06-24 12:31:09', 22, 365.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(170, 'Santa Marta', 'Manizales', '2023-06-27 11:17:20', '2023-06-27 18:32:23', 21, 379.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(171, 'Ibagué', 'Bucaramanga', '2023-06-23 16:58:53', '2023-06-24 00:09:25', 26, 387.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(172, 'Pereira', 'Santa Marta', '2023-06-26 01:54:05', '2023-06-26 08:43:47', 33, 301.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(173, 'Bogotá', 'Cartagena', '2023-06-25 10:41:18', '2023-06-25 17:56:38', 40, 268.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(174, 'Barranquilla', 'Bucaramanga', '2023-06-21 05:53:15', '2023-06-21 15:51:32', 29, 308.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(175, 'Bogotá', 'Medellín', '2023-06-21 14:43:29', '2023-06-21 21:31:51', 36, 203.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(176, 'Santa Marta', 'Ibagué', '2023-06-26 15:42:08', '2023-06-27 00:03:51', 35, 163.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(177, 'Bucaramanga', 'Pereira', '2023-06-21 04:37:05', '2023-06-21 16:35:40', 39, 359.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(178, 'Pereira', 'Santa Marta', '2023-06-21 18:23:02', '2023-06-22 01:49:24', 23, 65.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(179, 'Santa Marta', 'Cali', '2023-06-24 05:40:14', '2023-06-24 17:34:07', 32, 220.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(180, 'Manizales', 'Cali', '2023-06-22 09:52:47', '2023-06-22 19:46:44', 30, 283.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(181, 'Bucaramanga', 'Cartagena', '2023-06-24 09:35:55', '2023-06-24 18:56:37', 27, 353.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(182, 'Manizales', 'Bogotá', '2023-06-22 11:56:38', '2023-06-22 22:03:43', 20, 317.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(183, 'Cartagena', 'Santa Marta', '2023-06-21 11:57:25', '2023-06-21 19:23:59', 31, 236.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(184, 'Barranquilla', 'Cali', '2023-06-20 23:43:40', '2023-06-21 00:54:45', 22, 137.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(185, 'Bogotá', 'Cartagena', '2023-06-26 23:26:19', '2023-06-27 01:32:21', 21, 360.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(186, 'Barranquilla', 'Bucaramanga', '2023-06-21 11:21:25', '2023-06-21 16:57:51', 26, 270.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(187, 'Cali', 'Bucaramanga', '2023-06-24 15:47:54', '2023-06-24 17:18:11', 27, 389.00, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(188, 'Medellín', 'Cartagena', '2023-06-27 00:02:04', '2023-06-27 03:51:38', 36, 337.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(189, 'Bogotá', 'Ibagué', '2023-06-23 11:42:40', '2023-06-23 13:43:57', 34, 161.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(190, 'Cartagena', 'Barranquilla', '2023-06-25 00:55:57', '2023-06-25 05:33:31', 35, 346.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(191, 'Cartagena', 'Medellín', '2023-06-26 04:59:20', '2023-06-26 12:45:16', 20, 255.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(192, 'Cartagena', 'Santa Marta', '2023-06-27 09:34:59', '2023-06-27 18:27:52', 33, 128.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(193, 'Bucaramanga', 'Barranquilla', '2023-06-24 17:15:24', '2023-06-25 02:42:08', 40, 275.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(194, 'Bogotá', 'Medellín', '2023-06-20 11:53:18', '2023-06-20 21:02:01', 26, 46.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(195, 'Cartagena', 'Santa Marta', '2023-06-23 17:33:59', '2023-06-24 05:00:32', 32, 34.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(196, 'Manizales', 'Cartagena', '2023-06-22 00:52:26', '2023-06-22 08:34:42', 31, 299.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(197, 'Bucaramanga', 'Manizales', '2023-06-24 06:35:30', '2023-06-24 10:33:32', 38, 172.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(198, 'Pereira', 'Manizales', '2023-06-24 08:00:54', '2023-06-24 16:12:26', 34, 223.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(199, 'Santa Marta', 'Barranquilla', '2023-06-21 12:13:58', '2023-06-21 18:20:42', 27, 373.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27'),
	(200, 'Cartagena', 'Manizales', '2023-06-23 05:19:35', '2023-06-23 07:36:19', 32, 291.00, '2023-06-20 11:40:27', '2023-06-20 11:40:27');

-- Volcando estructura para tabla reservavuelos.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.migrations: ~8 rows (aproximadamente)
DELETE FROM `migrations`;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
	(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
	(4, '2019_08_19_000000_create_failed_jobs_table', 1),
	(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(6, '2023_06_18_015718_create_sessions_table', 1),
	(7, '2023_06_18_020309_create_flights_table', 1),
	(8, '2023_06_18_020337_create_bookings_table', 1);

-- Volcando estructura para tabla reservavuelos.password_reset_tokens
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.password_reset_tokens: ~0 rows (aproximadamente)
DELETE FROM `password_reset_tokens`;

-- Volcando estructura para tabla reservavuelos.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.personal_access_tokens: ~0 rows (aproximadamente)
DELETE FROM `personal_access_tokens`;

-- Volcando estructura para tabla reservavuelos.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.sessions: ~0 rows (aproximadamente)
DELETE FROM `sessions`;

-- Volcando estructura para tabla reservavuelos.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint unsigned DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla reservavuelos.users: ~21 rows (aproximadamente)
DELETE FROM `users`;
INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`) VALUES
	(1, 'Prof. Cleveland Connelly', 'psteuber@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'Gxh7SaPEXB', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(2, 'Kristian Harvey', 'jakubowski.jeffrey@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'zR62QHdCLU', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(3, 'Layne McCullough', 'langosh.ayla@example.com', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'ZA8KngJMjk', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(4, 'Jairo Runte', 'fsauer@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '7KdWZL5oiS', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(5, 'Gonzalo Considine', 'grant.watsica@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'pwpRxtojUx', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(6, 'Eula Zieme', 'uwelch@example.com', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'p6X7uOqZCg', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(7, 'Guadalupe Wolff IV', 'gabbott@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'd35MvMCTCC', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(8, 'Mrs. Mona Mraz MD', 'shyann48@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'IDFHZyS4k1', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(9, 'Daisha Morissette', 'taylor.ledner@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'XojSPKSzoH', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(10, 'Prof. Adolfo Sanford', 'pansy00@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'TUPysBooju', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(11, 'Soledad Cruickshank Sr.', 'maria86@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '1OWvqm8yPK', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(12, 'Heath Mohr', 'jlind@example.com', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'RiCsdoz084', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(13, 'Miss Helga Hilpert DVM', 'corine22@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'd2mCLevPu5', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(14, 'Prof. Saige Christiansen', 'ybeer@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'X7WJoN1mjQ', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(15, 'Prof. Angeline Franecki Jr.', 'charley00@example.com', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'efpqKVHP76', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(16, 'Ned Gerlach', 'pwillms@example.net', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'NnNm4AldV1', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(17, 'Shayne Kutch', 'rahsaan83@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'rFqAmC35VU', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(18, 'Cleta Jacobson', 'wdenesik@example.com', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'BJ5GC4SsHw', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(19, 'Anna Kohler PhD', 'viva.walker@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'xyFJ8AvZgQ', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(20, 'Patrick Kiehn I', 'jmraz@example.org', '2023-06-20 11:40:26', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'upRiWcgSdL', NULL, NULL, '2023-06-20 11:40:26', '2023-06-20 11:40:26'),
	(21, 'Luis', 'luis@admin.com', '2023-06-20 11:40:27', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, '8gLelUlmSb', NULL, NULL, '2023-06-20 11:40:27', '2023-06-20 11:40:27');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
