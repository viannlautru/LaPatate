-- phpMyAdmin SQL Dump
-- version 4.9.6
-- https://www.phpmyadmin.net/
--
-- Host: aa06e.myd.infomaniak.com
-- Generation Time: May 06, 2021 at 04:12 PM
-- Server version: 5.7.32-log
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aa06e_lapatate`
--

-- --------------------------------------------------------

--
-- Table structure for table `patate`
--

CREATE TABLE `patate` (
  `Num_patate` int(11) NOT NULL,
  `Nom_patate` varchar(50) NOT NULL,
  `Origine_patate` varchar(50) NOT NULL,
  `Couleur_patate` varchar(50) NOT NULL,
  `Prix_patate` float NOT NULL DEFAULT '0.6',
  `Image_patate` varchar(100) NOT NULL,
  `Texte_patate` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patate`
--

INSERT INTO `patate` (`Num_patate`, `Nom_patate`, `Origine_patate`, `Couleur_patate`, `Prix_patate`, `Image_patate`, `Texte_patate`) VALUES
(1, 'Bintje', 'Pays-Bas', 'jaune', 0.6, 'reservee/bintje.jpg', 'Aujourd\'hui cultivée dans le Nord de la France, la Bintje est la pomme de terre de prédilection pour réaliser des frites dorées et croustillantes. Mais elle se prête aussi à bien d’autres préparations.'),
(4, 'Agata', 'Pays-bas', 'Jaune', 0.6, 'reservee/agata.jpg', 'Elle est idéale pour les cuissons au four, en gratin et pour les plats mijotés, comme le pot-au-feu. En effet, la pomme de terre agata est toute simple'),
(5, 'Annabelle', 'Pays-bas', 'Jaune lisse', 0.6, 'reservee/annabelle.jpg', ' elle est bonne'),
(6, 'Chérie', 'France', 'rouge violacé', 0.8, 'reservee/chérie.jpg', 'Chérie est une variété précoce à demi-précoce. Elle présente une bonne aptitude à une récolte primeur, qui s\'effectue 85 jours après la plantation, avant complète maturation des tubercules. Récoltée aussi tôt, la pomme de terre Chérie doit être conservée dans le bac à légumes du réfrigérateur et consommée rapidement.'),
(7, 'Désirée', 'pays', 'rouge violacé', 0.6, 'reservee/desiree.jpg', 'La variété Désirée appartient au groupe culinaire B-C, sa chair ne tient pas bien à la cuisson. Elle est préconisée pour cuisiner des frites, de la purée ou des potages. Sa chair est farineuse, légèrement sucrée.'),
(8, 'Bonnotte', 'pays', 'jaune', 0.6, 'reservee/bonnotte.jpg', 'Aujourd’hui avec son goût prononcé de châtaigne fraîche, elle est devenue une ambassadrice universelle du savoir-faire en primeur de l’île de Noirmoutier.\r\n\r\nCuite à la vapeur pour l’expression de tous ses arômes ou juste blanchie et rissolée dans du beurre salé, elle rend gourmands tous les gourmets.'),
(9, 'Spunta', 'pays', 'jaune', 0.6, 'reservee/spunta.jpg', ' La pomme de terre Spunta présente une bonne tenue à la cuisson, malgré un très léger noircissement. Purée, frites, potages, pommes de terre sautées... Elle est polyvalente en cuisine.'),
(10, 'Charlotte ', 'pays', 'jaune', 0.6, 'reservee/charlotte.jpg', 'La Charlotte a une chair ferme, ce qui signifie qu\'elle ne se délite pas à la cuisson - même oubliée trop longtemps dans l\'eau bouillante. Conséquemment, ce n\'est pas une variété à purée. Par contre, pour toutes les recettes nécessitant des cuissons à l\'eau ou vapeur : foncez. Charlotte est la pomme de terre la plus utilisée pour les raclettes et les tartiflettes. Dans les salades, elle peut être présentée en dés ou rondelles fondants mais fermes. Elle est également adaptée aux cuissons sautées ou rissolées. Cette variété est également intéressant côte saveur : elle est fine sans être fade.'),
(11, ' Monalisa', 'pays', 'jaune', 0.6, 'reservee/monalisa.jpg', 'Elle se consomme de multiples façons : au four, en frites, en salade, à la vapeur, mijotée, en purée, farcie ou sautée grâce à sa chair tendre et fondante. Elle ne noircit pas et conserve une bonne tenue à la cuisson.'),
(12, 'Carminelle', 'pays', 'rouge', 0.6, 'reservee/carminelle.jpg', 'La teneur en matière sèche des tubercules est moyenne [21,3%\r\ncontre 19,9 % pour Monalisa, 21,5 % pour Bintje et 22,2 % pour\r\nDésirée]. La tenue à la cuisson est très bonne et la chair, jaunepâle, noircit légèrement après cuisson. La couleur après friture\r\nest moyenne. La qualité gustative est bonne. Groupe culinaire A'),
(13, 'Franceline', 'pays', 'rose', 0.6, 'reservee/franceline.jpg', 'Aussi appelée « Charlotte rouge », la pomme de terre Franceline a une chair jaune et ferme, tout comme la Ratte, ce qui lui assure une bonne tenue à la cuisson. Sa peau est de couleur rose et elle se récolte en été. Elle se cuit à la vapeur et se cuisine en salade telle que la kartoffelsalat.'),
(14, 'Ratte ', 'pays', 'jaune', 0.6, 'reservee/ratte.jpg', 'De classe culinaire A, la ratte est une pomme de terre dite \"à chair ferme\", ce qui signifie qu\'elle se tient bien à la cuisson. La ratte est recommandée pour les cuissons à la vapeur, à l\'eau, rissolée à la poêle, au micro-ondes et au four. Le défunt cuisinier Joël Robuchon l\'utilisait également dans sa célèbre purée.'),
(15, 'Vitelotte', 'pays', 'violette ', 0.6, 'reservee/vitelotte.jpg', 'La pomme de terre vitelotte est une pomme de terre qui dispose d’une très belle qualité gustative. Elle n’absorbe que très peu de graisses lors de sa cuisson, ce qui en fait le légume parfait pour la travailler en chips ou en frites, en purée ou en écrasé, avec une teinte inédite. Elle est parfaite pour colorer vos repas de fête.'),
(16, 'Apollo ', 'pays', 'jaune', 0.6, 'reservee/apollo.jpg', ' Elles sont idéales pour les cuissons à l\'eau ou à la vapeur et se dégustent aussi mijotées ou rissolées. Plantez les tubercules de mi-mars à mai selon le climat et récoltez 80 à 90 jours après la plantation. Pour une culture primeur, plantez dès février-mars sous abri et récoltez 70 jours après la plantation.'),
(17, 'Marfona', 'pays', 'jaune', 0.6, 'reservee/marfona.jpg', 'La pomme de terre Marfona a une peau fine, chair non farineuse.\r\nUne cuisson qui ce fait bien mais est utiliser de préference dans les salades'),
(18, 'Samba', 'pays', 'jaune', 0.6, 'reservee/samba.jpg', 'La pomme de terre Samba est d\'une très bonne tenue à la cuisson et de bonne qualité culinaire. Polyvalente, elle s\'utilise beaucoup comme pomme de terre au four ou pomme de terre en robe des champs. Une fois cuite, elle s\'écrase facilement, permettant ainsi la réalisation de purées.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patate`
--
ALTER TABLE `patate`
  ADD PRIMARY KEY (`Num_patate`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patate`
--
ALTER TABLE `patate`
  MODIFY `Num_patate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
