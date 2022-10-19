-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 19 oct. 2022 à 14:24
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
-- Base de données : `burega`
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
(1, '<h2><strong>Au début du xxe siècle, le roi Léopold II fit appel</strong></h2><p>Le Bulega dans le «&nbsp;domaine CFL&nbsp;»</p><p>Au début du&nbsp;xxe&nbsp;siècle, le roi Léopold II fit appel à son concours pour mettre à exécution un projet de chemins de fer dans l’Est de l’État indépendant, afin de mieux occuper ces régions et de les relier au Bas-Congo par de bonnes voies de communication. L\'histoire de l\'exploitation coloniale du Bulega est liée à l\'histoire d\'une société commerciale belge, le&nbsp;<strong>Groupe Empain</strong>. Le&nbsp;<strong>Groupe Empain</strong>&nbsp;constitue un ensemble informel de sociétés créées à l’initiative du baron Édouard Empain (1852-1929), dans les secteurs des transports et de l’électricité essentiellement, mais aussi dans ceux de la construction électrique, de l’extraction minière, de l’immobilier… La convention entre le roi Léopold II et le Groupe Empain de 1902 créa la compagnie à charte, la&nbsp;<i>Compagnie des Chemins de Fer du Congo supérieur aux Grands Lacs africains, en abrégé C.F.L.</i>, et le Groupe Empain la dotait d’un capital de 25 millions. La&nbsp;<i>Compagnie CFL</i>&nbsp;devait construire deux chemins de fer, l’un reliant «&nbsp;le fleuve Congo en aval et en amont de Stanleyville au lac Albert&nbsp;», l’autre «&nbsp;le fleuve Congo en aval et en amont de Nyangwe au lac Tanganyika&nbsp;». En contrepartie de la construction de son réseau ferroviaire, la&nbsp;<i>Compagnie CFL</i>&nbsp;a reçu le monopole sur un domaine foncier, forestier et minier. C\'est toute province Orientale d\'alors qui constituait le domaine de la&nbsp;<i>Compagnie CFL</i>. Le territoire du pays Lega, le Bulega, sous l\'administration de l\'EIC se retrouve dans le district d\'abord puis dans la province Orientale et dans le domaine de la&nbsp;<i>Compagnie C.F.L</i></p>', '<p>travail</p>', '<p>nous faire un don</p>', '<p>notre structure de gestion</p>', '2022-01-29 19:14:06', '2022-10-19 07:08:41');

-- --------------------------------------------------------

