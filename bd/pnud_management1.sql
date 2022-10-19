-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 16 juin 2022 à 15:22
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `pnud_management`
--

-- --------------------------------------------------------

--
-- Structure de la table `basics`
--

CREATE TABLE `basics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `apropos` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `travail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `don` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `structure` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `basics`
--

INSERT INTO `basics` (`id`, `apropos`, `travail`, `don`, `structure`, `created_at`, `updated_at`) VALUES
(1, 'nos à-propos', 'travail', 'nous faire un don', 'notre structure de gestion', '2022-01-29 19:14:06', '2022-05-31 21:18:09'),
(3, NULL, NULL, NULL, NULL, '2022-05-31 21:18:00', '2022-05-31 21:18:00');

-- --------------------------------------------------------

--
-- Structure de la table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blogs`
--

INSERT INTO `blogs` (`id`, `titre`, `description`, `photo`, `etat`, `created_at`, `updated_at`) VALUES
(1, 'titre1', 'cool', '1643630291.png', 1, '2022-01-31 10:58:11', '2022-02-01 14:09:02'),
(2, 'titre 2', 'description 2', '1643630316.jpg', 1, '2022-01-31 10:58:36', '2022-02-01 14:14:56'),
(3, 'titre 3', '&lt;p&gt;ok&lt;/p&gt;', 'vuetify.png', 0, '2022-01-31 10:58:45', '2022-02-01 14:15:05'),
(6, 'Jean-Marc Kabund promet de « brûler » la case UDPS !', '&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;Jean-Marc Kabund refuse de mourir le ventre et le cœur pleins. Définitivement exclu du parti le samedi 29 janvier, l\'ancien président ad intérim de l’Union pour la démocratie et le progrès social (UDPS), principal parti au pouvoir au sommet de l’Etat en RD Congo, promet d’éventer le boa dans les jours à venir. L’annonce a été faite hier lundi 31 janvier à la presse, par l’un de ses proches qui a requis l’anonymat.&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;Que dira le 1er vice-président de l’Assemblée nationale, descendu de son piédestal le week-end dernier ? La question est sur toutes les lèvres. Bien devin, qui pourrait lire comme sur une boule de cristal, la pensée de Jean-Marc Kabund. Normal, quand on sait qu’il est resté très calme, depuis l’annonce du verdict de la Convention démocratique du parti (CDP), organe attitré de l’UDPS chargé de statuer sur tout dossier d’indiscipline des cadres du parti.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;img src=&amp;quot;https://i0.wp.com/cretroactuel.com/wp-content/uploads/2022/01/JM-Kabund-demissionne.jpg?fit=1024%2C834&amp;amp;amp;ssl=1&amp;quot; alt=&amp;quot;&amp;quot;&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;Toutefois, de nombreux observateurs, considérant tout ce que Jean-Marc Kabund a été à l’UDPS (Secrétaire général et Président intérimaire), pensent que ce dernier est dépositaire de plusieurs secrets du parti cher au défunt Etienne Tshisekedi, historique opposant aux régimes des feus le maréchal Mobutu, M’Zee Laurent-Désiré Kabila et de Joseph Kabila. Du fait de son exclusion (humiliante ?), JMK conscient qu’il n’a plus rien à perdre ni à gagner sous le label UDPS, pourrait prendre la revanche de double éjection et tout mettre sur la place publique.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;Cependant, au siège national de l’UDPS à la 11ème rue Limete, cadres et combattants du parti se déclarent sereins. Tous disent n’avoir aucune crainte de ce que pourrait éventuellement déclarer Jean-Marc Kabund, considérant que ce serait une réaction normale d’un partenaire après le divorce.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;« L’UDPS est un parti des masses dont la boussole demeure l’intérêt général, soutenu par le respect des valeurs. Nous ne pouvons donc pas admettre que de personnes malintentionnées, des délinquants politiques ternissent ce grand patrimoine que nous ont légué ceux qui l’ont fondé au prix d’humiliations et autres brimades corporelles », réagit un cadre de l’UDPS.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;DES DEPUTES REVOLUTIONNAIRES USN DERRIERE KABUND ?&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;lt;strong&amp;gt;&amp;lt;img src=&amp;quot;https://oeildupeuple.com/pictures/16202052081787.jpg&amp;quot; alt=&amp;quot;&amp;quot;&amp;gt;&amp;lt;/strong&amp;gt;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;L’exclusion de Jean-Marc Kabund de l’UDPS, entraine-t-elle son départ de fait du perchoir de l’Assemblée nationale ? C’est encore une autre question de bon sens. Il s’avère cependant, que l’intéressé ne s’est pas encore clairement prononcé quant à ce. Lui qui, depuis le 14 janvier dernier, avait annoncé sa démission de la première vice-présidence de la Chambre, semble jouer à l’usure du temps. Mais pour quelle finalité?&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;Toutefois, à l’UDPS, le problème ne se pose plus. Autrement dit, JMK devrait tirer les conséquences logiques de son exclusion du parti. Le poste de 1er vice-président de l’Assemblée nationale étant réservé à l’UDPS, il revient donc au parti de se choisir son nouveau candidat qui devra occuper ce fauteuil. « Que Jean-Marc Kabund aie officiellement déposé sa lettre de démission ou pas, il ne pourrait plus prétendre reprendre son poste de 1er vice-président de la Représentation nationale lors de la prochaine session ordinaire de mars. Sa page est définitivement tournée« , soutient-on à la 11ème rue.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;&amp;amp;nbsp;&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;Entre-temps, un groupe de députés nationaux de l’Union sacrée de la nation (USN), se déclarant des révolutionnaires, annonce une importante réunion ce mardi 1er février dans la salle des spectacles du Palais du peuple, pour prendre position par rapport au dossier Kabund.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;« La situation est grave. Et, en tant qu’élus membres de l’Union sacrée, nous devons prendre position. Demain [ndlr : aujourd\'hui] nous allons donner notre position sur le dossier de l’honorable Kabund. Ce sera une communication à la hauteur de la situation », déclare sous couvert de l’anonymat au média en ligne, un député membre de ce groupe.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;Sans anticiper le contenu de la déclaration des députés révolutionnaires de l’USN, tout porte à croire que ces derniers pourraient apporter leur soutien à Jean-Marc Kabund. Mais pour quelle finalité, dès lors que les présidents des groupes parlementaires de la nouvelle majorité post coalition FCC-CACH, semblaient déjà avoir tourné le dos au 1er vice-président de leur chambre.&amp;lt;/p&amp;gt;&amp;lt;p&amp;gt;En termes d’équilibres, des analystes avisés ne voient pas en quoi ces « révolutionnaires » pourraient changer la donne dans une Assemblée nationale composée de 500 membres dont plus de la moitié, soit environ 300 députés ont adhéré à l’USN depuis sa création en décembre 2020.&amp;amp;nbsp;&amp;lt;/p&amp;gt;', '1643723065.jpeg', 1, '2022-02-01 11:57:41', '2022-02-01 12:44:25');

-- --------------------------------------------------------

--
-- Structure de la table `busness_plans`
--

CREATE TABLE `busness_plans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `busness_plan` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `busness_plans`
--

