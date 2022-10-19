-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 03 fév. 2022 à 08:56
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
-- Base de données : `vueyeba`
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
(1, 'nos à-propos', 'travail', 'nous faire un don', 'notre structure de gestion', '2022-01-29 19:14:06', '2022-01-29 19:21:00');

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
(14, '2022_02_01_204506_create_videos_table', 11);

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
(4, 'administrateur', 'admin@gmail.com', NULL, '$2y$10$/lqHcFc3tPGhdnxp/MMJU.lt6NKY1KZDE0JIudWsFDrLYGNB0gdm6', '+243817883541', 'Goma, Katoyi', '1643812713.jpg', 'M', 1, 'a1t8YuulWarB0WdglFNYwoM7cwSBtzEhxNiAcquvwXecapRBZwNJTrvlQFEe', NULL, '2022-02-02 19:53:20'),
(6, 'jojo', 'jojo@gmail.com', NULL, '$2y$10$aoWHyUaAEAjYsTALtxLksun/nYYQ9ylT9t5MRKvN.mQcJ48tUIJqG', '0817883541', 'goma katoyi', '1643296735.jpg', 'M', 2, '$2y$10$xZ0BLZRaYcKn7ZI5F59IeeVlxTtbaFOYiyEfNmOH1TE86D7DR/Jw.', NULL, '2022-01-27 14:18:55'),
(7, 'joel', 'joel@gmail.com', NULL, '$2y$10$IAEW8G7YBNcYPz.rIBVuz.EPkRmpCg6j8Nf2S3LcKUwSPinYAQN7y', '0970524665', 'Goma Ndosho', '1643297170.jpg', 'M', 3, 'ag6cmnntycjMnrJulnZG2MySY9iGEEhZRe5wSiMxfXwdhVB3ZF89xQAokAx9', '2022-01-27 14:14:47', '2022-01-27 14:26:32');

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
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `galeries`
--
ALTER TABLE `galeries`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `partenaires`
--
ALTER TABLE `partenaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `basics`
--
ALTER TABLE `basics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `galeries`
--
ALTER TABLE `galeries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `partenaires`
--
ALTER TABLE `partenaires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
