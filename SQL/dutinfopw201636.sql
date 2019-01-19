-- phpMyAdmin SQL Dump
-- version 4.0.10deb1ubuntu0.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 18 Janvier 2019 à 11:41
-- Version du serveur: 5.5.62-0ubuntu0.14.04.1
-- Version de PHP: 5.5.9-1ubuntu4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dutinfopw201636`
--

-- --------------------------------------------------------

--
-- Structure de la table `accueil`
--

CREATE TABLE IF NOT EXISTS `accueil` (
  `message` varchar(64) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `accueil`
--

INSERT INTO `accueil` (`message`, `id`) VALUES
('Bienvenue', 1);

-- --------------------------------------------------------

--
-- Structure de la table `administrateur`
--

CREATE TABLE IF NOT EXISTS `administrateur` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `loginAdmin` varchar(64) NOT NULL,
  `mdpAdmin` varchar(64) NOT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`nom`, `prenom`, `id`) VALUES
('zacc', 'boussedrau', 1),
('fergoug', 'abdel', 2),
('Test', 'TP3', 3);

-- --------------------------------------------------------

--
-- Structure de la table `calendrierrestaurant`
--

CREATE TABLE IF NOT EXISTS `calendrierrestaurant` (
  `dateduJour` date NOT NULL,
  `plageHoraire` varchar(64) NOT NULL,
  PRIMARY KEY (`dateduJour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `catIngredients`
--