--
-- Structure de la table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cat` int(11) DEFAULT NULL,
  `slug` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` int(11) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blogs`
--

INSERT INTO `blogs` (`id`, `titre`, `description`, `photo`, `id_cat`, `slug`, `etat`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Blog Bulega  Opportunité', '&lt;p&gt;Les Lega sont une population forestière bantoue d\'Afrique centrale, établie principalement en République démocratique du Congo (RDC), à l\'Est du fleuve Lwalaba (le fleuve Congo), jusqu\'en altitude dans les monts Mitumba, dans les provinces du Nord-Kivu, du Sud-Kivu et du Maniema1. Le totem des Lega est le pangolin. • et enfin les secteurs de Mituku-Basikate et Mituku-Bamoya en territoire de Ubundu, la province du Tshopo.&lt;/p&gt;', '1666100826.jpg', 3, 'blog-bulega--opp-hrf1i7cf', 1, 4, '2022-10-18 11:46:02', '2022-10-18 12:30:41'),
(2, 'Une communaute entreprenarial', '<p>Avec l\'organisation administrative de 1933, le territoire du pays Lega, le Bulega, se retrouve dans la province du Kivu mais divisé en deux domaines de deux compagnies à charte et saucissonné en petits morceaux appartenant à plusieurs compagnies concessionnaires.</p>', '1666100943.jpg', 1, 'une-communaute-e-qf0ztty2', 1, 4, '2022-10-18 11:49:03', '2022-10-18 11:49:03'),
(3, 'La culture lega', '<p>L\'Urega (Bulega) est un ancien territoire (circonscription administrative de l\'époque venant après le district et la province) du Congo belge1, issu de l\'ancien district de Lowa (1911-1926) dans la Province orientale2, qui est à l\'Est de la rivière Lwalaba, entre le Lwalaba et les monts Mitumba à l\'Ouest des lacs Kivu et Tanganyika et comprend les bassins des rivières</p>', '1666100983.jpg', 3, 'la-culture-lega-5itl5loh', 1, 4, '2022-10-18 11:49:43', '2022-10-18 11:49:43'),
(4, 'PEUPLE - ETHNIE LEGA / BALEGA', '<p>Les&nbsp;<strong>Lega</strong>&nbsp;sont un peuple forestier&nbsp;bantou&nbsp;d\'Afrique centrale&nbsp;établi principalement en&nbsp;République démocratique du Congo&nbsp;à l\'est de la <strong>rivière&nbsp;Lualaba</strong>, jusqu\'aux frontières avec le&nbsp;<strong>Rwanda</strong>&nbsp;et le&nbsp;<strong>Burundi</strong>, dans les provinces du&nbsp;<strong>Nord-Kivu</strong>, du&nbsp;<strong>Sud-Kivu&nbsp;et du&nbsp;Maniema</strong>.</p><p>La cohésion de la <strong>Confédération de Balega</strong> n\'était pas liée à une unité de commandement ou une autorité personnalisée (roi ou empereur) mais une unité institutionnalisée à travers la structure du <strong>Bwami</strong>.</p><p><strong>Le Bwami</strong> est une institution socio-politique autour de laquelle se structure toute la société. Les <strong>Bami</strong> (singulier&nbsp;: Mwami) sont les membres de la société ésotérique qui incarne le pouvoir social et politique de Balεga (Balega).</p><p>Tout individu ou groupe d’individus pouvait devenir Mulega, il suffisait de trouver accueil au sein d’une communauté familiale ou clanique, adopter la langue Kilega et intégrer la tradition et la culture Kilega par la voie des initiations.</p><p>Tout cela exige du temps … C’est ainsi que plusieurs individus et groupes d’individus ont intégré la communauté Balega et partagé ainsi le destin de ce peuple.</p><p>La vie n’est pas une quête de l’invisible mais une quête permanente de croissance en humanité tout en restant sur les traces de nos Pères. C’est pourquoi la religion Kilεga (Kilega) est l’ancestralité. Toute la vie est une initiation permanente à travers une institution initiatique, le Bwami.</p><p><strong>Selon les sources on observe les variantes suivantes de leur nom :</strong> Balega, Balegga, Barega, Kalega, Kilega, Kirega, Legas, Mwenga, Rega, Shabunda Lega, Valega, Vuaregga, Walega, Warega.</p><p><strong>Ba-Lega</strong> signifie : le peuple léga</p><p><strong>Balega</strong> signifie le pluriel de Mulega...</p>', '1666101396.jpg', 1, 'peuple---ethnie--r5f277tv', 1, 4, '2022-10-18 11:56:36', '2022-10-18 11:56:36'),
(5, 'Lega (peuple)', '<p>Les <strong>Lega</strong> sont une population forestière <a href=\"https://fr.wikipedia.org/wiki/Bantous\">bantoue</a> d\'<a href=\"https://fr.wikipedia.org/wiki/Afrique_centrale\">Afrique centrale</a>, établie principalement en <a href=\"https://fr.wikipedia.org/wiki/R%C3%A9publique_d%C3%A9mocratique_du_Congo\">République démocratique du Congo</a> (RDC), à l\'Est du fleuve <a href=\"https://fr.wikipedia.org/wiki/Congo_(fleuve)\">Lwalaba (le fleuve Congo)</a>, jusqu\'en altitude dans les <a href=\"https://fr.wikipedia.org/wiki/Monts_Mitumba\">monts Mitumba</a>, dans les provinces du <a href=\"https://fr.wikipedia.org/wiki/Nord-Kivu\">Nord-Kivu</a>, du <a href=\"https://fr.wikipedia.org/wiki/Sud-Kivu\">Sud-Kivu</a> et du <a href=\"https://fr.wikipedia.org/wiki/Maniema\">Maniema</a><a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-Olson-1\">1</a>.<br>Le totem des <strong>Lega</strong> est le <a href=\"https://fr.wikipedia.org/wiki/Pangolin\">pangolin</a>.</p>', '1666101651.png', 1, 'lega-(peuple)-9ckvpqlo', 1, 4, '2022-10-18 12:00:51', '2022-10-18 12:00:51'),
(6, 'Historique sur le peuple lega', '<p>Les Lega quittent la région du <a href=\"https://fr.wikipedia.org/wiki/Nil_blanc\">Nil blanc</a> (Nord-Est de la <a href=\"https://fr.wikipedia.org/wiki/R%C3%A9publique_d%C3%A9mocratique_du_Congo\">République démocratique du Congo</a> et Nord-Ouest de l\'<a href=\"https://fr.wikipedia.org/wiki/Ouganda\">Ouganda</a>), et plus précisément du royaume de <a href=\"https://fr.wikipedia.org/wiki/Bunyoro\">Bunyoro</a>, au cours du <a href=\"https://fr.wikipedia.org/wiki/XVIe_si%C3%A8cle\">xvie&nbsp;siècle</a> pour s\'installer sur la rive Est du <a href=\"https://fr.wikipedia.org/wiki/Congo_(fleuve)\">Lwalaba</a><a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-Bacquart-3\">3</a>. Ils ont puisé un fort sentiment d\'identité nationale dans les conflits ethniques ayant secoué le pays dans les <a href=\"https://fr.wikipedia.org/wiki/Ann%C3%A9es_1960\">années 1960</a> (<a href=\"https://fr.wikipedia.org/wiki/Crise_congolaise\">Crise congolaise</a>)<a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-Olson-1\">1</a>. Ce sentiment d\'identité nationale les poussa à la veille de l\'indépendance, en 1960, à transformer l\'association mutualiste <i>UNERGA (Union des enfants du peuple </i><a href=\"https://fr.wikipedia.org/w/index.php?title=Rega_(peuple)&amp;action=edit&amp;redlink=1\"><i>Rega</i></a><i>)</i>, créée en 1945 à <a href=\"https://fr.wikipedia.org/wiki/Bujumbura\">Bujumbura</a> (<a href=\"https://fr.wikipedia.org/wiki/Burundi\">Burundi</a>)<a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-4\">4</a>, en un parti politique rassemblant toute l\'élite Lega<a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-5\">5</a>. Ils se considèrent comme une des grandes nations du bassin oriental du <a href=\"https://fr.wikipedia.org/wiki/Fleuve_Congo\">fleuve Congo</a>. Depuis les crises à répétition consécutives à l\'indépendance de la RDC, le 30 juin 1960, les Lega font partie des peuples réclamant une nouvelle réorganisation administrative en RDC, fondée sur des critères objectifs&nbsp;: homogénéité culturelle, démographie suffisante, superficie convenable, viabilité économique, … À la conférence nationale de 1992, les Lega réitérèrent les mêmes revendications pour un État fédéral du Congo pluriethnique et multinational où le <a href=\"https://fr.wikipedia.org/wiki/Bulega\">Bulega</a> formerait une province ou un État fédéré. La conscience d\'une identité durable et forte fondée sur un capital culturel commun est source de richesse et participe à la diversité qui fonde une nation équilibrée et tolérante. Jusqu\'à l\'<a href=\"https://fr.wikipedia.org/wiki/%C3%89v%C3%A9nements_initiaux_du_g%C3%A9nocide_des_Tutsi_au_Rwanda\">éclatement de la guerre civile en 1994</a>, de fortes colonies Lega vivaient au Burundi et au <a href=\"https://fr.wikipedia.org/wiki/Rwanda\">Rwanda</a> <a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-Olson-1\">1</a>.</p><p>Les <a href=\"https://fr.wikipedia.org/wiki/Balega\">Balega</a> sont un peuple de la RDC. Ils parlent la langue <a href=\"https://fr.wikipedia.org/wiki/Kilega\">Kilega</a> et habitent le pays (l\'espace) <a href=\"https://fr.wikipedia.org/wiki/Bulega\">Bulega</a>. Leur population est aujourd\'hui estimée à plus de deux millions de personnes, dispersées à l\'intérieur des frontières congolaises. Le terme Kilega (Ileka) désigne à la fois la langue et la tradition, la culture et la civilisation du peuple Balega. Avec la colonisation, le Bulega a été morcelé et attribué à plusieurs <a href=\"https://fr.wikipedia.org/wiki/Provinces\">provinces</a> du Centre-Est de la RDC&nbsp;:</p><p>• les chefferies de <i>Wakabango I</i> et <i>Bakisi</i> dans le territoire de <a href=\"https://fr.wikipedia.org/wiki/Shabunda\">Shabunda</a>, dans les cheferries de <i>Lwindi</i>, <i>Basile</i> et <i>Wamuzima</i> dans le territoire de <a href=\"https://fr.wikipedia.org/wiki/Mwenga\">Mwenga</a>, la région de <i>Kinda</i> du clan Lega de <i>Bana-Isuma</i> du groupement de <i>Mulamba</i> en <a href=\"https://fr.wikipedia.org/wiki/Chefferie\">chefferie</a> de <i>Ngweshe</i> dans territoire de <a href=\"https://fr.wikipedia.org/wiki/Walungu\">Walungu</a> et la région de <i>Nkoto</i> du clan de <i>Bana-Ngozi</i> du groupement de <i>Irhegabarhonyi</i> en chefferie de Nindja dans le territoire de <a href=\"https://fr.wikipedia.org/wiki/Kabare\">Kabare</a> dans la province du <a href=\"https://fr.wikipedia.org/wiki/Sud-Kivu\">Sud-Kivu</a>;</p><p>• les secteurs de <i>Beia</i>, <i>Babene</i>, <i>Ikama</i> et <i>Wakabango II</i> dans le territoire de <a href=\"https://fr.wikipedia.org/wiki/Pangi\">Pangi</a> et le secteur de <i>Baleka</i> dans le territoire de <a href=\"https://fr.wikipedia.org/wiki/Punia\">Punia</a> (<i>Baleka-Mituku</i>)dans la province du <a href=\"https://fr.wikipedia.org/wiki/Maniema\">Maniema</a>;</p><p>• le secteur de <i>Bakano</i> dans le territoire de <a href=\"https://fr.wikipedia.org/wiki/Walikale\">Walikale</a> dans la province du <a href=\"https://fr.wikipedia.org/wiki/Nord-Kivu\">Nord-Kivu</a>&nbsp;;</p><p>• et enfin les secteurs de <i>Mituku-Basikate</i> et <i>Mituku-Bamoya</i> en territoire de <a href=\"https://fr.wikipedia.org/wiki/Ubundu\">Ubundu</a>, la province du <a href=\"https://fr.wikipedia.org/wiki/Tshopo_(province)\">Tshopo</a>.</p>', '1666101812.jpg', 1, 'historique-sur-l-j89uzwr1', 1, 4, '2022-10-18 12:03:32', '2022-10-18 12:03:32'),
(7, 'Les figurines', '<p>Les figurines d\'ivoire iginga sont des objets utilisés lors des rites d\'initiation du bwami; les initiés du grade ultime de cette association en étaient les détenteurs exclusifs. Ces figurines se transmettaient au sein de la famille, d\'un parent proche ou lointain à un autre. Elles sont d\'abord exposées sur la tombe du défunt durant une certaine période. C\'est de cette manière qu\'elles deviennent des objets consacrés, chargés d\'une force vitale indéfinissable qui stimule et soutient leurs détenteurs légitimes. Elles représentent la mémoire des grands personnages intègres, garants du code moral et philosophique et forment le lien entre les générations qui se succèdent. Pour les Lega, les iginga sont des objets secrets et ne peuvent être utilisés ou vus dans un contexte autre qu\'initiatique<a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-17\">17</a>.</p>', '1666101918.jpg', 1, 'les-figurines-kgtqvmvw', 1, 4, '2022-10-18 12:05:18', '2022-10-18 12:05:18'),
(8, 'Les Lukungu, masques en ivoire ou en os', '<p>Les Lukungu, masques en ivoire ou en os, sont encore plus petits. Pendant les rites du Kindi, ils sont enduits d\'huile afin de leur donner une belle patine. Ils sont la propriété personnelle de membres du Kindi. L\'usage qu\'on en fait est assez inhabituel puisqu\'ils sont exposés en rang, ou sur des barrières, encadrant un grand type de masque&nbsp;: un masque Idimu.</p>', '1666102085.jpg', 1, 'les-lukungu,-mas-wyugh1gr', 1, 4, '2022-10-18 12:08:05', '2022-10-18 12:08:05'),
(9, 'Le masque kayamba', '<p>Le Masque <i>Kayamba</i> est facilement reconnaissable par les deux cornes sur le dessus. C\'est un masque relativement rare, utilisé par les précepteurs lors des cérémonies de passage à l\'âge adulte des jeunes garçons.</p>', '1666102181.jpg', 4, 'le-masque-kayamb-gfceetgm', 1, 4, '2022-10-18 12:09:41', '2022-10-18 12:09:41'),
(10, 'Le masque idimu', '<p>Le masque idimu personnifiait alors le «&nbsp;Maître du pays entouré de ses enfants&nbsp;» et symbolisait l\'unité et la cohésion des associations rituelles qui se regroupaient autour de lui. Le masque Idimu est en bois ou en ivoire, avec une des plus grandes mesures (22&nbsp;cm). Il représente l\'esthétique Lega avec ses formes harmonieuses. Les patines sont variées. Il constitue le symbole d\'unité et de cohésion<a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-16\">16</a>.</p>', '1666102361.jpg', 1, 'le-masque-idimu-d43e5jgz', 1, 4, '2022-10-18 12:12:41', '2022-10-18 12:12:41'),
(11, 'Le masque lukwakongo', '&lt;p&gt;Le nom &lt;i&gt;lukwakongo&lt;/i&gt; est une expression Lega qui signifie, en français, &quot;la mort rassemble&quot; / &quot;la mort fédère toutes les tendances&quot;. Par sa signification, ce masque renvoie à une célébration d\'un culte en mémoire d\'un défunts et des défunts. Tout Mulega aspire à devenir un ancêtre, c\'est-à-dire une icône pour les générations postérieures. Le masque &lt;i&gt;lukwakongo&lt;/i&gt; ne représente pas un ancêtre bien déterminé mais un ancêtre anonyme. L\'ancêtre a été un ancien (plein d\'expériences) par son âge, un savant (un connaisseur) de la science de son temps, un sage (une référence) de la société, une autorité (matérielle, spirituelle et politique), c\'est pourquoi la société l\'a gardé dans sa mémoire collective. La barbe du &lt;i&gt;lukwakongo&lt;/i&gt; symbolise l\'ancienneté (Bwaale ou Bwakale, Buulu ou Bukulu) et la sagesse (Itekesha) comme qualités du défunt. Le &lt;i&gt;lukwakongo&lt;/i&gt; symbolise le mwami défunt classé parmi les sages de la société. C\'est pourquoi il est associé à la mort et aux défunts.&lt;/p&gt;&lt;p&gt;Les masques &lt;i&gt;lukwakongo&lt;/i&gt;, comme tout le contenu de &lt;i&gt;masengo&lt;/i&gt; sont des propriétés individuelles des initiés ayant atteint le cinquième niveau (dans le Tata) et le sixième niveau (dans le malinga) du bwami. Les masques sont l\'héritage des grands initiés défunts dont ils évoquent le souvenir agréable, sans pour autant en être les portraits, L\'idée la plus importante est que les défunts ne sont pas vraiment morts, mais survivent au travers des masques qu\'ils ont laissés à leurs successeurs pour perpétuer les traditions. Les aphorismes qui leur sont associés et que les initiés prononcent au cours des rituels évoquent les principes moraux, spirituels et philosophiques du bwami. Les petits masques en bois ou &lt;i&gt;Lukwakongo&lt;/i&gt; mesurent qu\'une quinzaine de centimètres, ils ne sont donc pas portés directement sur le visage. Accrochés sur l\'épaule, ce sont des symboles, des insignes. Ils appartiennent aux initiés d\'un grade du Bwami. Durant les rituels, un type de masque plus grand était attaché à une barrière, entouré de petits masques &lt;i&gt;lukwakongo&lt;/i&gt; signifier l\'unité la cohésion des ancêtres dans l\'au-delà.&lt;/p&gt;', '1666102413.jpg', 1, 'le-masque-lukwak-ryj2tsog', 1, 4, '2022-10-18 12:13:33', '2022-10-18 12:13:43'),
(12, 'Savoir sur le masque lega', '<p>Le mot <i>imangungu</i> (singulier) - <i>bimangungu</i> (pluriel) - signifie en français masque. Les masques Lega sont utilisés durant les rites initiatiques du bwami. Globalement les masques Lega se présentent sous deux formes: les grands masques et les petits masques. Les grands masques servent lors de certaines cérémonies pour voiler la face du porteur dans une incarnation d\'un rôle bien précis lors d\'une mise en scène durant les cérémonies initiatiques du bwami. Les petits masques sont portés sur les tempes, le front, l\'arrière de la tête ou tenus en main. Ils peuvent être suspendus généralement sur le <i>mutanga</i>, dénommé <i>La corde de la sagesse Lega</i> par <i>George Defour</i><a href=\"https://fr.wikipedia.org/wiki/Lega_(peuple)#cite_note-Du_Mutanga:_id%C3%A9oogrammes_de_la_soci%C3%A9t%C3%A9_Lega_%C2%AB_MondesFrancophones.com-12\">12</a> alignés ou entassés au sol. Les masques Lega se caractérisent surtout par la forme de leurs visages concave en forme de cœur.</p><p>Les masques sont des insignes de grade. Ils ne représentent pas un homme en particulier, mais l’homme dans son caractère universel. Les yeux ouverts et fendus, le nez vertical et fin, la bouche ouverte sont autant de caractéristiques propres à l’art Lega. Les masques sont souvent enduits de kaolin. La simplicité des formes et la sobriété dans les lignes donnent à ces masques toutes leur force et leur beauté. Les types de masques les plus courants sont: le masque <i>lukwakongo</i>, le masque <i>idimu</i>, le masque <i>lukungu</i>.</p>', '1666102931.jpg', 2, 'savoir-sur-le-ma-2a1dfh22', 1, 4, '2022-10-18 12:22:11', '2022-10-18 12:22:11'),
(13, 'LE MULEGA,L\'HOMME DE LA TRADITION', '<p>Depuis 2008, le Centre Culturel Lega ne ménage aucun effort pour accroître la promotion des valeurs culturelles lega. Dans cette perspective, nous avons décidé de numériser «&nbsp;LE MULEGA, L’HOMME DE LA TRADITION&nbsp;»&nbsp;; cet ouvrage écrit en 1982 par l’Abbé Charles BILEMBO et qui, à notre connaissance, est resté peu accessible à plusieurs lecteurs qui souhaiteraient en découvrir le contenu et élargir leur champ de connaissance sur le peuple Lega.</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nous avouons avec modestie que le manuscrit à notre <a href=\"http://centreculturellega.centerblog.net/possession.htm\">possession</a> avait certaines imperfections&nbsp;: pages manquantes, quelques références bibliographiques incomplètes, etc. Nous le signalons dans le corps du texte.</p><p>C’est pourquoi, à l’instar de l’auteur, nous serons heureux de recevoir des lecteurs des notes complémentaires des remarques, des rectifications et des critiques constructives car les Balega disent&nbsp;:&nbsp;«&nbsp;<i>Mutangi akitile abutwa, nu nsunguzi alinga abutwa</i>&nbsp;». (Tout homme a besoin de conseils&nbsp;: du choc des idées jaillit la lumière).</p>', '1666103238.jpg', 2, 'le-mulega,l-homm-qu3w76yl', 1, 4, '2022-10-18 12:27:18', '2022-10-18 12:27:18'),
(14, 'Château du Puiset', '<p>Le château du Puiset est un ancien château fort, du xie siècle, qui se dresse sur l\'ancienne commune du Puiset au sein de la commune nouvelle de Janville-en-Beauce dans le département d\'Eure-et-Loir, en région Centre-Val de Loire. SituationLes ruines du château sont situés à proximité nord ...</p>', '1666103431.jpg', 4, 'chateau-du-puis-r23ftw01', 1, 4, '2022-10-18 12:30:31', '2022-10-18 12:30:31');

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
(1, 6, '1654172695.zip', '2022-06-02 10:24:55', '2022-06-02 10:24:55'),
(2, 1, '1655413619.zip', '2022-06-16 19:06:59', '2022-06-16 19:06:59');

-- --------------------------------------------------------

--
-- Structure de la table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carousels`
--

