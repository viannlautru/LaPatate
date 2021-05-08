-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  sam. 08 mai 2021 à 12:32
-- Version du serveur :  5.7.17
-- Version de PHP :  7.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `lapatate`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`127.0.0.1` PROCEDURE `sauv_article` ()  NO SQL
BEGIN
	SET @heure = CONCAT(HOUR(NOW()),"-", MINUTE(NOW()),"-", SECOND(NOW()));
	SET @nomFich = CONCAT('G:/TRAVAIL_BTS/EasyPHP-Devserver-17/eds-www/LaPatate/save/article',@heure,'.txt');
	SET @requete = CONCAT("SELECT * INTO OUTFILE '",@nomfich,"' FROM articles_save;");
	PREPARE s1 FROM @requete;
	EXECUTE s1;
	DEALLOCATE PREPARE s1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_articles` int(11) NOT NULL,
  `Nom_articles` varchar(50) NOT NULL,
  `Prix_articles` float NOT NULL,
  `Quantite_articles` int(11) NOT NULL,
  `Panier_article` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `articles`
--

INSERT INTO `articles` (`id_articles`, `Nom_articles`, `Prix_articles`, `Quantite_articles`, `Panier_article`) VALUES
(1, 'Bintje', 9.6, 16, 1),
(2, 'Annabelle', 3, 5, 1),
(3, 'Chérie', 8, 10, 1),
(4, 'Annabelle', 2.4, 4, 1),
(5, 'Chérie', 8, 10, 1),
(6, 'Annabelle', 2.4, 4, 1),
(7, 'Chérie', 8, 10, 1),
(8, 'Annabelle', 2.4, 4, 1),
(9, 'Chérie', 8, 10, 1),
(10, 'Annabelle', 2.4, 4, 1),
(11, 'Chérie', 8, 10, 1),
(12, 'Annabelle', 2.4, 4, 1),
(13, 'Chérie', 8, 10, 1),
(14, 'Annabelle', 2.4, 4, 1),
(15, 'Chérie', 8, 10, 1),
(16, 'Annabelle', 2.4, 4, 1),
(17, 'Chérie', 8, 10, 1),
(18, 'Annabelle', 2.4, 4, 1),
(19, 'Chérie', 8, 10, 1),
(20, 'Annabelle', 2.4, 4, 1),
(21, 'Bintje', 5.4, 9, 1),
(22, 'Bintje', 5.4, 9, 1),
(23, 'Bintje', 5.4, 9, 1),
(24, 'Bintje', 5.4, 9, 1),
(25, 'Bintje', 5.4, 9, 1),
(26, 'Bintje', 5.4, 9, 1),
(27, 'Bintje', 5.4, 9, 1),
(28, 'Bintje', 5.4, 9, 1),
(29, 'Bintje', 5.4, 9, 1),
(30, 'Annabelle', 7.8, 13, 1),
(31, 'Annabelle', 7.8, 13, 1),
(32, 'Annabelle', 7.8, 13, 1),
(33, 'Annabelle', 7.8, 13, 2),
(34, 'Annabelle', 7.8, 13, 1),
(35, 'Annabelle', 7.8, 13, 1),
(36, 'Annabelle', 7.8, 13, 1),
(37, 'Annabelle', 7.8, 13, 1),
(38, 'Annabelle', 7.8, 13, 1),
(39, 'Annabelle', 7.8, 13, 1),
(40, 'Annabelle', 7.8, 13, 1),
(41, 'Annabelle', 7.8, 13, 1),
(42, 'Annabelle', 7.8, 13, 1),
(43, 'Annabelle', 7.8, 13, 1),
(44, 'Annabelle', 7.8, 13, 58),
(45, 'Annabelle', 7.8, 13, 59);

--
-- Déclencheurs `articles`
--
DELIMITER $$
CREATE TRIGGER `art_del` BEFORE DELETE ON `articles` FOR EACH ROW begin
	insert into articles_save values (old.id_articles, old.Nom_articles, old.Quantite_articles,old.Panier_article, 'D');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `art_sauv` AFTER INSERT ON `articles` FOR EACH ROW begin
	insert into articles_save values (new.id_articles, new.Nom_articles, new.Quantite_articles,new.Panier_article, 'I');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `art_up` AFTER UPDATE ON `articles` FOR EACH ROW begin
	insert into articles_save values (new.id_articles, new.Nom_articles, new.Quantite_articles,new.Panier_article, 'U');
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `articles_save`
--

CREATE TABLE `articles_save` (
  `id_articles` int(11) NOT NULL,
  `Nom_articles` varchar(50) NOT NULL,
  `Prix_articles` float NOT NULL,
  `Quantite_articles` int(11) NOT NULL,
  `Panier_article` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `Nom_categorie` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id_categorie`, `Nom_categorie`) VALUES
