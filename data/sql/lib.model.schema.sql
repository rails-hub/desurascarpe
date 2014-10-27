
# This is a fix for InnoDB in MySQL >= 4.1.x
# It "suspends judgement" for fkey relationships until are tables are set.
SET FOREIGN_KEY_CHECKS = 0;

#-----------------------------------------------------------------------------
#-- developer
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `developer`;


CREATE TABLE `developer`
(
	`id` INTEGER(11)  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255)  NOT NULL,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	PRIMARY KEY (`id`)
)Engine=InnoDB;

#-----------------------------------------------------------------------------
#-- game
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `game`;


CREATE TABLE `game`
(
	`id` INTEGER(11)  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255)  NOT NULL,
	`image` VARCHAR(255)  NOT NULL,
	`price` VARCHAR(255)  NOT NULL,
	`developer_id` INTEGER(11)  NOT NULL,
	`game_id` INTEGER(11)  NOT NULL,
	`game_name` VARCHAR(255)  NOT NULL,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	PRIMARY KEY (`id`),
	KEY `game_FI_1`(`developer_id`),
	CONSTRAINT `game_FK_1`
		FOREIGN KEY (`developer_id`)
		REFERENCES `developer` (`id`)
		ON UPDATE RESTRICT
		ON DELETE RESTRICT
)Engine=InnoDB;

#-----------------------------------------------------------------------------
#-- avatar
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `avatar`;


CREATE TABLE `avatar`
(
	`id` INTEGER(11)  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255)  NOT NULL,
	`image` VARCHAR(255)  NOT NULL,
	`game_id` INTEGER(11)  NOT NULL,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	PRIMARY KEY (`id`),
	KEY `game_FI_1`(`game_id`),
	CONSTRAINT `avatar_FK_1`
		FOREIGN KEY (`game_id`)
		REFERENCES `game` (`id`)
		ON UPDATE RESTRICT
		ON DELETE RESTRICT
)Engine=InnoDB;

#-----------------------------------------------------------------------------
#-- video
#-----------------------------------------------------------------------------

DROP TABLE IF EXISTS `video`;


CREATE TABLE `video`
(
	`id` INTEGER(11)  NOT NULL AUTO_INCREMENT,
	`name` VARCHAR(255)  NOT NULL,
	`link` VARCHAR(255)  NOT NULL,
	`game_id` INTEGER(11)  NOT NULL,
	`created_at` DATETIME,
	`updated_at` DATETIME,
	PRIMARY KEY (`id`),
	KEY `game_FI_1`(`game_id`),
	CONSTRAINT `video_FK_1`
		FOREIGN KEY (`game_id`)
		REFERENCES `game` (`id`)
		ON UPDATE RESTRICT
		ON DELETE RESTRICT
)Engine=InnoDB;

# This restores the fkey checks, after having unset them earlier
SET FOREIGN_KEY_CHECKS = 1;
