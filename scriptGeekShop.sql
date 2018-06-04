-- MySQL Script generated by MySQL Workbench
-- 01/12/17 15:38:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema geekshop
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `geekshop` ;

-- -----------------------------------------------------
-- Schema geekshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `geekshop` DEFAULT CHARACTER SET latin1 COLLATE latin1_spanish_ci ;
USE `geekshop` ;

-- -----------------------------------------------------
-- Table `geekshop`.`Administrador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Administrador` (
  `id_administrador` CHAR(5) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_administrador`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geekshop`.`Usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Usuarios` (
  `correo` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`correo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geekshop`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Proveedor` (
  `id_proveedor` CHAR(5) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`id_proveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geekshop`.`Productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Productos` (
  `id_producto` CHAR(5) NOT NULL,
  `stock` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `precio_unit` DOUBLE NOT NULL,
  `id_proveedor` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id_producto`),
  CONSTRAINT `idProveedor`
    FOREIGN KEY (`id_proveedor`)
    REFERENCES `geekshop`.`Proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idProveedor_idx` ON `geekshop`.`Productos` (`id_proveedor` ASC);


-- -----------------------------------------------------
-- Table `geekshop`.`Pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Pedidos` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `fecha` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `confirmacion` CHAR(1) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  CONSTRAINT `correo`
    FOREIGN KEY (`correo`)
    REFERENCES `geekshop`.`Usuarios` (`correo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `correo_idx` ON `geekshop`.`Pedidos` (`correo` ASC);


-- -----------------------------------------------------
-- Table `geekshop`.`Facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Facturas` (
  `id_facturas` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cedula` VARCHAR(10) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `direccion` VARCHAR(45) NOT NULL,
  `num_facturas` CHAR(15) NOT NULL,
  `ruc` VARCHAR(15) NOT NULL,
  `fecha_emision`  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `tipo_gasto` VARCHAR(20) NOT NULL,
  `valor_base` DOUBLE NOT NULL,
  `iva` DOUBLE NOT NULL,
  `descuento` DOUBLE NOT NULL,
  `total` DOUBLE NOT NULL,
  `id_pedido` INT NOT NULL,
  `confirmacion` CHAR(1) NOT NULL,
  PRIMARY KEY (`id_facturas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `geekshop`.`Detalles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `geekshop`.`Detalles` (
  `id_detalles` INT NOT NULL AUTO_INCREMENT,
  `id_pedido` INT NOT NULL,
  `id_producto` CHAR(5) NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `valor_unit` DOUBLE NOT NULL,
  `valor_total` DOUBLE NOT NULL,
  PRIMARY KEY (`id_detalles`),
  CONSTRAINT `id_producto`
    FOREIGN KEY (`id_producto`)
    REFERENCES `geekshop`.`Productos` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `id_pedido`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `geekshop`.`Pedidos` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `idPedido_idx` ON `geekshop`.`Detalles` (`id_producto` ASC);

CREATE INDEX `id_pedido_idx` ON `geekshop`.`Detalles` (`id_pedido` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;