INSERT INTO `busness_plans` (`id`, `id_entreprise`, `busness_plan`, `created_at`, `updated_at`) VALUES
(1, 6, '1654172695.zip', '2022-06-02 10:24:55', '2022-06-02 10:24:55');

-- --------------------------------------------------------

--
-- Structure de la table `entreprises`
--

CREATE TABLE `entreprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ceo` int(11) NOT NULL,
  `nomEntreprise` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionEntreprise` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailEntreprise` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adresseEntreprise` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephoneEntreprise` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `solutionEntreprise` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rccm` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `etat` int(11) NOT NULL DEFAULT 0,
  `idsecteur` int(11) NOT NULL,
  `idforme` int(11) NOT NULL,
  `idPays` int(11) NOT NULL,
  `idProvince` int(11) NOT NULL,
  `edition` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `facebook` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `linkedin` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `twitter` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `siteweb` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invPersonnel` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invHub` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invRecherche` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `chiffreAffaire` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbremploye` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `ceo`, `nomEntreprise`, `descriptionEntreprise`, `emailEntreprise`, `adresseEntreprise`, `telephoneEntreprise`, `solutionEntreprise`, `rccm`, `etat`, `idsecteur`, `idforme`, `idPays`, `idProvince`, `edition`, `facebook`, `linkedin`, `twitter`, `siteweb`, `invPersonnel`, `invHub`, `invRecherche`, `chiffreAffaire`, `nbremploye`, `logo`, `slug`, `created_at`, `updated_at`) VALUES
(1, 1, 'kaka security', '​\nChiffre d\'affaire annuel généré par l\'entreprise\n1000\nDescription de l\'entreprise', 'kakasecurity@gmail.com', 'kakasecurity@gmail.com', '+243817883541', 'la solution', 'CD/12/35-234/GOMA', 0, 1, 1, 1, 1, '2021', 'https://fonts.google.com/icons?icon.query=attach+money', 'https://web.whatsapp.com/', 'https://web.whatsapp.com/', 'https://fonts.google.com/icons?icon.query=attach+money', '10', '200', '800', '1000', '1-5', 'logo.png', 'kaka-security-celw7j0y', '2022-06-01 10:37:53', '2022-06-14 14:26:28'),
(2, 2, 'Boom topic', 'est une entreprise', 'boom@gmail.com', 'Goma ', '0825423678', 'la solution', 'cd/nr-1234/098', 1, 5, 3, 1, 1, '2022', '', '', '', '', '500', '800', '8300', '3000', '5-10', '1654088173.png', 'boom-topic-vji4ztwa', '2022-06-01 10:56:13', '2022-06-01 12:01:00'),
(3, 6, 'jojo photo', 'Créer un business Plan avec Angel est simple grâce à notre outil qui vous guide pas à pas. Créez facilement un Business Plan avec Angel. Démarrez gratuitement. C\'est simple & rapide. Essayer gratuitement. Soutien de la Communauté. Rapide. Interface innovante.', 'jojophoto@gmail.com', 'kisangani', '0817883541', 'Renforcez l\'équipe et livrez d\'excellentes expériences avec Jira Service Management™. Accélérez le développement du travail et déployez facilement les changements. Essayez. Résolvez les problèmes. Tarifs transparents. 25% de tickets en moins.', '45ghr645', 1, 4, 2, 1, 1, '2021', '', '', '', '', '300', '4500', '30000', '1000', '10-15', '1654088350.png', 'jojo-photo-9u3dqdyg', '2022-06-01 10:59:10', '2022-06-01 12:00:51'),
(4, 9, 'jonathan sarl', 'Le profil d\'entreprise est le sommaire formel d\'une entreprise et de ses activités ; une sorte de carte d\'identité, qui, en plus de fournir les caractéristiques de cette entreprise, indique aussi quelles sont sa mission, sa vision, ses valeurs, ses objectifs pour l\'avenir…', 'jonathan@gmail.com', 'goma', '09978234568', 'Madame, Monsieur, Notre société a pour secteur d\'activité (préciser le secteur) fondé depuis (préciser la date). Nous avons pour domaine d\'expertise (préciser vos principales offres : conseil financier, rénovation, restauration, …) avec une équipe de spécialistes de (nombre) personnes.21 juin 2021', 'CD-NK-6yer89/09-2022', 1, 3, 1, 1, 1, '2022', '', '', '', '', '4000', '8000', '35000', '12000', '1-5', '1654088586.png', 'jonathan-sarl-252mlcop', '2022-06-01 11:03:06', '2022-06-01 12:00:53'),
(5, 10, 'victory tech', 'Comment faire une bonne présentation personnelle ?\nPour ce faire, voici un petit canevas qui a pour objectif de vous aider à structurer votre présentation personnelle :', 'victory@gmail.com', 'goma', '+243813456781', 'La manière la plus simple pour se présenter de manière originale sans prendre trop de risque est de vous présenter de manière conventionnelle en rajoutant une information insolite et pertinente. pertinente : qui est en lien avec le contexte, la raison pour laquelle vous êtes là, ce que vous faites dans vie…19 janv. 2020', '34DU78jg7', 1, 2, 2, 1, 1, '2022', '', '', '', '', '4500', '5000', '36000', '12300', '1-5', '1654091008.png', 'victory-tech-hud06ptu', '2022-06-01 11:06:11', '2022-06-01 12:00:57'),
(6, 11, 'Dream of drc', 'Dream of drc(#dream) est une startup qui vise à promouvoir l\'intégrité de la jeunesse en appliquant la technologie afin de permettre l\'émergence de la société.', 'info@dreamofdrc.com', 'Goma', '+243970524665', 'Réduire le taux des difficultés que rencontre la société suite au manquement d\'une meilleure solution technologique appropriée à leur problématique au pourcentage le plus bas possible jamais atteint!', 'CD-N-K34YH78/03/08/21', 1, 3, 1, 1, 1, '2022', 'https://www.facebook.com/dreamofdrc', 'https://www.linkedin.com/in/dream-of-drc-startup-872765217/', 'https://twitter.com/drc_dream', 'http://dreamofdrc.com/', '500', '1000', '8000', '2670', '1-5', '1654089250.jpeg', 'dream-of-drc-ifgnhlow', '2022-06-01 11:14:10', '2022-06-14 14:25:35'),
(7, 13, 'forex', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'forex@gmail.com', 'kisangani', '0997645124', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.', 'CD-NK-123HDG4', 1, 6, 2, 1, 3, '2022', '', '', '', '', '200', '500', '2000', '1700', '5-10', '1654090128.png', 'forex-dpuuf9kj', '2022-06-01 11:28:48', '2022-06-01 12:00:33'),
(8, 14, 'daula sarl', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'daula@gmail.com', 'Goma nord kivu', '+2438167346154', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'CD97HN08', 1, 5, 2, 1, 1, '2022', '', '', '', '', '300', '500', '7600', '2300', '5-10', '1654090571.jpg', 'daula-sarl-qooem00d', '2022-06-01 11:36:11', '2022-06-01 12:00:37'),
(9, 15, 'webs lesson', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'info@webslesson.com', 'Goma', '+243817435671', 'first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'CD-NK/345OT/07/01-22', 1, 2, 2, 1, 1, '2022', '', '', '', '', '3000', '6000', '34000', '18000', '1-5', '1654090896.png', 'webs-lesson-10op78v5', '2022-06-01 11:41:36', '2022-06-01 12:13:37');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `forme_juridiques`
--

CREATE TABLE `forme_juridiques` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomForme` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `forme_juridiques`
--

