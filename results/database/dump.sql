-- -------------------------------------------------------------
-- TablePlus 3.11.0(352)
--
-- https://tableplus.com/
--
-- Database: campus_bdd_mysql_reference
-- Generation Time: 2020-12-07 23:46:27.3670
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `categories` (
                              `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                              `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `customers` (
                             `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                             `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                             `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                             `address` text COLLATE utf8mb4_general_ci,
                             `postal_code` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
                             `city` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                             PRIMARY KEY (`id`),
                             UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `orders` (
                          `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                          `number` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                          `customer_id` bigint DEFAULT NULL,
                          `date` datetime DEFAULT NULL,
                          `total` int DEFAULT NULL,
                          PRIMARY KEY (`id`),
                          UNIQUE KEY `id` (`id`),
                          UNIQUE KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `products` (
                            `id` bigint unsigned NOT NULL AUTO_INCREMENT,
                            `category_id` bigint unsigned DEFAULT NULL,
                            `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                            `description` text COLLATE utf8mb4_general_ci,
                            `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
                            `price` int DEFAULT NULL,
                            `weight` int DEFAULT NULL,
                            `available` tinyint(1) DEFAULT NULL,
                            `quantity` int DEFAULT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `id` (`id`),
                            KEY `category_id` (`category_id`),
                            CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



CREATE TABLE `order_product` (
                                 `order_id` bigint unsigned NOT NULL,
                                 `product_id` bigint unsigned NOT NULL,
                                 `quantity` int DEFAULT NULL,
                                 PRIMARY KEY (`order_id`,`product_id`),
                                 KEY `product_id` (`product_id`),
                                 CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
                                 CONSTRAINT `order_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO `categories` (`id`, `name`) VALUES
                                            ('1', 'Fast Food'),
                                            ('2', 'Slow Food'),
                                            ('3', 'Pain & co...');

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `address`, `postal_code`, `city`) VALUES
                                                                                                ('1', 'Chuck', 'Norris', NULL, NULL, NULL),
                                                                                                ('2', 'Charlize', 'Theron', NULL, NULL, NULL),
                                                                                                ('3', 'Ryan', 'Gosling', NULL, NULL, NULL);


INSERT INTO `orders` (`id`, `number`, `customer_id`, `date`, `total`) VALUES
                                                                          ('1', '0000000001', '1', '2020-12-09 21:35:21', NULL),
                                                                          ('2', '0000000002', '1', '2020-12-01 22:35:21', NULL),
                                                                          ('3', '0000000003', '2', '2020-12-01 22:35:21', NULL),
                                                                          ('4', '0000000004', '2', '2020-12-01 22:35:21', NULL),
                                                                          ('5', '0000000005', '2', '2020-12-09 22:35:21', NULL);

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `image`, `price`, `weight`, `available`, `quantity`) VALUES
                                                                                                                             ('1', '1', 'A - Pizza Chorizo ', NULL, 'https://images.unsplash.com/photo-1589477500339-82aeb8718167?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '100', '1000', '1', '10'),
                                                                                                                             ('2', '1', 'A - pizza napoletana', NULL, 'https://images.unsplash.com/photo-1579824218206-e70b13561132?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '100', '1000', '1', '10'),
                                                                                                                             ('3', '1', 'B - Coca', NULL, 'https://images.unsplash.com/photo-1554866585-cd94860890b7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '10', '500', '1', '1'),
                                                                                                                             ('4', '1', 'B - Pepsi', NULL, 'https://images.unsplash.com/photo-1531384370597-8590413be50a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '10', '500', '1', '1'),
                                                                                                                             ('5', '1', 'C - Jus d\'orange', NULL, 'https://images.unsplash.com/photo-1585611680828-24e7b3608ce3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '10', '500', '0', '1'),
                                                                                                                             ('6', '1', 'C - Apple Juice', NULL, 'https://images.unsplash.com/photo-1557753478-d111aef068be?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '10', '500', '0', '1'),
                                                                                                                             ('8', '2', 'D - Avocat', NULL, 'https://images.unsplash.com/photo-1587825045005-c9cc5fa27203?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '13', '500', '1', '0'),
                                                                                                                             ('9', '2', 'D - Courgette', NULL, 'https://images.unsplash.com/photo-1580294672675-91afc00ee7b3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '13', '500', '1', '0'),
                                                                                                                             ('10', '2', 'E - Lime', NULL, 'https://images.unsplash.com/photo-1583777731160-5abdc2fd7ab3?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '50', '1200', '1', '2'),
                                                                                                                             ('11', '2', 'E - Orange', NULL, 'https://images.unsplash.com/photo-1577234192428-7d62bcc3dc7e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '50', '1200', '1', '2'),
                                                                                                                             ('12', '3', 'F - baguette', NULL, 'https://images.unsplash.com/photo-1533782654613-826a072dd6f3?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=500&h=500&q=80', '500', '1200', '1', '5'),
                                                                                                                             ('13', '3', 'F - crepe', NULL, 'https://images.unsplash.com/photo-1519676867240-f03562e64548?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '500', '1200', '1', '5'),
                                                                                                                             ('14', '3', 'F - Bagels', NULL, 'https://images.unsplash.com/photo-1586147210169-4f248d3a4696?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&h=500&q=80', '500', '1200', '1', '5');

INSERT INTO `order_product` (`order_id`, `product_id`, `quantity`) VALUES
                                                                       ('1', '1', '1'),
                                                                       ('1', '3', '2'),
                                                                       ('2', '10', '1'),
                                                                       ('2', '11', '1'),
                                                                       ('2', '12', '1'),
                                                                       ('3', '2', '1'),
                                                                       ('3', '10', '1'),
                                                                       ('4', '3', '2'),
                                                                       ('4', '13', '1'),
                                                                       ('5', '2', '1'),
                                                                       ('5', '14', '1');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
