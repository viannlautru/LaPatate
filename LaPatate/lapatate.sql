-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  jeu. 18 fév. 2021 à 11:40
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

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `Nom_categorie` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
  `nombrearticle_panier` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `Prixtot_panier`, `Date_panier`, `Adresse_panier`, `Nom_panier`, `Prenom_panier`, `Mail_panier`, `Tel_panier`, `nombrearticle_panier`) VALUES
(1, 12.6, '2017-02-21 12:45:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(2, 12.6, '2017-02-21 12:53:07', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(3, 12.6, '2017-02-21 12:53:54', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(4, 12.6, '2017-02-21 12:54:51', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(5, 12.6, '2017-02-21 12:55:31', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(6, 12.6, '2017-02-21 12:56:54', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(7, 12.6, '2017-02-21 12:57:12', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(8, 12.6, '2017-02-21 12:58:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(9, 12.6, '2017-02-21 12:58:07', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(10, 12.6, '2017-02-21 12:59:16', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(11, 12.6, '2017-02-21 12:59:46', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(12, 12.6, '2017-02-21 01:00:11', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(13, 12.6, '2017-02-21 01:00:35', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(14, 12.6, '2017-02-21 01:00:58', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(15, 12.6, '2017-02-21 01:02:33', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(16, 12.6, '2017-02-21 01:02:44', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(17, 12.6, '2017-02-21 01:03:35', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(18, 12.6, '2017-02-21 01:04:16', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(19, 12.6, '2017-02-21 01:05:13', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(20, 12.6, '2017-02-21 01:06:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(21, 10.4, '2017-02-21 01:08:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(22, 10.4, '2017-02-21 01:09:08', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(23, 10.4, '2017-02-21 01:09:37', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(24, 10.4, '2017-02-21 01:10:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(25, 10.4, '2017-02-21 01:10:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(26, 10.4, '2017-02-21 01:10:30', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(27, 10.4, '2017-02-21 01:10:38', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(28, 10.4, '2017-02-21 01:10:49', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(29, 10.4, '2017-02-21 01:15:05', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 2),
(30, 5.4, '2017-02-21 01:15:49', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(31, 5.4, '2017-02-21 01:17:16', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(32, 5.4, '2017-02-21 01:18:17', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(33, 5.4, '2017-02-21 01:18:47', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(34, 5.4, '2017-02-21 01:20:33', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(35, 5.4, '2017-02-21 01:21:08', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(36, 5.4, '2017-02-21 01:21:30', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(37, 5.4, '2017-02-21 01:23:55', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(38, 5.4, '2017-02-21 01:24:11', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(39, 5.4, '2017-02-21 01:26:52', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(40, 5.4, '2017-02-21 01:27:06', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(41, 5.4, '2017-02-21 01:28:23', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(42, 5.4, '2017-02-21 01:28:33', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(43, 7.8, '2017-02-21 01:33:06', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(44, 7.8, '2017-02-21 01:34:36', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(45, 7.8, '2017-02-21 01:36:15', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(46, 7.8, '2017-02-21 01:37:01', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(47, 7.8, '2017-02-21 01:38:07', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(48, 7.8, '2017-02-21 01:38:40', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(49, 7.8, '2017-02-21 01:39:17', 'ok', 'Annabelle', 'ok', 'ok@ok', 243450698, 1),
(50, 7.8, '2017-02-21 01:40:48', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(51, 7.8, '2017-02-21 01:41:00', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(52, 7.8, '2017-02-21 01:43:54', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(53, 7.8, '2017-02-21 01:44:07', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(54, 7.8, '2017-02-21 01:44:22', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(55, 7.8, '2017-02-21 02:03:41', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(56, 7.8, '2017-02-21 02:05:04', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(57, 7.8, '2017-02-21 02:05:34', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(58, 7.8, '2017-02-21 02:10:14', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1),
(59, 7.8, '2017-02-21 02:10:36', '13 rue littre', 'Chérie', 'ok', 'ok@ok', 243450698, 1);

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
  `Texte_patate` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `patate`
--

INSERT INTO `patate` (`Num_patate`, `Nom_patate`, `Origine_patate`, `Couleur_patate`, `Prix_patate`, `Image_patate`, `Texte_patate`) VALUES
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/patate-seules-z.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.'),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/pomme-de-terre-agata.jpg', ' elle est bonne'),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/pomme-de-terre-agata.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple'),
(6, 'Chérie', 'France', 'rouge violacé', 0.8, 'reservee/spellforce.png', 'Chérie est une variété précoce à demi-précoce. Elle présente une bonne aptitude à une récolte primeur, qui s\'effectue 85 jours après la plantation, avant complète maturation des tubercules. Récoltée aussi tôt, la pomme de terre Chérie doit être conservée dans le bac à légumes du réfrigérateur et consommée rapidement.');

-- --------------------------------------------------------

--
-- Structure de la table `recette`
--

CREATE TABLE `recette` (
  `Id_recette` int(11) NOT NULL,
  `Nom_recette` varchar(50) NOT NULL,
  `Duree` time NOT NULL,
  `ingredient` int(11) NOT NULL,
  `Categorie` int(11) NOT NULL,
  `image_recette` varchar(100) NOT NULL,
  `Etape_recette` text NOT NULL
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
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT;
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
  MODIFY `Num_patate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `recette`
--
ALTER TABLE `recette`
  MODIFY `Id_recette` int(11) NOT NULL AUTO_INCREMENT;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