INSERT INTO `forme_juridiques` (`id`, `nomForme`, `created_at`, `updated_at`) VALUES
(1, 'Etablissement', '2022-05-31 11:43:52', '2022-05-31 11:43:52'),
(2, 'SARL', '2022-05-31 11:44:19', '2022-05-31 11:44:19'),
(3, 'SASU', '2022-05-31 11:44:29', '2022-05-31 11:44:29'),
(4, 'ASBL', '2022-05-31 11:44:48', '2022-05-31 11:44:48');

-- --------------------------------------------------------

--
-- Structure de la table `galeries`
--

CREATE TABLE `galeries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `galeries`
--

INSERT INTO `galeries` (`id`, `photo`, `created_at`, `updated_at`) VALUES
(1, '1643745340.jpg', '2022-02-01 18:55:40', '2022-02-01 18:55:40'),
(2, '1643746584.jpg', '2022-02-01 18:55:59', '2022-02-01 19:16:24'),
(3, '1643745369.jpg', '2022-02-01 18:56:09', '2022-02-01 18:56:09'),
(4, '1643745387.jpg', '2022-02-01 18:56:27', '2022-02-01 18:56:27'),
(5, '1643745397.jpg', '2022-02-01 18:56:37', '2022-02-01 18:56:37'),
(6, '1643745411.jpg', '2022-02-01 18:56:51', '2022-02-01 18:56:51'),
(7, '1643745430.jpg', '2022-02-01 18:57:10', '2022-02-01 18:57:10'),
(8, '1643745442.jpg', '2022-02-01 18:57:22', '2022-02-01 18:57:22'),
(9, '1643746486.jpg', '2022-02-01 19:14:46', '2022-02-01 19:14:46'),
(10, '1643746497.jpg', '2022-02-01 19:14:57', '2022-02-01 19:14:57');

-- --------------------------------------------------------

--
-- Structure de la table `link_canvases`
--

CREATE TABLE `link_canvases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ceo` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `link_canvases`
--

INSERT INTO `link_canvases` (`id`, `ceo`, `titre`, `message`, `created_at`, `updated_at`) VALUES
(1, 6, 'Problème', 'problème 1 ok', '2022-06-08 17:17:49', '2022-06-10 13:39:32'),
(2, 6, 'Solution', 'solution 1', '2022-06-08 17:18:12', '2022-06-08 17:18:12'),
(4, 6, 'Proposition de valeur unique', 'proposition 1', '2022-06-08 17:18:36', '2022-06-08 17:18:36'),
(5, 6, 'Proposition de valeur unique', 'proposition 3', '2022-06-08 17:18:46', '2022-06-08 17:18:46'),
(6, 6, 'Proposition de valeur unique', 'proposition 4', '2022-06-08 17:18:55', '2022-06-08 17:18:55'),
(7, 6, 'Avantage déloyale', 'avantage 1', '2022-06-08 17:19:08', '2022-06-08 17:19:08'),
(8, 6, 'Avantage déloyale', '2', '2022-06-08 17:19:20', '2022-06-08 17:19:20'),
(9, 6, 'Segment de client', 'Segment 1', '2022-06-08 17:19:34', '2022-06-08 17:19:34'),
(10, 6, 'Segment de client', 'Segment 2', '2022-06-08 17:19:46', '2022-06-08 17:19:46'),
(11, 6, 'Indicateur', 'Indicateur 1', '2022-06-08 17:20:00', '2022-06-08 17:20:00'),
(12, 6, 'Indicateur', 'Indicateur 2', '2022-06-08 17:20:09', '2022-06-08 17:20:09'),
(13, 6, 'Canaux', 'Canaux 1', '2022-06-08 17:20:20', '2022-06-08 17:20:20'),
(14, 6, 'Structure des coûts', 'Structure 1', '2022-06-08 17:20:34', '2022-06-08 17:20:34'),
(15, 6, 'Sources revenus', 'Source de revenus 1', '2022-06-08 17:20:52', '2022-06-08 17:20:52'),
(16, 6, 'Sources revenus', 'Source de revenus 2', '2022-06-08 17:21:04', '2022-06-08 17:21:04'),
(17, 6, 'Sources revenus', 'Source de revenus 2', '2022-06-08 17:21:15', '2022-06-08 17:21:15'),
(18, 6, 'Canaux', 'Canaux 2', '2022-06-08 17:21:31', '2022-06-08 17:21:31'),
(19, 9, 'Proposition de valeur unique', 'cool', '2022-06-08 17:57:06', '2022-06-08 17:57:06'),
(20, 6, 'Solution', 'solution ok', '2022-06-09 06:36:46', '2022-06-09 06:36:46'),
(21, 6, 'Avantage déloyale', 'coucou', '2022-06-10 12:05:22', '2022-06-10 12:05:22');

-- --------------------------------------------------------

--
-- Structure de la table `link_canvas_deuxes`
--

CREATE TABLE `link_canvas_deuxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_coach` int(11) NOT NULL,
  `ceo` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `link_canvas_deuxes`
--

INSERT INTO `link_canvas_deuxes` (`id`, `id_coach`, `ceo`, `titre`, `message`, `created_at`, `updated_at`) VALUES
(2, 4, 6, 'Problème', 'probleme correction 2', '2022-06-11 05:18:48', '2022-06-14 14:19:44'),
(3, 4, 6, 'Solution', 'solution correction 1', '2022-06-11 05:19:15', '2022-06-11 05:19:15'),
(4, 4, 6, 'Solution', 'solution correction 2', '2022-06-11 05:19:31', '2022-06-11 05:19:31'),
(5, 4, 6, 'Proposition de valeur unique', 'proposition correction 1', '2022-06-11 05:19:49', '2022-06-11 05:19:49'),
(6, 4, 6, 'Proposition de valeur unique', 'proposition correction 2', '2022-06-11 05:20:04', '2022-06-11 05:20:04'),
(7, 4, 6, 'Avantage déloyale', 'avantage correction 1', '2022-06-11 05:20:20', '2022-06-11 05:20:20'),
(8, 4, 6, 'Segment de client', 'segment correction 1', '2022-06-11 05:20:33', '2022-06-11 05:20:33'),
(9, 4, 6, 'Segment de client', 'segment correction 2', '2022-06-11 05:20:42', '2022-06-11 05:20:42'),
(10, 4, 6, 'Indicateur', 'indicateur correction 1', '2022-06-11 05:20:56', '2022-06-11 05:20:56'),
(11, 4, 6, 'Canaux', 'canaux de distribution correction 1', '2022-06-11 05:21:18', '2022-06-11 05:21:18'),
(12, 4, 6, 'Canaux', 'canaux de distribution correction 2', '2022-06-11 05:21:30', '2022-06-11 05:21:30'),
(13, 4, 6, 'Structure des coûts', 'structure de cout correction 1', '2022-06-11 05:21:48', '2022-06-11 05:21:48'),
(14, 4, 6, 'Structure des coûts', 'structure de cout correction 400$', '2022-06-11 05:22:48', '2022-06-11 05:22:48'),
(16, 4, 6, 'Sources revenus', 'source de revenu  correction 2', '2022-06-11 05:23:23', '2022-06-11 05:23:23'),
(18, 4, 6, 'Problème', 'ok', '2022-06-11 07:20:49', '2022-06-11 07:20:49');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_01_14_120826_create_roles_table', 2),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(7, '2014_10_12_000000_create_users_table', 4),
(8, '2022_01_29_121045_create_sites_table', 5),
(9, '2022_01_29_150923_create_basics_table', 6),
(10, '2022_01_29_202952_create_services_table', 7),
(11, '2022_01_31_083252_create_blogs_table', 8),
(12, '2022_02_01_141050_create_partenaires_table', 9),
(13, '2022_02_01_170959_create_galeries_table', 10),
(14, '2022_02_01_204506_create_videos_table', 11),
(15, '2022_05_31_105154_create_pays_table', 12),
(16, '2022_05_31_113453_create_provinces_table', 13),
(17, '2022_05_31_115613_create_secteurs_table', 14),
(18, '2022_05_31_123221_create_forme_juridiques_table', 15),
(19, '2022_05_31_210441_create_entreprises_table', 16),
(20, '2022_06_02_091439_create_pitches_table', 17),
(21, '2022_06_02_114822_create_busness_plans_table', 18),
(22, '2022_06_04_060844_create_link_canvases_table', 19),
(23, '2022_06_04_061458_create_swots_table', 19),
(24, '2022_06_04_095039_create_photo_entreprises_table', 20),
(25, '2022_06_04_105425_create_video_entreprises_table', 21),
(26, '2022_06_11_062250_create_link_canvas_deuxes_table', 22),
(27, '2022_06_11_062454_create_swot_deuxes_table', 22),
(28, '2022_06_16_095405_create_mot_semaines_table', 23);

-- --------------------------------------------------------

--
-- Structure de la table `mot_semaines`
--

CREATE TABLE `mot_semaines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `mot_semaines`
--

