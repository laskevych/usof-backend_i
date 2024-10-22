# DROP DATABASE IF EXISTS usof_irepeshko;
# CREATE DATABASE usof_irepeshko;
#
# DROP USER IF EXISTS 'irepeshko'@'%';
# CREATE USER 'irepeshko'@'%' IDENTIFIED BY 'securepass';
# GRANT ALL PRIVILEGES ON *.* TO 'irepeshko'@'%' WITH GRANT OPTION;

DROP TABLE IF EXISTS `likes`;
DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `posts_favorites`;
DROP TABLE IF EXISTS `posts_categories`;
DROP TABLE IF EXISTS `categories`;
DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE IF NOT EXISTS `users` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `login` VARCHAR(50) NOT NULL,
   `fullName` VARCHAR(50),
   `password` VARCHAR(150) NOT NULL,
   `email` VARCHAR(250) NOT NULL,
   `isVerified` BOOLEAN NOT NULL DEFAULT FALSE,
   `profilePicture` VARCHAR(50) DEFAULT 'default.png',
   `rating` INT(10) NOT NULL DEFAULT 0,
   `role` ENUM ('user', 'admin') DEFAULT 'user' NOT NULL,
   `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   UNIQUE KEY `login` (`login`),
   UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `posts` (
   `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
   `title` VARCHAR(150) NOT NULL,
   `content` TEXT NOT NULL,
   `status` ENUM ('active', 'inactive') DEFAULT 'active' NOT NULL,
   `showOnHomepage` BOOLEAN DEFAULT FALSE,
   `likes` INT(10) DEFAULT 0,
   `creationById` INT(10) UNSIGNED NOT NULL,
   `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY (`id`),
   INDEX `posts_creationById_i` (creationById),
   CONSTRAINT `foreign_key_posts_creationById`
       FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
           ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `categories` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(50) NOT NULL,
    `description` VARCHAR(250) DEFAULT '',
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `posts_categories` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INT(10) UNSIGNED NOT NULL,
    `categoryId` INT(10) UNSIGNED NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `post_category` (`postId`, `categoryId`),
    INDEX `posts_categories_categoryId_i` (categoryId),
    INDEX `posts_categories_postId_i` (postId),
    CONSTRAINT `foreign_key_posts_categories_postId`
        FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
            ON DELETE CASCADE,
    CONSTRAINT `foreign_key_posts_categories_categoryId`
      FOREIGN KEY (`categoryId`) REFERENCES `categories`(`id`)
          ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `posts_favorites` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `creationById` INT(10) UNSIGNED NOT NULL,
    `postId` INT(10) UNSIGNED NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `post_user` (`postId`, `creationById`),
    INDEX `posts_favorites_creationById_i` (creationById),
    CONSTRAINT `foreign_key_posts_favorites_creationById`
        FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
            ON DELETE CASCADE,
    CONSTRAINT `foreign_key_posts_favorites_postId`
         FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
             ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `comments` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `postId` INT(10) UNSIGNED NOT NULL,
    `creationById` INT(10) UNSIGNED NOT NULL,
    `content` TEXT NOT NULL,
    `isHelpful` BOOLEAN DEFAULT FALSE,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    INDEX `comments_postId_i` (postId),
    INDEX `comments_creationById_i` (creationById),
    CONSTRAINT `foreign_key_comments_postId`
        FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
            ON DELETE CASCADE,
    CONSTRAINT `foreign_key_comments_creationById`
      FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
          ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

CREATE TABLE IF NOT EXISTS `likes` (
    `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    `creationById` INT(10) UNSIGNED NOT NULL,
    `postId` INT(10) UNSIGNED NULL,
    `commentId` INT(10) UNSIGNED NULL,
    `type` ENUM ('like', 'dislike') DEFAULT 'like' NOT NULL,
    `creationAt` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    UNIQUE KEY `comment_like_user_unique` (`creationById`, `commentId`),
    UNIQUE KEY `post_like_user_unique` (`creationById`, `postId`),
    INDEX `likes_commentId_i` (commentId),
    INDEX `likes_postId_i` (postId),
    INDEX `likes_creationById_i` (creationById),
    CONSTRAINT `foreign_key_likes_creationById`
       FOREIGN KEY (`creationById`) REFERENCES `users`(`id`)
           ON DELETE CASCADE,
    CONSTRAINT `foreign_key_likes_postId`
       FOREIGN KEY (`postId`) REFERENCES `posts`(`id`)
           ON DELETE CASCADE,
    CONSTRAINT `foreign_key_likes_commentId`
       FOREIGN KEY (`commentId`) REFERENCES `comments`(`id`)
           ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;