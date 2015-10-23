SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
SHOW WARNINGS;
SHOW WARNINGS;
USE `mydb` ;


-- -----------------------------------------------------
-- Table `tipo_lugar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `tipo_lugar` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `tipo_lugar` (
  `idtipo_lugar` INT NOT NULL ,
  `descripcion` VARCHAR(45) NULL ,
  PRIMARY KEY (`idtipo_lugar`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Departamento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Departamento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Departamento` (
  `idDepartamento` INT NOT NULL ,
  `nombre_departamento` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idDepartamento`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Provincia` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Provincia` (
  `idprovincia` INT NOT NULL AUTO_INCREMENT ,
  `nombre_provincia` VARCHAR(45) NOT NULL ,
  `Departamento_idDepartamento` INT NOT NULL ,
  PRIMARY KEY (`idprovincia`, `Departamento_idDepartamento`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Distrito`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Distrito` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Distrito` (
  `idDistrito` INT NULL AUTO_INCREMENT ,
  `nombre_distrito` VARCHAR(45) NOT NULL ,
  `Provincia_idprovincia` INT NOT NULL ,
  `Provincia_Departamento_idDepartamento` INT NOT NULL ,
  PRIMARY KEY (`idDistrito`, `Provincia_idprovincia`, `Provincia_Departamento_idDepartamento`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `lugar`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `lugar` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `lugar` (
  `idlugar` INT NOT NULL ,
  `nombre` VARCHAR(45) NOT NULL ,
  `logo` BLOB NOT NULL ,
  `longitud` VARCHAR(45) NOT NULL ,
  `latitud` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `web_link` VARCHAR(45) NOT NULL ,
  `facebook_link` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(100) NULL ,
  `tipo_lugar_idtipo_lugar` INT NOT NULL ,
  `Distrito_idDistrito` INT NOT NULL ,
  `Distrito_Provincia_idprovincia` INT NOT NULL ,
  `Distrito_Provincia_Departamento_idDepartamento` INT NOT NULL ,
  PRIMARY KEY (`idlugar`, `Distrito_idDistrito`, `Distrito_Provincia_idprovincia`, `Distrito_Provincia_Departamento_idDepartamento`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Categoria` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Categoria` (
  `idCategoria` INT NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`idCategoria`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `SubCategoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SubCategoria` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `SubCategoria` (
  `idSubCategoria` INT NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `Categoria_idCategoria` INT NOT NULL ,
  PRIMARY KEY (`idSubCategoria`, `Categoria_idCategoria`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `evento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evento` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `evento` (
  `idevento` INT NOT NULL ,
  `nombre` VARCHAR(100) NOT NULL ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `fecha_inicio` DATE NULL ,
  `hora_inicio` TIME NULL ,
  `fecha_fin` DATE NULL ,
  `horra_fin` TIME NULL ,
  `pulico` TINYINT(1) NULL ,
  `logo` VARCHAR(50) NULL ,
  `url` VARCHAR(100) NULL ,
  `fecha_creacon` DATETIME NULL ,
  `capacidad` INT NULL ,
  `compartible` TINYINT(1) NULL ,
  `lugar_idlugar` INT NOT NULL ,
  `SubCategoria_idSubCategoria` INT NOT NULL ,
  `SubCategoria_Categoria_idCategoria` INT NOT NULL ,
  PRIMARY KEY (`idevento`, `lugar_idlugar`, `SubCategoria_idSubCategoria`, `SubCategoria_Categoria_idCategoria`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Persona` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Persona` (
  `idPersona` INT NOT NULL ,
  `dni` VARCHAR(8) NOT NULL ,
  `nonbres` VARCHAR(45) NULL ,
  `apellidos` VARCHAR(45) NULL ,
  `email` VARCHAR(60) NULL ,
  `direccion` VARCHAR(45) NULL ,
  `genero` CHAR(1) NULL ,
  `telefono` VARCHAR(8) NULL ,
  `celular` VARCHAR(11) NULL ,
  PRIMARY KEY (`idPersona`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `usuario_nivel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario_nivel` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `usuario_nivel` (
  `idusuario_nivel` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(45) NOT NULL ,
  `estado` INT(1) NOT NULL ,
  PRIMARY KEY (`idusuario_nivel`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `usuario` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(45) NOT NULL ,
  `clave` VARCHAR(128) NOT NULL ,
  `usuario_nivel_idusuario_nivel` INT NOT NULL ,
  PRIMARY KEY (`idusuario`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `evento_has_usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evento_has_usuario` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `evento_has_usuario` (
  `evento_idevento` INT NOT NULL ,
  `usuario_idusuario` INT NOT NULL ,
  `detalles` VARCHAR(45) NULL ,
  PRIMARY KEY (`evento_idevento`, `usuario_idusuario`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `evento_has_usuario_has_Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `evento_has_usuario_has_Persona` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `evento_has_usuario_has_Persona` (
  `evento_has_usuario_evento_idevento` INT NOT NULL ,
  `evento_has_usuario_usuario_idusuario` INT NOT NULL ,
  `Persona_idPersona` INT NOT NULL ,
  PRIMARY KEY (`evento_has_usuario_evento_idevento`, `evento_has_usuario_usuario_idusuario`, `Persona_idPersona`) )
ENGINE = InnoDB;

SHOW WARNINGS;
USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