INSERT INTO `mot_semaines` (`id`, `message`, `created_at`, `updated_at`) VALUES
(1, 'Jeune développeur, développer pour ton avenir et celui de ton pays!', '2022-06-16 08:41:05', '2022-06-16 08:41:28'),
(2, 'Jeune entrepreneur, entreprends pour ton avenir et celui de ton pays!', '2022-06-16 08:41:42', '2022-06-16 08:42:48');

-- --------------------------------------------------------

--
-- Structure de la table `partenaires`
--

CREATE TABLE `partenaires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `partenaires`
--

INSERT INTO `partenaires` (`id`, `nom`, `url`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Dream of drc', 'https://www.dreamofdrc.com', '1643733803.jpeg', '2022-02-01 14:35:09', '2022-02-01 15:43:23'),
(2, 'hub ujn', 'https://www.hub-ujn.com', '1643733734.jpg', '2022-02-01 15:42:14', '2022-02-01 15:42:14'),
(3, 'Casalind-news', 'https://www.casalind-news.com', '1643733968.png', '2022-02-01 15:46:08', '2022-02-01 15:46:08'),
(4, 'Casalind sarl', 'https://www.casalind.com', '1643734018.png', '2022-02-01 15:46:58', '2022-02-01 15:46:58'),
(5, 'Casalind wallet', 'https://www.casalind-wallet.com', '1643734067.png', '2022-02-01 15:47:47', '2022-02-01 15:49:46');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '6VlxJrIolFDFtQuNdjHC33BdDCuf14oM1DB6IPGr3Tu3w6kzqULofYD3EKBG', '2022-01-27 10:46:27');

-- --------------------------------------------------------

--
-- Structure de la table `pays`
--

CREATE TABLE `pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomPays` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pays`
--

