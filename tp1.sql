-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 09:35 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tp1`
--

-- --------------------------------------------------------

--
-- Table structure for table `achat`
--

CREATE TABLE `achat` (
  `numfacture` int(11) NOT NULL,
  `datefacture` date DEFAULT NULL,
  `montTOTAL` float DEFAULT NULL,
  `fournisseurid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `achat`
--

INSERT INTO `achat` (`numfacture`, `datefacture`, `montTOTAL`, `fournisseurid`) VALUES
(1, '2024-11-28', 12.05, 2),
(2, '2024-11-29', 45.99, 3),
(3, '2024-11-27', 23.99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `socisiren` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `socisiren`) VALUES
(1, 2),
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `personneid` int(11) DEFAULT NULL,
  `socisiren` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `personneid`, `socisiren`) VALUES
(1, 2, 1),
(2, 3, 1),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `contient_ingredient_achat`
--

CREATE TABLE `contient_ingredient_achat` (
  `achatNUMfacture` int(11) NOT NULL,
  `ingredientid` int(11) NOT NULL,
  `prixunitaire` float DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contient_ingredient_achat`
--

INSERT INTO `contient_ingredient_achat` (`achatNUMfacture`, `ingredientid`, `prixunitaire`, `quantite`) VALUES
(1, 3, 45.99, 8),
(2, 1, 12.05, 4),
(3, 2, 23.99, 9);

-- --------------------------------------------------------

--
-- Table structure for table `contient_vente_sousproduit`
--

CREATE TABLE `contient_vente_sousproduit` (
  `venteNUMfacture` int(11) NOT NULL,
  `sousproduitid` int(11) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prixunitaire` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contient_vente_sousproduit`
--

INSERT INTO `contient_vente_sousproduit` (`venteNUMfacture`, `sousproduitid`, `quantite`, `prixunitaire`) VALUES
(1, 2, 4, 12.05),
(2, 3, 10, 45.99),
(3, 1, 23, 23.99);

-- --------------------------------------------------------

--
-- Table structure for table `employe`
--

CREATE TABLE `employe` (
  `dat_emb` date DEFAULT NULL,
  `salaire` float DEFAULT NULL,
  `id` int(11) NOT NULL,
  `qualite` varchar(10) DEFAULT NULL,
  `sousserviceid` int(11) DEFAULT NULL,
  `personneid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employe`
--

INSERT INTO `employe` (`dat_emb`, `salaire`, `id`, `qualite`, `sousserviceid`, `personneid`) VALUES
('2017-05-01', 6000, 2, 'technicien', 1, 2),
('2018-02-13', 5000, 3, 'secretaire', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id` int(11) NOT NULL,
  `socisiren` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fournisseur`
--

INSERT INTO `fournisseur` (`id`, `socisiren`) VALUES
(3, 1),
(1, 2),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient`
--

CREATE TABLE `ingredient` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient`
--

INSERT INTO `ingredient` (`id`, `nom`) VALUES
(1, 'Lait'),
(2, 'Fromage'),
(3, 'fraise');

-- --------------------------------------------------------

--
-- Table structure for table `necessite_ingredient_produit`
--

CREATE TABLE `necessite_ingredient_produit` (
  `ingredientid` int(11) NOT NULL,
  `produitid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `necessite_ingredient_produit`
--

INSERT INTO `necessite_ingredient_produit` (`ingredientid`, `produitid`) VALUES
(1, 2),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `necessite_ingredient_sousproduit`
--

CREATE TABLE `necessite_ingredient_sousproduit` (
  `ingredientid` int(11) NOT NULL,
  `sousproduitid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `necessite_ingredient_sousproduit`
--

INSERT INTO `necessite_ingredient_sousproduit` (`ingredientid`, `sousproduitid`) VALUES
(1, 2),
(2, 3),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `personne`
--

CREATE TABLE `personne` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `prenom` varchar(10) DEFAULT NULL,
  `datanaiss` date DEFAULT NULL,
  `natio` varchar(10) DEFAULT NULL,
  `adr` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `personne`
--

INSERT INTO `personne` (`id`, `nom`, `prenom`, `datanaiss`, `natio`, `adr`) VALUES
(1, 'Taleb', 'Ahmed', '1976-06-11', 'maroccain', '170fes'),
(2, 'Taleb', 'Salma', '1967-05-09', 'maroccain', '13oujda'),
(3, 'Moutaouaki', 'Aya', '2005-05-31', 'maroccain', '67tanger');

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `nom`) VALUES
(1, 'lait au fr'),
(2, 'beurre'),
(3, 'babeurre');

-- --------------------------------------------------------

--
-- Table structure for table `propose_ingredient_fournisseur`
--

CREATE TABLE `propose_ingredient_fournisseur` (
  `fournisseurid` int(11) NOT NULL,
  `ingredientid` int(11) NOT NULL,
  `prixunitaire` float DEFAULT NULL,
  `variete` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `propose_ingredient_fournisseur`
--

INSERT INTO `propose_ingredient_fournisseur` (`fournisseurid`, `ingredientid`, `prixunitaire`, `variete`) VALUES
(1, 1, 12.9, '5'),
(2, 3, 56.78, '3'),
(3, 2, 45.66, '4');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `secteur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `nom`, `secteur`) VALUES
(1, 'Fabricatio', 1),
(2, 'Administra', 2),
(3, 'Admin', 2);

-- --------------------------------------------------------

--
-- Table structure for table `societe`
--

CREATE TABLE `societe` (
  `siren` int(11) NOT NULL,
  `tel` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
  `adr` varchar(10) DEFAULT NULL,
  `nom` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `societe`
--

INSERT INTO `societe` (`siren`, `tel`, `fax`, `adr`, `nom`) VALUES
(1, 688449922, 589843767, '45fes', 'jawda'),
(2, 655672901, 584378668, '65tanger', 'centrale'),
(3, 674370695, 584376659, '89oujda', 'moufid');

-- --------------------------------------------------------

--
-- Table structure for table `sousproduit`
--

CREATE TABLE `sousproduit` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `produitid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sousproduit`
--

INSERT INTO `sousproduit` (`id`, `nom`, `produitid`) VALUES
(1, 'dunup', 3),
(2, 'cartonlait', 1),
(3, 'yogurt', 3);

-- --------------------------------------------------------

--
-- Table structure for table `sousservice`
--

CREATE TABLE `sousservice` (
  `id` int(11) NOT NULL,
  `nom` varchar(10) DEFAULT NULL,
  `numbur` int(11) NOT NULL,
  `serviceid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sousservice`
--

INSERT INTO `sousservice` (`id`, `nom`, `numbur`, `serviceid`) VALUES
(1, 'Fab Fromag', 1, 1),
(2, 'Fab Lait', 2, 1),
(3, 'R-H', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `vente`
--

CREATE TABLE `vente` (
  `numfacture` int(11) NOT NULL,
  `datefacture` date DEFAULT NULL,
  `montTOTAL` float DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vente`
--

INSERT INTO `vente` (`numfacture`, `datefacture`, `montTOTAL`, `clientid`) VALUES
(1, '2024-11-28', 12.05, 3),
(2, '2024-11-29', 45.99, 2),
(3, '2024-11-29', 23.99, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achat`
--
ALTER TABLE `achat`
  ADD PRIMARY KEY (`numfacture`),
  ADD KEY `fournisseurid` (`fournisseurid`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socisiren` (`socisiren`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`),
  ADD KEY `personneid` (`personneid`),
  ADD KEY `socisiren` (`socisiren`);

--
-- Indexes for table `contient_ingredient_achat`
--
ALTER TABLE `contient_ingredient_achat`
  ADD PRIMARY KEY (`achatNUMfacture`,`ingredientid`),
  ADD KEY `ingredientid` (`ingredientid`);

--
-- Indexes for table `contient_vente_sousproduit`
--
ALTER TABLE `contient_vente_sousproduit`
  ADD PRIMARY KEY (`venteNUMfacture`,`sousproduitid`),
  ADD KEY `sousproduitid` (`sousproduitid`);

--
-- Indexes for table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sousserviceid` (`sousserviceid`),
  ADD KEY `personneid` (`personneid`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socisiren` (`socisiren`);

--
-- Indexes for table `ingredient`
--
ALTER TABLE `ingredient`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `necessite_ingredient_produit`
--
ALTER TABLE `necessite_ingredient_produit`
  ADD PRIMARY KEY (`ingredientid`,`produitid`),
  ADD KEY `produitid` (`produitid`);

--
-- Indexes for table `necessite_ingredient_sousproduit`
--
ALTER TABLE `necessite_ingredient_sousproduit`
  ADD PRIMARY KEY (`ingredientid`,`sousproduitid`),
  ADD KEY `sousproduitid` (`sousproduitid`);

--
-- Indexes for table `personne`
--
ALTER TABLE `personne`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `propose_ingredient_fournisseur`
--
ALTER TABLE `propose_ingredient_fournisseur`
  ADD PRIMARY KEY (`fournisseurid`,`ingredientid`),
  ADD KEY `ingredientid` (`ingredientid`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `societe`
--
ALTER TABLE `societe`
  ADD PRIMARY KEY (`siren`);

--
-- Indexes for table `sousproduit`
--
ALTER TABLE `sousproduit`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produitid` (`produitid`);

--
-- Indexes for table `sousservice`
--
ALTER TABLE `sousservice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `serviceid` (`serviceid`);

--
-- Indexes for table `vente`
--
ALTER TABLE `vente`
  ADD PRIMARY KEY (`numfacture`),
  ADD KEY `clientid` (`clientid`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achat`
--
ALTER TABLE `achat`
  ADD CONSTRAINT `achat_ibfk_1` FOREIGN KEY (`fournisseurid`) REFERENCES `fournisseur` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`socisiren`) REFERENCES `societe` (`siren`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `contact_ibfk_1` FOREIGN KEY (`personneid`) REFERENCES `personne` (`id`),
  ADD CONSTRAINT `contact_ibfk_2` FOREIGN KEY (`socisiren`) REFERENCES `societe` (`siren`);

--
-- Constraints for table `contient_ingredient_achat`
--
ALTER TABLE `contient_ingredient_achat`
  ADD CONSTRAINT `contient_ingredient_achat_ibfk_1` FOREIGN KEY (`achatNUMfacture`) REFERENCES `achat` (`numfacture`),
  ADD CONSTRAINT `contient_ingredient_achat_ibfk_2` FOREIGN KEY (`ingredientid`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `contient_vente_sousproduit`
--
ALTER TABLE `contient_vente_sousproduit`
  ADD CONSTRAINT `contient_vente_sousproduit_ibfk_1` FOREIGN KEY (`venteNUMfacture`) REFERENCES `vente` (`numfacture`),
  ADD CONSTRAINT `contient_vente_sousproduit_ibfk_2` FOREIGN KEY (`sousproduitid`) REFERENCES `sousproduit` (`id`);

--
-- Constraints for table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`sousserviceid`) REFERENCES `sousservice` (`id`),
  ADD CONSTRAINT `employe_ibfk_2` FOREIGN KEY (`personneid`) REFERENCES `personne` (`id`);

--
-- Constraints for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD CONSTRAINT `fournisseur_ibfk_1` FOREIGN KEY (`socisiren`) REFERENCES `societe` (`siren`);

--
-- Constraints for table `necessite_ingredient_produit`
--
ALTER TABLE `necessite_ingredient_produit`
  ADD CONSTRAINT `necessite_ingredient_produit_ibfk_1` FOREIGN KEY (`ingredientid`) REFERENCES `ingredient` (`id`),
  ADD CONSTRAINT `necessite_ingredient_produit_ibfk_2` FOREIGN KEY (`produitid`) REFERENCES `produit` (`id`);

--
-- Constraints for table `necessite_ingredient_sousproduit`
--
ALTER TABLE `necessite_ingredient_sousproduit`
  ADD CONSTRAINT `necessite_ingredient_sousproduit_ibfk_1` FOREIGN KEY (`ingredientid`) REFERENCES `ingredient` (`id`),
  ADD CONSTRAINT `necessite_ingredient_sousproduit_ibfk_2` FOREIGN KEY (`sousproduitid`) REFERENCES `sousproduit` (`id`);

--
-- Constraints for table `propose_ingredient_fournisseur`
--
ALTER TABLE `propose_ingredient_fournisseur`
  ADD CONSTRAINT `propose_ingredient_fournisseur_ibfk_1` FOREIGN KEY (`fournisseurid`) REFERENCES `fournisseur` (`id`),
  ADD CONSTRAINT `propose_ingredient_fournisseur_ibfk_2` FOREIGN KEY (`ingredientid`) REFERENCES `ingredient` (`id`);

--
-- Constraints for table `sousproduit`
--
ALTER TABLE `sousproduit`
  ADD CONSTRAINT `sousproduit_ibfk_1` FOREIGN KEY (`produitid`) REFERENCES `produit` (`id`);

--
-- Constraints for table `sousservice`
--
ALTER TABLE `sousservice`
  ADD CONSTRAINT `sousservice_ibfk_1` FOREIGN KEY (`serviceid`) REFERENCES `service` (`id`);

--
-- Constraints for table `vente`
--
ALTER TABLE `vente`
  ADD CONSTRAINT `vente_ibfk_1` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