INSERT INTO `carousels` (`id`, `titre`, `description`, `photo`, `created_at`, `updated_at`) VALUES
(1, 'Un home sans culture Le savez-vous?', 'Un homme sans culture ressemble à un zèbre sans rayures.', '1666181989.jpg', '2022-10-19 10:19:49', '2022-10-19 10:19:49'),
(2, 'La culture est l\'un des leviers', 'La culture est l\'un des leviers les plus importants à actionner pour réhabiliter et relancer l\'économie tout en produisant du sens.', '1666182028.jpg', '2022-10-19 10:20:28', '2022-10-19 10:20:35');

-- --------------------------------------------------------

--
-- Structure de la table `category_articles`
--

CREATE TABLE `category_articles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category_articles`
--

INSERT INTO `category_articles` (`id`, `nom`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Burega  actualité', 'burega--actualit-zuzg8iyn', '2022-10-18 10:36:14', '2022-10-18 10:39:18'),
(2, 'Burega  culture', 'burega--culture-s2vg7ttk', '2022-10-18 10:36:25', '2022-10-18 10:36:25'),
(3, 'Burega  communiqué', 'burega--communiq-on92ne6h', '2022-10-18 10:37:33', '2022-10-18 10:37:33'),
(4, 'Buleka tourisme', 'buleka-tourisme-ypp2qhw1', '2022-10-18 10:51:39', '2022-10-18 10:51:39'),
(5, 'Buleka opportinité', 'buleka-opportini-pc320y0p', '2022-10-18 10:52:07', '2022-10-18 10:52:07');

-- --------------------------------------------------------

--
-- Structure de la table `contact_infos`
--

CREATE TABLE `contact_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `contact_infos`
--

INSERT INTO `contact_infos` (`id`, `name`, `email`, `telephone`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(1, 'roger sumaili', 'patrona@gmail.com', '+243817883541', 'salutation', 'Bonjour', '2022-10-19 10:08:05', '2022-10-19 10:08:18');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `id_theme` int(11) DEFAULT NULL,
  `id_odd` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `entreprises`
--

INSERT INTO `entreprises` (`id`, `ceo`, `nomEntreprise`, `descriptionEntreprise`, `emailEntreprise`, `adresseEntreprise`, `telephoneEntreprise`, `solutionEntreprise`, `rccm`, `etat`, `idsecteur`, `idforme`, `idPays`, `idProvince`, `edition`, `facebook`, `linkedin`, `twitter`, `siteweb`, `invPersonnel`, `invHub`, `invRecherche`, `chiffreAffaire`, `nbremploye`, `logo`, `slug`, `created_at`, `updated_at`, `id_theme`, `id_odd`) VALUES
(1, 1, 'kaka security', '​\nChiffre d\'affaire annuel généré par l\'entreprise\n1000\nDescription de l\'entreprise', 'kakasecurity@gmail.com', 'kakasecurity@gmail.com', '+243817883541', 'la solution', 'CD/12/35-234/GOMA', 1, 1, 1, 1, 1, '2021', 'https://fonts.google.com/icons?icon.query=attach+money', 'https://web.whatsapp.com/', 'https://web.whatsapp.com/', 'https://fonts.google.com/icons?icon.query=attach+money', '10', '200', '800', '1000', '1-5', '1655412094.jpg', 'kaka-security-9i5x053n', '2022-06-01 10:37:53', '2022-07-15 16:51:51', 1, 1),
(2, 2, 'Boom topic', 'est une entreprise', 'boom@gmail.com', 'Goma ', '0825423678', 'la solution', 'cd/nr-1234/098', 1, 5, 3, 1, 1, '2022', '', '', '', '', '500', '800', '8300', '3000', '5-10', '1654088173.png', 'boom-topic-vji4ztwa', '2022-06-01 10:56:13', '2022-06-01 12:01:00', 1, 1),
(3, 6, 'jojo photo', 'Créer un business Plan avec Angel est simple grâce à notre outil qui vous guide pas à pas. Créez facilement un Business Plan avec Angel. Démarrez gratuitement. C\'est simple & rapide. Essayer gratuitement. Soutien de la Communauté. Rapide. Interface innovante.', 'jojophoto@gmail.com', 'kisangani', '0817883541', 'Renforcez l\'équipe et livrez d\'excellentes expériences avec Jira Service Management™. Accélérez le développement du travail et déployez facilement les changements. Essayez. Résolvez les problèmes. Tarifs transparents. 25% de tickets en moins.', '45ghr645', 1, 4, 2, 1, 1, '2021', '', '', '', '', '300', '4500', '30000', '1000', '10-15', '1654088350.png', 'jojo-photo-9u3dqdyg', '2022-06-01 10:59:10', '2022-06-01 12:00:51', 1, 1),
(4, 9, 'jonathan sarl', 'Le profil d\'entreprise est le sommaire formel d\'une entreprise et de ses activités ; une sorte de carte d\'identité, qui, en plus de fournir les caractéristiques de cette entreprise, indique aussi quelles sont sa mission, sa vision, ses valeurs, ses objectifs pour l\'avenir…', 'jonathan@gmail.com', 'goma', '09978234568', 'Madame, Monsieur, Notre société a pour secteur d\'activité (préciser le secteur) fondé depuis (préciser la date). Nous avons pour domaine d\'expertise (préciser vos principales offres : conseil financier, rénovation, restauration, …) avec une équipe de spécialistes de (nombre) personnes.21 juin 2021', 'CD-NK-6yer89/09-2022', 1, 3, 1, 1, 1, '2022', '', '', '', '', '4000', '8000', '35000', '12000', '1-5', '1654088586.png', 'jonathan-sarl-252mlcop', '2022-06-01 11:03:06', '2022-06-01 12:00:53', 1, 1),
(5, 10, 'victory tech', 'Comment faire une bonne présentation personnelle ?\nPour ce faire, voici un petit canevas qui a pour objectif de vous aider à structurer votre présentation personnelle :', 'victory@gmail.com', 'goma', '+243813456781', 'La manière la plus simple pour se présenter de manière originale sans prendre trop de risque est de vous présenter de manière conventionnelle en rajoutant une information insolite et pertinente. pertinente : qui est en lien avec le contexte, la raison pour laquelle vous êtes là, ce que vous faites dans vie…19 janv. 2020', '34DU78jg7', 1, 2, 2, 1, 1, '2022', '', '', '', '', '4500', '5000', '36000', '12300', '1-5', '1654091008.png', 'victory-tech-hud06ptu', '2022-06-01 11:06:11', '2022-06-01 12:00:57', 1, 1),
(6, 11, 'Dream of drc', 'Dream of drc(#dream) est une startup qui vise à promouvoir l\'intégrité de la jeunesse en appliquant la technologie afin de permettre l\'émergence de la société.', 'info@dreamofdrc.com', 'Goma', '+243970524665', 'Réduire le taux des difficultés que rencontre la société suite au manquement d\'une meilleure solution technologique appropriée à leur problématique au pourcentage le plus bas possible jamais atteint!', 'CD-N-K34YH78/03/08/21', 1, 3, 1, 1, 1, '2022', 'https://www.facebook.com/dreamofdrc', 'https://www.linkedin.com/in/dream-of-drc-startup-872765217/', 'https://twitter.com/drc_dream', 'http://dreamofdrc.com/', '500', '1000', '8000', '2670', '1-5', '1654089250.jpeg', 'dream-of-drc-fdmex2nh', '2022-06-01 11:14:10', '2022-07-07 13:49:37', 4, 3),
(7, 13, 'forex', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'forex@gmail.com', 'kisangani', '0997645124', 'Le lorem ipsum est, en imprimerie, une suite de mots sans signification utilisée à titre provisoire pour calibrer une mise en page, le texte définitif venant remplacer le faux-texte dès qu\'il est prêt ou que la mise en page est achevée. Généralement, on utilise un texte en faux latin, le Lorem ipsum ou Lipsum.', 'CD-NK-123HDG4', 1, 6, 2, 1, 3, '2022', '', '', '', '', '200', '500', '2000', '1700', '5-10', '1654090128.png', 'forex-3j0x77gk', '2022-06-01 11:28:48', '2022-07-07 13:42:21', 2, 2),
(8, 14, 'daula sarl', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'daula@gmail.com', 'Goma nord kivu', '+2438167346154', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'CD97HN08', 1, 5, 2, 1, 1, '2022', '', '', '', '', '300', '500', '7600', '2300', '5-10', '1654090571.jpg', 'daula-sarl-qooem00d', '2022-06-01 11:36:11', '2022-06-01 12:00:37', 1, 1),
(9, 15, 'webs lesson', 'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', 'info@webslesson.com', 'Goma', '+243817435671', 'first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 'CD-NK/345OT/07/01-22', 1, 2, 2, 1, 1, '2022', '', '', '', '', '3000', '6000', '34000', '18000', '1-5', '1654090896.png', 'webs-lesson-10op78v5', '2022-06-01 11:41:36', '2022-06-01 12:13:37', 1, 1);

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
(1, '1666171850.jpg', '2022-10-19 07:30:50', '2022-10-19 07:30:50'),
(2, '1666171860.png', '2022-10-19 07:31:00', '2022-10-19 07:31:00'),
(3, '1666171935.jpg', '2022-10-19 07:32:15', '2022-10-19 07:32:15'),
(4, '1666171940.jpg', '2022-10-19 07:32:20', '2022-10-19 07:32:20'),
(5, '1666171950.jpg', '2022-10-19 07:32:30', '2022-10-19 07:32:30'),
(6, '1666171954.jpg', '2022-10-19 07:32:34', '2022-10-19 07:32:34'),
(7, '1666171960.jpg', '2022-10-19 07:32:40', '2022-10-19 07:32:40'),
(8, '1666171966.jpg', '2022-10-19 07:32:46', '2022-10-19 07:32:46'),
(9, '1666171973.jpg', '2022-10-19 07:32:53', '2022-10-19 07:32:53'),
(10, '1666171978.jpg', '2022-10-19 07:32:58', '2022-10-19 07:32:58'),
(11, '1666171984.jpg', '2022-10-19 07:33:04', '2022-10-19 07:33:04'),
(12, '1666171990.jpg', '2022-10-19 07:33:10', '2022-10-19 07:33:10'),
(13, '1666171998.jpeg', '2022-10-19 07:33:18', '2022-10-19 07:33:18'),
(14, '1666172003.jpg', '2022-10-19 07:33:23', '2022-10-19 07:33:23'),
(15, '1666172011.jpg', '2022-10-19 07:33:31', '2022-10-19 07:33:31');

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
(21, 6, 'Avantage déloyale', 'coucou', '2022-06-10 12:05:22', '2022-06-10 12:05:22'),
(23, 1, 'Solution', 'solution ok plus', '2022-06-16 19:18:02', '2022-06-16 19:35:53'),
(24, 1, 'Proposition de valeur unique', 'proposition', '2022-06-16 19:18:11', '2022-06-16 19:18:29'),
(25, 1, 'Problème', 'problème 1', '2022-06-16 19:19:06', '2022-06-16 19:19:06'),
(26, 1, 'Problème', 'problème 2', '2022-06-16 19:19:14', '2022-06-16 19:19:14'),
(27, 1, 'Solution', 'solution ok', '2022-06-16 19:35:39', '2022-06-16 19:35:39'),
(28, 1, 'Canaux', 'ok', '2022-07-13 21:01:31', '2022-07-13 21:01:31');

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
(4, 4, 6, 'Solution', 'solution correction ok', '2022-06-11 05:19:31', '2022-06-23 07:32:13'),
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
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message`, `created_at`, `updated_at`, `receiver_id`, `image`) VALUES
(3, 2, 'oui bonjour', '2022-06-17 18:39:35', '2022-06-17 18:39:35', NULL, NULL),
(4, 6, 'Ni sawa?', '2022-06-17 18:39:48', '2022-06-17 18:39:48', NULL, NULL),
(5, 3, '👍', '2022-06-17 18:39:56', '2022-06-17 18:39:56', NULL, NULL),
(8, 12, 'ok boos', '2022-06-17 18:49:51', '2022-06-17 18:49:51', NULL, NULL),
(9, 4, 'ok boos', '2022-06-17 19:00:46', '2022-06-17 19:00:46', NULL, NULL),
(10, 4, '😍lool!😘', '2022-06-17 19:25:38', '2022-06-17 19:25:38', NULL, NULL),
(11, 6, NULL, '2022-06-17 19:26:45', '2022-06-17 19:26:45', NULL, 'chat/c8rXMNO6RcO58qKg592tyZHQVd3arxZoNgEkv50l.png'),
(13, 6, '😍👍 ok boos', '2022-06-17 19:55:06', '2022-06-17 19:55:06', NULL, NULL),
(14, 4, NULL, '2022-06-17 19:55:39', '2022-06-17 19:55:39', NULL, '1655502939.jpg'),
(15, 4, 'sawa🍊', '2022-06-17 19:58:09', '2022-06-17 19:58:09', NULL, NULL),
(16, 12, '😍 mdr!', '2022-06-17 19:58:33', '2022-06-17 19:58:33', NULL, NULL),
(17, 11, '🤐 je la boucle!', '2022-06-17 20:10:49', '2022-06-17 20:10:49', NULL, NULL),
(18, 12, 'On the local everything works fine, when I upload an image it will upload in storage folder and link of it will appear in public folder but since I moved to live host and production mode my images will upload in storage folder but nothing in my public_html/storage and I\'m not able to get them in my front-end.', '2022-06-17 20:21:58', '2022-06-17 20:21:58', NULL, NULL),
(20, 11, NULL, '2022-06-17 20:44:40', '2022-06-17 20:44:40', NULL, NULL),
(23, 4, NULL, '2022-06-18 08:32:58', '2022-06-18 08:32:58', NULL, '1655548378.png'),
(25, 4, 'ça va?', '2022-06-18 11:08:25', '2022-06-18 11:08:25', 14, NULL),
(27, 12, 'Ni sawa?', '2022-06-18 11:09:02', '2022-06-18 11:09:02', 4, NULL),
(28, 12, 'Ndiyo ni sawa?', '2022-06-18 11:09:28', '2022-06-18 11:09:28', 4, NULL),
(29, 4, 'Na weye?', '2022-06-18 11:09:40', '2022-06-18 11:09:40', 12, NULL),
(30, 12, 'On the local everything works fine, when I upload an image it will upload in storage folder and link of it will appear in public folder but since I moved to live host and production mode my images will upload in storage folder but nothing in my public_html/storage and I\'m not able to get them in my front-end.', '2022-06-18 11:10:00', '2022-06-18 11:10:00', 4, NULL),
(33, 4, '👍😍 bonjour', '2022-06-18 12:11:03', '2022-06-18 12:11:03', 15, NULL),
(46, 4, 'Hi bro!', '2022-06-18 13:22:06', '2022-06-18 13:22:06', 10, NULL),
(47, 4, NULL, '2022-06-18 13:23:46', '2022-06-18 13:23:46', NULL, '1655565826.png'),
(48, 1, 'Bonjour', '2022-06-18 13:27:18', '2022-06-18 13:27:18', 11, NULL),
(49, 1, 'Bonjour!', '2022-06-18 13:27:32', '2022-06-18 13:27:32', 4, NULL),
(50, 1, 'Hi😍', '2022-06-18 13:27:56', '2022-06-18 13:27:56', NULL, NULL),
(52, 1, 'hi boos!', '2022-06-18 13:39:32', '2022-06-18 13:39:32', 4, NULL),
(53, 4, 'hi to! _a va?', '2022-06-18 13:40:00', '2022-06-18 13:40:00', 1, NULL),
(54, 1, 'oui oui et toi?', '2022-06-18 13:40:19', '2022-06-18 13:40:19', 4, NULL),
(55, 4, 'moi aussi👩‍💻👩‍💻', '2022-06-18 13:41:10', '2022-06-18 13:41:10', 1, NULL),
(56, 4, '👍', '2022-06-18 13:42:00', '2022-06-18 13:42:00', 1, NULL),
(57, 1, 'ok', '2022-06-18 13:42:10', '2022-06-18 13:42:10', 4, NULL),
(58, 4, 'hi boos', '2022-06-18 13:44:02', '2022-06-18 13:44:02', NULL, NULL),
(59, 1, 'hi to', '2022-06-18 13:44:43', '2022-06-18 13:44:43', NULL, NULL),
(60, 1, 'dfff', '2022-06-18 13:55:43', '2022-06-18 13:55:43', 4, NULL),
(61, 4, 'ok', '2022-06-20 11:05:49', '2022-06-20 11:05:49', 14, NULL),
(62, 4, '👍', '2022-06-20 11:08:29', '2022-06-20 11:08:29', 15, NULL),
(63, 4, 'hi ☝️', '2022-06-20 11:10:42', '2022-06-20 11:10:42', 11, NULL),
(64, 4, 'Bonjour👍', '2022-06-23 07:44:12', '2022-06-23 07:44:12', 1, NULL),
(65, 1, 'oui bonjour', '2022-06-23 07:44:31', '2022-06-23 07:44:31', 4, NULL),
(66, 4, 'ok', '2022-06-23 07:44:53', '2022-06-23 07:44:53', NULL, NULL),
(67, 4, '👍 salut', '2022-07-02 11:33:00', '2022-07-02 11:33:00', 12, NULL),
(68, 12, 'ok boss', '2022-07-02 11:33:16', '2022-07-02 11:33:16', 4, NULL),
(69, 4, '😃', '2022-07-07 11:20:53', '2022-07-07 11:20:53', 12, NULL),
(70, 11, 'Bonjour boss', '2022-07-07 13:51:06', '2022-07-07 13:51:06', 18, NULL),
(71, 11, 'Bonjour boss', '2022-07-07 13:51:18', '2022-07-07 13:51:18', 17, NULL),
(72, 11, 'Bonjour boss', '2022-07-07 13:51:25', '2022-07-07 13:51:25', 14, NULL),
(73, 11, 'Hi boss!', '2022-07-07 13:52:00', '2022-07-07 13:52:00', 13, NULL),
(74, 11, 'Bonjour boss!🌏🏚️', '2022-07-07 13:52:47', '2022-07-07 13:52:47', 4, NULL),
(75, 11, 'Sawa les gars!👍', '2022-07-07 13:54:04', '2022-07-07 13:54:04', NULL, NULL),
(76, 3, 'hi', '2022-07-13 20:47:51', '2022-07-13 20:47:51', 21, NULL),
(77, 3, 'ni sawa😀👍', '2022-07-13 20:48:10', '2022-07-13 20:48:10', 17, NULL),
(78, 3, 'ni sawa boss?', '2022-07-13 20:48:39', '2022-07-13 20:48:39', 4, NULL),
(79, 4, 'salut', '2022-07-15 15:18:02', '2022-07-15 15:18:02', 12, NULL),
(80, 4, '👍 ni sawa?', '2022-07-15 15:18:22', '2022-07-15 15:18:22', 12, NULL),
(81, 3, 'Bonjour!', '2022-07-15 18:15:44', '2022-07-15 18:15:44', 18, NULL),
(82, 3, NULL, '2022-07-15 18:16:11', '2022-07-15 18:16:11', NULL, '1657916170.jpg'),
(83, 3, '👍😍', '2022-07-15 18:16:17', '2022-07-15 18:16:17', NULL, NULL),
(84, 4, 'salut boss👍', '2022-10-17 21:48:25', '2022-10-17 21:48:25', 11, NULL),
(85, 4, 'bonjour!', '2022-10-17 21:49:39', '2022-10-17 21:49:39', NULL, NULL),
(86, 4, 'hi', '2022-10-18 10:41:03', '2022-10-18 10:41:03', 12, NULL),
(87, 4, NULL, '2022-10-18 10:41:41', '2022-10-18 10:41:41', NULL, '1666096901.svg'),
(88, 4, NULL, '2022-10-18 10:41:43', '2022-10-18 10:41:43', NULL, NULL),
(89, 4, NULL, '2022-10-18 10:41:55', '2022-10-18 10:41:55', NULL, '1666096915.png'),
(90, 4, 'hi', '2022-10-18 10:41:59', '2022-10-18 10:41:59', NULL, NULL);

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
(28, '2022_06_16_095405_create_mot_semaines_table', 23),
(31, '2022_06_17_095822_create_messages_table', 24),
(32, '2022_06_17_103443_add_receiver_id_field_to_messages', 24),
(33, '2022_06_17_143153_add_image_column_to_messages', 24),
(35, '2022_07_07_082850_create_theme_formes_table', 25),
(36, '2022_07_07_081205_create_odd_formes_table', 26),
(37, '2022_07_08_120716_create_user_attendaces_table', 27),
(39, '2022_07_13_101911_create_teams_table', 28),
(41, '2022_08_29_124727_create_category_articles_table', 29),
(42, '2022_01_31_083252_create_blogs_table', 30),
(43, '2022_10_19_082855_create_territoires_table', 31),
(44, '2022_09_03_181439_create_contact_infos_table', 32),
(45, '2022_09_04_212957_create_carousels_table', 33);

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
-- Structure de la table `odd_formes`
--

