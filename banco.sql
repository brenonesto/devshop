-- MySQL Script generated by MySQL Workbench
-- Sat Jan  4 11:15:16 2020
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema devshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema devshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `devshop` DEFAULT CHARACTER SET utf8 ;
USE `devshop` ;

-- -----------------------------------------------------
-- Table `devshop`.`products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`product_variations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`product_variations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sku` VARCHAR(245) NULL,
  `available` INT NULL,
  `variation_name` VARCHAR(245) NULL,
  `price` FLOAT NULL,
  `price_from` FLOAT NULL,
  `weight` INT NULL,
  `order` INT NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_variations_products_idx` (`product_id` ASC),
  CONSTRAINT `fk_product_variations_products`
    FOREIGN KEY (`product_id`)
    REFERENCES `devshop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`product_images`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`product_images` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(245) NULL,
  `url` VARCHAR(245) NULL,
  `order` INT NULL,
  `product_variation_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_images_product_variations1_idx` (`product_variation_id` ASC),
  CONSTRAINT `fk_product_images_product_variations1`
    FOREIGN KEY (`product_variation_id`)
    REFERENCES `devshop`.`product_variations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`categories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `category` VARCHAR(245) NULL,
  `description` VARCHAR(245) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`categories_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`categories_products` (
  `product_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`product_id`, `category_id`),
  INDEX `fk_products_has_categories_categories1_idx` (`category_id` ASC),
  INDEX `fk_products_has_categories_products1_idx` (`product_id` ASC),
  CONSTRAINT `fk_products_has_categories_products1`
    FOREIGN KEY (`product_id`)
    REFERENCES `devshop`.`products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_products_has_categories_categories1`
    FOREIGN KEY (`category_id`)
    REFERENCES `devshop`.`categories` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`banners_type`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`banners_type` (
  `id` INT NOT NULL,
  `banner_type` VARCHAR(245) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `devshop`.`banners`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `devshop`.`banners` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(245) NULL,
  `bannerscol` VARCHAR(45) NULL,
  `banner_type_id` INT NOT NULL,
  `url` VARCHAR(245) NULL,
  `order` INT NULL,
  `image_url` VARCHAR(245) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_banners_banners_type1_idx` (`banner_type_id` ASC),
  CONSTRAINT `fk_banners_banners_type1`
    FOREIGN KEY (`banner_type_id`)
    REFERENCES `devshop`.`banners_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
