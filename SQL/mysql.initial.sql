/*
 * Roundcube Additional SMTP Schema
 *
 * @author Gene Hawkins <texxasrulez@yahoo.com>
 *
 * @licence GNU AGPL
 */

CREATE TABLE IF NOT EXISTS `additional_smtp` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `iid` int(10) unsigned NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` text,
  `server` varchar(256) DEFAULT NULL,
  `enabled` int(1) unsigned NOT NULL DEFAULT '0',
  `nosavesent` int(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `iid` (`iid`)
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=1 */;

ALTER TABLE `additional_smtp`
  ADD CONSTRAINT `additional_smtp_ibfk_2` FOREIGN KEY (`iid`) REFERENCES `identities` (`identity_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `additional_smtp_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS `additional_smtp_hosts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `host` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `ts` datetime NOT NULL,
  PRIMARY KEY (`id`)
) /*!40000 ENGINE=INNODB */ /*!40101 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci AUTO_INCREMENT=1 */;

REPLACE INTO `system` (`name`, `value`) VALUES ('additional_smtp-version', '2020080500');
