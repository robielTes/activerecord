CREATE SCHEMA IF NOT EXISTS `poo1_2021_shop` DEFAULT CHARACTER SET utf8 ;
USE `poo1_2021_shop` ;


-- -----------------------------------------------------
-- Table `poo1_2021_shop`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poo1_2021_shop`.`categories` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `description` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `poo1_2021_shop`.`clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poo1_2021_shop`.`clients` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `firstname` VARCHAR(45) NOT NULL,
    `lastname` VARCHAR(45) NOT NULL,
    PRIMARY KEY (`id`))
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `poo1_2021_shop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poo1_2021_shop`.`products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
    `price` VARCHAR(45) NOT NULL,
    `description` VARCHAR(45) NULL DEFAULT NULL,
    `category_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
    INDEX `fk_products_categories_idx` (`category_id` ASC) VISIBLE,
    CONSTRAINT `fk_products_categories`
    FOREIGN KEY (`category_id`)
    REFERENCES `poo1_2021_shop`.`categories` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `poo1_2021_shop`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poo1_2021_shop`.`orders` (
    `id` INT NOT NULL,
    `created_at` DATETIME NULL DEFAULT NULL,
    `shipped_at` DATETIME NULL DEFAULT NULL,
    `status` VARCHAR(45) NULL DEFAULT NULL,
    `client_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_orders_clients1_idx` (`client_id` ASC) VISIBLE,
    CONSTRAINT `fk_orders_clients1`
    FOREIGN KEY (`client_id`)
    REFERENCES `poo1_2021_shop`.`clients` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;

-- -----------------------------------------------------
-- Table `poo1_2021_shop`.`order_items`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `poo1_2021_shop`.`order_items` (
    `id` INT NOT NULL,
    `quantity` INT NOT NULL,
    `item_price` DECIMAL(7,2) NOT NULL,
    `product_id` INT NOT NULL,
    `orders_id` INT NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `fk_order_items_products1_idx` (`product_id` ASC) VISIBLE,
    INDEX `fk_order_items_orders1_idx` (`orders_id` ASC) VISIBLE,
    CONSTRAINT `fk_order_items_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `poo1_2021_shop`.`products` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `fk_order_items_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `poo1_2021_shop`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
    ENGINE = InnoDB
    DEFAULT CHARACTER SET = utf8mb3;


