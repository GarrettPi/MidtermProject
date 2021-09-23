-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema potatodb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `potatodb` ;

-- -----------------------------------------------------
-- Schema potatodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `potatodb` DEFAULT CHARACTER SET utf8 ;
USE `potatodb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NULL,
  `last_name` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_type` ;

CREATE TABLE IF NOT EXISTS `activity_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_source`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_source` ;

CREATE TABLE IF NOT EXISTS `activity_source` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_category` ;

CREATE TABLE IF NOT EXISTS `activity_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `expected_duration` INT NULL,
  `url` VARCHAR(255) NULL,
  `activity_type_id` INT NOT NULL,
  `activity_source_id` INT NOT NULL,
  `activity_category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_activity_type1_idx` (`activity_type_id` ASC),
  INDEX `fk_activity_activity_source1_idx` (`activity_source_id` ASC),
  INDEX `fk_activity_activity_category1_idx` (`activity_category_id` ASC),
  CONSTRAINT `fk_activity_activity_type1`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `activity_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_source1`
    FOREIGN KEY (`activity_source_id`)
    REFERENCES `activity_source` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_category1`
    FOREIGN KEY (`activity_category_id`)
    REFERENCES `activity_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `preference_review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `preference_review` ;

CREATE TABLE IF NOT EXISTS `preference_review` (
  `id` INT NOT NULL,
  `review` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `preference_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `preference_rating` ;

CREATE TABLE IF NOT EXISTS `preference_rating` (
  `id` INT NOT NULL,
  `rating` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_preference`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_preference` ;

CREATE TABLE IF NOT EXISTS `activity_preference` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `preference_review_id` INT NULL,
  `preference_rating_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_preferences_user_idx` (`user_id` ASC),
  INDEX `fk_activity_preferences_activity1_idx` (`activity_id` ASC),
  INDEX `fk_activity_preferences_preference_review1_idx` (`preference_review_id` ASC),
  INDEX `fk_activity_preferences_preference_rating1_idx` (`preference_rating_id` ASC),
  CONSTRAINT `fk_activity_preferences_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_preferences_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_preferences_preference_review1`
    FOREIGN KEY (`preference_review_id`)
    REFERENCES `preference_review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_preferences_preference_rating1`
    FOREIGN KEY (`preference_rating_id`)
    REFERENCES `preference_rating` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `activity_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_rating` ;

CREATE TABLE IF NOT EXISTS `activity_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(90) NOT NULL,
  `review_content` VARCHAR(45) NULL,
  `activity_id` INT NOT NULL,
  `url` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_rating_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_activity_rating_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS potatouser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'potatouser'@'localhost' IDENTIFIED BY 'potatouser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'potatouser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (1, 'jt', '123', 'Jacob', 'Tweedy', 'examplej@sd.com', 1, 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (2, 'cc', '123', 'Cindy', 'Chase', 'examplec@sd.com', 1, 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (3, 'cp', '123', 'Garrett', 'Pipes', 'exampleg@sd.com', 1, 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (4, 'rv', '123', 'Ron', 'Viramontes', 'exampler@sd.com', 1, 'user');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_type` (`id`, `name`) VALUES (1, 'Movie');
INSERT INTO `activity_type` (`id`, `name`) VALUES (2, 'Series');
INSERT INTO `activity_type` (`id`, `name`) VALUES (3, 'Other');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_source`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_source` (`id`, `name`) VALUES (1, 'External');
INSERT INTO `activity_source` (`id`, `name`) VALUES (2, 'User Generated');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_category` (`id`, `name`) VALUES (1, 'Couch Potato');
INSERT INTO `activity_category` (`id`, `name`) VALUES (2, 'Active Potato');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `url`, `activity_type_id`, `activity_source_id`, `activity_category_id`) VALUES (1, 'Potato Potahto', 104, 'https://www.netflix.com/title/81213149?source=35', 1, 1, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `url`, `activity_type_id`, `activity_source_id`, `activity_category_id`) VALUES (2, 'Game Of Thrones', 1000, 'https://www.hbo.com/game-of-thrones', 2, 1, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `url`, `activity_type_id`, `activity_source_id`, `activity_category_id`) VALUES (3, 'Pick my nose', 5, NULL, 3, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `preference_review`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `preference_review` (`id`, `review`) VALUES (1, 'Digging for Gold!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `preference_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `preference_rating` (`id`, `rating`) VALUES (1, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_preference`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_preference` (`id`, `user_id`, `activity_id`, `preference_review_id`, `preference_rating_id`) VALUES (1, 1, 1, NULL, NULL);
INSERT INTO `activity_preference` (`id`, `user_id`, `activity_id`, `preference_review_id`, `preference_rating_id`) VALUES (2, 3, 3, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_rating` (`id`, `name`, `review_content`, `activity_id`, `url`) VALUES (1, 'IMDb', '2 Stars', 1, 'https://www.imdb.com/title/tt6950250/');
INSERT INTO `activity_rating` (`id`, `name`, `review_content`, `activity_id`, `url`) VALUES (2, 'Roten Tomat', '65%', 1, 'https://www.rottentomatoes.com/');
INSERT INTO `activity_rating` (`id`, `name`, `review_content`, `activity_id`, `url`) VALUES (3, 'IMDb', '5 Stars', 2, 'https://www.imdb.com/title/tt0944947/');

COMMIT;

