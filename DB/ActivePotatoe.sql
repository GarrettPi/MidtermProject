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
  `activity_url` VARCHAR(1000) NOT NULL,
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
  `first_name` VARCHAR(255) NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `password_salt` VARCHAR(255) NULL DEFAULT NULL,
  `last_name` VARCHAR(255) NULL DEFAULT NULL,
  `email` VARCHAR(255) NULL DEFAULT NULL,
  `enabled` TINYINT NULL DEFAULT NULL,
  `role` VARCHAR(255) NULL DEFAULT NULL,
  `profile_url` VARCHAR(1000) NULL DEFAULT 'https://ih1.redbubble.net/image.939692630.5711/st,small,845x845-pad,1000x1000,f8f8f8.jpg',
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
  `description` VARCHAR(1000) NULL DEFAULT NULL,
  `url` VARCHAR(1000) NULL DEFAULT NULL,
  `image_url` VARCHAR(1000) NULL DEFAULT NULL,
  `activity_type_id` INT NOT NULL,
  `activity_category_id` INT NOT NULL,
  `create_date` DATE NULL DEFAULT NULL,
  `last_update_date` DATE NULL DEFAULT NULL,
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
  `experience_date` DATE NULL DEFAULT NULL,
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
  `comment` VARCHAR(255) NULL DEFAULT NULL,
  `comment_date` DATE NULL DEFAULT NULL,
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
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (1, 'Movie', 'https://cdn.pixabay.com/photo/2013/07/13/13/36/film-161204_960_720.png');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (2, 'TV Series', 'https://cdn.pixabay.com/photo/2013/07/13/13/36/film-161204_960_720.png');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (3, 'Mini Game', 'https://icons.iconarchive.com/icons/paomedia/small-n-flat/256/gamepad-icon.png');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (4, 'Archery', 'https://png.pngtree.com/png-clipart/20190611/original/pngtree-a-bow-and-arrow-png-image_2808604.jpg');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (5, 'Baseball', 'https://image.freepik.com/free-vector/doodle-baseball_1034-761.jpg');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (6, 'Beach Volleyball', 'https://image.freepik.com/free-vector/realistic-white-volleyball-ball-sports-equipment-leather-ball-beach-volleyball-water-polo_390775-166.jpg');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (7, 'Birdwatching', 'https://image.freepik.com/free-vector/illustration-binocular_53876-5600.jpg');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (8, 'Camping', 'https://image.flaticon.com/icons/png/512/1040/1040426.png');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (9, 'Football', 'https://img.freepik.com/free-vector/realistic-football-rugby-ball-icon-isolated_98292-4385.jpg?size=338&ext=jpg');
INSERT INTO `activity_type` (`id`, `name`, `activity_url`) VALUES (10, 'Frisbee', 'https://image.freepik.com/free-icon/frisbee_318-1495.jpg');

COMMIT;