INSERT INTO `pays` (`id`, `nomPays`, `created_at`, `updated_at`) VALUES
(1, 'RDCongo', '2022-05-31 09:29:28', '2022-06-13 17:01:44'),
(2, 'Cameroun', '2022-05-31 09:29:51', '2022-05-31 09:29:51');

-- --------------------------------------------------------

--
-- Structure de la table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `photo_entreprises`
--

CREATE TABLE `photo_entreprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `photo_entreprises`
--

INSERT INTO `photo_entreprises` (`id`, `id_entreprise`, `photo`, `created_at`, `updated_at`) VALUES
(1, 6, '1654338319.JPG', '2022-06-04 08:25:19', '2022-06-04 08:25:19'),
(2, 6, '1654338330.JPG', '2022-06-04 08:25:30', '2022-06-04 08:25:30'),
(3, 6, '1654338342.JPG', '2022-06-04 08:25:42', '2022-06-04 08:25:42'),
(4, 6, '1654338355.jpg', '2022-06-04 08:25:55', '2022-06-04 08:25:55'),
(5, 6, '1654338363.jpg', '2022-06-04 08:26:03', '2022-06-04 08:26:03'),
(6, 6, '1654338371.jpg', '2022-06-04 08:26:11', '2022-06-04 08:26:11'),
(7, 6, '1654338380.jpg', '2022-06-04 08:26:20', '2022-06-04 08:26:20'),
(8, 6, '1654338388.jpg', '2022-06-04 08:26:28', '2022-06-04 08:26:28'),
(9, 6, '1654338405.jpg', '2022-06-04 08:26:45', '2022-06-04 08:26:45'),
(10, 6, '1654338414.jpg', '2022-06-04 08:26:54', '2022-06-04 08:26:54'),
(11, 6, '1654338419.png', '2022-06-04 08:26:59', '2022-06-04 08:26:59');

-- --------------------------------------------------------

--
-- Structure de la table `pitches`
--

CREATE TABLE `pitches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_entreprise` int(11) NOT NULL,
  `pitch` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pitches`
--

INSERT INTO `pitches` (`id`, `id_entreprise`, `pitch`, `created_at`, `updated_at`) VALUES
(1, 6, '1654170157.pptx', '2022-06-02 09:42:37', '2022-06-02 09:42:37');

-- --------------------------------------------------------

--
-- Structure de la table `provinces`
--

CREATE TABLE `provinces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idPays` int(11) NOT NULL,
  `nomProvince` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `provinces`
--