CREATE TABLE IF NOT EXISTS `catIngredients` (
  `idC` int(11) NOT NULL AUTO_INCREMENT,
  `nomC` varchar(25) DEFAULT NULL,
  `descC` text,
  PRIMARY KEY (`idC`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `catIngredients`
--

INSERT INTO `catIngredients` (`idC`, `nomC`, `descC`) VALUES
(1, 'Viandes', 'Toutes les viandes/poissons...'),
(2, 'Legumes', 'Toutes les légumes...'),
(3, 'Boissons', 'Les boissons...'),
(4, 'Sauces', 'Toutes les sauces...'),
(5, 'Desserts', 'Les désserts...'),
(6, 'Patates', 'Pommes de terre'),
(7, 'Pain', 'Pain...'),
(8, 'Fromage', 'Toutes les fromages...');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE IF NOT EXISTS `client` (
  `idClient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `mdp` varchar(64) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `connecte` tinyint(1) NOT NULL DEFAULT '0',
  `email` varchar(256) NOT NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=76 ;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`idClient`, `nom`, `prenom`, `login`, `mdp`, `telephone`, `connecte`, `email`) VALUES
(67, 'Sankar', 'Vijay', 'vsankar', 'c0c2b65f577040f3c7785a6872aa163b48342f5e2d47cd008e27c43767dee835', '0708090455', 0, 'vijay93700@gmail.com'),
(68, 'toto', 'toto', 'toto', '1b7b6a59fc15e81a2911ef8df45a204cce02e1145d8d604fa9312271c5fa8a5c', '0674859632', 0, 'toto@gmail.com'),
(69, 'Rodrigues', 'romain', 'rrodrigues', '9fdc7d26e8d8444d390a79d53bfdc11948f27a8eac1a7cc23d8bf47cc0b0b531', '0674859625', 0, 'romain@gmail.com'),
(70, 'Vieira', 'Dorian', 'dovieira', 'b678986c5d46acb47db4f412defc80f2a51436a8a364a865073c7c67653585bc', '0674859632', 0, 'dvieira@Ä§otmail.fr'),
(72, 'neto', 'nicolas', 'nneto', '19cceab3adce7dc4bbc1a0869f42b38ff5d0c4ca6be45397e5e74f22a09500b0', '0678965241', 0, 'nneto@gmail.com'),
(73, 'jean', 'Jack', 'jjack', '623dd7839d9e77a06919129b05c046f25d6f6e108b255c371a1ddcb5c205672a', '0606080784', 0, 'jack@gmail.fr'),
(74, 'Bens', 'Youcef', 'Yobens', '043102141bcdb8b081c59ba8b7a06f8609d814b111549d04552d64c6ed36d055', '0686846797', 0, 'yobense@yahoo.fr'),
(75, 'Zlatan ', 'Ibra', 'zlatan', 'a2c0f394099fc145e58c3b053d65fd6a075912ff76d2d76ba9e387278b5eefe3', '0796523652', 0, 'zlataaan@hotmail.fr');

-- --------------------------------------------------------

--
-- Structure de la table `detenir`
--

CREATE TABLE IF NOT EXISTS `detenir` (
  `idRestaurant` int(11) NOT NULL,
  `dateduJour` date NOT NULL,
  PRIMARY KEY (`idRestaurant`,`dateduJour`),
  KEY `FK_detenir_dateduJour` (`dateduJour`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL,
  `nom` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`id`, `nom`) VALUES
(1, 'SFX'),
(3, 'Fantastique'),
(4, 'Roman policier'),
(7, 'Essai'),
(12, 'Heroique'),
(13, '0'),
(0, '');

-- --------------------------------------------------------

--
-- Structure de la table `gerer`
--

CREATE TABLE IF NOT EXISTS `gerer` (
  `idRestaurant` int(11) NOT NULL,
  `idAdmin` int(11) NOT NULL,
  PRIMARY KEY (`idRestaurant`,`idAdmin`),
  KEY `FK_gerer_idAdmin` (`idAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `ingredients`
--

CREATE TABLE IF NOT EXISTS `ingredients` (
  `idI` int(11) NOT NULL AUTO_INCREMENT,
  `nomI` varchar(25) DEFAULT NULL,
  `prixI` float DEFAULT NULL,
  `descI` text,
  `idN` int(11) DEFAULT NULL,
  `idC` int(11) DEFAULT NULL,
  PRIMARY KEY (`idI`),
  KEY `FK_Ingredients_idC` (`idC`),
  KEY `FK_Ingredients_idN` (`idN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Contenu de la table `ingredients`
--

INSERT INTO `ingredients` (`idI`, `nomI`, `prixI`, `descI`, `idN`, `idC`) VALUES
(1, 'Salades', 0.5, 'La bonne salade sa mère', 1, 2),
(2, 'Steak', 2, 'Bon steak', 1, 1),
(3, 'Poulet', 2, 'Miam', 6, 1),
(4, 'Frites', 1, 'Dose de frites', 1, 6),
(5, 'Potatoes', 1, 'Dose de potatoes', 7, 6),
(6, 'Bacon', 1.5, 'Tranche de bacon', 7, 1),
(7, 'Pain', 1, '2 tranches de pain', 1, 7),
(8, 'Tomates', 0.5, 'Dose tomates', 1, 2),
(9, 'Oignons', 0.5, 'Dose oignon', 1, 2),
(10, 'Fromage', 1, 'Tranche de fromage', 1, 8),
(11, 'Soda', 1, 'Boissons', 1, 3),
(12, 'Vodka du supermarché', 2, 'Un petit shnaps ?', 1, 3),
(13, 'Absolute vodka', 2, 'Vodka gastronomique', 16, 3),
(14, 'Lait milkshake/glaces', 1, 'Dose pour une glace', 10, 5),
(15, 'Steak végétarien', 1.5, 'Pour les fragiles...', 10, 1),
(16, 'Poisson', 2, 'Il est frais mon poisson', 10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `joueurs`
--

CREATE TABLE IF NOT EXISTS `joueurs` (
  `idJ` int(11) NOT NULL AUTO_INCREMENT,
  `loginJ` varchar(25) DEFAULT NULL,
  `passwordJ` varchar(25) DEFAULT NULL,
  `pseudoJ` varchar(16) DEFAULT NULL,
  `argentJ` float DEFAULT NULL,
  `xpJ` int(11) DEFAULT NULL,
  `idN` int(11) DEFAULT NULL,
  `idP` int(11) DEFAULT NULL,
  `estAdmin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idJ`),
  UNIQUE KEY `loginJ` (`loginJ`),
  KEY `FK_Joueurs_idN` (`idN`),
  KEY `FK_Joueurs_idP` (`idP`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `joueurs`
--

INSERT INTO `joueurs` (`idJ`, `loginJ`, `passwordJ`, `pseudoJ`, `argentJ`, `xpJ`, `idN`, `idP`, `estAdmin`) VALUES
(1, 'admin', 'admin', 'administrateur', 0, 1000, 1, NULL, 1),
(2, 'joueur', 'joueur', 'joueur1', 0, 0, 1, NULL, 0);

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `titre` varchar(100) NOT NULL,
  `resume` text NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `lo`
--

CREATE TABLE IF NOT EXISTS `lo` (
  `message` mediumtext NOT NULL,
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `localisation`
--

CREATE TABLE IF NOT EXISTS `localisation` (
  `idLocalisation` int(11) NOT NULL AUTO_INCREMENT,
  `region` varchar(64) NOT NULL,
  `ville` varchar(64) NOT NULL,
  `cp` varchar(5) NOT NULL,
  PRIMARY KEY (`idLocalisation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Contenu de la table `localisation`
--

INSERT INTO `localisation` (`idLocalisation`, `region`, `ville`, `cp`) VALUES
(1, 'Île-de-France', 'Sevran', '93270'),
(2, 'Languedoc-Roussillon', 'Canet', '66000'),
(3, 'Centre-Val de Loire', 'Orleans', '45000'),
(4, 'Midi-Pyrénées', 'Toulouse', '31200'),
(5, 'Midi-Pyrénées', 'Albi', '81000'),
(6, 'Rhône-Alpes', 'Grenoble', '38100'),
(7, 'Guadeloupe', 'Basse-Terre', '97100'),
(8, 'La Reunion', 'Petite-Ile', '97429'),
(9, 'Guyane', 'Cayenne', '97300'),
(10, 'La Réunion', 'Cilaos', '97413');

-- --------------------------------------------------------

--
-- Structure de la table `machines`
--

CREATE TABLE IF NOT EXISTS `machines` (
  `idM` int(11) NOT NULL AUTO_INCREMENT,
  `nomM` varchar(25) DEFAULT NULL,
  `prixM` float DEFAULT NULL,
  `entretienM` float DEFAULT NULL,
  `descM` text,
  `idN` int(11) DEFAULT NULL,
  PRIMARY KEY (`idM`),
  KEY `FK_Machines_idN` (`idN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `machines`
--

INSERT INTO `machines` (`idM`, `nomM`, `prixM`, `entretienM`, `descM`, `idN`) VALUES
(1, 'Friteuse', 0, 9, 'Machine pour cuire frites', 1),
(2, 'Grill', 0, 9, 'Cuisson des viandes', 1),
(3, 'Machine à boissons', 0, 9, 'Machine pour préparer boissons', 1),
(4, 'Machine desserts', 2000, 9, 'Machine pour préparer glaces...', 10),
(5, 'Machine cocktails', 1000, 9, 'Machine pour préparer cocktails', 10),
(6, 'Paneur', 500, 9, 'Machine pour cuire poulet et nuggets', 6);

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(64) NOT NULL,
  `entree` varchar(64) NOT NULL,
  `plat` varchar(64) NOT NULL,
  `dessert` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `prix` float NOT NULL,
  `idRestaurant` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMenu`),
  KEY `FK_Menu_idRestaurant` (`idRestaurant`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Contenu de la table `menu`
--

INSERT INTO `menu` (`idMenu`, `titre`, `entree`, `plat`, `dessert`, `description`, `prix`, `idRestaurant`) VALUES
(16, 'l''Orient', 'Salade de carottes cuites au cumin', 'Couscous boulettes de boeuf Maison', 'Rondelle d''oranges miel canelle', 'Un menu parfumé qui vous emmene au Maroc !', 20, 59),
(20, 'Le Parisien', 'champignons', 'champignons farcies', 'flan', 'Plat parisien', 10, 89),
(23, 'Indian MealSsss', 'Badji de pommes de terre', 'Poulet vindaloo', 'kulfi', 'Gros plats', 17, 90),
(28, 'the big boss', 'salade americaine', 'Big burger', 'Tiramisu', 'tu vas aimer ca', 11, 103),
(30, 'Le Fameux', 'salade nicoise', 'Saumon farcies', 'Brownie', 'un bon repas', 10, 101);

-- --------------------------------------------------------

--
-- Structure de la table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `idM` int(11) NOT NULL AUTO_INCREMENT,
  `idI1` int(11) DEFAULT NULL,
  `idI2` int(11) DEFAULT NULL,
  `idI3` int(11) DEFAULT NULL,
  `idI4` int(11) DEFAULT NULL,
  `idI5` int(11) DEFAULT NULL,
  `idI6` int(11) DEFAULT NULL,
  `idI7` int(11) DEFAULT NULL,
  `idI8` int(11) DEFAULT NULL,
  `idI9` int(11) DEFAULT NULL,
  `idI10` int(11) DEFAULT NULL,
  PRIMARY KEY (`idM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `niveaux`
--

CREATE TABLE IF NOT EXISTS `niveaux` (
  `idN` int(11) NOT NULL AUTO_INCREMENT,
  `nomN` varchar(64) DEFAULT NULL,
  `xpminN` int(11) DEFAULT NULL,
  PRIMARY KEY (`idN`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Contenu de la table `niveaux`
--

INSERT INTO `niveaux` (`idN`, `nomN`, `xpminN`) VALUES
(1, 'Apprenti', 0),
(2, 'Apprenti+', 10),
(3, 'Apprenti++', 30),
(4, 'Petit cuistot', 100),
(5, 'Petit cuistot+', 300),
(6, 'Petit cuistot++', 600),
(7, 'Cuistot', 1000),
(8, 'Cuistot+', 1500),
(9, 'Cuistot++', 2200),
(10, 'Petit chef', 3000),
(11, 'Petit chef+', 4000),
(12, 'Petit chef++', 5500),
(13, 'Chef cuistot', 7500),
(14, 'Chef cuistot+', 10000),
(15, 'Chef cuistot++', 13000),
(16, 'Grand chef cuistot', 17000),
(17, 'Grand chef cuistot+', 22000),
(18, 'Grand chef cuistot++', 29000),
(19, 'Grand chef cuistot étoilé: *', 38000),
(20, 'Grand chef cuistot étoilé: **', 50000),
(21, 'Grand chef cuistot étoilé: ***', 70000),
(22, 'Grand chef cuistot étoilé: ****', 100000),
(23, 'Grand chef cuistot étoilé: *****', 150000);

-- --------------------------------------------------------

--
-- Structure de la table `partie`
--

CREATE TABLE IF NOT EXISTS `partie` (
  `idP` int(11) NOT NULL AUTO_INCREMENT,
  `nbrCouverts` int(11) DEFAULT NULL,
  `recetteTotal` int(11) DEFAULT NULL,
  `xp` int(11) DEFAULT NULL,
  `prixAliments` int(11) DEFAULT NULL,
  `pertes` int(11) DEFAULT NULL,
  `tips` int(11) DEFAULT NULL,
  `bonus` int(11) DEFAULT NULL,
  `totalXp` int(11) DEFAULT NULL,
  `totalArgent` int(11) DEFAULT NULL,
  `idJ` int(11) NOT NULL,
  PRIMARY KEY (`idP`),
  UNIQUE KEY `idJ` (`idJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `partie`
--

INSERT INTO `partie` (`idP`, `nbrCouverts`, `recetteTotal`, `xp`, `prixAliments`, `pertes`, `tips`, `bonus`, `totalXp`, `totalArgent`, `idJ`) VALUES
(1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `personne_admin`
--

CREATE TABLE IF NOT EXISTS `personne_admin` (
  `id` int(11) NOT NULL,
  `creation` tinyint(1) NOT NULL,
  `modification` tinyint(1) NOT NULL,
  `suppression` tinyint(1) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `personne_admin`
--

INSERT INTO `personne_admin` (`id`, `creation`, `modification`, `suppression`) VALUES
(10, 1, 1, 1),
(11, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE IF NOT EXISTS `reserver` (
  `dateDuJour` date DEFAULT NULL,
  `heureDebut` time DEFAULT NULL,
  `idRestaurant` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`idRestaurant`,`idClient`),
  KEY `FK_reserver_idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `reserver`
--

INSERT INTO `reserver` (`dateDuJour`, `heureDebut`, `idRestaurant`, `idClient`) VALUES
('2017-01-17', '20:00:00', 101, 67);

-- --------------------------------------------------------

--
-- Structure de la table `restaurant`
--

CREATE TABLE IF NOT EXISTS `restaurant` (
  `idRestaurant` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `adresse` varchar(64) NOT NULL,
  `telephone` varchar(64) NOT NULL,
  `horaireDebut` varchar(24) NOT NULL,
  `horaireFin` varchar(24) NOT NULL,
  `capacite` int(11) NOT NULL,
  `promotion` float DEFAULT NULL,
  `type` varchar(64) NOT NULL,
  `note` smallint(6) DEFAULT NULL,
  `noteMoyenne` float DEFAULT NULL,
  `idLocalisation` int(11) DEFAULT NULL,
  `idRestaurateur` int(11) DEFAULT NULL,
  `image` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idRestaurant`),
  KEY `FK_Restaurant_idLocalisation` (`idLocalisation`),
  KEY `FK_Restaurant_idRestaurateur` (`idRestaurateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Contenu de la table `restaurant`
--

INSERT INTO `restaurant` (`idRestaurant`, `nom`, `adresse`, `telephone`, `horaireDebut`, `horaireFin`, `capacite`, `promotion`, `type`, `note`, `noteMoyenne`, `idLocalisation`, `idRestaurateur`, `image`) VALUES
(59, 'L''Etoile 2 Nuit', '58 Route de Bondy, 93270 Sevran', '0606080784', '10:00', '21:00', 70, NULL, 'Orientale', NULL, NULL, 1, 9, 'etoile.jpg'),
(89, 'Crous', '140 rue de la nouvelle France,66000 Canet', '0142453623', '12:00', '19:00', 100, NULL, 'Japonaise', NULL, NULL, 2, 10, 'crous.jpg'),
(90, 'Indian Street', '26 Rue Maximilien Robespierre,93270 Sevran', '0141526325', '14:00', '23:00', 80, NULL, 'Indienne', NULL, NULL, 1, 6, 'IndianStreet.jpg'),
(101, 'Saudade', '34 rue des Bourdonnais,45000 Orleans', '0195745854', '12:00', '22:00', 50, NULL, 'Portuguaise', NULL, NULL, 3, 10, 'saudade.jpg'),
(103, 'Le fameux', '150 avenue Henry Barbusse, 45000 Orleans', '0145781247', '19:00', '23:00', 58, NULL, 'Bresilienne', NULL, NULL, 3, 13, '3a51cce85d487bdadc2aa3d4f6b7e9fd_large.jpeg');

-- --------------------------------------------------------

--
-- Structure de la table `restaurateur`
--

CREATE TABLE IF NOT EXISTS `restaurateur` (
  `idRestaurateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `mdp` varchar(64) NOT NULL,
  `email` varchar(256) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `connecte` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idRestaurateur`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `restaurateur`
--

INSERT INTO `restaurateur` (`idRestaurateur`, `nom`, `prenom`, `login`, `mdp`, `email`, `telephone`, `connecte`) VALUES
(6, 'Bossard', 'Aurelien', 'abossard', '2b1f160055639c8d602fe67de67e1a1a04d19b5fad3086fa9a354f1e4b47d96c', 'boss93@hotmail.fr', '0687512584', 0),
(9, 'toto', 'titi', 'titi', 'e913c8e35f8a369b89ae6cc7353100ebaadc657036bd4c1a1295887238f98602', 'titi@hotmail.fr', '0145263256', 0),
(10, 'Homps', 'Marc', 'mhomps', 'c0c2b65f577040f3c7785a6872aa163b48342f5e2d47cd008e27c43767dee835', 'mhomps@hotmail.fr', '0674585544', 0),
(12, 'polac', 'jeanmis', 'pjean', 'cfb524b28f908329a268284cc84a96ff057fdf0918f1809ee5d3ee57d5c993fe', 'pjean@gmail.com', '0678787878', 0),
(13, 'psalam', 'polac', 'polac', 'cfb524b28f908329a268284cc84a96ff057fdf0918f1809ee5d3ee57d5c993fe', 'polac@gmail.com', '0897897787', 0),
(14, 'Kent', 'Clark', 'Superman', '1dbededd67b189f12be016eed17f46935beb80bece64bff96919f2d0bd366716', 'Ck@gmail.ck', '0143301416', 0);

-- --------------------------------------------------------

--
-- Structure de la table `StockIngredient`
--

CREATE TABLE IF NOT EXISTS `StockIngredient` (
  `idJ` int(11) NOT NULL,
  `idI` int(11) NOT NULL,
  `idJ_Joueurs` int(11) NOT NULL,
  `idI_Ingredients` int(11) DEFAULT NULL,
  PRIMARY KEY (`idJ`,`idI`),
  KEY `FK_StockIngredient_idJ_Joueurs` (`idJ_Joueurs`),
  KEY `FK_StockIngredient_idI_Ingredients` (`idI_Ingredients`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `StockMachine`
--

CREATE TABLE IF NOT EXISTS `StockMachine` (
  `idJ` int(11) NOT NULL,
  `idM` int(11) NOT NULL,
  `possedeM` tinyint(1) DEFAULT NULL,
  `idJ_Joueurs` int(11) NOT NULL,
  `idM_Machines` int(11) DEFAULT NULL,
  PRIMARY KEY (`idJ`,`idM`),
  KEY `FK_StockMachine_idJ_Joueurs` (`idJ_Joueurs`),
  KEY `FK_StockMachine_idM_Machines` (`idM_Machines`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `sujet`
--

CREATE TABLE IF NOT EXISTS `sujet` (
  `id_sujet` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `titre` varchar(55) DEFAULT NULL,
  `description` text,
  `id_utilisateur` bigint(20) unsigned DEFAULT NULL,
  `date_publication` date DEFAULT NULL,
  PRIMARY KEY (`id_sujet`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=82 ;

--
-- Contenu de la table `sujet`
--

INSERT INTO `sujet` (`id_sujet`, `titre`, `description`, `id_utilisateur`, `date_publication`) VALUES
(62, ') delete * from Sujet;', ') delete * from Sujet;', 5, '2017-01-25'),
(63, 'zae', '', 5, '2017-01-25'),
(64, ') delete * from Sujet;', ') delete * from Sujet;', 5, '2017-01-25'),
(65, 'couleur de me', '', 5, '2017-01-25'),
(66, ') delete * from sujet;', ') delete * from sujet;', 5, '2017-01-25'),
(67, 'change les couleur', '', 5, '2017-01-25'),
(68, '#', '#', 5, '2017-01-25'),
(69, '', '', 5, '2017-01-25'),
(70, 'VOUS Y ARRIVEREZ PAS', 'OUAI PEPITO', 5, '2017-01-25'),
(71, '<script>alert("caca");</script>', '<script>alert("caca");</script>', 5, '2017-01-25'),
(72, 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaa', 5, '2017-01-25'),
(73, 'AKljizajmajmzfjmsdfsdfsfdsffsdds', 'AKljizajmajmzfjmsdfsdfsfdsffsddsAKljizajmajmzfjmsdfsdfsfdsffsddsAKljizajmajmzfjmsdfsdfsfdsffsddsAKljizajmajmzfjmsdfsdfsfdsffsddsAKljizajmajmzfjmsdfsdfsfdsffsddsAKljizajmajmzfjmsdfsdfsfdsffsdds', 5, '2017-01-25'),
(74, '×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×', '×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ 2×©×‚ ×©×‚2×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚×©×‚ ×©×‚', 5, '2017-01-26'),
(75, '	/Ê”/	/Ê”/	mapiq5	×Ö¼ ×Ö¼	1 /Ê”l/	lig', '', 5, '2017-01-26'),
(76, '×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×', '''1=1#', 5, '2017-01-26'),
(77, '×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤', '×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×333×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ××¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×', 5, '2017-01-26'),
(78, 'ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢', 'ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×', 5, '2017-01-26'),
(79, 'ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢', 'ï¬»×›×™×˜ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×3ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢×¡× ×ž×œ×Ÿ×ï¬»×›×™×˜×—×–×•×”×“×’ï¬±×‘××š×ªï¬«ï¬ª×©×¨×§×¦×¥ï­„×¤×¢', 5, '2017-01-26'),
(80, ''' OR 1=1"); #', '', 5, '2017-01-26'),
(81, 'sysout', 'sysout', 5, '2017-03-07');

-- --------------------------------------------------------

--
-- Structure de la table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `jeton` varchar(20) NOT NULL,
  `temps` datetime NOT NULL,
  `expiration` int(10) unsigned NOT NULL,
  PRIMARY KEY (`jeton`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `idType` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nomType` varchar(64) NOT NULL,
  PRIMARY KEY (`idType`),
  UNIQUE KEY `idType` (`idType`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`idType`, `nomType`) VALUES
(1, 'Japonaise'),
(2, 'Orientale'),
(3, 'Europeenne'),
(4, 'Thailandais'),
(5, 'Portuguaise'),
(6, 'Indienne'),
(7, 'Espagnole'),
(8, 'Bresilienne'),
(9, 'Antillaise'),
(10, 'Bresilienne'),
(11, 'Antillaise');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `prenom` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `login`, `password`) VALUES
(1, 'Vi', 'Tor', 'Xxvitor-du-93xX', 'motdepasse'),
(4, 'A', 'B', 'C', 'D'),
(10, 'Admin', 'G', 'admin', 'motdepassetreslongmaispastrescomplique'),
(11, 'Le', 'Soleil', 'ychalabiu', '1234');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `mdp` varchar(20) DEFAULT NULL,
  `nom` varchar(20) DEFAULT NULL,
  `prenom` varchar(20) DEFAULT NULL,
  `mail` varchar(55) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `login`, `mdp`, `nom`, `prenom`, `mail`, `admin`) VALUES
(1, 'jdujardin', NULL, 'jean', 'dujardin', 'jdujardin@gmail.com', 1),
(2, 'jreno', NULL, 'jean', 'reno', 'jreno@gmail.com', 0),
(5, 'test', 'test', 'JEAN', 'PAUL', 'test@test.fr', 0);

-- --------------------------------------------------------

--
-- Structure de la table `verification`
--

CREATE TABLE IF NOT EXISTS `verification` (
  `token` varchar(64) NOT NULL,
  `login` varchar(64) NOT NULL,
  `idRestaurateur` int(11) NOT NULL,
  `idClient` int(11) NOT NULL,
  PRIMARY KEY (`token`),
  KEY `FK_Verification_idRestaurateur` (`idRestaurateur`),
  KEY `FK_Verification_idClient` (`idClient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `detenir`
--
ALTER TABLE `detenir`
  ADD CONSTRAINT `FK_detenir_dateduJour` FOREIGN KEY (`dateduJour`) REFERENCES `calendrierrestaurant` (`dateduJour`),
  ADD CONSTRAINT `FK_detenir_idRestaurant` FOREIGN KEY (`idRestaurant`) REFERENCES `restaurant` (`idRestaurant`);

--
-- Contraintes pour la table `gerer`
--
ALTER TABLE `gerer`
  ADD CONSTRAINT `FK_gerer_idAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `administrateur` (`idAdmin`),
  ADD CONSTRAINT `FK_gerer_idRestaurant` FOREIGN KEY (`idRestaurant`) REFERENCES `restaurant` (`idRestaurant`);

--
-- Contraintes pour la table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `FK_Ingredients_idN` FOREIGN KEY (`idN`) REFERENCES `niveaux` (`idN`),
  ADD CONSTRAINT `FK_Ingredients_idC` FOREIGN KEY (`idC`) REFERENCES `catIngredients` (`idC`);

--
-- Contraintes pour la table `joueurs`
--
ALTER TABLE `joueurs`
  ADD CONSTRAINT `FK_Joueurs_idP` FOREIGN KEY (`idP`) REFERENCES `partie` (`idP`),
  ADD CONSTRAINT `FK_Joueurs_idN` FOREIGN KEY (`idN`) REFERENCES `niveaux` (`idN`);

--
-- Contraintes pour la table `machines`
--
ALTER TABLE `machines`
  ADD CONSTRAINT `FK_Machines_idN` FOREIGN KEY (`idN`) REFERENCES `niveaux` (`idN`);

--
-- Contraintes pour la table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `FK_Menu_idRestaurant` FOREIGN KEY (`idRestaurant`) REFERENCES `restaurant` (`idRestaurant`);

--
-- Contraintes pour la table `partie`
--
ALTER TABLE `partie`
  ADD CONSTRAINT `FK_Partie_idJ` FOREIGN KEY (`idJ`) REFERENCES `joueurs` (`idJ`);

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `FK_reserver_idClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `FK_reserver_idRestaurant` FOREIGN KEY (`idRestaurant`) REFERENCES `restaurant` (`idRestaurant`);

--
-- Contraintes pour la table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `FK_Restaurant_idLocalisation` FOREIGN KEY (`idLocalisation`) REFERENCES `localisation` (`idLocalisation`),
  ADD CONSTRAINT `FK_Restaurant_idRestaurateur` FOREIGN KEY (`idRestaurateur`) REFERENCES `restaurateur` (`idRestaurateur`);

--
-- Contraintes pour la table `StockIngredient`
--
ALTER TABLE `StockIngredient`
  ADD CONSTRAINT `FK_StockIngredient_idI_Ingredients` FOREIGN KEY (`idI_Ingredients`) REFERENCES `ingredients` (`idI`),
  ADD CONSTRAINT `FK_StockIngredient_idJ_Joueurs` FOREIGN KEY (`idJ_Joueurs`) REFERENCES `joueurs` (`idJ`);

--
-- Contraintes pour la table `StockMachine`
--
ALTER TABLE `StockMachine`
  ADD CONSTRAINT `FK_StockMachine_idM_Machines` FOREIGN KEY (`idM_Machines`) REFERENCES `machines` (`idM`),
  ADD CONSTRAINT `FK_StockMachine_idJ_Joueurs` FOREIGN KEY (`idJ_Joueurs`) REFERENCES `joueurs` (`idJ`);

--
-- Contraintes pour la table `verification`
--
ALTER TABLE `verification`
  ADD CONSTRAINT `FK_Verification_idClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`idClient`),
  ADD CONSTRAINT `FK_Verification_idRestaurateur` FOREIGN KEY (`idRestaurateur`) REFERENCES `restaurateur` (`idRestaurateur`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
