-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema tennisPro
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tennisPro
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tennisPro` DEFAULT CHARACTER SET utf8 ;
USE `tennisPro` ;

-- -----------------------------------------------------
-- Table `tennisPro`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Users` (
  `idUsers` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(256) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `photo` BLOB NULL,
  `langCode` VARCHAR(3) NOT NULL,
  `sessionId` VARCHAR(64) NULL,
  PRIMARY KEY (`idUsers`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `sessionId_UNIQUE` (`sessionId` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`Players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Players` (
  `idPlayer` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NOT NULL,
  `Users_idUsers` INT NOT NULL,
  PRIMARY KEY (`idPlayer`),
  UNIQUE INDEX `login_UNIQUE` (`name` ASC),
  INDEX `fk_Players_Users1_idx` (`Users_idUsers` ASC),
  CONSTRAINT `fk_Players_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `tennisPro`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`TournamentStatusDict`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`TournamentStatusDict` (
  `idTournamentStatusDict` INT NOT NULL AUTO_INCREMENT,
  `value` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTournamentStatusDict`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`Tournaments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Tournaments` (
  `idTournaments` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `photo` BLOB NULL,
  `status_id` INT NOT NULL,
  `setsPerMatch` INT NULL,
  `legs` INT NULL,
  `banner` BLOB NULL,
  `plannedStartDate` DATETIME NULL,
  PRIMARY KEY (`idTournaments`),
  INDEX `fk_Tournaments_TournamentStatusDict1_idx` (`status_id` ASC),
  CONSTRAINT `fk_Tournaments_TournamentStatusDict1`
    FOREIGN KEY (`status_id`)
    REFERENCES `tennisPro`.`TournamentStatusDict` (`idTournamentStatusDict`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`Matches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Matches` (
  `idMatches` INT NOT NULL AUTO_INCREMENT,
  `id_player1` INT NOT NULL,
  `id_player2` INT NOT NULL,
  `id_tournament` INT NOT NULL,
  `startDate` DATETIME NULL,
  PRIMARY KEY (`idMatches`),
  INDEX `fk_Matches_Players_idx` (`id_player1` ASC),
  INDEX `fk_Matches_Players1_idx` (`id_player2` ASC),
  INDEX `fk_Matches_Tournaments1_idx` (`id_tournament` ASC),
  CONSTRAINT `fk_Matches_Players`
    FOREIGN KEY (`id_player1`)
    REFERENCES `tennisPro`.`Players` (`idPlayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matches_Players1`
    FOREIGN KEY (`id_player2`)
    REFERENCES `tennisPro`.`Players` (`idPlayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matches_Tournaments1`
    FOREIGN KEY (`id_tournament`)
    REFERENCES `tennisPro`.`Tournaments` (`idTournaments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`Roles_dict`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Roles_dict` (
  `idRoles` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`idRoles`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`Sets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Sets` (
  `idSets` INT NOT NULL AUTO_INCREMENT,
  `player1Gems` INT NULL,
  `player2Gems` INT NULL,
  `Matches_idMatches` INT NOT NULL,
  PRIMARY KEY (`idSets`),
  INDEX `fk_Sets_Matches1_idx` (`Matches_idMatches` ASC),
  CONSTRAINT `fk_Sets_Matches1`
    FOREIGN KEY (`Matches_idMatches`)
    REFERENCES `tennisPro`.`Matches` (`idMatches`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`User_role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`User_role` (
  `Users_idUsers` INT NOT NULL,
  `Roles_dict_idRoles` INT NOT NULL,
  INDEX `fk_User_role_Users1_idx` (`Users_idUsers` ASC),
  INDEX `fk_User_role_Roles_dict1_idx` (`Roles_dict_idRoles` ASC),
  CONSTRAINT `fk_User_role_Users1`
    FOREIGN KEY (`Users_idUsers`)
    REFERENCES `tennisPro`.`Users` (`idUsers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_role_Roles_dict1`
    FOREIGN KEY (`Roles_dict_idRoles`)
    REFERENCES `tennisPro`.`Roles_dict` (`idRoles`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`GuiMessage`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`GuiMessage` (
  `idGuiMessage` INT NOT NULL AUTO_INCREMENT,
  `code` VARCHAR(45) NULL,
  `message` VARCHAR(300) NOT NULL,
  `langCode` VARCHAR(10) NULL,
  PRIMARY KEY (`idGuiMessage`),
  UNIQUE INDEX `code_UNIQUE` (`code` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`PlayerStatusInTournamentDict`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`PlayerStatusInTournamentDict` (
  `idPlayerStatusInTournamentDict` INT NOT NULL AUTO_INCREMENT,
  `PlayerStatusInTournamentDictcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idPlayerStatusInTournamentDict`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tennisPro`.`Tournaments_players`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tennisPro`.`Tournaments_players` (
  `Tournaments_idTournaments` INT NOT NULL,
  `Players_idPlayer` INT NOT NULL,
  `playerStatus` INT NOT NULL,
  INDEX `fk_Tournaments_players_Tournaments1_idx` (`Tournaments_idTournaments` ASC),
  INDEX `fk_Tournaments_players_Players1_idx` (`Players_idPlayer` ASC),
  INDEX `fk_Tournaments_players_PlayerStatusInTournamentDict1_idx` (`playerStatus` ASC),
  CONSTRAINT `fk_Tournaments_players_Tournaments1`
    FOREIGN KEY (`Tournaments_idTournaments`)
    REFERENCES `tennisPro`.`Tournaments` (`idTournaments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tournaments_players_Players1`
    FOREIGN KEY (`Players_idPlayer`)
    REFERENCES `tennisPro`.`Players` (`idPlayer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tournaments_players_PlayerStatusInTournamentDict1`
    FOREIGN KEY (`playerStatus`)
    REFERENCES `tennisPro`.`PlayerStatusInTournamentDict` (`idPlayerStatusInTournamentDict`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