(1, 'Plat '),
(2, 'Entrée');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `Prenom_client` varchar(50) NOT NULL,
  `Nom_client` varchar(50) NOT NULL,
  `Mail_client` varchar(50) NOT NULL,
  `Adresse_client` varchar(100) NOT NULL,
  `PWD_client` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `Prenom_client`, `Nom_client`, `Mail_client`, `Adresse_client`, `PWD_client`) VALUES
(1, 'Vianney', 'Lautru', 'vianney.lautru5@orange.fr', '13 Rue du Boir', 'ab4f63f9ac65152575886860dde480a1'),
(2, 'Vianney', 'Lautru', 'vianney@orange.fr', '13 Rue du Boir', 'ab4f63f9ac65152575886860dde480a1'),
(3, 'Vianney', 'Lautru', 'lautru5@orange.fr', '13 Rue du Boir', 'ab4f63f9ac65152575886860dde480a1'),
(4, 'Vianney', 'Lautru', 'lautru5.lautru5@orange.fr', '13 Rue du Boir', 'ab4f63f9ac65152575886860dde480a1'),
(5, 'Bout', 'Carrie', 'car@yahoo.com', '13 Rue du Boir', 'ab4f63f9ac65152575886860dde480a1'),
(6, 'BouBoul', 'Boul', 'Boul@orangee.fr', 'boul17rue', 'ab4f63f9ac65152575886860dde480a1'),
(7, 'hy', 'Chérie', 'referr@fe.fr', 'strgtsg', 'ab4f63f9ac65152575886860dde480a1');