CREATE TABLE `odd_formes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `odd` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionOdd` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `odd_formes`
--

INSERT INTO `odd_formes` (`id`, `odd`, `descriptionOdd`, `icone`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'ODD n°1 - Pas de pauvreté ', 'Éliminer la pauvreté sous toutes ses formes et partout dans le monde', '1657191300.png', NULL, '2022-07-07 08:36:28', '2022-07-07 08:55:00'),
(2, 'ODD n°2 - Faim « Zéro »', 'Éliminer la faim, assurer la sécurité alimentaire, améliorer la nutrition et promouvoir l’agriculture durable', '1657191329.jpg', NULL, '2022-07-07 08:55:29', '2022-07-07 08:55:29'),
(3, 'ODD n°3 - Bonne santé et bien-être', 'Permettre à tous de vivre en bonne santé et promouvoir le bien-être de tous à tout âge', '1657191353.png', NULL, '2022-07-07 08:55:53', '2022-07-07 08:55:53'),
(4, 'ODD n°4 - Éducation de qualité', 'Assurer à tous une éducation équitable, inclusive et de qualité et des possibilités d’apprentissage tout au long de la vie', '1657191386.png', NULL, '2022-07-07 08:56:26', '2022-07-07 08:56:26'),
(5, ' ODD n°5 - Égalité entre les sexes', 'Parvenir à l’égalité des sexes et autonomiser toutes les femmes et toutes les filles', '1657191407.png', NULL, '2022-07-07 08:56:47', '2022-07-07 08:56:47'),
(6, 'ODD n°6 - Eau propre et assainissement', 'Garantir l’accès de tous à des services d’alimentation en eau et d’assainissement gérés de façon durable', '1657191438.png', NULL, '2022-07-07 08:57:18', '2022-07-07 08:57:18'),
(7, 'ODD n°7 - Énergie propre et d\'un coût abordable', 'Garantir l’accès de tous à des services énergétiques fiables, durables et modernes, à un coût abordable', '1657191461.png', NULL, '2022-07-07 08:57:41', '2022-07-07 08:57:41'),
(8, 'ODD n°8 - Travail décent et croissance économique', 'Promouvoir une croissance économique soutenue, partagée et durable, le plein emploi productif et un travail décent pour tous', '1657191484.png', NULL, '2022-07-07 08:58:04', '2022-07-07 08:58:04'),
(9, 'ODD n°9 - Industrie, innovation et infrastructure', 'Bâtir une infrastructure résiliente, promouvoir une industrialisation durable qui profite à tous et encourager l’innovation', '1657191508.png', NULL, '2022-07-07 08:58:28', '2022-07-07 08:58:28'),
(10, 'ODD n°10 - Inégalités réduites', 'Réduire les inégalités dans les pays et d’un pays à l’autre', '1657191535.png', NULL, '2022-07-07 08:58:55', '2022-07-07 08:58:55'),
(11, 'ODD n°11 - Villes et communautés durable', 'Faire en sorte que les villes et les établissements humains soient ouverts à tous, sûrs, résilients et durables', '1657191560.png', NULL, '2022-07-07 08:59:20', '2022-07-07 08:59:20'),
(12, 'ODD n°12 - Consommation et production responsables', 'Établir des modes de consommation et de production durables', '1657191588.png', NULL, '2022-07-07 08:59:48', '2022-07-07 08:59:48'),
(13, 'ODD n°13 - Lutte contre les changements climatiques', 'Prendre d’urgence des mesures pour lutter contre les changements climatiques et leurs répercussions', '1657191614.png', NULL, '2022-07-07 09:00:14', '2022-07-07 09:00:14'),
(14, 'ODD n°14 - Vie aquatique', 'Conserver et exploiter de manière durable les océans, les mers et les ressources marines aux fins du développement durable', '1657191645.png', NULL, '2022-07-07 09:00:45', '2022-07-07 09:00:45'),
(15, 'ODD n°15 - Vie terrestre', 'Préserver et restaurer les écosystèmes terrestres, en veillant à les exploiter de façon durable, gérer durablement les forêts, lutter contre la désertification, enrayer et inverser le processus de dégradation des terres et mettre fin à l’appauvrissement de la biodiversité', '1657191673.png', NULL, '2022-07-07 09:01:13', '2022-07-07 09:01:13'),
(16, 'ODD n°16 - Paix, justice et institutions efficaces', 'Promouvoir l’avènement de sociétés pacifiques et inclusives aux fins du développement durable, assurer l’accès de tous à la justice et mettre en place, à tous les niveaux, des institutions efficaces, responsables et ouvertes à tous', '1657191698.png', NULL, '2022-07-07 09:01:38', '2022-07-07 09:01:38'),
(17, 'ODD n°17 - Partenariats pour la réalisation des objectifs', 'Renforcer les moyens de mettre en œuvre le Partenariat mondial pour le développement durable et le revitaliser', '1657191723.png', NULL, '2022-07-07 09:02:03', '2022-07-07 09:02:03');

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
(1, 'Dream of drc', 'https://dreamofdrc.com/', '1666172290.jpeg', '2022-02-01 14:35:09', '2022-10-19 07:38:10'),
(2, 'Kivu green', 'https://kivugreen.com/', '1666172473.png', '2022-02-01 15:42:14', '2022-10-19 07:41:13'),
(4, 'Congo culture', 'https://culturecongo.com/', '1666172651.jpg', '2022-02-01 15:46:58', '2022-10-19 07:44:11');

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
('admin@gmail.com', '6VlxJrIolFDFtQuNdjHC33BdDCuf14oM1DB6IPGr3Tu3w6kzqULofYD3EKBG', '2022-01-27 10:46:27'),
('admin@gmail.com', 'QWaQileVQL5bBtuacovFbHQ5ivK6bV5KtmyTQkxXKiAmsc6R3Aog0inK6xWh', '2022-06-21 03:37:51'),
('admin@gmail.com', 'xlNkfexyLicDg2TXOZ119GSnIcPpTtXiQ47VoM5WziIXq3OtXTTdbxMVWfyx', '2022-06-21 03:40:33');

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
(11, 6, '1654338419.png', '2022-06-04 08:26:59', '2022-06-04 08:26:59'),
(13, 1, '1655413663.jpg', '2022-06-16 19:07:43', '2022-06-16 19:07:43'),
(14, 1, '1655413672.png', '2022-06-16 19:07:52', '2022-06-16 19:07:52'),
(15, 1, '1655413681.png', '2022-06-16 19:08:01', '2022-06-16 19:08:01');

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
(1, 6, '1654170157.pptx', '2022-06-02 09:42:37', '2022-06-02 09:42:37'),
(2, 1, '1655413576.pptx', '2022-06-16 19:06:16', '2022-06-16 19:06:16');

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
(2, 'utilisateur normal', NULL, '2022-10-17 21:59:42'),
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
(6, 'Elevage', '2022-05-31 10:23:31', '2022-07-02 11:30:17');

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
(1, 'l\'inspiration esthétique', 'Activités qui visent à répondre à des intérêts ou des besoins culturels. Sans prendre la forme de biens matériels, ils en facilitent la production et la diffusion', 'home', '2022-01-31 07:55:31', '2022-10-19 07:55:18'),
(2, 'Loisirs et santé mentale et physique', 'Les loisirs pratiqués dans la nature, par exemple la marche ou bien les jeux sportifs dans les parcs et les espaces verts urbains, jouent un rôle important dans le maintien de la santé mentale et physique.', 'extension', '2022-01-31 07:58:29', '2022-10-19 07:58:13'),
(3, 'Tourisme', 'Les joies de la nature attirent des millions de voyageurs partout dans le monde. Ce service écosystémique culturel est à la fois bénéfique, s\'agissant des visiteurs, et lucratif, s\'agissant des prestataires de services de tourisme vert.', 'design_services', '2022-01-31 07:58:58', '2022-10-19 07:57:07'),
(7, 'Conscience et inspiration esthétiques dans la culture, l\'art et le design', 'Les animaux, les plantes et les écosystèmes sont une source d\'inspiration essentielle dans l\'art, la culture et le design; de plus en plus, ils inspirent aussi la science.', 'open_with', '2022-07-21 09:48:43', '2022-10-19 07:57:44');

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
  `about` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mission` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `objectif` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(2, 'Bulega', 'Bulega est une plateforme web d\'identifications des personnes Legas dans l\'échel planétaire', 'info@bulega.org', 'Goma, quartier des volcans', '+243818472003', '+243971681767', '+243843044444', 'XYH34d258jhgd0Tdn', NULL, 'L’accès à des services professionnels de développement des start-ups, en particulier l’accélération, est\nune étape très importante pour les start-ups. Trouver la bonne structure, au bon endroit et au bon prix\nest crucial et pourtant la procédure la plus difficile. De plus, plus de 75% des jeunes entreprises dans la\nphase initiale de leur aventure entrepreneuriale s&#39;effondrent en RDC.\nAinsi, le Hub UJN en partenariat avec le Laboratoire d’Accélération du PNUD compte encourager la\nmentalité d&#39;innovation entrepreneuriale, stimuler la croissance économique, et créer des emplois\ndécents (ODD 8) afin de contribuer à la réduction de la pauvreté (ODD 1) en République Démocratique\ndu Congo, mais aussi dans le but de renforcer les capacités en innovation des porteurs des solutions\nretenus sur Goma, Beni et Kisangani, le programme prévoit d’organiser un Boot camp pour une durée\nde 2 semaines.', 'Objectif global : Organiser un boot camp à Goma en faveur des 15 porteurs des solutions innovantes\nretenus dans le cadre du projet JINNOV pour la phase de l’expérimentation.\nObjectifs spécifiques :\n- Améliorer les connaissances entrepreneuriales des 15 jeunes entrepreneurs en leurs donnant des\nformations sur les thèmes : Design Thinking, Discipline entrepreneurship, Anthropologie, les 7\nHabitudes des gens qui réussissent ce qu’ils entreprennent pendant les 2 semaines ;\n- Expérimenter les 15 solutions proposées par les jeunes entrepreneurs ;\n- Amener les 15 jeunes entrepreneurs porteurs des solutions à atteindre leurs objectifs entrepreneurials ;\n- Perfectionner le business Plan des 15 jeunes porteurs des solutions ;\n3. Résultats attendus\n- 15 porteurs de solutions sont formés au travers du Boot Camp à Goma ;\n- 15 jeunes entrepreneurs sont coachés ;\n- 15 porteurs des solutions font l’expérimentations de leurs projets ;\n- 15 porteurs des solutions pitchent leurs projets.\n- 15 porteurs des solutions ont un BP mis à jour après l’expérimentation ;\n4. Méthodologie\n- Exposé court sur la théorie générale relative à la matière ;\n- Échanges pratiques, réception du feed-back des apprenants et Exposés des projets par les\napprenants ;\n- Descente pour expérimentation.\n5. Lieu et durée :\nGoma Pendant 2 semaines', 'la politique', 'notre condition', 'site.jpg', 'https://web.facebook.com/Dream-of-drc-114107447382924', 'https://www.linkedin.com/in/dream-of-drc-startup-872765217/', 'https://twitter.com/drc_dream', 'https://youtube.com/', '2022-01-29 13:53:28', '2022-10-19 07:04:53');

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
(12, 6, 'Menaces', 'Menace 4', '2022-06-11 13:33:45', '2022-06-11 13:33:45'),
(13, 1, 'Forces', 'force 1', '2022-06-16 19:32:26', '2022-06-16 19:32:26'),
(14, 1, 'Forces', 'force 2', '2022-06-16 19:32:34', '2022-06-16 19:32:34'),
(15, 1, 'Faiblesses', 'faiblesse', '2022-06-16 19:32:48', '2022-06-16 19:32:48'),
(16, 1, 'Opportunités', 'opportunité', '2022-06-16 19:33:03', '2022-06-16 19:33:03'),
(17, 1, 'Menaces', 'menace 1', '2022-06-16 19:33:20', '2022-06-16 19:33:33');

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
-- Structure de la table `teams`
--

CREATE TABLE `teams` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nom` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titre` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `biographie` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `etat` int(11) NOT NULL DEFAULT 1,
  `facebook` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `teams`
--

INSERT INTO `teams` (`id`, `nom`, `email`, `titre`, `biographie`, `photo`, `etat`, `facebook`, `linkedin`, `twitter`, `telephone`, `created_at`, `updated_at`) VALUES
(3, 'Wilson vulembere', 'willsonantoine@gmail.com', 'I.T.I, Développeur', 'I.T.I, Développeur || Directeur et fondateur de Mlinzi Corporation', '1666175761.jpg', 1, 'https://www.linkedin.com/in/cedryson-vulembere-368a76ba/', 'linkedin.com/in/cedryson-vulembere-368a76ba', '', '+243990084881', '2022-07-13 11:17:05', '2022-10-19 08:36:01'),
(4, 'sumaili shabani roger', 'sumailiroger681@gmail.com', 'Fullstack developer', 'Techentrepreneur #ceo et fondateur de dream of drc sarl. apporteur de solutions numériques de la nouvelle technologie.', '1666175467.jpg', 1, 'https://web.facebook.com/patronat.shabanisumaili.9', 'linkedin.com/in/sumaili-shabani-roger-patrôna-7426a71a1', 'https://twitter.com/RogerPatrona', '+243817883541', '2022-07-13 11:19:07', '2022-10-19 08:31:07'),
(5, 'Chris Ayale ', 'ayale.chris@gmail.com', 'Responsable de l\'organisation', 'Fondateur et Ceo de l\'entreprise KivuGreen Corporation', '1666174477.jpg', 1, '', 'linkedin.com/in/chris-ayale-866458154', 'https://twitter.com/AyaleChris', '+243823268000', '2022-07-13 11:19:45', '2022-10-19 08:14:37'),
(7, 'Lucien (Delalune) Azmayawa', 'lucienazmayawa@gmail.com', 'Directeur de fabrique chez Goma Digital Academy', 'Directeur de fabrique chez Goma Digital Academy', '1666174304.jpg', 1, 'https://web.facebook.com/bernard.m.tshienda', 'https://www.linkedin.com/in/bernard-malaba-tshienda-3905575a/', 'https://twitter.com/bmtshienda', '+243818472003', '2022-07-13 11:25:59', '2022-10-19 08:11:44');

-- --------------------------------------------------------

--
-- Structure de la table `territoires`
--

CREATE TABLE `territoires` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomTerritoire` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `territoires`
--