INSERT INTO `provinces` (`id`, `idPays`, `nomProvince`, `created_at`, `updated_at`) VALUES
(1, 1, 'Nord-Kivu', '2022-05-31 09:49:58', '2022-05-31 09:49:58'),
(2, 1, 'Kinshasa', '2022-05-31 09:50:12', '2022-05-31 09:50:12'),
(3, 1, 'Tshopo', '2022-05-31 09:50:57', '2022-05-31 09:51:42'),
(4, 2, 'Douala', '2022-05-31 09:51:17', '2022-05-31 09:51:25');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `nom`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL),
(2, 'user', NULL, NULL),
(3, 'member', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `secteurs`
--

CREATE TABLE `secteurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomSecteur` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `secteurs`
--

INSERT INTO `secteurs` (`id`, `nomSecteur`, `created_at`, `updated_at`) VALUES
(1, 'Mine', '2022-05-31 10:22:06', '2022-05-31 10:24:03'),
(2, 'Numérique', '2022-05-31 10:22:17', '2022-05-31 10:22:17'),
(3, 'Heath tech', '2022-05-31 10:22:29', '2022-05-31 10:22:29'),
(4, 'Fin tech', '2022-05-31 10:22:50', '2022-05-31 10:26:28'),
(5, 'Agro transformation', '2022-05-31 10:23:12', '2022-05-31 10:23:12'),
(6, 'Elevage', '2022-05-31 10:23:31', '2022-05-31 10:29:09');

-- --------------------------------------------------------

--
-- Structure de la table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `services`
--

INSERT INTO `services` (`id`, `titre`, `description`, `icone`, `created_at`, `updated_at`) VALUES
(1, 'service 1', 'description service 1', 'home', '2022-01-31 07:55:31', '2022-01-31 08:05:22'),
(2, 'service 2', 'description service 2', 'extension', '2022-01-31 07:58:29', '2022-01-31 07:58:29'),
(3, 'service 3', 'description service 3', 'design_services', '2022-01-31 07:58:58', '2022-01-31 08:00:41'),
(4, 'service 4', 'description service 4', 'home_repair_service', '2022-01-31 08:01:13', '2022-01-31 08:01:13');

-- --------------------------------------------------------

--
-- Structure de la table `sites`
--

CREATE TABLE `sites` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel1` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel2` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tel3` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mission` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectif` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `politique` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `condition` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `sites`
--

INSERT INTO `sites` (`id`, `nom`, `description`, `email`, `adresse`, `tel1`, `tel2`, `tel3`, `token`, `about`, `mission`, `objectif`, `politique`, `condition`, `logo`, `facebook`, `linkedin`, `twitter`, `youtube`, `created_at`, `updated_at`) VALUES
(2, 'yebassurance', 'Yebassurance est une plateforme web de paiement des assurances en ligne', 'info@yebassurance.com', 'Goma, quartier des volcans', '+243817883541', '+243970524665', '+243854543870', 'XYH34d258jhgd0Tdn', NULL, 'la mission est', 'l\'objectif est', 'la politique', 'notre condition', 'site.jpg', 'https://web.facebook.com/Dream-of-drc-114107447382924', 'https://www.linkedin.com/in/dream-of-drc-startup-872765217/', 'https://twitter.com/drc_dream', 'https://youtube.com/', '2022-01-29 13:53:28', '2022-02-02 18:42:48');

-- --------------------------------------------------------

--
-- Structure de la table `swots`
--

CREATE TABLE `swots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ceo` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `swots`
--

INSERT INTO `swots` (`id`, `ceo`, `titre`, `message`, `created_at`, `updated_at`) VALUES
(1, 6, 'Forces', 'force 1', '2022-06-11 13:31:11', '2022-06-11 13:31:11'),
(2, 6, 'Forces', 'force 2', '2022-06-11 13:31:24', '2022-06-11 13:31:24'),
(3, 6, 'Faiblesses', 'Faiblesse 1', '2022-06-11 13:31:43', '2022-06-11 13:31:43'),
(4, 6, 'Faiblesses', 'Faiblesse 2', '2022-06-11 13:31:53', '2022-06-11 13:31:53'),
(5, 6, 'Faiblesses', 'Faiblesse 3', '2022-06-11 13:32:03', '2022-06-11 13:32:03'),
(6, 6, 'Opportunités', 'Opportunité 1', '2022-06-11 13:32:30', '2022-06-11 13:32:30'),
(7, 6, 'Opportunités', 'Opportunité 2', '2022-06-11 13:32:41', '2022-06-11 13:32:41'),
(8, 6, 'Opportunités', 'Opportunité 3', '2022-06-11 13:32:51', '2022-06-11 13:32:51'),
(9, 6, 'Menaces', 'Menace 1', '2022-06-11 13:33:15', '2022-06-11 13:33:15'),
(10, 6, 'Menaces', 'Menace 2', '2022-06-11 13:33:25', '2022-06-11 13:33:25'),
(11, 6, 'Menaces', 'Menace 3', '2022-06-11 13:33:35', '2022-06-11 13:33:35'),
(12, 6, 'Menaces', 'Menace 4', '2022-06-11 13:33:45', '2022-06-11 13:33:45');

-- --------------------------------------------------------

--
-- Structure de la table `swot_deuxes`
--

CREATE TABLE `swot_deuxes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_coach` int(11) NOT NULL,
  `ceo` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `swot_deuxes`
--

INSERT INTO `swot_deuxes` (`id`, `id_coach`, `ceo`, `titre`, `message`, `created_at`, `updated_at`) VALUES
(1, 4, 6, 'Forces', 'SWOT analysis (or SWOT matrix) is a strategic planning technique used to help a person or organization identify strengths, weaknesses, opportunities, ...', '2022-06-11 15:54:12', '2022-06-11 17:13:20'),
(4, 4, 6, 'Opportunités', 'correction opportunité', '2022-06-11 15:55:00', '2022-06-11 15:55:00'),
(10, 4, 6, 'Menaces', 'correction menace', '2022-06-11 15:56:16', '2022-06-11 17:12:11'),
(11, 4, 6, 'Faiblesses', 'Faiblesse 13434334', '2022-06-11 17:11:41', '2022-06-11 17:11:55'),
(12, 4, 6, 'Faiblesses', 'swot · GitHub Topicshttps://github.com › topics › swot\nTraduire cette page\nSWOT analysis (or SWOT matrix) is a strategic planning technique used to help a person or organization identify strengths, weaknesses, opportunities, and ...', '2022-06-11 17:39:16', '2022-06-11 17:39:16'),
(13, 4, 6, 'Faiblesses', 'Conducting a SWOT Analysis. Based on the situation analysis, organizations analyze their strengths, weaknesses, opportunities, and threats, or conduct what\'s ...', '2022-06-11 17:40:01', '2022-06-11 17:40:01'),
(14, 4, 6, 'Forces', 'Comprehend the relationships among business, corporate, and international strategy. Know the inputs into a SWOT analysis.', '2022-06-11 17:51:06', '2022-06-11 17:51:06'),
(15, 4, 6, 'Opportunités', 'fullstack web developer. hardworking student developer at isig goma', '2022-06-11 17:51:38', '2022-06-11 17:51:38'),
(16, 4, 6, 'Menaces', 'First, GitHub has more than eight hundred permanent employees. GitHub developers are generally tasked with the development and maintenance of certain projects ...', '2022-06-11 17:52:19', '2022-06-11 17:52:19');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexe` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_role` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `telephone`, `adresse`, `avatar`, `sexe`, `id_role`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'user one', 'user@gmail.com', NULL, '$2y$10$a5FWP6l2FpvD8g2QcL0XAOYGOm05RCW5BcLpaSZ9RJtufRce3nlze', '+243817883541', 'Goma quartier himbi', '1643296973.webp', 'F', 2, 'L3hdX3x8ilosvze2xB8jEEve9qvZyzsXd1unoq9FWVZ1IeDW1121ZrMCLwQc', NULL, '2022-02-03 06:37:59'),
(2, 'user2', 'user2@gmail.com', NULL, '$2y$10$wn9c0j9xzMVMhpYZLAL8Cu0b9eZN3QebdSMOIjE4DNngwJxy/owI.', NULL, NULL, '1643296833.jpg', 'M', 2, '$2y$10$Tug/E8koDG.xEw3M.DluA.3hfS1ugnEH6WzbXxHVDbBk.JDdT/0Ha', NULL, '2022-01-27 14:20:33'),
(3, 'member', 'member@gmail.com', NULL, '$2y$10$2sZHAUEDtc79UiH/6PMBe.Mf7W4h2x.hG9vfUZ3HQiVZbFP//TEFK', NULL, NULL, '1643296874.jpg', 'M', 3, 'AyA03IV0Av96EkuC437EyFMYrmITr243Vm9aR6aVLdj4Zq0lyit0bM26wApb', NULL, '2022-01-27 14:21:14'),
(4, 'administrateur pnud', 'admin@gmail.com', NULL, '$2y$10$/lqHcFc3tPGhdnxp/MMJU.lt6NKY1KZDE0JIudWsFDrLYGNB0gdm6', '+243817883541', 'Goma, Katoyi', '1643812713.jpg', 'M', 1, 'KHtIWkehPSsoR8YZaKl4aFxIVyRnQcKnFBr5CuOdMSxjjvBCnWzqDqttKXGI', NULL, '2022-06-16 11:06:56'),
(6, 'jojo', 'jojo@gmail.com', NULL, '$2y$10$aoWHyUaAEAjYsTALtxLksun/nYYQ9ylT9t5MRKvN.mQcJ48tUIJqG', '0817883541', 'goma katoyi', '1643296735.jpg', 'M', 2, '$2y$10$xZ0BLZRaYcKn7ZI5F59IeeVlxTtbaFOYiyEfNmOH1TE86D7DR/Jw.', NULL, '2022-01-27 14:18:55'),
(7, 'joel', 'joel@gmail.com', NULL, '$2y$10$IAEW8G7YBNcYPz.rIBVuz.EPkRmpCg6j8Nf2S3LcKUwSPinYAQN7y', '0970524665', 'Goma Ndosho', '1643297170.jpg', 'M', 3, 'ag6cmnntycjMnrJulnZG2MySY9iGEEhZRe5wSiMxfXwdhVB3ZF89xQAokAx9', '2022-01-27 14:14:47', '2022-01-27 14:26:32'),
(9, 'jonathan kambere', 'jonathan@gmail.com', NULL, '$2y$10$rAACs28vmfFg/sbDKOSG1.rLuhhKU/uFKbOpwcy3nSpkPIsp8w6j6', '+243817883541', 'goma himbi', '1654038836.jpg', 'M', 2, '$2y$10$b.uaphKq66QNCnp7vyVxxO3LZ9rFMSs/guRkbl0y1g2ySqOrODcsS', NULL, '2022-05-31 21:13:56'),
(10, 'Victor shukuru', 'victor@gmail.com', NULL, '$2y$10$HJfYk412uUod4fy/F.n/s.oOSVzGfxtws8pnEP/0hS9pKaVM7Mk6.', '0823456789', 'Goma', 'avatar.png', 'M', 2, '$2y$10$B61dMeAbZt0X7Ozq2c1Wve5PSemP2SRVCO10VO9fOxHocL/hrUkdm', NULL, NULL),
(11, 'Roger sumaili', 'sumailiroger681@gmail.com', NULL, '$2y$10$49XVZ3daXANHE2VrjqetJONl5P4wIb/WS5lpoHW4zuG2K7umH.tiC', '+243970524665', 'Goma', '1654038823.jpg', 'M', 2, '$2y$10$loCBQh0Ksf7iArheHlwCKeXfeThQQWWsPvyxAShvUA8RXkWc2BHvS', NULL, '2022-05-31 21:13:44'),
(12, 'Benit bahati', 'benitbahati@gmail.com', NULL, '$2y$10$UVVQBLvvqgzuOcujjeE6AOpge84Rx8WZJMixCArUB5SJ1fUdpLBpu', '+142857823567', 'Goma', '1654038789.jpg', 'M', 2, '$2y$10$DvAHs0GxDATht5k542jcte9qqE0LYntoqYyXrW3VvGN2HezjI75y.', NULL, '2022-05-31 21:13:09'),
(13, 'Pionde bin sefu', 'pionde@gmail.com', NULL, '$2y$10$nfkWVY2tDFbjg49bfE/Fnehxfrs/vGg.MBar76Gp8QEKw3i/exa1y', '+243817883541', 'Kisangani', '1654038894.jpg', 'M', 2, '$2y$10$ivR38s3LhmBwwe1JhkMjM.uFRC/uSp0k6edq.F8qOo32HdF.I79PW', NULL, '2022-05-31 21:14:54'),
(14, 'Elégance daula', 'elgadaula@gmail.com', NULL, '$2y$10$wUhtw.5bdY64Z8ysYKVq6.C0AvXei1ee45nl0iwcArjuDh9cMZk.q', '+243816234903', 'Kisangani', '1654038776.jpg', 'F', 2, '$2y$10$Pb/ItzClgKbqYTVGCcwpOe9OJRr7h2N.eWfnAvKOl9Ead1Sdbm5IO', NULL, '2022-05-31 21:12:56'),
(15, 'john smith', 'johnsmith@gmail.com', NULL, '$2y$10$7TYio3TjCaK1vfO43sdVwe1yCg.uyBTODfUkuL.6eKlEOBIRczCfW', '+243817883541', 'Beni', '1654038767.jpg', 'M', 2, '$2y$10$Ct/fL6sUQmMDW8CygIx2fuE4WsVjvjlfX2s9gyASjCgv0lG2iV3Ka', NULL, '2022-05-31 21:16:58');

-- --------------------------------------------------------

--
-- Structure de la table `videos`
--

CREATE TABLE `videos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `videos`
--

INSERT INTO `videos` (`id`, `titre`, `description`, `url`, `created_at`, `updated_at`) VALUES
(1, 'vidéo 1', 'description de la video 1', 'https://www.youtube.com/watch?v=hfVgvN_8bhY', '2022-02-02 13:09:12', '2022-02-02 13:09:12'),
(2, 'vidéo 2', 'cool', 'https://www.youtube.com/watch?v=hfVgvN_8bhY', '2022-02-02 13:10:37', '2022-02-02 13:11:21');

-- --------------------------------------------------------

--
-- Structure de la table `video_entreprises`
--

CREATE TABLE `video_entreprises` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ceo` int(11) NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `video_entreprises`
--

INSERT INTO `video_entreprises` (`id`, `ceo`, `titre`, `description`, `url`, `created_at`, `updated_at`) VALUES
(1, 6, 'MAP DEMO API WITH CODEIGNITER(PHP) MYSQL', 'C\'est une vidéo de démonstration de l\'api google map en codeigniter avec mysql. la localisation des hôpitaux de la ville de Goma', 'https://www.youtube.com/embed/XTW6z0UhaPE', '2022-06-04 09:40:32', '2022-06-04 09:40:32'),
(2, 6, 'Apprendre à utiliser l\'application de transfert des bagages dans une agence aérienne', 'c\'est une application complète de la gestion de transfert de bagages', 'https://www.youtube.com/embed/H2rHGNJKNts', '2022-06-04 09:42:20', '2022-06-04 09:42:20'),
(3, 6, 'Flutter Backend | Flutter Laravel Backend PHP | Flutter Rest API | Flutter Http Post Request', 'Here you will learn how to create flutter app with backend with Laravel and PHP. Flutter Rest API use for sign up, sign in, login, logout with post, get HTTP request based on laravel admin panel based on PHP.  This works a s web backend as well. This backend is done using PHP Laravel', 'https://www.youtube.com/embed/kTrbcb21ENU', '2022-06-04 09:44:42', '2022-06-04 09:44:42'),
(4, 6, 'Flutter API Laravel - CRUD test POSTMAN y Device Video #3/3', 'CC English subtitles\n\nCRUD API Laravel - Flutter\nwe consume the services from flutter\n\nCRUD completo desde Laravel y consumismos sus servicios REST API desde Flutter\n\nContinuamos trabajando basados en los dos vídeos anteriores', 'https://www.youtube.com/embed/mdQ7eEeNefc', '2022-06-04 09:47:37', '2022-06-11 17:15:08'),
(5, 6, 'Flutter API Laravel - JWT Authenticacion - save state login Video #1', 'Creation of the API in Laravel, we consume the services with Flutter, initially we log in that allows us to maintain its status, it means that if you re-enter the App you should not ask for the login data, we will surely continue with a CRUD.', 'https://www.youtube.com/embed/h1JAAYGvm7M', '2022-06-04 09:49:32', '2022-06-04 09:49:32'),
(6, 6, 'Buld chat application in Vuejs - Vuetify UI Design, Messenger & Chating', 'In this tutorial we\'ll learn How to design a Modern Messenger & chating   dashboard application ( web design ) using vuetify and  vuejs 2 , material design icons, Font Awsome icons.\nSidebar, Card, Aavatar, list item, expantion .', 'https://www.youtube.com/embed/S1mAt8pKjUk', '2022-06-04 09:50:30', '2022-06-14 14:21:37');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `basics`
--
ALTER TABLE `basics`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `busness_plans`
--
ALTER TABLE `busness_plans`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `entreprises`
--
ALTER TABLE `entreprises`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `forme_juridiques`
--
ALTER TABLE `forme_juridiques`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `forme_juridiques_nomforme_unique` (`nomForme`);

--
-- Index pour la table `galeries`
--
ALTER TABLE `galeries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `link_canvases`
--
ALTER TABLE `link_canvases`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `link_canvas_deuxes`
--
ALTER TABLE `link_canvas_deuxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `mot_semaines`
--
ALTER TABLE `mot_semaines`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `partenaires`
--
ALTER TABLE `partenaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pays`
--
ALTER TABLE `pays`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `photo_entreprises`
--
ALTER TABLE `photo_entreprises`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `pitches`
--
ALTER TABLE `pitches`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `secteurs`
--
ALTER TABLE `secteurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `secteurs_nomsecteur_unique` (`nomSecteur`);

--
-- Index pour la table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `swots`
--
ALTER TABLE `swots`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `swot_deuxes`
--
ALTER TABLE `swot_deuxes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `videos_titre_unique` (`titre`);

--
-- Index pour la table `video_entreprises`
--
ALTER TABLE `video_entreprises`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `video_entreprises_titre_unique` (`titre`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `basics`
--
ALTER TABLE `basics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `busness_plans`
--
ALTER TABLE `busness_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `forme_juridiques`
--
ALTER TABLE `forme_juridiques`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `galeries`
--
ALTER TABLE `galeries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `link_canvases`
--
ALTER TABLE `link_canvases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `link_canvas_deuxes`
--
ALTER TABLE `link_canvas_deuxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `mot_semaines`
--
ALTER TABLE `mot_semaines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `partenaires`
--
ALTER TABLE `partenaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `pays`
--
ALTER TABLE `pays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `photo_entreprises`
--
ALTER TABLE `photo_entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `pitches`
--
ALTER TABLE `pitches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `secteurs`
--
ALTER TABLE `secteurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `swots`
--
ALTER TABLE `swots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `swot_deuxes`
--
ALTER TABLE `swot_deuxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `video_entreprises`
--
ALTER TABLE `video_entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