-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `user` (`id`, `username`, `first_name`, `password`, `password_salt`, `last_name`, `email`, `enabled`, `role`, `profile_url`) VALUES (1, 'insert', 'insert', 'QbLlmoL9Xzl1nC+q7kJ9SXYiYYfZiHClGMxiD5lWDks=', 'QPlNdf2A80jziqfxbQR6Rqd5xvwQiv', 'insert', 'insert@example.com', 1, 'admin', NULL);
INSERT INTO `user` (`id`, `username`, `first_name`, `password`, `password_salt`, `last_name`, `email`, `enabled`, `role`, `profile_url`) VALUES (2, 'jacob', 'jacob', 'j92fQuLNlLJNveikD/VNgYAiU8Gm4wwnmIzg1r4xgMY=', 'TcDu4nKBtBQGgUKjLiqdNLLdPgH930', 'tweedy', 'jacob@example.com', 1, 'admin', NULL);
INSERT INTO `user` (`id`, `username`, `first_name`, `password`, `password_salt`, `last_name`, `email`, `enabled`, `role`, `profile_url`) VALUES (3, 'ron', 'ron', 'Aq4bfE8Hw4yTnUKeqK872MH8ZDe0CsOzHx4gy58k/94=', 'o2YPDdi0lCawyTC2ksaxs3eN6NEWLp', 'viramontes', 'ron@example.com', 1, 'admin', NULL);
INSERT INTO `user` (`id`, `username`, `first_name`, `password`, `password_salt`, `last_name`, `email`, `enabled`, `role`, `profile_url`) VALUES (4, 'garrett', 'garrett', 'POiM3OazZnGnDH2efxjbBmGX6Dxzzv5tsAqHm9Gb5jk=', 'GsEhg00F4yXJa4epxQokW7RevXGeLL', 'pipes', 'garrett@example.com', 1, 'admin', NULL);
INSERT INTO `user` (`id`, `username`, `first_name`, `password`, `password_salt`, `last_name`, `email`, `enabled`, `role`, `profile_url`) VALUES (5, 'cindy', 'cindy', '+7BB7C4g56fMaaRI/vxsfZYmCqSD6ilSFiiqtkETCmU=', 'SV75jdLvAY074afLR6ZapHC8rmgi2b', 'chase', 'cindy@example.com', 1, 'admin', NULL);
INSERT INTO `user` (`id`, `username`, `first_name`, `password`, `password_salt`, `last_name`, `email`, `enabled`, `role`, `profile_url`) VALUES (6, 'test', 'test', 'x75v9pjhF2CybXq3gjVb3EGu7pw9lJ78MlgLMmzKwDw=', 'aRFXocBwaZFi5jwEoVXekiErxPAeWJ', 'test', 'test@example.com', 1, 'admin', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `activity`
-- -----------------------------------------------------
START TRANSACTION;
USE `potatodb`;
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (1, 'Malignant', 111, 'Paralyzed by fear from shocking visions, a woman\'s torment worsens as she discovers her waking dreams are terrifying realities.', 'https://www.imdb.com/title/tt3811906/', 'https://m.media-amazon.com/images/M/MV5BYTc0NWIwOTYtNzEwYi00YmUyLTlmYWYtYjJiZjRjN2RjMjAxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (2, 'Dune', 155, 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet\'s exclusive supply of the most precious resource in existence, only those who can conquer their own fear will survive.', 'https://www.imdb.com/title/tt1160419/', 'https://m.media-amazon.com/images/M/MV5BN2FjNmEyNWMtYzM0ZS00NjIyLTg5YzYtYThlMGVjNzE1OGViXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (3, 'Shang-Chi and the Legend of the Ten Rings', 132, 'Martial-arts master Shang-Chi confronts the past he thought he left behind when he\'s drawn into the web of the mysterious Ten Rings organization.', 'https://www.imdb.com/title/tt9376612/', 'https://m.media-amazon.com/images/M/MV5BYzM0YjJlMWEtZTg0MS00NjM4LWJkMDktN2VmZGU2ZjQ1YjI2XkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (4, 'Kate', 106, 'Slipped a fatal poison on her final job, a ruthless Tokyo assassin has less than 24 hours to find out who ordered the hit and exact revenge.', 'https://www.imdb.com/title/tt7737528/', 'https://m.media-amazon.com/images/M/MV5BN2IyYzI4YmQtNzBmMi00Mjg3LWI4NTMtNmZjNjk3YjIwZmJhXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (5, 'Cinderella', 113, 'Cinderella is a 2021 romantic musical film based on the fairy tale of the same name by Charles Perrault. Written and directed by Kay Cannon, it stars singer Camila Cabello as the title character in her acting debut, alongside Idina Menzel, Minnie Driver, Nicholas Galitzine, Billy Porter, and Pierce Brosnan.', 'https://www.imdb.com/title/tt10155932/', 'https://m.media-amazon.com/images/M/MV5BMjhlNGIwYmYtMzQyMC00ZGE5LWFlZDctOTEzZWM5NWQ3MWRjXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (6, 'The Voyeurs', 120, 'Innocent curiosity turns into full-blown obsession when a young Montreal couple spy on their eccentric neighbours across the street.', 'https://www.imdb.com/title/tt11235772/', 'https://m.media-amazon.com/images/M/MV5BZmQzMGE0YzEtZjNiYS00Mjg5LTgyOTctNWViZTFiZDAzYTNkXkEyXkFqcGdeQXVyODk4OTc3MTY@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (7, 'Cry Macho', 104, 'A onetime rodeo star and washed-up horse breeder, in 1978, takes a job from an ex-boss to bring the man\'s young son home and away from his alcoholic mum. Crossing rural Mexico on their back way to Texas, the unlikely pair faces an unexpectedly challenging journey, during which the world-weary horseman may find his own sense of redemption through teaching the boy what it means to be a good man.', 'https://www.imdb.com/title/tt1924245/', 'https://m.media-amazon.com/images/M/MV5BOGQ5OTBkNzAtYWQxYy00YjIxLWJkNTAtNTM2NDMxYzdkZDVmXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (8, 'Candyman', 91, 'For decades, the housing projects of Chicago\'s Cabrini-Green were terrorized by a ghost story about a supernatural, hook-handed killer. In present day, an artist begins to explore the macabre history of Candyman, not knowing it would unravel his sanity and unleash a terrifying wave of violence that puts him on a collision course with destiny.', 'https://www.imdb.com/title/tt9347730/', 'https://m.media-amazon.com/images/M/MV5BOWEzNDAxYmEtYWU0Zi00ZjZjLTkxY2QtMGY1MjY5ZjVhNDdjXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (9, 'Free Guy', 115, 'When a bank teller discovers he\'s actually a background player in an open-world video game, he decides to become the hero of his own story -- one that he can rewrite himself. In a world where there\'s no limits, he\'s determined to save the day his way before it\'s too late, and maybe find a little romance with the coder who conceived him.', 'https://www.imdb.com/title/tt6264654/', 'https://m.media-amazon.com/images/M/MV5BOTY2NzFjODctOWUzMC00MGZhLTlhNjMtM2Y2ODBiNGY1ZWRiXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (10, 'The Many Saints of Newark', 120, 'Young Anthony Soprano is growing up in one of the most tumultuous eras in Newark, N.J., history, becoming a man just as rival gangsters start to rise up and challenge the all-powerful DiMeo crime family. Caught up in the changing times is the uncle he idolizes, Dickie Moltisanti, whose influence over his nephew will help shape the impressionable teenager into the all-powerful mob boss, Tony Soprano.', 'https://www.imdb.com/title/tt8110232/', 'https://m.media-amazon.com/images/M/MV5BYmQzNmY3YzItOTE3OC00NGZjLTkwZDYtOWVmM2QyMzhiYTgwXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (11, 'Cruella', 134, 'Estella is a young and clever grifter who\'s determined to make a name for herself in the fashion world. She soon meets a pair of thieves who appreciate her appetite for mischief, and together they build a life for themselves on the streets of London. However, when Estella befriends fashion legend Baroness von Hellman, she embraces her wicked side to become the raucous and revenge-bent Cruella.', 'https://www.imdb.com/title/tt3228774/', 'https://m.media-amazon.com/images/M/MV5BOWI5YTUxOWEtZmRiZS00ZmQxLWE2NzctYTRiODA2NzE1ZjczXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (12, 'Nightbooks', 103, 'Scary story fan Alex must tell a spine-tingling tale every night, or stay trapped with his new friend in a wicked witch\'s magical apartment forever.', 'https://www.imdb.com/title/tt10521144/', 'https://m.media-amazon.com/images/M/MV5BY2E4MmNmMzgtOTI2YS00MzhjLTlmOWItZTkxNWRkYTY2NDcwXkEyXkFqcGdeQXVyNjY1MTg4Mzc@._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (13, 'The Guilty', 90, 'A troubled police detective demoted to 911 operator duty scrambles to save a distressed caller during a harrowing day of revelations -- and reckonings.', 'https://www.imdb.com/title/tt9421570/', 'https://m.media-amazon.com/images/M/MV5BMTJjYjVkMGQtNTM1Yi00Mjc3LWI5YzEtN2NiYTQ4NDU4NjdmXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_UY1200_CR165,0,630,1200_AL_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (14, 'Don\'t Look Up', 145, 'Two low-level astronomers must go on a giant media tour to warn mankind of an approaching comet that will destroy planet Earth.', 'https://www.imdb.com/title/tt11286314/', 'https://m.media-amazon.com/images/M/MV5BYTA5MzRmZDEtYTRjNi00YTc3LTllZWUtYzc1Njg2Y2YwZDljXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (15, 'Venom: Let There Be Carnage', 90, 'Venom springs into action when notorious serial killer Cletus Kasady transforms into the evil Carnage.', 'https://www.imdb.com/title/tt7097896/', 'https://m.media-amazon.com/images/M/MV5BNTFiNzBlYmEtMTcxZS00ZTEyLWJmYmQtMjYzYjAxNGQwODAzXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (16, 'The Suicide Squad', 132, 'Assemble a team of the world\'s most dangerous, incarcerated Super Villains, provide them with the most powerful arsenal at the government\'s disposal, and send them off on a mission to defeat an enigmatic, insuperable entity. U.S. intelligence officer Amanda Waller has determined only a secretly convened group of disparate, despicable individuals with next to nothing to lose will do. However, once they realize they weren\'t picked to succeed but chosen for their patent culpability when they inevitably fail, will the Suicide Squad resolve to die trying, or decide it\'s every man for himself.', 'https://www.imdb.com/title/tt6334354/', 'https://m.media-amazon.com/images/M/MV5BNGM3YzdlOWYtNjViZS00MTE2LWE1MWUtZmE2ZTcxZjcyMmU3XkEyXkFqcGdeQXVyODEyMTI1MjA@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (17, 'Prisoners of the Ghostland', 103, 'In the treacherous frontier city of Samurai Town, a ruthless bank robber gets sprung from jail by a wealthy warlord whose adopted granddaughter has gone missing. He offers the prisoner his freedom in exchange for retrieving the runaway. Strapped into a leather suit that will self-destruct in five days, the bandit sets off on a journey to find the young woman -- and his own path to redemption.', 'https://www.imdb.com/title/tt6372694/', 'https://m.media-amazon.com/images/M/MV5BYTE3YWU3MjYtYTAxYy00ODQ0LTg3MDQtMmNjMDU3MDRlNTY2XkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (18, 'The Matrix', 136, 'Plagued by strange memories, Neo\'s life takes an unexpected turn when he finds himself back inside the Matrix.', 'https://www.imdb.com/title/tt0133093/', 'https://m.media-amazon.com/images/M/MV5BNzNlZTZjMDctZjYwNi00NzljLWIwN2QtZWZmYmJiYzQ0MTk2XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (19, 'Prey', 87, 'Roman, his brother Albert and their friends go on a hiking trip into the wild. The group soon find themselves in a desperate bid for survival when they realize that they have fallen prey to a mysterious shooter.', 'https://www.imdb.com/title/tt15198608/', 'https://m.media-amazon.com/images/M/MV5BMzkwZjMwNjMtOGQwMC00MzJjLWI5NzYtOTJjZWVmODNjNDdmXkEyXkFqcGdeQXVyNjE4ODA3NTY@._V1_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (20, 'The Last Duel', 152, 'A woman claims she\'s been raped by her husband\'s best friend, Jean de Carrouges. But when no one believes her accusation, her husband challenges his friend to a duel, the last legally sanctioned duel in the country\'s history.', 'https://www.imdb.com/title/tt4244994/', 'https://m.media-amazon.com/images/M/MV5BZmRkZTIzZDUtZWMwZC00YjJlLThiYzUtZDUwOGY2ZDM3ZTIzXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg', 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (21, 'The Card Counter', 111, NULL, 'https://www.imdb.com/title/tt11196036/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (22, 'Last Night in Soho', 116, NULL, 'https://www.imdb.com/title/tt9639470/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (23, 'Old', 108, NULL, 'https://www.imdb.com/title/tt10954652/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (24, 'The Power of the Dog', 126, NULL, 'https://www.imdb.com/title/tt10293406/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (25, 'Dune', 137, NULL, 'https://www.imdb.com/title/tt0087182/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (26, 'My Son', 95, NULL, 'https://www.imdb.com/title/tt13234058/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (27, 'Black Widow', 134, NULL, 'https://www.imdb.com/title/tt3480822/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (28, 'Don\'t Breathe 2', 98, NULL, 'https://www.imdb.com/title/tt6246322/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (29, 'The Eyes of Tammy Faye', 126, NULL, 'https://www.imdb.com/title/tt9115530/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (30, 'Dear Evan Hansen', 137, NULL, 'https://www.imdb.com/title/tt9357050/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (31, 'Escape Room: Tournament of Champions', 88, NULL, 'https://www.imdb.com/title/tt9844522/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (32, 'Reminiscence', 116, NULL, 'https://www.imdb.com/title/tt3272066/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (33, 'What Is Life Worth', 118, NULL, 'https://www.imdb.com/title/tt8009744/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (34, 'He\'s All That', 88, NULL, 'https://www.imdb.com/title/tt4590256/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (35, 'The Green Knight', 130, NULL, 'https://www.imdb.com/title/tt9243804/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (36, 'Copshop', 107, NULL, 'https://www.imdb.com/title/tt5748448/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (37, 'United 93', 111, NULL, 'https://www.imdb.com/title/tt0475276/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (38, 'The Matrix Reloaded', 138, NULL, 'https://www.imdb.com/title/tt0234215/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (39, 'Shershaah', 135, NULL, 'https://www.imdb.com/title/tt10295212/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (40, 'F9', 143, NULL, 'https://www.imdb.com/title/tt5433138/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (41, 'Bhoot Police', 129, NULL, 'https://www.imdb.com/title/tt10083640/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (42, 'After We Fell', 99, NULL, 'https://www.imdb.com/title/tt13069986/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (43, 'Fauci', 104, NULL, 'https://www.imdb.com/title/tt13984924/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (44, 'Halloween Kills', 106, NULL, 'https://www.imdb.com/title/tt10665338/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (45, 'Gunpowder Milkshake', 114, NULL, 'https://www.imdb.com/title/tt8368408/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (46, 'Jungle Cruise', 127, NULL, 'https://www.imdb.com/title/tt0870154/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (47, 'Avengers: Endgame', 181, NULL, 'https://www.imdb.com/title/tt4154796/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (48, 'Everybody\'s Talking About Jamie', 115, NULL, 'https://www.imdb.com/title/tt8635092/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (49, '365 dni', 114, NULL, 'https://www.imdb.com/title/tt10886166/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (50, 'The Shawshank Redemption', 142, NULL, 'https://www.imdb.com/title/tt0111161/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (51, 'Schumacher', 112, NULL, 'https://www.imdb.com/title/tt10322274/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (52, 'World Trade Center', 129, NULL, 'https://www.imdb.com/title/tt0469641/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (53, 'Once Upon a Time... in Hollywood', 161, NULL, 'https://www.imdb.com/title/tt7131622/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (54, 'Knives Out', 130, NULL, 'https://www.imdb.com/title/tt8946378/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (55, 'Once Upon a Time in America', 229, NULL, 'https://www.imdb.com/title/tt0087843/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (56, 'Midsommar', 148, NULL, 'https://www.imdb.com/title/tt8772262/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (57, 'Best Sellers', 102, NULL, 'https://www.imdb.com/title/tt10339052/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (58, 'Vacation Friends', 103, NULL, 'https://www.imdb.com/title/tt3626476/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (59, 'Wind River', 107, NULL, 'https://www.imdb.com/title/tt5362988/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (60, 'Stillwater', 139, NULL, 'https://www.imdb.com/title/tt10696896/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (61, 'Mortal Kombat', 110, NULL, 'https://www.imdb.com/title/tt0293429/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (62, 'CODA', 111, NULL, 'https://www.imdb.com/title/tt10366460/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (63, 'The Matrix Revolutions', 129, NULL, 'https://www.imdb.com/title/tt0242653/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (64, 'Sweet Girl', 110, NULL, 'https://www.imdb.com/title/tt10731768/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (65, 'Dirty Work', 82, NULL, 'https://www.imdb.com/title/tt0120654/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (66, 'Candyman', 99, NULL, 'https://www.imdb.com/title/tt0103919/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (67, 'The Tomorrow War', 138, NULL, 'https://www.imdb.com/title/tt9777666/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (68, 'The Courier', 112, NULL, 'https://www.imdb.com/title/tt8368512/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (69, 'The School of Rock', 109, NULL, 'https://www.imdb.com/title/tt0332379/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (70, 'The Protege', 109, NULL, 'https://www.imdb.com/title/tt6079772/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (71, 'Harry Potter and the Sorcerer\'s Stone', 152, NULL, 'https://www.imdb.com/title/tt0241527/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (72, 'Wrath of Man', 119, NULL, 'https://www.imdb.com/title/tt11083552/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (73, 'A Quiet Place Part II', 97, NULL, 'https://www.imdb.com/title/tt8332922/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (74, 'Snake Eyes: G.I. Joe Origins', 121, NULL, 'https://www.imdb.com/title/tt8404256/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (75, 'Tenet', 150, NULL, 'https://www.imdb.com/title/tt6723592/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (76, 'Don\'t Breathe', 88, NULL, 'https://www.imdb.com/title/tt4160708/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (77, 'The Wolf of Wall Street', 180, NULL, 'https://www.imdb.com/title/tt0993846/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (78, 'Venom', 112, NULL, 'https://www.imdb.com/title/tt1270797/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (79, 'SAS: Red Notice', 124, NULL, 'https://www.imdb.com/title/tt4479380/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (80, 'Nobody', 92, NULL, 'https://www.imdb.com/title/tt7888964/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (81, 'Zack Snyder\'s Justice League', 242, NULL, 'https://www.imdb.com/title/tt12361974/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (82, 'Pig', 92, NULL, 'https://www.imdb.com/title/tt11003218/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (83, 'News of the World', 118, NULL, 'https://www.imdb.com/title/tt6878306/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (84, 'Bellbottom', 123, NULL, 'https://www.imdb.com/title/tt11260832/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (85, 'Mars Attacks!', 106, NULL, 'https://www.imdb.com/title/tt0116996/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (86, 'The Father', 97, NULL, 'https://www.imdb.com/title/tt10272386/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (87, 'The Night House', 107, NULL, 'https://www.imdb.com/title/tt9731534/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (88, 'Spencer', 111, NULL, 'https://www.imdb.com/title/tt12536294/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (89, 'Interstellar', 169, NULL, 'https://www.imdb.com/title/tt0816692/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (90, 'Luca', 95, NULL, 'https://www.imdb.com/title/tt12801262/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (91, 'Killers of the Flower Moon', 91, NULL, 'https://www.imdb.com/title/tt5537002/', NULL, 1, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (92, 'Lucifer', 42, NULL, 'https://www.imdb.com/title/tt4052886/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (93, 'Sex Education', 45, NULL, 'https://www.imdb.com/title/tt7767422/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (94, 'What If...?', NULL, NULL, 'https://www.imdb.com/title/tt10168312/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (95, 'Ted Lasso', 30, NULL, 'https://www.imdb.com/title/tt10986410/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (96, 'The Walking Dead', 44, NULL, 'https://www.imdb.com/title/tt1520211/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (97, 'Clickbait', 368, NULL, 'https://www.imdb.com/title/tt10888878/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (98, 'La casa de papel', 70, NULL, 'https://www.imdb.com/title/tt6468322/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (99, 'Nine Perfect Strangers', 388, NULL, 'https://www.imdb.com/title/tt8760932/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (100, 'Only Murders in the Building', NULL, NULL, 'https://www.imdb.com/title/tt12851524/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (101, 'American Horror Story', 60, NULL, 'https://www.imdb.com/title/tt1844624/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (102, 'Y: The Last Man', 60, NULL, 'https://www.imdb.com/title/tt8042500/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (103, 'Brooklyn Nine-Nine', 22, NULL, 'https://www.imdb.com/title/tt2467372/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (104, 'American Crime Story', 42, NULL, 'https://www.imdb.com/title/tt2788432/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (105, 'Game of Thrones', 57, NULL, 'https://www.imdb.com/title/tt0944947/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (106, 'Rick and Morty', 23, NULL, 'https://www.imdb.com/title/tt2861424/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (107, 'The Morning Show', 60, NULL, 'https://www.imdb.com/title/tt7203552/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (108, 'The White Lotus', 353, NULL, 'https://www.imdb.com/title/tt13406094/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (109, 'See', 60, NULL, 'https://www.imdb.com/title/tt7949218/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (110, 'Scenes from a Marriage', 60, NULL, 'https://www.imdb.com/title/tt12682218/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (111, 'Titans', 45, NULL, 'https://www.imdb.com/title/tt1043813/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (112, 'The Sopranos', 55, NULL, 'https://www.imdb.com/title/tt0141842/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (113, 'American Rust', NULL, NULL, 'https://www.imdb.com/title/tt1532495/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (114, 'Vigil', NULL, NULL, 'https://www.imdb.com/title/tt11846996/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (115, 'Grey\'s Anatomy', 41, NULL, 'https://www.imdb.com/title/tt0413573/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (116, 'Billions', 60, NULL, 'https://www.imdb.com/title/tt4270492/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (117, 'Yellowstone', 60, NULL, 'https://www.imdb.com/title/tt4236770/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (118, 'Peaky Blinders', 60, NULL, 'https://www.imdb.com/title/tt2442560/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (119, 'Downton Abbey', 58, NULL, 'https://www.imdb.com/title/tt1606375/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (120, 'Breaking Bad', 49, NULL, 'https://www.imdb.com/title/tt0903747/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (121, 'The Office', 22, NULL, 'https://www.imdb.com/title/tt0386676/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (122, 'What We Do in the Shadows', 30, NULL, 'https://www.imdb.com/title/tt7908628/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (123, 'Manifest', 43, NULL, 'https://www.imdb.com/title/tt8421350/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (124, 'Into the Night', NULL, NULL, 'https://www.imdb.com/title/tt10919486/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (125, 'Succession', 60, NULL, 'https://www.imdb.com/title/tt7660850/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (126, 'The Wire', 59, NULL, 'https://www.imdb.com/title/tt0306414/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (127, 'Good Girls', 43, NULL, 'https://www.imdb.com/title/tt6474378/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (128, 'Dexter', 53, NULL, 'https://www.imdb.com/title/tt0773262/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (129, 'Friends', 22, NULL, 'https://www.imdb.com/title/tt0108778/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (130, 'Criminal Minds', 42, NULL, 'https://www.imdb.com/title/tt0452046/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (131, 'NCIS: Naval Criminal Investigative Service', 60, NULL, 'https://www.imdb.com/title/tt0364845/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (132, 'Chicago Fire', 43, NULL, 'https://www.imdb.com/title/tt2261391/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (133, 'Supernatural', 44, NULL, 'https://www.imdb.com/title/tt0460681/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (134, 'The Boys', 60, NULL, 'https://www.imdb.com/title/tt1190634/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (135, 'The Lost Symbol', NULL, NULL, 'https://www.imdb.com/title/tt10478054/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (136, 'Stranger Things', 51, NULL, 'https://www.imdb.com/title/tt4574334/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (137, 'You', 45, NULL, 'https://www.imdb.com/title/tt7335184/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (138, 'Mumbai Diaries 26/11', NULL, NULL, 'https://www.imdb.com/title/tt12714854/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (139, 'On the Verge', 35, NULL, 'https://www.imdb.com/title/tt5540990/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (140, 'Vikings', 44, NULL, 'https://www.imdb.com/title/tt2306299/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (141, 'Candy', 39, NULL, 'https://www.imdb.com/title/tt14479078/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (142, 'Kin', NULL, NULL, 'https://www.imdb.com/title/tt13444408/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (143, 'American Horror Stories', 45, NULL, 'https://www.imdb.com/title/tt12306692/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (144, 'Law & Order: Special Victims Unit', 60, NULL, 'https://www.imdb.com/title/tt0203259/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (145, 'Modern Family', 22, NULL, 'https://www.imdb.com/title/tt1442437/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (146, 'The Handmaid\'s Tale', 60, NULL, 'https://www.imdb.com/title/tt5834204/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (147, 'The North Water', 300, NULL, 'https://www.imdb.com/title/tt7660970/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (148, 'Loki', NULL, NULL, 'https://www.imdb.com/title/tt9140554/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (149, 'Fantasy Island', NULL, NULL, 'https://www.imdb.com/title/tt13784584/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (150, 'Animal Kingdom', 60, NULL, 'https://www.imdb.com/title/tt5574490/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (151, 'The Big Bang Theory', 22, NULL, 'https://www.imdb.com/title/tt0898266/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (152, 'The Mandalorian', 40, NULL, 'https://www.imdb.com/title/tt8111088/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (153, 'Doctor Who', 45, NULL, 'https://www.imdb.com/title/tt0436992/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (154, 'Better Call Saul', 46, NULL, 'https://www.imdb.com/title/tt3032476/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (155, 'The Blacklist', 43, NULL, 'https://www.imdb.com/title/tt2741602/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (156, 'Reservation Dogs', 30, NULL, 'https://www.imdb.com/title/tt13623580/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (157, 'The Witcher', 60, NULL, 'https://www.imdb.com/title/tt5180504/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (158, 'The Good Doctor', 41, NULL, 'https://www.imdb.com/title/tt6470478/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (159, 'Chicago Med', 43, NULL, 'https://www.imdb.com/title/tt4655480/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (160, 'Mare of Easttown', 60, NULL, 'https://www.imdb.com/title/tt10155688/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (161, 'Endeavour', 89, NULL, 'https://www.imdb.com/title/tt2701582/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (162, 'Schitt\'s Creek', 22, NULL, 'https://www.imdb.com/title/tt3526078/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (163, 'Shameless', 46, NULL, 'https://www.imdb.com/title/tt1586680/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (164, 'Friday Night Lights', 44, NULL, 'https://www.imdb.com/title/tt0758745/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (165, 'Outlander', 64, NULL, 'https://www.imdb.com/title/tt3006802/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (166, 'It\'s Always Sunny in Philadelphia', 22, NULL, 'https://www.imdb.com/title/tt0472954/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (167, 'Squid Game', 60, NULL, 'https://www.imdb.com/title/tt10919420/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (168, 'Mr. Robot', 49, NULL, 'https://www.imdb.com/title/tt4158110/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (169, 'Outer Banks', 50, NULL, 'https://www.imdb.com/title/tt10293938/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (170, 'Silent Witness', 120, NULL, 'https://www.imdb.com/title/tt0115355/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (171, 'Australian Gangster', 180, NULL, 'https://www.imdb.com/title/tt9265262/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (172, 'Black Mirror', 60, NULL, 'https://www.imdb.com/title/tt2085059/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (173, 'Help', 98, NULL, 'https://www.imdb.com/title/tt13649036/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (174, 'How I Met Your Mother', 22, NULL, 'https://www.imdb.com/title/tt0460649/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (175, 'Ozark', 60, NULL, 'https://www.imdb.com/title/tt5071412/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (176, 'Turning Point: 9/11 and the War on Terror', 312, NULL, 'https://www.imdb.com/title/tt15260794/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (177, 'Midsomer Murders', 90, NULL, 'https://www.imdb.com/title/tt0118401/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (178, 'Lost', 44, NULL, 'https://www.imdb.com/title/tt0411008/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (179, 'Bones', 40, NULL, 'https://www.imdb.com/title/tt0460627/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (180, 'Shingeki no kyojin', 24, NULL, 'https://www.imdb.com/title/tt2560140/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (181, 'Brand New Cherry Flavor', 342, NULL, 'https://www.imdb.com/title/tt11343600/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (182, 'The Flash', 43, NULL, 'https://www.imdb.com/title/tt3107288/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (183, 'Suits', 44, NULL, 'https://www.imdb.com/title/tt1632701/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (184, 'The Chair', 30, NULL, 'https://www.imdb.com/title/tt11834150/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (185, 'Fargo', 53, NULL, 'https://www.imdb.com/title/tt2802850/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (186, 'Riverdale', 45, NULL, 'https://www.imdb.com/title/tt5420376/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (187, 'Chapelwaite', 45, NULL, 'https://www.imdb.com/title/tt11525188/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (188, 'All the Queen\'s Men', 105, NULL, 'https://www.imdb.com/title/tt14321632/', NULL, 2, 1, '2021-09-24', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (190, 'GOLF STRIKE', 15, 'Challenge real players from around the world and make it to the top! Play on beautiful courses all over the world against 5 other players in exciting matches!', 'https://www.miniclip.com/games/golf-strike/en/#privacy-settings', NULL, 3, 1, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (191, 'Archery', 60, 'Find local archery ranges near you!', 'https://www.google.com/maps/search/archery+near+me/', 'https://images.pexels.com/photos/6132323/pexels-photo-6132323.jpeg', 4, 2, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (192, 'Basketball Stars', 10, 'Find local basketball games near you!', 'https://www.miniclip.com/games/basketball-stars/en/#privacy-settings', NULL, 3, 1, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (193, 'Solitaire', 3, 'Lets play Solitaire!', 'https://solitaired.com/', 'https://media.istockphoto.com/photos/playing-cards-game-on-black-background-picture-id490177902?k=20&m=490177902&s=612x612&w=0&h=xMpB-PdbQjEBYgkJeV76UbX0VzxruJZE3qDqkLBk98A=', 3, 1, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (194, 'Baseball', 120, 'Find local baseball games near you!', 'https://www.google.com/maps/search/baseball+near+me/', 'https://images.pexels.com/photos/1661950/pexels-photo-1661950.jpeg', 5, 2, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (195, 'Beach Volleyball', 60, 'Find local Volleyball games near you!', 'https://www.google.com/maps/search/beach+volleyball+near+me/', 'https://images.pexels.com/photos/6180402/pexels-photo-6180402.jpeg', 6, 2, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (196, 'Birdwatching', 45, 'Find birdwatching areas near you!', 'https://www.google.com/maps/search/birdwatching+near+me/', 'https://images.pexels.com/photos/2662434/pexels-photo-2662434.jpeg', 7, 2, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (197, 'Camping', NULL, 'Find campgrounds near you!', 'https://www.google.com/maps/search/camping+near+me/', 'https://images.pexels.com/photos/5914157/pexels-photo-5914157.jpeg', 8, 2, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (198, 'Football', 120, 'Find football games near you!', 'https://www.google.com/maps/search/football+near+me/', 'https://images.pexels.com/photos/2570139/pexels-photo-2570139.jpeg', 9, 2, '2021-09-27', NULL, 1);
INSERT INTO `activity` (`id`, `name`, `expected_duration`, `description`, `url`, `image_url`, `activity_type_id`, `activity_category_id`, `create_date`, `last_update_date`, `user_id`) VALUES (199, 'Frisbee', 60, 'Find frisbee games near you!', 'https://www.google.com/maps/search/frisbee+near+me/', 'https://images.pexels.com/photos/8733112/pexels-photo-8733112.jpeg', 10, 2, '2021-09-27', NULL, 1);

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

