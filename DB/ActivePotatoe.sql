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
-- Table `activity_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_category` ;

CREATE TABLE IF NOT EXISTS `activity_category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `activity_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_type` ;

CREATE TABLE IF NOT EXISTS `activity_type` (
  `id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `enabled` TINYINT NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `activity`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity` ;

CREATE TABLE IF NOT EXISTS `activity` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `expected_duration` INT NULL DEFAULT NULL,
  `description` VARCHAR(255) NULL,
  `url` VARCHAR(1000) NULL DEFAULT NULL,
  `image_url` VARCHAR(1000) NULL DEFAULT NULL,
  `activity_type_id` INT NOT NULL,
  `activity_category_id` INT NOT NULL,
  `create_date` DATE NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_activity_type1_idx` (`activity_type_id` ASC),
  INDEX `fk_activity_activity_category1_idx` (`activity_category_id` ASC),
  INDEX `fk_activity_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_activity_activity_category1`
    FOREIGN KEY (`activity_category_id`)
    REFERENCES `activity_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_activity_type1`
    FOREIGN KEY (`activity_type_id`)
    REFERENCES `activity_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `interest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `interest` ;

CREATE TABLE IF NOT EXISTS `interest` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_preferences_user_idx` (`user_id` ASC),
  INDEX `fk_activity_preferences_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_activity_preferences_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_activity_preferences_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `activity_rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `activity_rating` ;

CREATE TABLE IF NOT EXISTS `activity_rating` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `activity_id` INT NOT NULL,
  `url` VARCHAR(1000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_activity_rating_activity1_idx` (`activity_id` ASC),
  CONSTRAINT `fk_activity_rating_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `experience`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `experience` ;

CREATE TABLE IF NOT EXISTS `experience` (
  `id` INT NOT NULL,
  `rating` INT NOT NULL,
  `interest_id` INT NOT NULL,
  `experience_date` DATE NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_experience_interest1_idx` (`interest_id` ASC),
  CONSTRAINT `fk_experience_interest1`
    FOREIGN KEY (`interest_id`)
    REFERENCES `interest` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `comment` VARCHAR(255) NULL,
  `comment_date` DATE NULL,
  `user_id` INT NOT NULL,
  `activity_id` INT NOT NULL,
  `comment_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_comment_activity1_idx` (`activity_id` ASC),
  INDEX `fk_comment_comment1_idx` (`comment_id` ASC),
  CONSTRAINT `fk_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_activity1`
    FOREIGN KEY (`activity_id`)
    REFERENCES `activity` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_comment1`
    FOREIGN KEY (`comment_id`)
    REFERENCES `comment` (`id`)
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
-- Data for table `activity_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_category` (`id`, `name`) VALUES (1, 'Couch Potato');
INSERT INTO `activity_category` (`id`, `name`) VALUES (2, 'Active Potato');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_type`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_type` (`id`, `name`) VALUES (1, 'Movie');
INSERT INTO `activity_type` (`id`, `name`) VALUES (2, 'TV Series');
INSERT INTO `activity_type` (`id`, `name`) VALUES (3, 'Mini Game');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (1, 'insert', 'insert', 'insert', 'insert', 'insert@example.com', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (2, 'jacob', '123', 'jacob', 'tweedy', 'jacob@example.com', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (3, 'ron', '123', 'ron', 'viramontes', 'ron@example.com', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (4, 'garrett', '123', 'garrett', 'pipes', 'garrett@example.com', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (5, 'cindy', '123', 'cindy', 'chase', 'cindy@example.com', 1, 'admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `enabled`, `role`) VALUES (6, 'test', 'test', 'test', 'test', 'test@example.com', 1, 'admin');

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (1, 'Malignant', 111, '', 'https://www.imdb.com/title/tt3811906/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (2, 'Dune', 155, '', 'https://www.imdb.com/title/tt1160419/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (3, 'Shang-Chi and the Legend of the Ten Rings', 132, '', 'https://www.imdb.com/title/tt9376612/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (4, 'Kate', 106, '', 'https://www.imdb.com/title/tt7737528/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (5, 'Cinderella', 113, '', 'https://www.imdb.com/title/tt10155932/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (6, 'The Voyeurs', 120, '', 'https://www.imdb.com/title/tt11235772/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (7, 'Cry Macho', 104, '', 'https://www.imdb.com/title/tt1924245/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (8, 'Candyman', 91, '', 'https://www.imdb.com/title/tt9347730/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (9, 'Free Guy', 115, '', 'https://www.imdb.com/title/tt6264654/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (10, 'The Many Saints of Newark', 120, '', 'https://www.imdb.com/title/tt8110232/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (11, 'Cruella', 134, '', 'https://www.imdb.com/title/tt3228774/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (12, 'Nightbooks', 103, '', 'https://www.imdb.com/title/tt10521144/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (13, 'The Guilty', 90, '', 'https://www.imdb.com/title/tt9421570/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (14, 'Don\'t Look Up', 145, '', 'https://www.imdb.com/title/tt11286314/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (15, 'Venom: Let There Be Carnage', 90, '', 'https://www.imdb.com/title/tt7097896/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (16, 'The Suicide Squad', 132, '', 'https://www.imdb.com/title/tt6334354/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (17, 'Prisoners of the Ghostland', 103, '', 'https://www.imdb.com/title/tt6372694/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (18, 'The Matrix', 136, '', 'https://www.imdb.com/title/tt0133093/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (19, 'Prey', 87, '', 'https://www.imdb.com/title/tt15198608/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (20, 'The Last Duel', 152, '', 'https://www.imdb.com/title/tt4244994/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (21, 'The Card Counter', 111, '', 'https://www.imdb.com/title/tt11196036/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (22, 'Last Night in Soho', 116, '', 'https://www.imdb.com/title/tt9639470/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (23, 'Old', 108, '', 'https://www.imdb.com/title/tt10954652/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (24, 'The Power of the Dog', 126, '', 'https://www.imdb.com/title/tt10293406/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (25, 'Dune', 137, '', 'https://www.imdb.com/title/tt0087182/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (26, 'My Son', 95, '', 'https://www.imdb.com/title/tt13234058/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (27, 'Black Widow', 134, '', 'https://www.imdb.com/title/tt3480822/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (28, 'Don\'t Breathe 2', 98, '', 'https://www.imdb.com/title/tt6246322/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (29, 'The Eyes of Tammy Faye', 126, '', 'https://www.imdb.com/title/tt9115530/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (30, 'Dear Evan Hansen', 137, '', 'https://www.imdb.com/title/tt9357050/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (31, 'Escape Room: Tournament of Champions', 88, '', 'https://www.imdb.com/title/tt9844522/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (32, 'Reminiscence', 116, '', 'https://www.imdb.com/title/tt3272066/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (33, 'What Is Life Worth', 118, '', 'https://www.imdb.com/title/tt8009744/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (34, 'He\'s All That', 88, '', 'https://www.imdb.com/title/tt4590256/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (35, 'The Green Knight', 130, '', 'https://www.imdb.com/title/tt9243804/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (36, 'Copshop', 107, '', 'https://www.imdb.com/title/tt5748448/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (37, 'United 93', 111, '', 'https://www.imdb.com/title/tt0475276/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (38, 'The Matrix Reloaded', 138, '', 'https://www.imdb.com/title/tt0234215/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (39, 'Shershaah', 135, '', 'https://www.imdb.com/title/tt10295212/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (40, 'F9', 143, '', 'https://www.imdb.com/title/tt5433138/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (41, 'Bhoot Police', 129, '', 'https://www.imdb.com/title/tt10083640/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (42, 'After We Fell', 99, '', 'https://www.imdb.com/title/tt13069986/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (43, 'Fauci', 104, '', 'https://www.imdb.com/title/tt13984924/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (44, 'Halloween Kills', 106, '', 'https://www.imdb.com/title/tt10665338/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (45, 'Gunpowder Milkshake', 114, '', 'https://www.imdb.com/title/tt8368408/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (46, 'Jungle Cruise', 127, '', 'https://www.imdb.com/title/tt0870154/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (47, 'Avengers: Endgame', 181, '', 'https://www.imdb.com/title/tt4154796/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (48, 'Everybody\'s Talking About Jamie', 115, '', 'https://www.imdb.com/title/tt8635092/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (49, '365 dni', 114, '', 'https://www.imdb.com/title/tt10886166/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (50, 'The Shawshank Redemption', 142, '', 'https://www.imdb.com/title/tt0111161/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (51, 'Schumacher', 112, '', 'https://www.imdb.com/title/tt10322274/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (52, 'World Trade Center', 129, '', 'https://www.imdb.com/title/tt0469641/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (53, 'Once Upon a Time... in Hollywood', 161, '', 'https://www.imdb.com/title/tt7131622/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (54, 'Knives Out', 130, '', 'https://www.imdb.com/title/tt8946378/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (55, 'Once Upon a Time in America', 229, '', 'https://www.imdb.com/title/tt0087843/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (56, 'Midsommar', 148, '', 'https://www.imdb.com/title/tt8772262/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (57, 'Best Sellers', 102, '', 'https://www.imdb.com/title/tt10339052/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (58, 'Vacation Friends', 103, '', 'https://www.imdb.com/title/tt3626476/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (59, 'Wind River', 107, '', 'https://www.imdb.com/title/tt5362988/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (60, 'Stillwater', 139, '', 'https://www.imdb.com/title/tt10696896/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (61, 'Mortal Kombat', 110, '', 'https://www.imdb.com/title/tt0293429/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (62, 'CODA', 111, '', 'https://www.imdb.com/title/tt10366460/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (63, 'The Matrix Revolutions', 129, '', 'https://www.imdb.com/title/tt0242653/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (64, 'Sweet Girl', 110, '', 'https://www.imdb.com/title/tt10731768/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (65, 'Dirty Work', 82, '', 'https://www.imdb.com/title/tt0120654/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (66, 'Candyman', 99, '', 'https://www.imdb.com/title/tt0103919/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (67, 'The Tomorrow War', 138, '', 'https://www.imdb.com/title/tt9777666/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (68, 'The Courier', 112, '', 'https://www.imdb.com/title/tt8368512/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (69, 'The School of Rock', 109, '', 'https://www.imdb.com/title/tt0332379/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (70, 'The Protege', 109, '', 'https://www.imdb.com/title/tt6079772/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (71, 'Harry Potter and the Sorcerer\'s Stone', 152, '', 'https://www.imdb.com/title/tt0241527/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (72, 'Wrath of Man', 119, '', 'https://www.imdb.com/title/tt11083552/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (73, 'A Quiet Place Part II', 97, '', 'https://www.imdb.com/title/tt8332922/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (74, 'Snake Eyes: G.I. Joe Origins', 121, '', 'https://www.imdb.com/title/tt8404256/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (75, 'Tenet', 150, '', 'https://www.imdb.com/title/tt6723592/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (76, 'Don\'t Breathe', 88, '', 'https://www.imdb.com/title/tt4160708/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (77, 'The Wolf of Wall Street', 180, '', 'https://www.imdb.com/title/tt0993846/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (78, 'Venom', 112, '', 'https://www.imdb.com/title/tt1270797/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (79, 'SAS: Red Notice', 124, '', 'https://www.imdb.com/title/tt4479380/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (80, 'Nobody', 92, '', 'https://www.imdb.com/title/tt7888964/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (81, 'Zack Snyder\'s Justice League', 242, '', 'https://www.imdb.com/title/tt12361974/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (82, 'Pig', 92, '', 'https://www.imdb.com/title/tt11003218/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (83, 'News of the World', 118, '', 'https://www.imdb.com/title/tt6878306/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (84, 'Bellbottom', 123, '', 'https://www.imdb.com/title/tt11260832/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (85, 'Mars Attacks!', 106, '', 'https://www.imdb.com/title/tt0116996/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (86, 'The Father', 97, '', 'https://www.imdb.com/title/tt10272386/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (87, 'The Night House', 107, '', 'https://www.imdb.com/title/tt9731534/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (88, 'Spencer', 111, '', 'https://www.imdb.com/title/tt12536294/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (89, 'Interstellar', 169, '', 'https://www.imdb.com/title/tt0816692/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (90, 'Luca', 95, '', 'https://www.imdb.com/title/tt12801262/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (91, 'Killers of the Flower Moon', null, '', 'https://www.imdb.com/title/tt5537002/', '', 1, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (92, 'Lucifer', 42, '', 'https://www.imdb.com/title/tt4052886/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (93, 'Sex Education', 45, '', 'https://www.imdb.com/title/tt7767422/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (94, 'What If...?', null, '', 'https://www.imdb.com/title/tt10168312/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (95, 'Ted Lasso', 30, '', 'https://www.imdb.com/title/tt10986410/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (96, 'The Walking Dead', 44, '', 'https://www.imdb.com/title/tt1520211/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (97, 'Clickbait', 368, '', 'https://www.imdb.com/title/tt10888878/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (98, 'La casa de papel', 70, '', 'https://www.imdb.com/title/tt6468322/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (99, 'Nine Perfect Strangers', 388, '', 'https://www.imdb.com/title/tt8760932/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (100, 'Only Murders in the Building', null, '', 'https://www.imdb.com/title/tt12851524/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (101, 'American Horror Story', 60, '', 'https://www.imdb.com/title/tt1844624/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (102, 'Y: The Last Man', 60, '', 'https://www.imdb.com/title/tt8042500/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (103, 'Brooklyn Nine-Nine', 22, '', 'https://www.imdb.com/title/tt2467372/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (104, 'American Crime Story', 42, '', 'https://www.imdb.com/title/tt2788432/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (105, 'Game of Thrones', 57, '', 'https://www.imdb.com/title/tt0944947/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (106, 'Rick and Morty', 23, '', 'https://www.imdb.com/title/tt2861424/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (107, 'The Morning Show', 60, '', 'https://www.imdb.com/title/tt7203552/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (108, 'The White Lotus', 353, '', 'https://www.imdb.com/title/tt13406094/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (109, 'See', 60, '', 'https://www.imdb.com/title/tt7949218/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (110, 'Scenes from a Marriage', 60, '', 'https://www.imdb.com/title/tt12682218/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (111, 'Titans', 45, '', 'https://www.imdb.com/title/tt1043813/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (112, 'The Sopranos', 55, '', 'https://www.imdb.com/title/tt0141842/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (113, 'American Rust', null, '', 'https://www.imdb.com/title/tt1532495/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (114, 'Vigil', null, '', 'https://www.imdb.com/title/tt11846996/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (115, 'Grey\'s Anatomy', 41, '', 'https://www.imdb.com/title/tt0413573/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (116, 'Billions', 60, '', 'https://www.imdb.com/title/tt4270492/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (117, 'Yellowstone', 60, '', 'https://www.imdb.com/title/tt4236770/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (118, 'Peaky Blinders', 60, '', 'https://www.imdb.com/title/tt2442560/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (119, 'Downton Abbey', 58, '', 'https://www.imdb.com/title/tt1606375/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (120, 'Breaking Bad', 49, '', 'https://www.imdb.com/title/tt0903747/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (121, 'The Office', 22, '', 'https://www.imdb.com/title/tt0386676/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (122, 'What We Do in the Shadows', 30, '', 'https://www.imdb.com/title/tt7908628/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (123, 'Manifest', 43, '', 'https://www.imdb.com/title/tt8421350/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (124, 'Into the Night', null, '', 'https://www.imdb.com/title/tt10919486/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (125, 'Succession', 60, '', 'https://www.imdb.com/title/tt7660850/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (126, 'The Wire', 59, '', 'https://www.imdb.com/title/tt0306414/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (127, 'Good Girls', 43, '', 'https://www.imdb.com/title/tt6474378/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (128, 'Dexter', 53, '', 'https://www.imdb.com/title/tt0773262/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (129, 'Friends', 22, '', 'https://www.imdb.com/title/tt0108778/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (130, 'Criminal Minds', 42, '', 'https://www.imdb.com/title/tt0452046/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (131, 'NCIS: Naval Criminal Investigative Service', 60, '', 'https://www.imdb.com/title/tt0364845/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (132, 'Chicago Fire', 43, '', 'https://www.imdb.com/title/tt2261391/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (133, 'Supernatural', 44, '', 'https://www.imdb.com/title/tt0460681/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (134, 'The Boys', 60, '', 'https://www.imdb.com/title/tt1190634/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (135, 'The Lost Symbol', null, '', 'https://www.imdb.com/title/tt10478054/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (136, 'Stranger Things', 51, '', 'https://www.imdb.com/title/tt4574334/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (137, 'You', 45, '', 'https://www.imdb.com/title/tt7335184/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (138, 'Mumbai Diaries 26/11', null, '', 'https://www.imdb.com/title/tt12714854/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (139, 'On the Verge', 35, '', 'https://www.imdb.com/title/tt5540990/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (140, 'Vikings', 44, '', 'https://www.imdb.com/title/tt2306299/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (141, 'Candy', 39, '', 'https://www.imdb.com/title/tt14479078/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (142, 'Kin', null, '', 'https://www.imdb.com/title/tt13444408/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (143, 'American Horror Stories', 45, '', 'https://www.imdb.com/title/tt12306692/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (144, 'Law & Order: Special Victims Unit', 60, '', 'https://www.imdb.com/title/tt0203259/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (145, 'Modern Family', 22, '', 'https://www.imdb.com/title/tt1442437/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (146, 'The Handmaid\'s Tale', 60, '', 'https://www.imdb.com/title/tt5834204/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (147, 'The North Water', 300, '', 'https://www.imdb.com/title/tt7660970/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (148, 'Loki', null, '', 'https://www.imdb.com/title/tt9140554/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (149, 'Fantasy Island', null, '', 'https://www.imdb.com/title/tt13784584/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (150, 'Animal Kingdom', 60, '', 'https://www.imdb.com/title/tt5574490/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (151, 'The Big Bang Theory', 22, '', 'https://www.imdb.com/title/tt0898266/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (152, 'The Mandalorian', 40, '', 'https://www.imdb.com/title/tt8111088/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (153, 'Doctor Who', 45, '', 'https://www.imdb.com/title/tt0436992/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (154, 'Better Call Saul', 46, '', 'https://www.imdb.com/title/tt3032476/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (155, 'The Blacklist', 43, '', 'https://www.imdb.com/title/tt2741602/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (156, 'Reservation Dogs', 30, '', 'https://www.imdb.com/title/tt13623580/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (157, 'The Witcher', 60, '', 'https://www.imdb.com/title/tt5180504/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (158, 'The Good Doctor', 41, '', 'https://www.imdb.com/title/tt6470478/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (159, 'Chicago Med', 43, '', 'https://www.imdb.com/title/tt4655480/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (160, 'Mare of Easttown', 60, '', 'https://www.imdb.com/title/tt10155688/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (161, 'Endeavour', 89, '', 'https://www.imdb.com/title/tt2701582/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (162, 'Schitt\'s Creek', 22, '', 'https://www.imdb.com/title/tt3526078/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (163, 'Shameless', 46, '', 'https://www.imdb.com/title/tt1586680/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (164, 'Friday Night Lights', 44, '', 'https://www.imdb.com/title/tt0758745/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (165, 'Outlander', 64, '', 'https://www.imdb.com/title/tt3006802/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (166, 'It\'s Always Sunny in Philadelphia', 22, '', 'https://www.imdb.com/title/tt0472954/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (167, 'Squid Game', 60, '', 'https://www.imdb.com/title/tt10919420/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (168, 'Mr. Robot', 49, '', 'https://www.imdb.com/title/tt4158110/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (169, 'Outer Banks', 50, '', 'https://www.imdb.com/title/tt10293938/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (170, 'Silent Witness', 120, '', 'https://www.imdb.com/title/tt0115355/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (171, 'Australian Gangster', 180, '', 'https://www.imdb.com/title/tt9265262/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (172, 'Black Mirror', 60, '', 'https://www.imdb.com/title/tt2085059/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (173, 'Help', 98, '', 'https://www.imdb.com/title/tt13649036/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (174, 'How I Met Your Mother', 22, '', 'https://www.imdb.com/title/tt0460649/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (175, 'Ozark', 60, '', 'https://www.imdb.com/title/tt5071412/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (176, 'Turning Point: 9/11 and the War on Terror', 312, '', 'https://www.imdb.com/title/tt15260794/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (177, 'Midsomer Murders', 90, '', 'https://www.imdb.com/title/tt0118401/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (178, 'Lost', 44, '', 'https://www.imdb.com/title/tt0411008/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (179, 'Bones', 40, '', 'https://www.imdb.com/title/tt0460627/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (180, 'Shingeki no kyojin', 24, '', 'https://www.imdb.com/title/tt2560140/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (181, 'Brand New Cherry Flavor', 342, '', 'https://www.imdb.com/title/tt11343600/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (182, 'The Flash', 43, '', 'https://www.imdb.com/title/tt3107288/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (183, 'Suits', 44, '', 'https://www.imdb.com/title/tt1632701/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (184, 'The Chair', 30, '', 'https://www.imdb.com/title/tt11834150/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (185, 'Fargo', 53, '', 'https://www.imdb.com/title/tt2802850/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (186, 'Riverdale', 45, '', 'https://www.imdb.com/title/tt5420376/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (187, 'Chapelwaite', null, '', 'https://www.imdb.com/title/tt11525188/', '', 2, 1, '2021-09-24', 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `user_id`) VALUES (188, 'All the Queen\'s Men', null, '', 'https://www.imdb.com/title/tt14321632/', '', 2, 1, '2021-09-24', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `interest`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `interest` (`id`, `user_id`, `activity_id`) VALUES (1, 2, 2);
INSERT INTO `interest` (`id`, `user_id`, `activity_id`) VALUES (2, 2, 3);
INSERT INTO `interest` (`id`, `user_id`, `activity_id`) VALUES (3, 4, 7);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity_rating`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (1, 'IMDb', 1, 'https://www.imdb.com/title/tt3811906/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (2, 'IMDb', 2, 'https://www.imdb.com/title/tt1160419/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (3, 'IMDb', 3, 'https://www.imdb.com/title/tt9376612/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (4, 'IMDb', 4, 'https://www.imdb.com/title/tt7737528/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (5, 'IMDb', 5, 'https://www.imdb.com/title/tt10155932/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (6, 'IMDb', 6, 'https://www.imdb.com/title/tt11235772/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (7, 'IMDb', 7, 'https://www.imdb.com/title/tt1924245/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (8, 'IMDb', 8, 'https://www.imdb.com/title/tt9347730/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (9, 'IMDb', 9, 'https://www.imdb.com/title/tt6264654/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (10, 'IMDb', 10, 'https://www.imdb.com/title/tt8110232/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (11, 'IMDb', 11, 'https://www.imdb.com/title/tt3228774/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (12, 'IMDb', 12, 'https://www.imdb.com/title/tt10521144/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (13, 'IMDb', 13, 'https://www.imdb.com/title/tt9421570/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (14, 'IMDb', 14, 'https://www.imdb.com/title/tt11286314/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (15, 'IMDb', 15, 'https://www.imdb.com/title/tt7097896/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (16, 'IMDb', 16, 'https://www.imdb.com/title/tt6334354/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (17, 'IMDb', 17, 'https://www.imdb.com/title/tt6372694/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (18, 'IMDb', 18, 'https://www.imdb.com/title/tt0133093/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (19, 'IMDb', 19, 'https://www.imdb.com/title/tt15198608/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (20, 'IMDb', 20, 'https://www.imdb.com/title/tt4244994/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (21, 'IMDb', 21, 'https://www.imdb.com/title/tt11196036/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (22, 'IMDb', 22, 'https://www.imdb.com/title/tt9639470/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (23, 'IMDb', 23, 'https://www.imdb.com/title/tt10954652/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (24, 'IMDb', 24, 'https://www.imdb.com/title/tt10293406/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (25, 'IMDb', 25, 'https://www.imdb.com/title/tt0087182/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (26, 'IMDb', 26, 'https://www.imdb.com/title/tt13234058/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (27, 'IMDb', 27, 'https://www.imdb.com/title/tt3480822/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (28, 'IMDb', 28, 'https://www.imdb.com/title/tt6246322/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (29, 'IMDb', 29, 'https://www.imdb.com/title/tt9115530/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (30, 'IMDb', 30, 'https://www.imdb.com/title/tt9357050/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (31, 'IMDb', 31, 'https://www.imdb.com/title/tt9844522/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (32, 'IMDb', 32, 'https://www.imdb.com/title/tt3272066/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (33, 'IMDb', 33, 'https://www.imdb.com/title/tt8009744/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (34, 'IMDb', 34, 'https://www.imdb.com/title/tt4590256/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (35, 'IMDb', 35, 'https://www.imdb.com/title/tt9243804/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (36, 'IMDb', 36, 'https://www.imdb.com/title/tt5748448/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (37, 'IMDb', 37, 'https://www.imdb.com/title/tt0475276/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (38, 'IMDb', 38, 'https://www.imdb.com/title/tt0234215/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (39, 'IMDb', 39, 'https://www.imdb.com/title/tt10295212/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (40, 'IMDb', 40, 'https://www.imdb.com/title/tt5433138/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (41, 'IMDb', 41, 'https://www.imdb.com/title/tt10083640/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (42, 'IMDb', 42, 'https://www.imdb.com/title/tt13069986/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (43, 'IMDb', 43, 'https://www.imdb.com/title/tt13984924/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (44, 'IMDb', 44, 'https://www.imdb.com/title/tt10665338/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (45, 'IMDb', 45, 'https://www.imdb.com/title/tt8368408/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (46, 'IMDb', 46, 'https://www.imdb.com/title/tt0870154/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (47, 'IMDb', 47, 'https://www.imdb.com/title/tt4154796/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (48, 'IMDb', 48, 'https://www.imdb.com/title/tt8635092/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (49, 'IMDb', 49, 'https://www.imdb.com/title/tt10886166/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (50, 'IMDb', 50, 'https://www.imdb.com/title/tt0111161/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (51, 'IMDb', 51, 'https://www.imdb.com/title/tt10322274/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (52, 'IMDb', 52, 'https://www.imdb.com/title/tt0469641/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (53, 'IMDb', 53, 'https://www.imdb.com/title/tt7131622/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (54, 'IMDb', 54, 'https://www.imdb.com/title/tt8946378/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (55, 'IMDb', 55, 'https://www.imdb.com/title/tt0087843/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (56, 'IMDb', 56, 'https://www.imdb.com/title/tt8772262/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (57, 'IMDb', 57, 'https://www.imdb.com/title/tt10339052/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (58, 'IMDb', 58, 'https://www.imdb.com/title/tt3626476/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (59, 'IMDb', 59, 'https://www.imdb.com/title/tt5362988/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (60, 'IMDb', 60, 'https://www.imdb.com/title/tt10696896/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (61, 'IMDb', 61, 'https://www.imdb.com/title/tt0293429/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (62, 'IMDb', 62, 'https://www.imdb.com/title/tt10366460/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (63, 'IMDb', 63, 'https://www.imdb.com/title/tt0242653/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (64, 'IMDb', 64, 'https://www.imdb.com/title/tt10731768/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (65, 'IMDb', 65, 'https://www.imdb.com/title/tt0120654/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (66, 'IMDb', 66, 'https://www.imdb.com/title/tt0103919/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (67, 'IMDb', 67, 'https://www.imdb.com/title/tt9777666/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (68, 'IMDb', 68, 'https://www.imdb.com/title/tt8368512/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (69, 'IMDb', 69, 'https://www.imdb.com/title/tt0332379/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (70, 'IMDb', 70, 'https://www.imdb.com/title/tt6079772/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (71, 'IMDb', 71, 'https://www.imdb.com/title/tt0241527/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (72, 'IMDb', 72, 'https://www.imdb.com/title/tt11083552/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (73, 'IMDb', 73, 'https://www.imdb.com/title/tt8332922/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (74, 'IMDb', 74, 'https://www.imdb.com/title/tt8404256/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (75, 'IMDb', 75, 'https://www.imdb.com/title/tt6723592/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (76, 'IMDb', 76, 'https://www.imdb.com/title/tt4160708/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (77, 'IMDb', 77, 'https://www.imdb.com/title/tt0993846/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (78, 'IMDb', 78, 'https://www.imdb.com/title/tt1270797/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (79, 'IMDb', 79, 'https://www.imdb.com/title/tt4479380/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (80, 'IMDb', 80, 'https://www.imdb.com/title/tt7888964/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (81, 'IMDb', 81, 'https://www.imdb.com/title/tt12361974/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (82, 'IMDb', 82, 'https://www.imdb.com/title/tt11003218/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (83, 'IMDb', 83, 'https://www.imdb.com/title/tt6878306/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (84, 'IMDb', 84, 'https://www.imdb.com/title/tt11260832/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (85, 'IMDb', 85, 'https://www.imdb.com/title/tt0116996/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (86, 'IMDb', 86, 'https://www.imdb.com/title/tt10272386/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (87, 'IMDb', 87, 'https://www.imdb.com/title/tt9731534/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (88, 'IMDb', 88, 'https://www.imdb.com/title/tt12536294/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (89, 'IMDb', 89, 'https://www.imdb.com/title/tt0816692/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (90, 'IMDb', 90, 'https://www.imdb.com/title/tt12801262/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (91, 'IMDb', 91, 'https://www.imdb.com/title/tt5537002/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (92, 'IMDb', 92, 'https://www.imdb.com/title/tt4052886/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (93, 'IMDb', 93, 'https://www.imdb.com/title/tt7767422/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (94, 'IMDb', 94, 'https://www.imdb.com/title/tt10168312/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (95, 'IMDb', 95, 'https://www.imdb.com/title/tt10986410/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (96, 'IMDb', 96, 'https://www.imdb.com/title/tt1520211/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (97, 'IMDb', 97, 'https://www.imdb.com/title/tt10888878/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (98, 'IMDb', 98, 'https://www.imdb.com/title/tt6468322/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (99, 'IMDb', 99, 'https://www.imdb.com/title/tt8760932/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (100, 'IMDb', 100, 'https://www.imdb.com/title/tt12851524/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (101, 'IMDb', 101, 'https://www.imdb.com/title/tt1844624/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (102, 'IMDb', 102, 'https://www.imdb.com/title/tt8042500/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (103, 'IMDb', 103, 'https://www.imdb.com/title/tt2467372/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (104, 'IMDb', 104, 'https://www.imdb.com/title/tt2788432/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (105, 'IMDb', 105, 'https://www.imdb.com/title/tt0944947/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (106, 'IMDb', 106, 'https://www.imdb.com/title/tt2861424/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (107, 'IMDb', 107, 'https://www.imdb.com/title/tt7203552/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (108, 'IMDb', 108, 'https://www.imdb.com/title/tt13406094/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (109, 'IMDb', 109, 'https://www.imdb.com/title/tt7949218/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (110, 'IMDb', 110, 'https://www.imdb.com/title/tt12682218/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (111, 'IMDb', 111, 'https://www.imdb.com/title/tt1043813/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (112, 'IMDb', 112, 'https://www.imdb.com/title/tt0141842/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (113, 'IMDb', 113, 'https://www.imdb.com/title/tt1532495/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (114, 'IMDb', 114, 'https://www.imdb.com/title/tt11846996/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (115, 'IMDb', 115, 'https://www.imdb.com/title/tt0413573/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (116, 'IMDb', 116, 'https://www.imdb.com/title/tt4270492/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (117, 'IMDb', 117, 'https://www.imdb.com/title/tt4236770/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (118, 'IMDb', 118, 'https://www.imdb.com/title/tt2442560/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (119, 'IMDb', 119, 'https://www.imdb.com/title/tt1606375/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (120, 'IMDb', 120, 'https://www.imdb.com/title/tt0903747/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (121, 'IMDb', 121, 'https://www.imdb.com/title/tt0386676/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (122, 'IMDb', 122, 'https://www.imdb.com/title/tt7908628/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (123, 'IMDb', 123, 'https://www.imdb.com/title/tt8421350/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (124, 'IMDb', 124, 'https://www.imdb.com/title/tt10919486/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (125, 'IMDb', 125, 'https://www.imdb.com/title/tt7660850/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (126, 'IMDb', 126, 'https://www.imdb.com/title/tt0306414/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (127, 'IMDb', 127, 'https://www.imdb.com/title/tt6474378/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (128, 'IMDb', 128, 'https://www.imdb.com/title/tt0773262/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (129, 'IMDb', 129, 'https://www.imdb.com/title/tt0108778/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (130, 'IMDb', 130, 'https://www.imdb.com/title/tt0452046/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (131, 'IMDb', 131, 'https://www.imdb.com/title/tt0364845/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (132, 'IMDb', 132, 'https://www.imdb.com/title/tt2261391/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (133, 'IMDb', 133, 'https://www.imdb.com/title/tt0460681/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (134, 'IMDb', 134, 'https://www.imdb.com/title/tt1190634/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (135, 'IMDb', 135, 'https://www.imdb.com/title/tt10478054/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (136, 'IMDb', 136, 'https://www.imdb.com/title/tt4574334/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (137, 'IMDb', 137, 'https://www.imdb.com/title/tt7335184/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (138, 'IMDb', 138, 'https://www.imdb.com/title/tt12714854/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (139, 'IMDb', 139, 'https://www.imdb.com/title/tt5540990/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (140, 'IMDb', 140, 'https://www.imdb.com/title/tt2306299/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (141, 'IMDb', 141, 'https://www.imdb.com/title/tt14479078/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (142, 'IMDb', 142, 'https://www.imdb.com/title/tt13444408/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (143, 'IMDb', 143, 'https://www.imdb.com/title/tt12306692/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (144, 'IMDb', 144, 'https://www.imdb.com/title/tt0203259/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (145, 'IMDb', 145, 'https://www.imdb.com/title/tt1442437/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (146, 'IMDb', 146, 'https://www.imdb.com/title/tt5834204/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (147, 'IMDb', 147, 'https://www.imdb.com/title/tt7660970/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (148, 'IMDb', 148, 'https://www.imdb.com/title/tt9140554/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (149, 'IMDb', 149, 'https://www.imdb.com/title/tt13784584/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (150, 'IMDb', 150, 'https://www.imdb.com/title/tt5574490/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (151, 'IMDb', 151, 'https://www.imdb.com/title/tt0898266/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (152, 'IMDb', 152, 'https://www.imdb.com/title/tt8111088/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (153, 'IMDb', 153, 'https://www.imdb.com/title/tt0436992/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (154, 'IMDb', 154, 'https://www.imdb.com/title/tt3032476/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (155, 'IMDb', 155, 'https://www.imdb.com/title/tt2741602/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (156, 'IMDb', 156, 'https://www.imdb.com/title/tt13623580/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (157, 'IMDb', 157, 'https://www.imdb.com/title/tt5180504/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (158, 'IMDb', 158, 'https://www.imdb.com/title/tt6470478/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (159, 'IMDb', 159, 'https://www.imdb.com/title/tt4655480/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (160, 'IMDb', 160, 'https://www.imdb.com/title/tt10155688/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (161, 'IMDb', 161, 'https://www.imdb.com/title/tt2701582/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (162, 'IMDb', 162, 'https://www.imdb.com/title/tt3526078/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (163, 'IMDb', 163, 'https://www.imdb.com/title/tt1586680/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (164, 'IMDb', 164, 'https://www.imdb.com/title/tt0758745/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (165, 'IMDb', 165, 'https://www.imdb.com/title/tt3006802/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (166, 'IMDb', 166, 'https://www.imdb.com/title/tt0472954/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (167, 'IMDb', 167, 'https://www.imdb.com/title/tt10919420/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (168, 'IMDb', 168, 'https://www.imdb.com/title/tt4158110/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (169, 'IMDb', 169, 'https://www.imdb.com/title/tt10293938/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (170, 'IMDb', 170, 'https://www.imdb.com/title/tt0115355/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (171, 'IMDb', 171, 'https://www.imdb.com/title/tt9265262/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (172, 'IMDb', 172, 'https://www.imdb.com/title/tt2085059/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (173, 'IMDb', 173, 'https://www.imdb.com/title/tt13649036/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (174, 'IMDb', 174, 'https://www.imdb.com/title/tt0460649/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (175, 'IMDb', 175, 'https://www.imdb.com/title/tt5071412/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (176, 'IMDb', 176, 'https://www.imdb.com/title/tt15260794/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (177, 'IMDb', 177, 'https://www.imdb.com/title/tt0118401/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (178, 'IMDb', 178, 'https://www.imdb.com/title/tt0411008/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (179, 'IMDb', 179, 'https://www.imdb.com/title/tt0460627/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (180, 'IMDb', 180, 'https://www.imdb.com/title/tt2560140/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (181, 'IMDb', 181, 'https://www.imdb.com/title/tt11343600/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (182, 'IMDb', 182, 'https://www.imdb.com/title/tt3107288/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (183, 'IMDb', 183, 'https://www.imdb.com/title/tt1632701/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (184, 'IMDb', 184, 'https://www.imdb.com/title/tt11834150/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (185, 'IMDb', 185, 'https://www.imdb.com/title/tt2802850/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (186, 'IMDb', 186, 'https://www.imdb.com/title/tt5420376/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (187, 'IMDb', 187, 'https://www.imdb.com/title/tt11525188/');
INSERT INTO `activity_rating` (`id`, `name`, `activity_id`, `url`) VALUES (188, 'IMDb', 188, 'https://www.imdb.com/title/tt14321632/');

COMMIT;


-- -----------------------------------------------------
-- Data for table `experience`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `experience` (`id`, `rating`, `interest_id`, `experience_date`) VALUES (1, 1, 1, '2021-09-24');
INSERT INTO `experience` (`id`, `rating`, `interest_id`, `experience_date`) VALUES (2, 3, 2, '2021-09-24');
INSERT INTO `experience` (`id`, `rating`, `interest_id`, `experience_date`) VALUES (3, 5, 3, '2021-09-24');

COMMIT;

