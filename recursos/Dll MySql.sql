-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema inmobiliariamarelsa
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema inmobiliariamarelsa
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `inmobiliariamarelsa` DEFAULT CHARACTER SET latin1 ;
USE `inmobiliariamarelsa` ;

-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`accesos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`accesos` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(60) NOT NULL,
  `url` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`departamentos` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`ciudades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`ciudades` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `departamento` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `ciudades_departamentos_fk` (`departamento` ASC),
  CONSTRAINT `ciudades_departamentos_fk`
    FOREIGN KEY (`departamento`)
    REFERENCES `inmobiliariamarelsa`.`departamentos` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`promocion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`promocion` (
  `id` INT(11) NOT NULL,
  `descripcion` VARCHAR(100) NOT NULL,
  `porcentaje` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`roles` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(30) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`personas` (
  `id` INT(11) NOT NULL,
  `cedula` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(40) NOT NULL,
  `apellido` VARCHAR(40) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `latitud` DOUBLE NOT NULL,
  `longitud` DOUBLE NOT NULL,
  `telefono` VARCHAR(10) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  `rol` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `personas__un` (`cedula` ASC),
  INDEX `personas_roles_fk` (`rol` ASC),
  CONSTRAINT `personas_roles_fk`
    FOREIGN KEY (`rol`)
    REFERENCES `inmobiliariamarelsa`.`roles` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`usuarios` (
  `persona` INT(11) NOT NULL,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`persona`),
  UNIQUE INDEX `usuario__un` (`persona` ASC),
  CONSTRAINT `usuario_personas_fk`
    FOREIGN KEY (`persona`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`tipo_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`tipo_inmueble` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`inmueble` (
  `id` INT(11) NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `area` INT(11) NOT NULL,
  `valor` INT(11) NOT NULL,
  `banios` INT(11) NOT NULL,
  `estado` INT(11) NOT NULL,
  `tipoav` INT(11) NOT NULL,
  `garajes` INT(11) NOT NULL,
  `habitaciones` INT(11) NOT NULL,
  `detalles` VARCHAR(400) NOT NULL,
  `aÒoconstruccion` VARCHAR(20) NOT NULL,
  `ascensor` CHAR(1) NOT NULL,
  `canchas_deportivas` CHAR(1) NOT NULL,
  `zonas_humedas` CHAR(1) NOT NULL,
  `zona_infantil` CHAR(1) NOT NULL,
  `jardines` CHAR(1) NOT NULL,
  `transporte_publico_cercano` CHAR(1) NOT NULL,
  `precio_negociable` CHAR(1) NOT NULL,
  `zona_ropas` CHAR(1) NOT NULL,
  `parqueadero` CHAR(1) NOT NULL,
  `deposito` CHAR(1) NOT NULL,
  `estudio` CHAR(1) NULL DEFAULT NULL,
  `tipo_cortinas` VARCHAR(100) NOT NULL,
  `cuarto_servicio` CHAR(1) NOT NULL,
  `chimenea` CHAR(1) NOT NULL,
  `cocinaac` CHAR(1) NOT NULL,
  `comedorIndependiente` CHAR(1) NOT NULL,
  `vista_exterior_interior` CHAR(1) NOT NULL,
  `zona` INT(11) NOT NULL,
  `numero_matricula` VARCHAR(100) NOT NULL,
  `latitud` DOUBLE NOT NULL,
  `longitud` DOUBLE NOT NULL,
  `aprobacion_fecha` DATE NULL DEFAULT NULL,
  `tipo` INT(11) NOT NULL,
  `ciudad` INT(11) NOT NULL,
  `usuario` INT(11) NOT NULL,
  `administrador` INT(11) NULL DEFAULT NULL,
  `promocion` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `inmueble_ciudades_fk` (`ciudad` ASC),
  INDEX `inmueble_promocion_fk` (`promocion` ASC),
  INDEX `inmueble_usuarios_fk` (`usuario` ASC),
  INDEX `inmueble_usuarios_fkv2` (`administrador` ASC),
  INDEX `tipo_inmueble_fk` (`tipo` ASC),
  CONSTRAINT `inmueble_ciudades_fk`
    FOREIGN KEY (`ciudad`)
    REFERENCES `inmobiliariamarelsa`.`ciudades` (`id`),
  CONSTRAINT `inmueble_promocion_fk`
    FOREIGN KEY (`promocion`)
    REFERENCES `inmobiliariamarelsa`.`promocion` (`id`),
  CONSTRAINT `inmueble_usuarios_fk`
    FOREIGN KEY (`usuario`)
    REFERENCES `inmobiliariamarelsa`.`usuarios` (`persona`),
  CONSTRAINT `inmueble_usuarios_fkv2`
    FOREIGN KEY (`administrador`)
    REFERENCES `inmobiliariamarelsa`.`usuarios` (`persona`),
  CONSTRAINT `tipo_inmueble_fk`
    FOREIGN KEY (`tipo`)
    REFERENCES `inmobiliariamarelsa`.`tipo_inmueble` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`archivo_inmueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`archivo_inmueble` (
  `id` INT(11) NOT NULL,
  `tipo` INT(11) NOT NULL,
  `nombre` VARCHAR(300) NOT NULL,
  `inmueble` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fotos_inmueble_inmueble_fk` (`inmueble` ASC),
  CONSTRAINT `fotos_inmueble_inmueble_fk`
    FOREIGN KEY (`inmueble`)
    REFERENCES `inmobiliariamarelsa`.`inmueble` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`reservar_visita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`reservar_visita` (
  `id` INT(11) NOT NULL,
  `mensaje` VARCHAR(600) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `estado` INT(11) NOT NULL,
  `inmueble` INT(11) NOT NULL,
  `cliente` INT(11) NOT NULL,
  `empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `empleado` (`empleado` ASC),
  INDEX `res_visita_inm_fk` (`inmueble` ASC),
  INDEX `visita_personas_fk` (`cliente` ASC),
  CONSTRAINT `empleado`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`),
  CONSTRAINT `res_visita_inm_fk`
    FOREIGN KEY (`inmueble`)
    REFERENCES `inmobiliariamarelsa`.`inmueble` (`id`),
  CONSTRAINT `visita_personas_fk`
    FOREIGN KEY (`cliente`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`contrato`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`contrato` (
  `id` INT(11) NOT NULL,
  `descripcion` VARCHAR(1000) NULL DEFAULT NULL,
  `empleado` INT(11) NOT NULL,
  `cliente` INT(11) NOT NULL,
  `visita` INT(11) NOT NULL,
  `estado` INT(11) NOT NULL,
  `fecha_finalizacion` DATE NULL DEFAULT NULL,
  `fecha_solicitud` DATE NOT NULL,
  `file_certificacion` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `personav1` (`empleado` ASC),
  INDEX `personav3` (`cliente` ASC),
  INDEX `reservar_visita` (`visita` ASC),
  CONSTRAINT `personav1`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`),
  CONSTRAINT `personav3`
    FOREIGN KEY (`cliente`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`),
  CONSTRAINT `reservar_visita`
    FOREIGN KEY (`visita`)
    REFERENCES `inmobiliariamarelsa`.`reservar_visita` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`arriendo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`arriendo` (
  `id` INT(11) NOT NULL,
  `contrato` INT(11) NOT NULL,
  `empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `arriendo_contrato_fk` (`contrato` ASC),
  INDEX `empleadov3` (`empleado` ASC),
  CONSTRAINT `arriendo_contrato_fk`
    FOREIGN KEY (`contrato`)
    REFERENCES `inmobiliariamarelsa`.`contrato` (`id`),
  CONSTRAINT `empleadov3`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`cargos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`cargos` (
  `id` INT(11) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`caucion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`caucion` (
  `id` INT(11) NOT NULL,
  `descripcion` VARCHAR(1000) NOT NULL,
  `arriendo` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `arriendo` (`arriendo` ASC),
  CONSTRAINT `arriendo`
    FOREIGN KEY (`arriendo`)
    REFERENCES `inmobiliariamarelsa`.`arriendo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`cita_desalojo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`cita_desalojo` (
  `id` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `arriendo` INT(11) NOT NULL,
  `empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `cita_desalojo_arriendo_fk` (`arriendo` ASC),
  INDEX `empleadov5` (`empleado` ASC),
  CONSTRAINT `cita_desalojo_arriendo_fk`
    FOREIGN KEY (`arriendo`)
    REFERENCES `inmobiliariamarelsa`.`arriendo` (`id`),
  CONSTRAINT `empleadov5`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`empleados` (
  `usuario` INT(11) NOT NULL,
  `salario` INT(11) NOT NULL,
  `cargo` INT(11) NOT NULL,
  PRIMARY KEY (`usuario`),
  INDEX `empleados_cargos_fk` (`cargo` ASC),
  CONSTRAINT `empleados_cargos_fk`
    FOREIGN KEY (`cargo`)
    REFERENCES `inmobiliariamarelsa`.`cargos` (`id`),
  CONSTRAINT `empleados_usuarios_fk`
    FOREIGN KEY (`usuario`)
    REFERENCES `inmobiliariamarelsa`.`usuarios` (`persona`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`experiencias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`experiencias` (
  `id` INT(11) NOT NULL,
  `empresa` VARCHAR(200) NOT NULL,
  `empresa_direccion` VARCHAR(100) NOT NULL,
  `empresa_telefono` VARCHAR(100) NOT NULL,
  `cargo` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_fin` DATE NOT NULL,
  `file_certificacion` VARCHAR(200) NOT NULL,
  `empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `experiencias_empleados_fk` (`empleado` ASC),
  CONSTRAINT `experiencias_empleados_fk`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`empleados` (`usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`formaciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`formaciones` (
  `id` INT(11) NOT NULL,
  `institucion` VARCHAR(100) NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `file_certificacion` VARCHAR(300) NOT NULL,
  `empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `formaciones_empleados_fk` (`empleado` ASC),
  CONSTRAINT `formaciones_empleados_fk`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`empleados` (`usuario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`formato_ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`formato_ventas` (
  `id` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `inmueble` INT(11) NOT NULL,
  `empleado` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `empleadov6` (`empleado` ASC),
  INDEX `inmueble` (`inmueble` ASC),
  CONSTRAINT `empleadov6`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`),
  CONSTRAINT `inmueble`
    FOREIGN KEY (`inmueble`)
    REFERENCES `inmobiliariamarelsa`.`inmueble` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`informe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`informe` (
  `id` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `descripcion` VARCHAR(1000) NOT NULL,
  `arriendo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `arriendov2` (`arriendo_id` ASC),
  CONSTRAINT `arriendov2`
    FOREIGN KEY (`arriendo_id`)
    REFERENCES `inmobiliariamarelsa`.`arriendo` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`reportes_visitas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`reportes_visitas` (
  `id` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `inmueble` INT(11) NOT NULL,
  `usuario` INT(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`reunion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`reunion` (
  `id` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `descripcion` VARCHAR(1000) NOT NULL,
  `persona` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `persona` (`persona` ASC),
  CONSTRAINT `persona`
    FOREIGN KEY (`persona`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`rol_accesos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`rol_accesos` (
  `rol` INT(11) NOT NULL,
  `acceso` INT(11) NOT NULL,
  PRIMARY KEY (`rol`, `acceso`),
  INDEX `acceso` (`acceso` ASC),
  CONSTRAINT `acceso`
    FOREIGN KEY (`acceso`)
    REFERENCES `inmobiliariamarelsa`.`accesos` (`id`),
  CONSTRAINT `rol`
    FOREIGN KEY (`rol`)
    REFERENCES `inmobiliariamarelsa`.`roles` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inmobiliariamarelsa`.`venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `inmobiliariamarelsa`.`venta` (
  `id` INT(11) NOT NULL,
  `contrato` INT(11) NOT NULL,
  `empleado` INT(11) NOT NULL,
  `fecha` DATE NOT NULL,
  `descripcion` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `contraro` (`contrato` ASC),
  INDEX `empleadov2` (`empleado` ASC),
  CONSTRAINT `contraro`
    FOREIGN KEY (`contrato`)
    REFERENCES `inmobiliariamarelsa`.`contrato` (`id`),
  CONSTRAINT `empleadov2`
    FOREIGN KEY (`empleado`)
    REFERENCES `inmobiliariamarelsa`.`personas` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