--
-- Déclencheurs `client`
--
DELIMITER $$
CREATE TRIGGER `cli_del` BEFORE DELETE ON `client` FOR EACH ROW begin
	insert into client_save values (old.id_client, old.Prenom_client, old.Nom_client,old.Mail_client,old.Adresse_client,old.PWD_client,'D');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cli_sauv` AFTER INSERT ON `client` FOR EACH ROW begin
	insert into client_save values (new.id_client, new.Prenom_client, new.Nom_client,new.Mail_client,new.Adresse_client,new.PWD_client,'I');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `cli_up` AFTER UPDATE ON `client` FOR EACH ROW begin
	insert into client_save values (new.id_client, new.Prenom_client, new.Nom_client,new.Mail_client,new.Adresse_client,new.PWD_client,'U');
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `client_save`
--

CREATE TABLE `client_save` (
  `id_client` int(11) NOT NULL,
  `Prenom_client` varchar(50) NOT NULL,
  `Nom_client` varchar(50) NOT NULL,
  `Mail_client` varchar(50) NOT NULL,
  `Adresse_client` varchar(100) NOT NULL,
  `PWD_client` varchar(50) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

CREATE TABLE `panier` (
  `id_panier` int(11) NOT NULL,
  `Prixtot_panier` float NOT NULL,
  `Date_panier` datetime NOT NULL,
  `Adresse_panier` varchar(200) NOT NULL,
  `Nom_panier` varchar(50) NOT NULL,
  `Prenom_panier` varchar(50) NOT NULL,
  `Mail_panier` varchar(100) NOT NULL,
  `Tel_panier` int(10) NOT NULL,
  `nombrearticle_panier` int(11) NOT NULL,
  `Envoyer` tinyint(1) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `Prixtot_panier`, `Date_panier`, `Adresse_panier`, `Nom_panier`, `Prenom_panier`, `Mail_panier`, `Tel_panier`, `nombrearticle_panier`, `Envoyer`) VALUES
(1, 12.6, '2017-02-21 12:45:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 1),
(2, 12.6, '2017-02-21 12:53:07', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(3, 12.6, '2017-02-21 12:53:54', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(4, 12.6, '2017-02-21 12:54:51', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 1),
(5, 12.6, '2017-02-21 12:55:31', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(6, 12.6, '2017-02-21 12:56:54', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(7, 12.6, '2017-02-21 12:57:12', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(8, 12.6, '2017-02-21 12:58:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(9, 12.6, '2017-02-21 12:58:07', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(10, 12.6, '2017-02-21 12:59:16', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(11, 12.6, '2017-02-21 12:59:46', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(12, 12.6, '2017-02-21 01:00:11', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 1),
(13, 12.6, '2017-02-21 01:00:35', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 1),
(14, 12.6, '2017-02-21 01:00:58', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(15, 12.6, '2017-02-21 01:02:33', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(16, 12.6, '2017-02-21 01:02:44', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(17, 12.6, '2017-02-21 01:03:35', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(18, 12.6, '2017-02-21 01:04:16', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(19, 12.6, '2017-02-21 01:05:13', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(20, 12.6, '2017-02-21 01:06:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(21, 10.4, '2017-02-21 01:08:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(22, 10.4, '2017-02-21 01:09:08', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(23, 10.4, '2017-02-21 01:09:37', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(24, 10.4, '2017-02-21 01:10:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(25, 10.4, '2017-02-21 01:10:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(26, 10.4, '2017-02-21 01:10:30', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(27, 10.4, '2017-02-21 01:10:38', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(28, 10.4, '2017-02-21 01:10:49', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(29, 10.4, '2017-02-21 01:15:05', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, NULL),
(30, 5.4, '2017-02-21 01:15:49', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(31, 5.4, '2017-02-21 01:17:16', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(32, 5.4, '2017-02-21 01:18:17', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(33, 5.4, '2017-02-21 01:18:47', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(34, 5.4, '2017-02-21 01:20:33', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(35, 5.4, '2017-02-21 01:21:08', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(36, 5.4, '2017-02-21 01:21:30', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(37, 5.4, '2017-02-21 01:23:55', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(38, 5.4, '2017-02-21 01:24:11', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(39, 5.4, '2017-02-21 01:26:52', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(40, 5.4, '2017-02-21 01:27:06', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(41, 5.4, '2017-02-21 01:28:23', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(42, 5.4, '2017-02-21 01:28:33', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(43, 7.8, '2017-02-21 01:33:06', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(44, 7.8, '2017-02-21 01:34:36', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(45, 7.8, '2017-02-21 01:36:15', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(46, 7.8, '2017-02-21 01:37:01', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(47, 7.8, '2017-02-21 01:38:07', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(48, 7.8, '2017-02-21 01:38:40', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(49, 7.8, '2017-02-21 01:39:17', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1, NULL),
(50, 7.8, '2017-02-21 01:40:48', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(51, 7.8, '2017-02-21 01:41:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(52, 7.8, '2017-02-21 01:43:54', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(53, 7.8, '2017-02-21 01:44:07', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(54, 7.8, '2017-02-21 01:44:22', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(55, 7.8, '2017-02-21 02:03:41', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(56, 7.8, '2017-02-21 02:05:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(57, 7.8, '2017-02-21 02:05:34', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(58, 7.8, '2017-02-21 02:10:14', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL),
(59, 7.8, '2017-02-21 02:10:36', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1, NULL);

--
-- Déclencheurs `panier`
--
DELIMITER $$
CREATE TRIGGER `pan_del` BEFORE DELETE ON `panier` FOR EACH ROW begin
	insert into panier_save values (old.id_panier, old.Prixtot_panier, old.Date_panier, old.Adresse_panier, old.Nom_panier, old.Prenom_panier, old.Mail_panier, old.Tel_panier, old.nombrearticle_panier, 'D');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pan_sauv` AFTER INSERT ON `panier` FOR EACH ROW begin
	insert into panier_save values (new.id_panier, new.Prixtot_panier, new.Date_panier, new.Adresse_panier, new.Nom_panier, new.Prenom_panier, new.Mail_panier, new.Tel_panier, new.nombrearticle_panier, 'I');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pan_up` AFTER UPDATE ON `panier` FOR EACH ROW begin
	insert into panier_save values (new.id_panier, new.Prixtot_panier, new.Date_panier, new.Adresse_panier, new.Nom_panier, new.Prenom_panier, new.Mail_panier, new.Tel_panier, new.nombrearticle_panier, 'U');
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `panier_save`
--

CREATE TABLE `panier_save` (
  `id_panier` int(11) NOT NULL,
  `Prixtot_panier` float NOT NULL,
  `Date_panier` datetime NOT NULL,
  `Adresse_panier` varchar(200) NOT NULL,
  `Nom_panier` varchar(50) NOT NULL,
  `Prenom_panier` varchar(50) NOT NULL,
  `Mail_panier` varchar(100) NOT NULL,
  `Tel_panier` int(10) NOT NULL,
  `nombrearticle_panier` int(11) NOT NULL,
  `Type` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `panier_save`
--

INSERT INTO `panier_save` (`id_panier`, `Prixtot_panier`, `Date_panier`, `Adresse_panier`, `Nom_panier`, `Prenom_panier`, `Mail_panier`, `Tel_panier`, `nombrearticle_panier`, `Type`) VALUES
(1, 12.6, '2017-02-21 12:45:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 'U'),
(12, 12.6, '2017-02-21 01:00:11', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 'U'),
(13, 12.6, '2017-02-21 01:00:35', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 'U'),
(4, 12.6, '2017-02-21 12:54:51', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2, 'U');

-- --------------------------------------------------------

--
-- Structure de la table `patate`
--

CREATE TABLE `patate` (
  `Num_patate` int(11) NOT NULL,
  `Nom_patate` varchar(50) NOT NULL,
  `Origine_patate` varchar(50) NOT NULL,
  `Couleur_patate` varchar(50) NOT NULL,
  `Prix_patate` float NOT NULL DEFAULT '0.6',
  `Image_patate` varchar(100) NOT NULL,
  `Texte_patate` text NOT NULL,
  `Quantite` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patate`
