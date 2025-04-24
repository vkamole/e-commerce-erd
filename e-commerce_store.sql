USE ecommerce_db;
-- Use the ecommerce_db database for all subsequent operations
CREATE TABLE `brand` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `product_category` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL
);

CREATE TABLE `product` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `brand_id` INT,
  `category_id` INT,
  `base_price` DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (`brand_id`) REFERENCES `brand`(`id`),
  FOREIGN KEY (`category_id`) REFERENCES `product_category`(`id`)
);

-- Variation Tables
CREATE TABLE `color` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `hex_code` VARCHAR(7)
);

CREATE TABLE `size_category` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `size_option` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `size_category_id` INT NOT NULL,
  `value` VARCHAR(20) NOT NULL,
  FOREIGN KEY (`size_category_id`) REFERENCES `size_category`(`id`)
);

CREATE TABLE `product_variation` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `color_id` INT,
  `size_id` INT,
  FOREIGN KEY (`product_id`) REFERENCES `product`(`id`),
  FOREIGN KEY (`color_id`) REFERENCES `color`(`id`),
  FOREIGN KEY (`size_id`) REFERENCES `size_option`(`id`)
);