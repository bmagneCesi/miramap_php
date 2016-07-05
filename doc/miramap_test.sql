-- phpMyAdmin SQL Dump
-- version 4.3.8
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 05 Juillet 2016 à 15:50
-- Version du serveur :  5.5.38
-- Version de PHP :  5.6.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `miramap_test`
--

-- --------------------------------------------------------

--
-- Structure de la table `Adresse`
--

CREATE TABLE IF NOT EXISTS `Adresse` (
  `id_adresse` int(11) NOT NULL,
  `adresse` varchar(50) NOT NULL,
  `id_ville` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Adresse`
--

INSERT INTO `Adresse` (`id_adresse`, `adresse`, `id_ville`) VALUES
(1, '45 rue massue', 1),
(2, '34 rue du four', 2),
(3, '45 rue du fond', 3),
(4, '23 rue de la bac', 4),
(5, '23 rue des bourdonnais', 5),
(6, '34 boulevard piratech', 56),
(7, '34 avenue du tapis', 57),
(8, '34 rue du tarmac', 58),
(9, '34 avenue du catÃ©ter', 60);

-- --------------------------------------------------------

--
-- Structure de la table `AMAP`
--

CREATE TABLE IF NOT EXISTS `AMAP` (
  `id_AMAP` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `adresse` varchar(25) DEFAULT NULL,
  `id_ville` int(11) NOT NULL,
  `id_MIRAMAP` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `AMAP`
--

INSERT INTO `AMAP` (`id_AMAP`, `libelle`, `adresse`, `id_ville`, `id_MIRAMAP`) VALUES
(1, 'AMAP coeur du sundgau', ' Rue du 42e Rif', 16, 1),
(2, 'AMAP coeur du sundgau', ' Rue du 42e Rif', 16, 1),
(3, 'AMAP de Bischoffsheim', '44 Rue des 3 Rois', 17, 1),
(4, 'AMAP coeur du sundgau', ' Rue du 42e Rif', 16, 1),
(5, 'AMAP de Bischoffsheim', '44 Rue des 3 Rois', 17, 1),
(6, 'AMAP de Illkirch-Graffens', '50 W Allée du Servenier', 18, 1),
(7, 'AMAP coeur du sundgau', ' Rue du 42e Rif', 16, 1),
(8, 'AMAP de Bischoffsheim', '44 Rue des 3 Rois', 17, 1),
(9, 'AMAP de Illkirch-Graffens', '50 W Allée du Servenier', 18, 1),
(10, 'AMAP de la Bergerie des C', '41 Rue du 8 Mai', 19, 1),
(11, 'AMAP de la ferme Obrecht ', '53 E Route d''Hourtin', 10, 1),
(12, 'AMAP de Luppachhov à Mulh', '11 N Rue Edmond Rostand', 11, 1),
(13, 'AMAP des hirondelles à Mu', '12 N Rue Labruyère', 12, 1),
(14, 'AMAP du Jardin de Rachel ', '42 Route Nationale 9', 13, 1),
(15, 'AMAP Hatten', '45 Rue de Decize', 14, 1),
(16, 'AMAP La Coccinelle', '47 Rue Baudin', 14, 1),
(17, 'AMAP le jardin d''Agnès à ', '50 Rue de Lyon', 14, 1),
(18, 'THURAMAP', '48 Puits 5', 15, 1),
(19, 'Les jardins de Breitenhei', '44 Rue du 20e Siècle', 26, 1),
(20, 'La coccinelle', '47 Voie du 48e Commando', 27, 1),
(21, 'AMAP Céréales paysannes', ' Rue du 49e Mobiles', 28, 1),
(22, 'AMAP Cerise', '11 N Rue des Vignes', 29, 1),
(23, 'AMAP du ruisseau Bleu', '30 N Avenue Jean Mermoz', 30, 1),
(24, 'Amap du Schluthfeld', '47 W Rue de Paris', 30, 1),
(25, 'AMAP''MONDE', '33 N Boulevard Laennec', 31, 1),
(26, 'Les saveurs de Kienheim', ' Avenue du 41e Ri', 32, 1),
(27, 'Collectif Potager de Wimm', '15 W Rue ètienne Blandin', 33, 1),
(28, 'Amap de Schiltigheim', '50 N Avenue Marcel Haegel', 34, 1),
(29, 'AMAP''ERO', '16 N Rue du Bas de Grange', 35, 1),
(30, 'Amap Truttenhausen Illkir', '47 N Rue de Tarragon', 36, 1),
(31, 'AMAP BARR/MITTELBERGHEIM', '49 Les Sablonnières 1', 37, 1),
(32, 'Les jardins de Breitenhei', '36 N Rue des Capucins', 38, 1),
(33, 'AMAP du Jardin de Rachel ', '48 Rue des 3 Mariés', 39, 1),
(34, 'Amap Framboises et Doryph', '45 5e Avenue', 40, 1),
(35, 'AMAP du Moulin de Manspac', '5 Rue du Necotin', 41, 1),
(36, 'Thuramap', '30 N Rue Moriou', 42, 1),
(37, 'RHENAMAP', '48 Rue du Foix', 42, 1),
(38, 'AMAP de Boulazac', '31 E Rue Lucien Gigaud', 43, 1),
(39, 'AMAP de Marsac-Sur-L''isle', '43 Rue du 20e Chasseurs', 44, 1),
(40, 'AMAP Saint-Cyprien', '43 Rue du 20e Chasseurs', 44, 1),
(41, 'Le potager gourmand', '49 Rue des 3 Obus', 45, 1),
(42, 'Aux paniers des deux vill', '40 N Rue Ledru Rollin', 46, 1),
(43, 'Amap de Tout Vent', ' Place du 24e Ri', 47, 1),
(44, 'AMAP coeur du sundgau', ' Rue du 42e Rif', 16, 1),
(45, 'AMAP de Bischoffsheim', '44 Rue des 3 Rois', 17, 1),
(46, 'AMAP de Illkirch-Graffens', '50 W Allée du Servenier', 18, 1),
(47, 'AMAP de la Bergerie des C', '41 Rue du 8 Mai', 19, 1),
(48, 'AMAP de la ferme Obrecht ', '53 E Route d''Hourtin', 10, 1),
(49, 'AMAP de Luppachhov à Mulh', '11 N Rue Edmond Rostand', 11, 1),
(50, 'AMAP des hirondelles à Mu', '12 N Rue Labruyère', 12, 1),
(51, 'AMAP du Jardin de Rachel ', '42 Route Nationale 9', 13, 1),
(52, 'AMAP Hatten', '45 Rue de Decize', 14, 1),
(53, 'AMAP La Coccinelle', '47 Rue Baudin', 14, 1),
(54, 'AMAP le jardin d''Agnès à ', '50 Rue de Lyon', 14, 1),
(55, 'THURAMAP', '48 Puits 5', 15, 1),
(56, 'Les jardins de Breitenhei', '44 Rue du 20e Siècle', 26, 1),
(57, 'La coccinelle', '47 Voie du 48e Commando', 27, 1),
(58, 'AMAP Céréales paysannes', ' Rue du 49e Mobiles', 28, 1),
(59, 'AMAP Cerise', '11 N Rue des Vignes', 29, 1),
(60, 'AMAP du ruisseau Bleu', '30 N Avenue Jean Mermoz', 30, 1),
(61, 'Amap du Schluthfeld', '47 W Rue de Paris', 30, 1),
(62, 'AMAP''MONDE', '33 N Boulevard Laennec', 31, 1),
(63, 'Les saveurs de Kienheim', ' Avenue du 41e Ri', 32, 1),
(64, 'Collectif Potager de Wimm', '15 W Rue ètienne Blandin', 33, 1),
(65, 'Amap de Schiltigheim', '50 N Avenue Marcel Haegel', 34, 1),
(66, 'AMAP''ERO', '16 N Rue du Bas de Grange', 35, 1),
(67, 'Amap Truttenhausen Illkir', '47 N Rue de Tarragon', 36, 1),
(68, 'AMAP BARR/MITTELBERGHEIM', '49 Les Sablonnières 1', 37, 1),
(69, 'Les jardins de Breitenhei', '36 N Rue des Capucins', 38, 1),
(70, 'AMAP du Jardin de Rachel ', '48 Rue des 3 Mariés', 39, 1),
(71, 'Amap Framboises et Doryph', '45 5e Avenue', 40, 1),
(72, 'AMAP du Moulin de Manspac', '5 Rue du Necotin', 41, 1),
(73, 'Thuramap', '30 N Rue Moriou', 42, 1),
(74, 'RHENAMAP', '48 Rue du Foix', 42, 1),
(75, 'AMAP de Boulazac', '31 E Rue Lucien Gigaud', 43, 1),
(76, 'AMAP de Marsac-Sur-L''isle', '43 Rue du 20e Chasseurs', 44, 1),
(77, 'AMAP Saint-Cyprien', '43 Rue du 20e Chasseurs', 44, 1),
(78, 'Le potager gourmand', '49 Rue des 3 Obus', 45, 1),
(79, 'Aux paniers des deux vill', '40 N Rue Ledru Rollin', 46, 1),
(80, 'Amap de Tout Vent', ' Place du 24e Ri', 47, 1),
(81, 'AMAP coeur du sundgau', ' Rue du 42e Rif', 16, 1),
(82, 'AMAP de Bischoffsheim', '44 Rue des 3 Rois', 17, 1),
(83, 'AMAP de Illkirch-Graffens', '50 W Allée du Servenier', 18, 1),
(84, 'AMAP de la Bergerie des C', '41 Rue du 8 Mai', 19, 1),
(85, 'AMAP de la ferme Obrecht ', '53 E Route d''Hourtin', 10, 1),
(86, 'AMAP de Luppachhov à Mulh', '11 N Rue Edmond Rostand', 11, 1),
(87, 'AMAP des hirondelles à Mu', '12 N Rue Labruyère', 12, 1),
(88, 'AMAP du Jardin de Rachel ', '42 Route Nationale 9', 13, 1),
(89, 'AMAP Hatten', '45 Rue de Decize', 14, 1),
(90, 'AMAP La Coccinelle', '47 Rue Baudin', 14, 1),
(91, 'AMAP le jardin d''Agnès à ', '50 Rue de Lyon', 14, 1),
(92, 'THURAMAP', '48 Puits 5', 15, 1),
(93, 'Les jardins de Breitenhei', '44 Rue du 20e Siècle', 26, 1),
(94, 'La coccinelle', '47 Voie du 48e Commando', 27, 1),
(95, 'AMAP Céréales paysannes', ' Rue du 49e Mobiles', 28, 1),
(96, 'AMAP Cerise', '11 N Rue des Vignes', 29, 1),
(97, 'AMAP du ruisseau Bleu', '30 N Avenue Jean Mermoz', 30, 1),
(98, 'Amap du Schluthfeld', '47 W Rue de Paris', 30, 1),
(99, 'AMAP''MONDE', '33 N Boulevard Laennec', 31, 1),
(100, 'Les saveurs de Kienheim', ' Avenue du 41e Ri', 32, 1),
(101, 'Collectif Potager de Wimm', '15 W Rue ètienne Blandin', 33, 1),
(102, 'Amap de Schiltigheim', '50 N Avenue Marcel Haegel', 34, 1),
(103, 'AMAP''ERO', '16 N Rue du Bas de Grange', 35, 1),
(104, 'Amap Truttenhausen Illkir', '47 N Rue de Tarragon', 36, 1),
(105, 'AMAP BARR/MITTELBERGHEIM', '49 Les Sablonnières 1', 37, 1),
(106, 'Les jardins de Breitenhei', '36 N Rue des Capucins', 38, 1),
(107, 'AMAP du Jardin de Rachel ', '48 Rue des 3 Mariés', 39, 1),
(108, 'Amap Framboises et Doryph', '45 5e Avenue', 40, 1),
(109, 'AMAP du Moulin de Manspac', '5 Rue du Necotin', 41, 1),
(110, 'Thuramap', '30 N Rue Moriou', 42, 1),
(111, 'RHENAMAP', '48 Rue du Foix', 42, 1),
(112, 'AMAP de Boulazac', '31 E Rue Lucien Gigaud', 43, 1),
(113, 'AMAP de Marsac-Sur-L''isle', '43 Rue du 20e Chasseurs', 44, 1),
(114, 'AMAP Saint-Cyprien', '43 Rue du 20e Chasseurs', 44, 1),
(115, 'Le potager gourmand', '49 Rue des 3 Obus', 45, 1),
(116, 'Aux paniers des deux vill', '40 N Rue Ledru Rollin', 46, 1),
(117, 'Amap de Tout Vent', ' Place du 24e Ri', 47, 1),
(118, 'Les portes du bassin', '43 N Rue Bournizet', 48, 1),
(119, 'AMAP Marcheprime', '7 Rue Anatole Gabeur', 49, 1),
(120, 'AMAP de L''Esquirot', ' Rue du 45e Ri', 50, 1),
(121, 'AMAP Talence Nord', '43 Place à  Suariccia 5', 51, 1),
(122, 'AMAP Talence Sud', '20 N Chemin des Tilleroye', 52, 1),
(123, 'Amap Barsac', '46 N Rue Jean Wyrsch', 52, 1),
(124, 'RDVBio', '55 N Rue de Dole', 52, 1),
(125, 'Coccinelle', '3 Rue du 9e Zouave', 53, 1),
(126, 'Les jardins d''Eole', '22 N Chemin de Montciel', 54, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contenir__PanierProduit_`
--

CREATE TABLE IF NOT EXISTS `contenir__PanierProduit_` (
  `quantite` int(11) DEFAULT NULL,
  `id_panier` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `contenir__PanierProduit_`
--

INSERT INTO `contenir__PanierProduit_` (`quantite`, `id_panier`, `id_produit`) VALUES
(9, 6, 4),
(1, 7, 2),
(1, 7, 4),
(1, 7, 7),
(1, 8, 5),
(1, 9, 3),
(1, 9, 7),
(2, 10, 2),
(2, 10, 4),
(2, 10, 7),
(1, 11, 4),
(1, 12, 4),
(4, 14, 2),
(2, 14, 4),
(24, 15, 3),
(50, 16, 2),
(50, 16, 3),
(50, 16, 4),
(8, 17, 3),
(7, 18, 4);

-- --------------------------------------------------------

--
-- Structure de la table `Contrat`
--

CREATE TABLE IF NOT EXISTS `Contrat` (
  `id_contrat` int(11) NOT NULL,
  `id_livraison` int(11) DEFAULT NULL,
  `etat` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `id_panier` int(11) NOT NULL,
  `id_producteur` int(11) NOT NULL,
  `id_consommateur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Contrat`
--

INSERT INTO `Contrat` (`id_contrat`, `id_livraison`, `etat`, `date_livraison`, `id_panier`, `id_producteur`, `id_consommateur`) VALUES
(18, 2, 'EN COURS', '0000-00-00', 10, 1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `Contrat_pro`
--

CREATE TABLE IF NOT EXISTS `Contrat_pro` (
  `id_contrat_pro` int(11) NOT NULL,
  `debut` date DEFAULT NULL,
  `fin` date DEFAULT NULL,
  `fonction` varchar(25) DEFAULT NULL,
  `salaire` int(11) DEFAULT NULL,
  `date_signature` date DEFAULT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_AMAP` int(11) NOT NULL,
  `id_MIRAMAP` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Entrepot`
--

CREATE TABLE IF NOT EXISTS `Entrepot` (
  `id_entrepot` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `adresse` varchar(25) DEFAULT NULL,
  `stock_max` int(11) DEFAULT NULL,
  `nombre_vehicule_max` int(11) DEFAULT NULL,
  `id_ville` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `fournir__ProduitCommande_`
--

CREATE TABLE IF NOT EXISTS `fournir__ProduitCommande_` (
  `type_panier` varchar(25) DEFAULT NULL,
  `id_panier` int(11) NOT NULL,
  `id_contrat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Lieu_distribution`
--

CREATE TABLE IF NOT EXISTS `Lieu_distribution` (
  `id_lieu_distribution` int(11) NOT NULL,
  `adresse` varchar(25) DEFAULT NULL,
  `id_ville` int(11) NOT NULL,
  `id_type_lieu_distribution` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Livraison`
--

CREATE TABLE IF NOT EXISTS `Livraison` (
  `id_livraison` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `id_lieu_distribution` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL,
  `id_type_livraison` int(11) NOT NULL,
  `id_producteur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `livrer__produitEntrepot_`
--

CREATE TABLE IF NOT EXISTS `livrer__produitEntrepot_` (
  `quantite_livrer` int(11) DEFAULT NULL,
  `id_panier` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `MIRAMAP`
--

CREATE TABLE IF NOT EXISTS `MIRAMAP` (
  `id_MIRAMAP` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `adresse` varchar(25) DEFAULT NULL,
  `id_ville` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `MIRAMAP`
--

INSERT INTO `MIRAMAP` (`id_MIRAMAP`, `libelle`, `adresse`, `id_ville`) VALUES
(1, 'MIRAMAP', '56 rue du chemin', 55);

-- --------------------------------------------------------

--
-- Structure de la table `Panier`
--

CREATE TABLE IF NOT EXISTS `Panier` (
  `id_panier` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `prix` int(11) DEFAULT NULL,
  `id_producteur` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Panier`
--

INSERT INTO `Panier` (`id_panier`, `libelle`, `prix`, `id_producteur`) VALUES
(6, 'Fruits', 63, 1),
(7, 'Verdure', 15, 3),
(8, 'Jardin', 7, 4),
(9, 'Primeur', 8, 1),
(10, 'Legumes', 30, 1),
(11, 'Terroir', 40, 3),
(12, 'Fraicheur', 58, 1),
(13, 'Soleil', 0, 3),
(14, 'Montagne', 26, 1),
(15, 'Bernardo', 96, 1),
(16, 'Chaleur', 550, 4),
(17, 'Orient', 44, 1),
(18, 'Occident', 35, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Produit`
--

CREATE TABLE IF NOT EXISTS `Produit` (
  `id_produit` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `prix_unitaire` int(11) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `id_saison` int(11) NOT NULL,
  `id_consommateur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Produit`
--

INSERT INTO `Produit` (`id_produit`, `libelle`, `prix_unitaire`, `quantite`, `id_saison`, `id_consommateur`) VALUES
(1, 'pomme', 3, 10, 1, 1),
(2, 'poire', 4, 20, 1, 2),
(3, 'cerise', 2, 100, 1, 1),
(4, 'pastÃ¨que', 5, 55, 3, 4),
(5, 'ciboulette', 1, 300, 2, 1),
(6, 'pomme', 2, 100, 4, 3),
(7, 'pistache', 6, 200, 1, 4),
(8, 'patate', 3, 10, 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `Region`
--

CREATE TABLE IF NOT EXISTS `Region` (
  `id_region` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Region`
--

INSERT INTO `Region` (`id_region`, `libelle`) VALUES
(1, 'Ile-de-France'),
(2, 'Alsace'),
(3, 'Aquitaine'),
(4, 'Auvergne'),
(5, 'Basse-Normandie'),
(6, 'Bourgogne'),
(7, 'Bretagne'),
(8, 'Centre Val-de-loire'),
(9, 'Champagne-Ardenne'),
(10, 'Corse'),
(11, 'Franche-Comté'),
(12, 'Haute-Normandie'),
(13, 'Languedoc-Roussillon'),
(14, 'Limousin'),
(15, 'Lorraine'),
(16, 'Midi-Pyrénées'),
(17, 'Nord-Pas-de-Calais'),
(18, 'Provence-Alpes-Côte-dAzur'),
(19, 'Pays-de-la-Loire'),
(20, 'Picardie'),
(21, 'Poitou-Charente'),
(22, 'Rhone-Alpes'),
(23, 'Ile de France'),
(24, 'Poitou Charente');

-- --------------------------------------------------------

--
-- Structure de la table `Saison`
--

CREATE TABLE IF NOT EXISTS `Saison` (
  `id_saison` int(11) NOT NULL,
  `libelle` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Saison`
--

INSERT INTO `Saison` (`id_saison`, `libelle`) VALUES
(1, 'Été'),
(2, 'Automne'),
(3, 'Primtemps'),
(4, 'Hiver');

-- --------------------------------------------------------

--
-- Structure de la table `Type_lieu_distribution`
--

CREATE TABLE IF NOT EXISTS `Type_lieu_distribution` (
  `id_type_lieu_distribution` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Type_livraison`
--

CREATE TABLE IF NOT EXISTS `Type_livraison` (
  `id_type_livraison` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Type_livraison`
--

INSERT INTO `Type_livraison` (`id_type_livraison`, `libelle`) VALUES
(1, 'Domicile '),
(2, 'AMAP la plus proche');

-- --------------------------------------------------------

--
-- Structure de la table `Type_utilisateur`
--

CREATE TABLE IF NOT EXISTS `Type_utilisateur` (
  `id_type_utilisateur` int(11) NOT NULL,
  `libelle` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Type_utilisateur`
--

INSERT INTO `Type_utilisateur` (`id_type_utilisateur`, `libelle`) VALUES
(0, 'Administrateur'),
(2, 'Consommateur'),
(1, 'Producteur');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateur`
--

CREATE TABLE IF NOT EXISTS `Utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `mail` varchar(35) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `civilite` varchar(25) DEFAULT NULL,
  `telephone` varchar(25) DEFAULT NULL,
  `nationalite` varchar(25) DEFAULT NULL,
  `id_adresse` int(11) NOT NULL,
  `id_type_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Utilisateur`
--

INSERT INTO `Utilisateur` (`id_utilisateur`, `mail`, `password`, `nom`, `prenom`, `date_naissance`, `civilite`, `telephone`, `nationalite`, `id_adresse`, `id_type_utilisateur`) VALUES
(1, 'bmagne@me.fr', 'azeaze', 'magne', 'benjamin', '1991-10-19', 'Mr', '0674160055', 'FR', 1, 1),
(2, 'bmagne@me.com', 'azeaze', 'pireil', 'mireille', '1963-02-19', 'Mme', '0674160017', 'FR', 2, 2),
(3, 'ppatoulatchi@gmail.com', 'azeaze', 'patoulatchi', 'pascal', '1954-02-12', 'Mr', '0675345567', 'FR', 3, 1),
(4, 'dpatcho@gmail.com', 'azeaze', 'patcho', 'delphine', '1984-05-12', 'Mme', '0536296938', 'FR', 4, 1),
(5, 'micheline@gmail.fr', 'azeaze', 'lfell', 'micheline', '1922-07-17', 'Mme', '0450060779', 'FR', 5, 2),
(6, 'flandes@gmail.fr', 'azeaze', 'Lande', 'Francis', '1967-04-12', 'Mr', '060607030405', 'FR', 6, 1),
(7, 'ccantal@gmail.com', 'azeaze', 'Cantal', 'Chantal', '1965-03-04', 'Mme', '0612435465', 'FR', 7, 1),
(8, 'mpagnol@hotmail.fr', 'azeaze', 'Pagnol', 'Marcel', '1945-06-14', 'Mr', '06778563452', 'FR', 8, 1),
(9, 'mpotache@gmail.fr', 'azeaze', 'Potache', 'Mathilde', '0000-00-00', 'Mme', '0675879856', 'FR', 9, 1);

-- --------------------------------------------------------

--
-- Structure de la table `Ville`
--

CREATE TABLE IF NOT EXISTS `Ville` (
  `id_ville` int(11) NOT NULL,
  `libelle` varchar(25) DEFAULT NULL,
  `code_postal` int(11) DEFAULT NULL,
  `id_region` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Ville`
--

INSERT INTO `Ville` (`id_ville`, `libelle`, `code_postal`, `id_region`) VALUES
(1, 'Vincennes', 75000, 1),
(2, 'Paris', 75017, 1),
(3, 'fond', 34534, 8),
(4, 'Poitiers', 23845, 1),
(5, 'Charenton', 75001, 1),
(6, 'Molenbeek', 67390, 2),
(7, 'Mulhuse', 68100, 2),
(8, 'Lembrass', 24100, 3),
(10, 'Vendays-Montalivet', 33930, 3),
(11, 'Capbreton', 40130, 3),
(12, 'Tonneins', 47400, 3),
(13, 'Le Mayet-d''ècole', 3800, 4),
(14, 'Moulins', 3000, 4),
(15, 'Saint-èloy-les-Mines', 63700, 4),
(16, 'Marckolsheim', 67390, 2),
(17, 'Mulhouse', 68100, 2),
(18, 'Lembras', 24100, 3),
(19, 'Marsac-sur-l''Isle', 24430, 3),
(26, 'Caen', 14000, 5),
(27, 'Langrune-sur-Mer', 14830, 5),
(28, 'Alençon', 61000, 5),
(29, 'Nevers', 58000, 6),
(30, 'Auxerre', 89000, 6),
(31, 'Saint-Brieuc', 22000, 7),
(32, 'Rennes', 35000, 7),
(33, 'Saint-Malo', 35400, 7),
(34, 'Bourges', 18000, 8),
(35, 'Vierzon', 18100, 8),
(36, 'Châteaudun', 28200, 8),
(37, 'Rueil-la-Gadelière', 28270, 8),
(38, 'Issoudun', 36100, 8),
(39, 'Fondettes', 37230, 8),
(40, 'Meung-sur-Loire', 45130, 8),
(41, 'Orléans', 45000, 8),
(42, 'Blois', 41000, 8),
(43, 'Romorantin-Lanthenay', 41200, 8),
(44, 'Vendôme', 41100, 8),
(45, 'Nouzonville', 8700, 9),
(46, 'Revin', 8500, 9),
(47, 'Saint-Loup-en-Champagne', 8300, 9),
(48, 'Vouziers', 8400, 9),
(49, 'Arc-en-Barrois', 52210, 9),
(50, 'Fismes', 51170, 9),
(51, 'Borgo', 20290, 10),
(52, 'Besançon', 25000, 11),
(53, 'Hérimoncourt', 25310, 11),
(54, 'Dole', 39100, 11),
(55, 'Annecy', 74010, 22),
(56, 'Paris', 75001, 23),
(57, 'Vincennes', 33800, 23),
(58, 'Poitiers', 45000, 24),
(59, 'Paris', 75004, 23),
(60, 'Buxerolles', 86180, 24),
(61, 'Paris', 75013, 23);

-- --------------------------------------------------------

--
-- Structure de la table `villes_france`
--

CREATE TABLE IF NOT EXISTS `villes_france` (
  `ville_id` mediumint(8) unsigned NOT NULL,
  `ville_departement` varchar(3) DEFAULT NULL,
  `ville_slug` varchar(255) DEFAULT NULL,
  `ville_nom` varchar(45) DEFAULT NULL,
  `ville_nom_simple` varchar(45) DEFAULT NULL,
  `ville_nom_reel` varchar(45) DEFAULT NULL,
  `ville_nom_soundex` varchar(20) DEFAULT NULL,
  `ville_nom_metaphone` varchar(22) DEFAULT NULL,
  `ville_code_postal` varchar(255) DEFAULT NULL,
  `ville_commune` varchar(3) DEFAULT NULL,
  `ville_code_commune` varchar(5) NOT NULL,
  `ville_arrondissement` smallint(3) unsigned DEFAULT NULL,
  `ville_canton` varchar(4) DEFAULT NULL,
  `ville_amdi` smallint(5) unsigned DEFAULT NULL,
  `ville_population_2010` mediumint(11) unsigned DEFAULT NULL,
  `ville_population_1999` mediumint(11) unsigned DEFAULT NULL,
  `ville_population_2012` mediumint(10) unsigned DEFAULT NULL COMMENT 'approximatif',
  `ville_densite_2010` int(11) DEFAULT NULL,
  `ville_surface` float DEFAULT NULL,
  `ville_longitude_deg` float DEFAULT NULL,
  `ville_latitude_deg` float DEFAULT NULL,
  `ville_longitude_grd` varchar(9) DEFAULT NULL,
  `ville_latitude_grd` varchar(8) DEFAULT NULL,
  `ville_longitude_dms` varchar(9) DEFAULT NULL,
  `ville_latitude_dms` varchar(8) DEFAULT NULL,
  `ville_zmin` mediumint(4) DEFAULT NULL,
  `ville_zmax` mediumint(4) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=36831 DEFAULT CHARSET=utf8;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Adresse`
--
ALTER TABLE `Adresse`
  ADD PRIMARY KEY (`id_adresse`), ADD KEY `id_ville` (`id_ville`), ADD KEY `id_ville_2` (`id_ville`);

--
-- Index pour la table `AMAP`
--
ALTER TABLE `AMAP`
  ADD PRIMARY KEY (`id_AMAP`), ADD KEY `FK_AMAP_id_ville` (`id_ville`), ADD KEY `FK_AMAP_id_MIRAMAP` (`id_MIRAMAP`);

--
-- Index pour la table `contenir__PanierProduit_`
--
ALTER TABLE `contenir__PanierProduit_`
  ADD PRIMARY KEY (`id_panier`,`id_produit`), ADD KEY `FK_contenir__PanierProduit__id_produit` (`id_produit`);

--
-- Index pour la table `Contrat`
--
ALTER TABLE `Contrat`
  ADD PRIMARY KEY (`id_contrat`), ADD KEY `id_producteur` (`id_producteur`);

--
-- Index pour la table `Contrat_pro`
--
ALTER TABLE `Contrat_pro`
  ADD PRIMARY KEY (`id_contrat_pro`), ADD KEY `FK_Contrat_pro_id_utilisateur` (`id_utilisateur`), ADD KEY `FK_Contrat_pro_id_AMAP` (`id_AMAP`), ADD KEY `FK_Contrat_pro_id_MIRAMAP` (`id_MIRAMAP`);

--
-- Index pour la table `Entrepot`
--
ALTER TABLE `Entrepot`
  ADD PRIMARY KEY (`id_entrepot`), ADD KEY `FK_Entrepot_id_ville` (`id_ville`);

--
-- Index pour la table `fournir__ProduitCommande_`
--
ALTER TABLE `fournir__ProduitCommande_`
  ADD PRIMARY KEY (`id_panier`,`id_contrat`), ADD KEY `FK_fournir__ProduitCommande__id_contrat` (`id_contrat`);

--
-- Index pour la table `Lieu_distribution`
--
ALTER TABLE `Lieu_distribution`
  ADD PRIMARY KEY (`id_lieu_distribution`), ADD KEY `FK_Lieu_distribution_id_ville` (`id_ville`), ADD KEY `FK_Lieu_distribution_id_type_lieu_distribution` (`id_type_lieu_distribution`);

--
-- Index pour la table `Livraison`
--
ALTER TABLE `Livraison`
  ADD PRIMARY KEY (`id_livraison`), ADD KEY `FK_Livraison_id_lieu_distribution` (`id_lieu_distribution`), ADD KEY `FK_Livraison_id_entrepot` (`id_entrepot`), ADD KEY `FK_Livraison_id_type_livraison` (`id_type_livraison`), ADD KEY `FK_Livraison_id_producteur` (`id_producteur`);

--
-- Index pour la table `livrer__produitEntrepot_`
--
ALTER TABLE `livrer__produitEntrepot_`
  ADD PRIMARY KEY (`id_panier`,`id_entrepot`), ADD KEY `FK_livrer__produitEntrepot__id_entrepot` (`id_entrepot`);

--
-- Index pour la table `MIRAMAP`
--
ALTER TABLE `MIRAMAP`
  ADD PRIMARY KEY (`id_MIRAMAP`), ADD KEY `FK_MIRAMAP_id_ville` (`id_ville`);

--
-- Index pour la table `Panier`
--
ALTER TABLE `Panier`
  ADD PRIMARY KEY (`id_panier`);

--
-- Index pour la table `Produit`
--
ALTER TABLE `Produit`
  ADD PRIMARY KEY (`id_produit`), ADD KEY `FK_Produit_id_consommateur` (`id_consommateur`);

--
-- Index pour la table `Region`
--
ALTER TABLE `Region`
  ADD PRIMARY KEY (`id_region`);

--
-- Index pour la table `Saison`
--
ALTER TABLE `Saison`
  ADD PRIMARY KEY (`id_saison`);

--
-- Index pour la table `Type_lieu_distribution`
--
ALTER TABLE `Type_lieu_distribution`
  ADD PRIMARY KEY (`id_type_lieu_distribution`);

--
-- Index pour la table `Type_livraison`
--
ALTER TABLE `Type_livraison`
  ADD PRIMARY KEY (`id_type_livraison`);

--
-- Index pour la table `Type_utilisateur`
--
ALTER TABLE `Type_utilisateur`
  ADD PRIMARY KEY (`id_type_utilisateur`), ADD UNIQUE KEY `libelle` (`libelle`);

--
-- Index pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`), ADD UNIQUE KEY `mail` (`mail`), ADD KEY `id_adresse` (`id_adresse`), ADD KEY `id_type_utilisateur` (`id_type_utilisateur`);

--
-- Index pour la table `Ville`
--
ALTER TABLE `Ville`
  ADD PRIMARY KEY (`id_ville`), ADD KEY `FK_Ville_id_region` (`id_region`);

--
-- Index pour la table `villes_france`
--
ALTER TABLE `villes_france`
  ADD PRIMARY KEY (`ville_id`), ADD UNIQUE KEY `ville_code_commune_2` (`ville_code_commune`), ADD UNIQUE KEY `ville_slug` (`ville_slug`), ADD KEY `ville_departement` (`ville_departement`), ADD KEY `ville_nom` (`ville_nom`), ADD KEY `ville_nom_reel` (`ville_nom_reel`), ADD KEY `ville_code_commune` (`ville_code_commune`), ADD KEY `ville_code_postal` (`ville_code_postal`), ADD KEY `ville_longitude_latitude_deg` (`ville_longitude_deg`,`ville_latitude_deg`), ADD KEY `ville_nom_soundex` (`ville_nom_soundex`), ADD KEY `ville_nom_metaphone` (`ville_nom_metaphone`), ADD KEY `ville_population_2010` (`ville_population_2010`), ADD KEY `ville_nom_simple` (`ville_nom_simple`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Adresse`
--
ALTER TABLE `Adresse`
  MODIFY `id_adresse` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `AMAP`
--
ALTER TABLE `AMAP`
  MODIFY `id_AMAP` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
--
-- AUTO_INCREMENT pour la table `Contrat`
--
ALTER TABLE `Contrat`
  MODIFY `id_contrat` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `Contrat_pro`
--
ALTER TABLE `Contrat_pro`
  MODIFY `id_contrat_pro` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Entrepot`
--
ALTER TABLE `Entrepot`
  MODIFY `id_entrepot` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Lieu_distribution`
--
ALTER TABLE `Lieu_distribution`
  MODIFY `id_lieu_distribution` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Livraison`
--
ALTER TABLE `Livraison`
  MODIFY `id_livraison` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `MIRAMAP`
--
ALTER TABLE `MIRAMAP`
  MODIFY `id_MIRAMAP` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `Panier`
--
ALTER TABLE `Panier`
  MODIFY `id_panier` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `Produit`
--
ALTER TABLE `Produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT pour la table `Region`
--
ALTER TABLE `Region`
  MODIFY `id_region` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT pour la table `Saison`
--
ALTER TABLE `Saison`
  MODIFY `id_saison` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `Type_lieu_distribution`
--
ALTER TABLE `Type_lieu_distribution`
  MODIFY `id_type_lieu_distribution` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `Type_livraison`
--
ALTER TABLE `Type_livraison`
  MODIFY `id_type_livraison` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `Ville`
--
ALTER TABLE `Ville`
  MODIFY `id_ville` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT pour la table `villes_france`
--
ALTER TABLE `villes_france`
  MODIFY `ville_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36831;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Adresse`
--
ALTER TABLE `Adresse`
ADD CONSTRAINT `Adresse_ibfk_1` FOREIGN KEY (`id_ville`) REFERENCES `Ville` (`id_ville`);

--
-- Contraintes pour la table `AMAP`
--
ALTER TABLE `AMAP`
ADD CONSTRAINT `FK_AMAP_id_MIRAMAP` FOREIGN KEY (`id_MIRAMAP`) REFERENCES `MIRAMAP` (`id_MIRAMAP`),
ADD CONSTRAINT `FK_AMAP_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `Ville` (`id_ville`);

--
-- Contraintes pour la table `contenir__PanierProduit_`
--
ALTER TABLE `contenir__PanierProduit_`
ADD CONSTRAINT `FK_contenir__PanierProduit__id_panier` FOREIGN KEY (`id_panier`) REFERENCES `Panier` (`id_panier`),
ADD CONSTRAINT `FK_contenir__PanierProduit__id_produit` FOREIGN KEY (`id_produit`) REFERENCES `Produit` (`id_produit`);

--
-- Contraintes pour la table `Contrat`
--
ALTER TABLE `Contrat`
ADD CONSTRAINT `FK_Contrat_id_producteur` FOREIGN KEY (`id_producteur`) REFERENCES `Utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `Contrat_pro`
--
ALTER TABLE `Contrat_pro`
ADD CONSTRAINT `FK_Contrat_pro_id_AMAP` FOREIGN KEY (`id_AMAP`) REFERENCES `AMAP` (`id_AMAP`),
ADD CONSTRAINT `FK_Contrat_pro_id_MIRAMAP` FOREIGN KEY (`id_MIRAMAP`) REFERENCES `MIRAMAP` (`id_MIRAMAP`),
ADD CONSTRAINT `FK_Contrat_pro_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `Utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `Entrepot`
--
ALTER TABLE `Entrepot`
ADD CONSTRAINT `FK_Entrepot_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `Ville` (`id_ville`);

--
-- Contraintes pour la table `fournir__ProduitCommande_`
--
ALTER TABLE `fournir__ProduitCommande_`
ADD CONSTRAINT `FK_fournir__ProduitCommande__id_contrat` FOREIGN KEY (`id_contrat`) REFERENCES `Contrat` (`id_contrat`),
ADD CONSTRAINT `FK_fournir__ProduitCommande__id_panier` FOREIGN KEY (`id_panier`) REFERENCES `Panier` (`id_panier`);

--
-- Contraintes pour la table `Lieu_distribution`
--
ALTER TABLE `Lieu_distribution`
ADD CONSTRAINT `FK_Lieu_distribution_id_type_lieu_distribution` FOREIGN KEY (`id_type_lieu_distribution`) REFERENCES `Type_lieu_distribution` (`id_type_lieu_distribution`),
ADD CONSTRAINT `FK_Lieu_distribution_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `Ville` (`id_ville`);

--
-- Contraintes pour la table `Livraison`
--
ALTER TABLE `Livraison`
ADD CONSTRAINT `FK_Livraison_id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `Entrepot` (`id_entrepot`),
ADD CONSTRAINT `FK_Livraison_id_lieu_distribution` FOREIGN KEY (`id_lieu_distribution`) REFERENCES `Lieu_distribution` (`id_lieu_distribution`),
ADD CONSTRAINT `FK_Livraison_id_producteur` FOREIGN KEY (`id_producteur`) REFERENCES `Utilisateur` (`id_utilisateur`),
ADD CONSTRAINT `FK_Livraison_id_type_livraison` FOREIGN KEY (`id_type_livraison`) REFERENCES `Type_livraison` (`id_type_livraison`);

--
-- Contraintes pour la table `livrer__produitEntrepot_`
--
ALTER TABLE `livrer__produitEntrepot_`
ADD CONSTRAINT `FK_livrer__produitEntrepot__id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `Entrepot` (`id_entrepot`),
ADD CONSTRAINT `FK_livrer__produitEntrepot__id_panier` FOREIGN KEY (`id_panier`) REFERENCES `Panier` (`id_panier`);

--
-- Contraintes pour la table `MIRAMAP`
--
ALTER TABLE `MIRAMAP`
ADD CONSTRAINT `FK_MIRAMAP_id_ville` FOREIGN KEY (`id_ville`) REFERENCES `Ville` (`id_ville`);

--
-- Contraintes pour la table `Produit`
--
ALTER TABLE `Produit`
ADD CONSTRAINT `FK_Produit_id_consommateur` FOREIGN KEY (`id_consommateur`) REFERENCES `Utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `Utilisateur`
--
ALTER TABLE `Utilisateur`
ADD CONSTRAINT `Utilisateur_ibfk_1` FOREIGN KEY (`id_adresse`) REFERENCES `Adresse` (`id_adresse`),
ADD CONSTRAINT `Utilisateur_ibfk_2` FOREIGN KEY (`id_type_utilisateur`) REFERENCES `Type_utilisateur` (`id_type_utilisateur`);

--
-- Contraintes pour la table `Ville`
--
ALTER TABLE `Ville`
ADD CONSTRAINT `FK_Ville_id_region` FOREIGN KEY (`id_region`) REFERENCES `Region` (`id_region`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