--

INSERT INTO `patate` (`Num_patate`, `Nom_patate`, `Origine_patate`, `Couleur_patate`, `Prix_patate`, `Image_patate`, `Texte_patate`, `Quantite`) VALUES
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/bintje.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.', 30),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/annabelle.jpg', ' elle est bonne', 250),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/agata.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple', 135),
(6, 'Chérie', 'France', 'rouge violacé', 0.8, 'reservee/chérie.jpg', 'Chérie est une variété précoce à demi-précoce. Elle présente une bonne aptitude à une récolte primeur, qui s\'effectue 85 jours après la plantation, avant complète maturation des tubercules. Récoltée aussi tôt, la pomme de terre Chérie doit être conservée dans le bac à légumes du réfrigérateur et consommée rapidement.', NULL),
(7, 'Désirée', 'pays', 'jaune', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', NULL),
(8, 'Bonnotte', 'pays', 'jaune', 0.6, 'reservee/bonnotte.jpg', 'Aujourd’hui avec son goût prononcé de châtaigne fraîche, elle est devenue une ambassadrice universelle du savoir-faire en primeur de l’île de Noirmoutier.\r\n\r\nCuite à la vapeur pour l’expression de tous ses arômes ou juste blanchie et rissolée dans du beurre salé, elle rend gourmands tous les gourmets.', NULL),
(9, 'Spunta', 'pays', 'jaune', 0.6, 'reservee/spunta.jpg', ' La pomme de terre Spunta présente une bonne tenue à la cuisson, malgré un très léger noircissement. Purée, frites, potages, pommes de terre sautées... Elle est polyvalente en cuisine.', NULL),
(10, 'Charlotte ', 'pays', 'jaune', 0.6, 'reservee/charlotte.jpg', 'La Charlotte a une chair ferme, ce qui signifie qu\'elle ne se délite pas à la cuisson - même oubliée trop longtemps dans l\'eau bouillante. Conséquemment, ce n\'est pas une variété à purée. Par contre, pour toutes les recettes nécessitant des cuissons à l\'eau ou vapeur : foncez. Charlotte est la pomme de terre la plus utilisée pour les raclettes et les tartiflettes. Dans les salades, elle peut être présentée en dés ou rondelles fondants mais fermes. Elle est également adaptée aux cuissons sautées ou rissolées. Cette variété est également intéressant côte saveur : elle est fine sans être fade.', 2),
(11, ' Monalisa', 'pays', 'jaune', 0.6, 'reservee/monalisa.jpg', 'Elle se consomme de multiples façons : au four, en frites, en salade, à la vapeur, mijotée, en purée, farcie ou sautée grâce à sa chair tendre et fondante. Elle ne noircit pas et conserve une bonne tenue à la cuisson.', 20),
(12, 'Carminelle', 'pays', 'rouge', 0.6, 'reservee/carminelle.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A', NULL),
(13, 'Franceline', 'pays', 'rose', 0.6, 'reservee/franceline.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.', NULL),
(14, 'Ratte ', 'pays', 'jaune', 0.6, 'reservee/ratte.jpg', 'De classe culinaire A, la ratte est une pomme de terre dite \"à chair ferme\", ce qui signifie qu\'elle se tient bien à la cuisson. La ratte est recommandée pour les cuissons à la vapeur, à l\'eau, rissolée à la poêle, au micro-ondes et au four. Le défunt cuisinier Joël Robuchon l\'utilisait également dans sa célèbre purée.', NULL),
(15, 'Vitelotte', 'pays', 'violette', 0.6, 'reservee/vitelotte.jpg', 'La pomme de terre vitelotte est une pomme de terre qui dispose d’une très belle qualité gustative. Elle n’absorbe que très peu de graisses lors de sa cuisson, ce qui en fait le légume parfait pour la travailler en chips ou en frites, en purée ou en écrasé, avec une teinte inédite. Elle est parfaite pour colorer vos repas de fête.', NULL),
(16, 'Apollo ', 'pays', 'jaune', 0.6, 'reservee/apollo.jpg', ' Elles sont idéales pour les cuissons à l\'eau ou à la vapeur et se dégustent aussi mijotées ou rissolées. Plantez les tubercules de mi-mars à mai selon le climat et récoltez 80 à 90 jours après la plantation. Pour une culture primeur, plantez dès février-mars sous abri et récoltez 70 jours après la plantation.', NULL),
(17, 'Marfona', 'pays', 'jaune', 0.6, 'reservee/marfona.jpg', 'La pomme de terre Marfona a une peau fine, chair non farineuse.\r\nUne cuisson qui ce fait bien mais est utiliser de préference dans les salades', NULL),
(18, 'Samba', 'pays', 'jaune', 0.6, 'reservee/samba.jpg', 'La pomme de terre Samba est d\'une très bonne tenue à la cuisson et de bonne qualité culinaire. Polyvalente, elle s\'utilise beaucoup comme pomme de terre au four ou pomme de terre en robe des champs. Une fois cuite, elle s\'écrase facilement, permettant ainsi la réalisation de purées.', NULL);

--
-- Déclencheurs `patate`
--
DELIMITER $$
CREATE TRIGGER `pat_del` BEFORE DELETE ON `patate` FOR EACH ROW begin
	insert into patate_save values (old.Num_patate, old.Nom_patate, old.Origine_patate, old.Couleur_patate, old.Prix_patate,old.Image_patate,old.Texte_patate,'D',old.Quantite);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pat_sauv` AFTER INSERT ON `patate` FOR EACH ROW begin
	insert into patate_save values (new.Num_patate, new.Nom_patate, new.Origine_patate, new.Couleur_patate, new.Prix_patate, new.Image_patate, new.Texte_patate,'I',new.Quantite);
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `pat_up` AFTER UPDATE ON `patate` FOR EACH ROW begin
	insert into patate_save values (new.Num_patate, new.Nom_patate, new.Origine_patate, new.Couleur_patate, new.Prix_patate, new.Image_patate, new.Texte_patate,'U',new.Quantite);
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `patate_save`
--

CREATE TABLE `patate_save` (
  `Num_patate` int(11) NOT NULL,
  `Nom_patate` varchar(50) NOT NULL,
  `Origine_patate` varchar(50) NOT NULL,
  `Couleur_patate` varchar(50) NOT NULL,
  `Prix_patate` float NOT NULL DEFAULT '0.6',
  `Image_patate` varchar(100) NOT NULL,
  `Texte_patate` text NOT NULL,
  `Type` varchar(20) NOT NULL,
  `Quantite` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patate_save`
--

INSERT INTO `patate_save` (`Num_patate`, `Nom_patate`, `Origine_patate`, `Couleur_patate`, `Prix_patate`, `Image_patate`, `Texte_patate`, `Type`, `Quantite`) VALUES
(6, 'Chérie', 'France', 'rouge violacé', 0.8, 'reservee/pomme-de-terre-agata.jpg', 'Chérie est une variété précoce à demi-précoce. Elle présente une bonne aptitude à une récolte primeur, qui s\'effectue 85 jours après la plantation, avant complète maturation des tubercules. Récoltée aussi tôt, la pomme de terre Chérie doit être conservée dans le bac à légumes du réfrigérateur et consommée rapidement.', 'U', 0),
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/patate-seules-z.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.', 'U', 0),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/pomme-de-terre-agata.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple', 'U', 0),
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/patate-seules-z.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne', 'U', 0),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/pomme-de-terre-agata.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple', 'U', 0),
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/ok.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.', 'U', 0),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/ok.jpg', ' elle est bonne', 'U', 0),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/ok.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple', 'U', 0),
(6, 'Chérie', 'France', 'rouge violacé', 0.8, 'reservee/ok.jpg', 'Chérie est une variété précoce à demi-précoce. Elle présente une bonne aptitude à une récolte primeur, qui s\'effectue 85 jours après la plantation, avant complète maturation des tubercules. Récoltée aussi tôt, la pomme de terre Chérie doit être conservée dans le bac à légumes du réfrigérateur et consommée rapidement.', 'U', 0),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/ok.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple', 'U', 0),
(7, 'Désirée', 'pays', 'jaune', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', NULL),
(8, 'Bonnotte', 'pays', 'jaune', 0.6, 'reservee/bonnotte.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', NULL),
(8, 'Bonnotte', 'pays', 'jaune', 0.6, 'reservee/bonnotte.jpg', 'Aujourd’hui avec son goût prononcé de châtaigne fraîche, elle est devenue une ambassadrice universelle du savoir-faire en primeur de l’île de Noirmoutier.\r\n\r\nCuite à la vapeur pour l’expression de tous ses arômes ou juste blanchie et rissolée dans du beurre salé, elle rend gourmands tous les gourmets.', 'U', NULL),
(9, 'Spunta', 'pays', 'rouge violacé', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', NULL),
(9, 'Spunta', 'pays', 'jaune', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', NULL),
(9, 'Spunta', 'pays', 'jaune', 0.6, 'reservee/spunta.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', NULL),
(9, 'Spunta', 'pays', 'jaune', 0.6, 'reservee/spunta.jpg', ' La pomme de terre Spunta présente une bonne tenue à la cuisson, malgré un très léger noircissement. Purée, frites, potages, pommes de terre sautées... Elle est polyvalente en cuisine.', 'U', NULL),
(10, 'Charlotte ', 'pays', 'rouge violacé', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', 2),
(10, 'Charlotte ', 'pays', 'jaune', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', 2),
(10, 'Charlotte ', 'pays', 'jaune', 0.6, 'reservee/charlotte.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', 2),
(10, 'Charlotte ', 'pays', 'jaune', 0.6, 'reservee/charlotte.jpg', 'La Charlotte a une chair ferme, ce qui signifie qu\'elle ne se délite pas à la cuisson - même oubliée trop longtemps dans l\'eau bouillante. Conséquemment, ce n\'est pas une variété à purée. Par contre, pour toutes les recettes nécessitant des cuissons à l\'eau ou vapeur : foncez. Charlotte est la pomme de terre la plus utilisée pour les raclettes et les tartiflettes. Dans les salades, elle peut être présentée en dés ou rondelles fondants mais fermes. Elle est également adaptée aux cuissons sautées ou rissolées. Cette variété est également intéressant côte saveur : elle est fine sans être fade.', 'U', 2),
(11, ' Monalisa', 'pays', 'rouge violacé', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', 20),
(11, ' Monalisa', 'pays', 'jaune', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', 20),
(11, ' Monalisa', 'pays', 'jaune', 0.6, 'reservee/monalisa.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.', 'U', 20),
(11, ' Monalisa', 'pays', 'jaune', 0.6, 'reservee/monalisa.jpg', 'Elle se consomme de multiples façons : au four, en frites, en salade, à la vapeur, mijotée, en purée, farcie ou sautée grâce à sa chair tendre et fondante. Elle ne noircit pas et conserve une bonne tenue à la cuisson.', 'U', 20),
(12, 'Carminelle', 'pays', 'rouge', 0.6, 'reservee/carminelle.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A', 'I', NULL),
(13, 'Franceline', 'pays', 'rose', 0.6, 'reservee/franceline.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.', 'I', NULL),
(14, 'Carminelle', 'pays', 'rouge', 0.6, 'reservee/carminelle.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A', 'I', NULL),
(15, 'Franceline', 'pays', 'rose', 0.6, 'reservee/franceline.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.', 'I', NULL),
(14, 'Ratte ', 'pays', 'rouge', 0.6, 'reservee/carminelle.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A', 'U', NULL),
(14, 'Ratte ', 'pays', 'jaune', 0.6, 'reservee/carminelle.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A', 'U', NULL),
(14, 'Ratte ', 'pays', 'jaune', 0.6, 'reservee/ratte.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A', 'U', NULL),
(14, 'Ratte ', 'pays', 'jaune', 0.6, 'reservee/ratte.jpg', 'De classe culinaire A, la ratte est une pomme de terre dite \"à chair ferme\", ce qui signifie qu\'elle se tient bien à la cuisson. La ratte est recommandée pour les cuissons à la vapeur, à l\'eau, rissolée à la poêle, au micro-ondes et au four. Le défunt cuisinier Joël Robuchon l\'utilisait également dans sa célèbre purée.', 'U', NULL),
(15, 'Vitelotte', 'pays', 'rose', 0.6, 'reservee/franceline.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.', 'U', NULL),
(15, 'Vitelotte', 'pays', 'violette', 0.6, 'reservee/franceline.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.', 'U', NULL),
(15, 'Vitelotte', 'pays', 'violette', 0.6, 'reservee/vitelotte.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.', 'U', NULL),
(15, 'Vitelotte', 'pays', 'violette', 0.6, 'reservee/vitelotte.jpg', 'La pomme de terre vitelotte est une pomme de terre qui dispose d’une très belle qualité gustative. Elle n’absorbe que très peu de graisses lors de sa cuisson, ce qui en fait le légume parfait pour la travailler en chips ou en frites, en purée ou en écrasé, avec une teinte inédite. Elle est parfaite pour colorer vos repas de fête.', 'U', NULL),
(16, 'Apollo ', 'pays', 'jaune', 0.6, 'reservee/apollo.jpg', ' Elles sont idéales pour les cuissons à l\'eau ou à la vapeur et se dégustent aussi mijotées ou rissolées. Plantez les tubercules de mi-mars à mai selon le climat et récoltez 80 à 90 jours après la plantation. Pour une culture primeur, plantez dès février-mars sous abri et récoltez 70 jours après la plantation.', 'I', NULL),
(17, 'Apollo ', 'pays', 'jaune', 0.6, 'reservee/apollo.jpg', ' Elles sont idéales pour les cuissons à l\'eau ou à la vapeur et se dégustent aussi mijotées ou rissolées. Plantez les tubercules de mi-mars à mai selon le climat et récoltez 80 à 90 jours après la plantation. Pour une culture primeur, plantez dès février-mars sous abri et récoltez 70 jours après la plantation.', 'I', NULL),
(17, 'Marfona', 'pays', 'jaune', 0.6, 'reservee/apollo.jpg', ' Elles sont idéales pour les cuissons à l\'eau ou à la vapeur et se dégustent aussi mijotées ou rissolées. Plantez les tubercules de mi-mars à mai selon le climat et récoltez 80 à 90 jours après la plantation. Pour une culture primeur, plantez dès février-mars sous abri et récoltez 70 jours après la plantation.', 'U', NULL),
(17, 'Marfona', 'pays', 'jaune', 0.6, 'reservee/marfona.jpg', ' Elles sont idéales pour les cuissons à l\'eau ou à la vapeur et se dégustent aussi mijotées ou rissolées. Plantez les tubercules de mi-mars à mai selon le climat et récoltez 80 à 90 jours après la plantation. Pour une culture primeur, plantez dès février-mars sous abri et récoltez 70 jours après la plantation.', 'U', NULL),
(17, 'Marfona', 'pays', 'jaune', 0.6, 'reservee/marfona.jpg', 'La pomme de terre Marfona a une peau fine, chair non farineuse.\r\nUne cuisson qui ce fait bien mais est utiliser de préference dans les salades', 'U', NULL),
(18, 'Samba', 'pays', 'jaune', 0.6, 'reservee/samba.jpg', 'La pomme de terre Samba est d\'une très bonne tenue à la cuisson et de bonne qualité culinaire. Polyvalente, elle s\'utilise beaucoup comme pomme de terre au four ou pomme de terre en robe des champs. Une fois cuite, elle s\'écrase facilement, permettant ainsi la réalisation de purées.', 'I', NULL),
(19, 'Samba', 'pays', 'jaune', 0.6, 'reservee/samba.jpg', 'La pomme de terre Samba est d\'une très bonne tenue à la cuisson et de bonne qualité culinaire. Polyvalente, elle s\'utilise beaucoup comme pomme de terre au four ou pomme de terre en robe des champs. Une fois cuite, elle s\'écrase facilement, permettant ainsi la réalisation de purées.', 'I', NULL),
(19, 'Samba', 'pays', 'jaune', 0.6, 'reservee/samba.jpg', 'La pomme de terre Samba est d\'une très bonne tenue à la cuisson et de bonne qualité culinaire. Polyvalente, elle s\'utilise beaucoup comme pomme de terre au four ou pomme de terre en robe des champs. Une fois cuite, elle s\'écrase facilement, permettant ainsi la réalisation de purées.', 'D', NULL),
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/bintje.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.', 'U', 30),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/agata.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple', 'U', 135),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/annabelle.jpg', ' elle est bonne', 'U', 250),
(6, 'Chérie', 'France', 'rouge violacé', 0.8, 'reservee/chérie.jpg', 'Chérie est une variété précoce à demi-précoce. Elle présente une bonne aptitude à une récolte primeur, qui s\'effectue 85 jours après la plantation, avant complète maturation des tubercules. Récoltée aussi tôt, la pomme de terre Chérie doit être conservée dans le bac à légumes du réfrigérateur et consommée rapidement.', 'U', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `Id_recette` int(11) NOT NULL,
  `Nom_recette` varchar(50) NOT NULL,
  `Duree` float NOT NULL,
  `ingredient` text NOT NULL,
  `Categorie` int(11) NOT NULL,
  `image_recette` varchar(100) NOT NULL,
  `Etape` text NOT NULL,
  `Validation` tinyint(1) DEFAULT NULL,
  `Date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `recette`
--

INSERT INTO `recette` (`Id_recette`, `Nom_recette`, `Duree`, `ingredient`, `Categorie`, `image_recette`, `Etape`, `Validation`, `Date`) VALUES
(1, 'tarte', 10, '-2kg carotte</br>', 1, 'recette/345827.jpg', '0.mettre le plat au four</br>', 0, '2013-04-21 12:52:36'),
(4, 'Raclette', 60, '-15kg Fromage</br>-15 Pomme de terre</br>-15kg viande</br>', 1, 'recette/raclette-1293573_1920.jpg', '0.allumer la machine</br>1.preparer les fromages</br>2.mettre dans la machine</br>', 1, '2014-04-21 03:26:55');

--
-- Déclencheurs `recette`
--
DELIMITER $$
CREATE TRIGGER `rec_del` BEFORE DELETE ON `recette` FOR EACH ROW begin
	insert into recette_save values (old.Id_recette, old.Nom_recette, old.Duree, old.ingredient, old.Categorie, old.image_recette, old.Etape, old.Validation, old.Date,'D');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `rec_sauv` AFTER INSERT ON `recette` FOR EACH ROW begin
	insert into recette_save values (new.Id_recette, new.Nom_recette, new.Duree, new.ingredient, new.Categorie, new.image_recette, new.Etape, new.Validation, new.Date,'I');
end
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `rec_up` AFTER UPDATE ON `recette` FOR EACH ROW begin
	insert into recette_save values (new.Id_recette, new.Nom_recette, new.Duree, new.ingredient, new.Categorie, new.image_recette, new.Etape, new.Validation, new.Date,'U');
end
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `recette_save`
--

CREATE TABLE `recette_save` (
  `Id_recette` int(11) NOT NULL,
  `Nom_recette` varchar(50) NOT NULL,
  `Duree` time NOT NULL,
  `ingredient` int(11) NOT NULL,
  `Categorie` int(11) NOT NULL,
  `image_recette` varchar(100) NOT NULL,
  `Etape` text NOT NULL,
  `Validation` tinyint(1) DEFAULT NULL,
  `Date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_articles`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `panier`
--
ALTER TABLE `panier`
  ADD PRIMARY KEY (`id_panier`);

--
-- Index pour la table `patate`
--
ALTER TABLE `patate`
  ADD PRIMARY KEY (`Num_patate`);

--
-- Index pour la table `recette`
--
ALTER TABLE `recette`
  ADD PRIMARY KEY (`Id_recette`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_articles` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;
--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `panier`
--
ALTER TABLE `panier`
  MODIFY `id_panier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT pour la table `patate`
--
ALTER TABLE `patate`
  MODIFY `Num_patate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `Id_recette` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