INSERT INTO `territoires` (`id`, `nomTerritoire`, `created_at`, `updated_at`) VALUES
(1, 'Mwenga', '2022-10-19 06:53:17', '2022-10-19 06:53:17'),
(2, 'Shabunda', '2022-10-19 06:53:26', '2022-10-19 06:53:26'),
(3, 'Pangi', '2022-10-19 06:53:34', '2022-10-19 06:53:34'),
(4, 'Walikale', '2022-10-19 06:53:41', '2022-10-19 06:53:41');

-- --------------------------------------------------------

--
-- Structure de la table `theme_formes`
--

CREATE TABLE `theme_formes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nomTheme` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `theme_formes`
--

INSERT INTO `theme_formes` (`id`, `nomTheme`, `created_at`, `updated_at`) VALUES
(1, 'Protection sociale', '2022-07-07 07:33:10', '2022-07-07 07:33:10'),
(2, 'Insécurité alimentaire', '2022-07-07 07:33:22', '2022-07-07 07:33:22'),
(3, 'Éruption volcanique', '2022-07-07 07:33:31', '2022-07-07 07:33:31'),
(4, 'Santé et bien être', '2022-07-07 07:33:42', '2022-07-07 07:33:42'),
(5, 'Environnement et Écologie', '2022-07-07 07:33:53', '2022-07-07 07:33:53');

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
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `telephone`, `adresse`, `avatar`, `sexe`, `id_role`, `remember_token`, `created_at`, `updated_at`, `active`) VALUES
(1, 'user one', 'user@gmail.com', NULL, '$2y$10$a5FWP6l2FpvD8g2QcL0XAOYGOm05RCW5BcLpaSZ9RJtufRce3nlze', '+243817883541', 'Goma quartier himbi', '1643296973.webp', 'F', 2, 'Vq82sED4amcmdUNxk0u6W8HPuQknceQwsz2NobvwCDCrhmhGnMggU5WjQU0V', NULL, '2022-02-03 05:37:59', 1),
(2, 'user2', 'user2@gmail.com', NULL, '$2y$10$wn9c0j9xzMVMhpYZLAL8Cu0b9eZN3QebdSMOIjE4DNngwJxy/owI.', NULL, NULL, '1643296833.jpg', 'M', 2, '$2y$10$Tug/E8koDG.xEw3M.DluA.3hfS1ugnEH6WzbXxHVDbBk.JDdT/0Ha', NULL, '2022-01-27 13:20:33', 1),
(3, 'member', 'member@gmail.com', NULL, '$2y$10$2sZHAUEDtc79UiH/6PMBe.Mf7W4h2x.hG9vfUZ3HQiVZbFP//TEFK', NULL, NULL, '1643296874.jpg', 'M', 3, 'TDEVjRNM24nSyszHe7zFfrmMYaBQafwBCZlUMypV8RkQ8R4NMqRGDyyk1UcE', NULL, '2022-01-27 13:21:14', 1),
(4, 'administrateur lega', 'admin@gmail.com', NULL, '$2y$10$V0FmIG6fab5a1wxmwcwFUuHK5h.9SWChmP1LFXZ2676CCKnVeH1eG', '+243817883541', 'Goma, Katoyi', '1643812713.jpg', 'M', 1, 'rqAp1KcnvgOgwMVYSsZP34XOgjFwKYJ9GkFBbo3G31BLYaZRUkjHf9ZatKfN', NULL, '2022-10-18 12:15:48', 1),
(6, 'jojo', 'jojo@gmail.com', NULL, '$2y$10$aoWHyUaAEAjYsTALtxLksun/nYYQ9ylT9t5MRKvN.mQcJ48tUIJqG', '0817883541', 'goma katoyi', '1643296735.jpg', 'M', 2, '$2y$10$xZ0BLZRaYcKn7ZI5F59IeeVlxTtbaFOYiyEfNmOH1TE86D7DR/Jw.', NULL, '2022-01-27 13:18:55', 1),
(7, 'joel', 'joel@gmail.com', NULL, '$2y$10$IAEW8G7YBNcYPz.rIBVuz.EPkRmpCg6j8Nf2S3LcKUwSPinYAQN7y', '0970524665', 'Goma Ndosho', '1643297170.jpg', 'M', 3, 'ag6cmnntycjMnrJulnZG2MySY9iGEEhZRe5wSiMxfXwdhVB3ZF89xQAokAx9', '2022-01-27 13:14:47', '2022-01-27 13:26:32', 1),
(9, 'jonathan kambere', 'jonathan@gmail.com', NULL, '$2y$10$rAACs28vmfFg/sbDKOSG1.rLuhhKU/uFKbOpwcy3nSpkPIsp8w6j6', '+243817883541', 'goma himbi', '1654038836.jpg', 'M', 2, '$2y$10$b.uaphKq66QNCnp7vyVxxO3LZ9rFMSs/guRkbl0y1g2ySqOrODcsS', NULL, '2022-05-31 19:13:56', 1),
(10, 'Victor shukuru', 'victor@gmail.com', NULL, '$2y$10$HJfYk412uUod4fy/F.n/s.oOSVzGfxtws8pnEP/0hS9pKaVM7Mk6.', '0823456789', 'Goma', 'avatar.png', 'M', 2, '$2y$10$B61dMeAbZt0X7Ozq2c1Wve5PSemP2SRVCO10VO9fOxHocL/hrUkdm', NULL, NULL, 1),
(11, 'Roger sumaili', 'sumailiroger681@gmail.com', NULL, '$2y$10$49XVZ3daXANHE2VrjqetJONl5P4wIb/WS5lpoHW4zuG2K7umH.tiC', '+243970524665', 'Goma', '1654038823.jpg', 'M', 2, 'Jd1TJv0YIRiszakK4mAIwSkBOfyC7dmELoZvNXmqcUT25oAsX1IlvQE57WlT', NULL, '2022-05-31 19:13:44', 1),
(12, 'Benit bahati', 'benitbahati@gmail.com', NULL, '$2y$10$UVVQBLvvqgzuOcujjeE6AOpge84Rx8WZJMixCArUB5SJ1fUdpLBpu', '+142857823567', 'Goma', '1654038789.jpg', 'M', 2, '$2y$10$DvAHs0GxDATht5k542jcte9qqE0LYntoqYyXrW3VvGN2HezjI75y.', NULL, '2022-05-31 19:13:09', 1),
(13, 'Pionde bin sefu', 'pionde@gmail.com', NULL, '$2y$10$nfkWVY2tDFbjg49bfE/Fnehxfrs/vGg.MBar76Gp8QEKw3i/exa1y', '+243817883541', 'Kisangani', '1654038894.jpg', 'M', 2, '$2y$10$ivR38s3LhmBwwe1JhkMjM.uFRC/uSp0k6edq.F8qOo32HdF.I79PW', NULL, '2022-05-31 19:14:54', 1),
(14, 'Elégance daula', 'elgadaula@gmail.com', NULL, '$2y$10$wUhtw.5bdY64Z8ysYKVq6.C0AvXei1ee45nl0iwcArjuDh9cMZk.q', '+243816234903', 'Kisangani', '1654038776.jpg', 'F', 2, '$2y$10$Pb/ItzClgKbqYTVGCcwpOe9OJRr7h2N.eWfnAvKOl9Ead1Sdbm5IO', NULL, '2022-05-31 19:12:56', 1),
(15, 'john smith', 'johnsmith@gmail.com', NULL, '$2y$10$7TYio3TjCaK1vfO43sdVwe1yCg.uyBTODfUkuL.6eKlEOBIRczCfW', '+243817883541', 'Beni', '1654038767.jpg', 'M', 2, '$2y$10$Ct/fL6sUQmMDW8CygIx2fuE4WsVjvjlfX2s9gyASjCgv0lG2iV3Ka', NULL, '2022-05-31 19:16:58', 1),
(16, 'jojo kahembe', 'jojo@gmail.com', NULL, '$2y$10$xTXaFvYC2LTU.oDnvMXqquAyal6H7.l/WJmFhnKEKvy1N5WSOk/2O', NULL, NULL, 'avatar.png', 'M', 2, '$2y$10$j9lYKwSc4p1rI4U0sQTOGOauFtRATzmNmwqIUu0cuHAtdazpCKpSS', NULL, NULL, 0),
(17, 'Patrick ombeni', 'patrick@gmail.com', NULL, '$2y$10$uAKvBshLnpTli5TGrP9A0uXmZl.UzJ1FRut5uEEa6MyYqKptleQRa', NULL, NULL, '1655789076.jpg', 'M', 2, '$2y$10$IVo.bNSnPgyq.6rFzUxhPOZ1xAmvuD6T3xc3JcJEgtj/O8aYWejfa', NULL, '2022-06-21 03:24:36', 0),
(18, 'jonathan dufina', 'jonathan12@gmail.com', NULL, '$2y$10$k.atrYUfNHhUqXu5kuoHye4Ibitvgyit0o.vCpdre8RS15FNd0wiW', NULL, NULL, '1655788876.jpg', 'M', 2, '$2y$10$5Jg6nldOfetBkxocGACXB.64YRg4/TYN5zUEg8hAVBBfj0RQrR5Oa', NULL, '2022-06-21 03:21:16', 1),
(19, 'jonathan board', 'grafikart@gmail.com', NULL, '$2y$10$rMtRJDBgQX5gRX1OlrrI1OOn/lfTFcxj6T7WSVAeI1i6bALMbEYFO', NULL, NULL, 'avatar.png', 'M', 2, '$2y$10$L8apYY7zQ64rrYpAijRla.TOvGYufvq9TrO7foJ.wNN4KXBIiumV6', NULL, NULL, 0),
(21, 'Pionde bien sefu', 'piondesefu123@gmail.com', NULL, '$2y$10$89Lsat0OoFMzXsp04EuxzeQc5xQIOQ774s51v/CPA6XzSxVju2wqu', '0817883541', 'Goma himbi', 'avatar.png', 'M', 2, '$2y$10$juF6VS0CxhueOWjyFyqMneyyndS1ro7iImVQPExJS8z46zEScTMjW', NULL, '2022-10-17 21:53:39', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user_attendaces`
--

CREATE TABLE `user_attendaces` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telephone` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adresse` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sexe` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT 0,
  `id_role` int(11) NOT NULL DEFAULT 2,
  `nomP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descriptionP` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `avancementP` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentaire` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_theme` int(11) NOT NULL,
  `id_odd` int(11) NOT NULL,
  `date_naiss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nbremploye` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_attendaces`
--

INSERT INTO `user_attendaces` (`id`, `name`, `email`, `email_verified_at`, `password`, `telephone`, `adresse`, `avatar`, `sexe`, `active`, `id_role`, `nomP`, `descriptionP`, `avancementP`, `commentaire`, `id_theme`, `id_odd`, `date_naiss`, `nbremploye`, `created_at`, `updated_at`) VALUES
(1, 'Sumbu leonard', 'sumbu@gmail.com', NULL, '123456', '0817883541', 'virunga goma', NULL, 'F', 0, 2, 'julisha', 'brevet', 'prototypage 78', 'commentaire 1334', 3, 4, '1998-07-08', '15-20', '2022-07-08 12:13:43', '2022-07-08 12:21:34'),
(2, 'cool le boss', 'coucou@gmail.com', NULL, '12345678', '0817883541', 'Goma', NULL, 'M', 0, 2, 'Payondgo', 'description locale', 'ok', 'ok', 2, 2, '1999-07-08', '5-10', '2022-07-08 12:18:32', '2022-07-08 12:21:30'),
(5, 'susu kahembe', 'susu@gmail.com', NULL, '123456', '0817883541', 'Goma tmk', NULL, 'F', 0, 2, 'Goma chai', 'description de goma chai', 'prototypage', 'description de goma chai drc', 4, 3, '2022-07-08', '10-15', '2022-07-08 13:25:18', '2022-07-08 13:25:18'),
(6, 'sus leo', 'sus@gmail.com', NULL, '123456', '0817883541', 'goma', NULL, 'M', 0, 2, 'Goma chai', 'description Goma chai', 'prototypage', 'commentaire Goma chai', 4, 3, '2022-07-08', '5-10', '2022-07-08 13:29:44', '2022-07-08 13:29:44'),
(7, 'Kahembe tumba', 'kahembetumba@gmail.com', NULL, '12345678', '0817883541', 'Goma himbi', NULL, 'M', 0, 2, 'SoS Afia', 'ok', 'Prototype', 'Lol', 4, 3, '1997-07-13', '1-5', '2022-07-13 19:55:30', '2022-07-13 19:55:30');

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
(1, 'Actualité', 'description de la video 1', 'https://www.youtube.com/watch?v=hfVgvN_8bhY', '2022-02-02 13:09:12', '2022-10-19 07:36:11'),
(2, 'Codding train', 'cool', 'https://www.youtube.com/watch?v=hfVgvN_8bhY', '2022-02-02 13:10:37', '2022-07-11 10:38:20'),
(4, 'Life Week end du Vendredi 4 Septembre 2020 avec Emma Lohoues', 'Ce Vendredi 4 Septembre 2020,  Konnie et les girls du #LifeWKD étaient en compagnie de Emma Lohoues pour la dernière émission de la saison 1.', 'https://youtu.be/xQIFzLBB0h8', '2022-07-11 10:38:02', '2022-07-11 10:38:02'),
(5, 'Apoutchou Life - La réunion (lancement)', 'Retrouvez également l\'émission sur le Lifeplay  👉http://www.lifeplay.ci\n#Lifetv', 'https://youtu.be/P36w5f345r0', '2022-07-11 10:39:27', '2022-07-11 10:39:27'),
(6, 'APOUTCHOU LIFE - Episode 1', 'Retrouvez également l\'émission sur le Lifeplay  👉http://www.lifeplay.ci \n#LifeTV', 'https://youtu.be/AKRiNaEwEuw', '2022-07-11 10:40:19', '2022-07-11 10:40:19'),
(7, 'La minute sans filtre Apoutchou Life Part 1', '#Lifetv', 'https://youtu.be/mxj8paTGVG8', '2022-07-11 10:41:38', '2022-07-11 10:41:38');

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
(1, 6, 'MAP DEMO API WITH CODEIGNITER(PHP) MYSQL', 'C\'est une vidéo de démonstration de l\'api google map en codeigniter avec mysql. la localisation des hôpitaux de la ville de Goma', 'https://www.youtube.com/embed/XTW6z0UhaPE', '2022-06-04 09:40:32', '2022-07-02 11:25:19'),
(2, 6, 'Apprendre à utiliser l\'application de transfert des bagages dans une agence aérienne', 'c\'est une application complète de la gestion de transfert de bagages', 'https://www.youtube.com/embed/H2rHGNJKNts', '2022-06-04 09:42:20', '2022-06-04 09:42:20'),
(3, 6, 'Flutter Backend | Flutter Laravel Backend PHP | Flutter Rest API | Flutter Http Post Request', 'Here you will learn how to create flutter app with backend with Laravel and PHP. Flutter Rest API use for sign up, sign in, login, logout with post, get HTTP request based on laravel admin panel based on PHP.  This works a s web backend as well. This backend is done using PHP Laravel', 'https://www.youtube.com/embed/kTrbcb21ENU', '2022-06-04 09:44:42', '2022-06-04 09:44:42'),
(4, 6, 'Flutter API Laravel - CRUD test POSTMAN y Device Video #3/3', 'CC English subtitles\n\nCRUD API Laravel - Flutter\nwe consume the services from flutter\n\nCRUD completo desde Laravel y consumismos sus servicios REST API desde Flutter\n\nContinuamos trabajando basados en los dos vídeos anteriores', 'https://www.youtube.com/embed/mdQ7eEeNefc', '2022-06-04 09:47:37', '2022-06-11 17:15:08'),
(5, 6, 'Flutter API Laravel - JWT Authenticacion - save state login Video #1', 'Creation of the API in Laravel, we consume the services with Flutter, initially we log in that allows us to maintain its status, it means that if you re-enter the App you should not ask for the login data, we will surely continue with a CRUD.', 'https://www.youtube.com/embed/h1JAAYGvm7M', '2022-06-04 09:49:32', '2022-06-04 09:49:32'),
(6, 6, 'Buld chat application in Vuejs - Vuetify UI Design, Messenger & Chating', 'In this tutorial we\'ll learn How to design a Modern Messenger & chating   dashboard application ( web design ) using vuetify and  vuejs 2 , material design icons, Font Awsome icons.\nSidebar, Card, Aavatar, list item, expantion .', 'https://www.youtube.com/embed/S1mAt8pKjUk', '2022-06-04 09:50:30', '2022-06-20 11:57:44'),
(10, 1, 'DOSSEH : \"Habitué\" (live @ Hip Hop Symphonique 3)', 'Dosseh a performé \"Habitué\" accompagné par The Ice Kream et l\'Orchestre Philharmonique de Radio France, enregistré à l\'occasion de Hip Hip symphonique 3, un concert coproduit par  Mouv’, l’Adami et l’orchestre philharmonique de Radio France.', 'https://youtu.be/BZyCRdgnu-0', '2022-06-16 19:11:43', '2022-06-16 19:11:43'),
(11, 1, 'Charlotte Dipanda - Coucou feat Singuila - Live au Grand Rex - Paris', 'Retrouve Charlotte Dipanda sur :\n\nSite Officiel : http://www.charlottedipandamusic.com', 'https://youtu.be/zeez4OmkgwU', '2022-06-16 19:11:58', '2022-06-16 19:13:29');

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
-- Index pour la table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category_articles`
--
ALTER TABLE `category_articles`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `contact_infos`
--
ALTER TABLE `contact_infos`
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
-- Index pour la table `messages`
--
ALTER TABLE `messages`
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
-- Index pour la table `odd_formes`
--
ALTER TABLE `odd_formes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `odd_formes_odd_unique` (`odd`);

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
-- Index pour la table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `territoires`
--
ALTER TABLE `territoires`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `territoires_nomterritoire_unique` (`nomTerritoire`);

--
-- Index pour la table `theme_formes`
--
ALTER TABLE `theme_formes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_attendaces`
--
ALTER TABLE `user_attendaces`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_attendaces_email_unique` (`email`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `busness_plans`
--
ALTER TABLE `busness_plans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `category_articles`
--
ALTER TABLE `category_articles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `contact_infos`
--
ALTER TABLE `contact_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `entreprises`
--
ALTER TABLE `entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `link_canvases`
--
ALTER TABLE `link_canvases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `link_canvas_deuxes`
--
ALTER TABLE `link_canvas_deuxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `mot_semaines`
--
ALTER TABLE `mot_semaines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `odd_formes`
--
ALTER TABLE `odd_formes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `pitches`
--
ALTER TABLE `pitches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `sites`
--
ALTER TABLE `sites`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `swots`
--
ALTER TABLE `swots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `swot_deuxes`
--
ALTER TABLE `swot_deuxes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `territoires`
--
ALTER TABLE `territoires`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `theme_formes`
--
ALTER TABLE `theme_formes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT pour la table `user_attendaces`
--
ALTER TABLE `user_attendaces`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `video_entreprises`
--
ALTER TABLE `video_entreprises`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
