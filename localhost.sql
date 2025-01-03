SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `wagtailDevelopment` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci;
USE `wagtailDevelopment`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'Editors'),
(1, 'Moderators');

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(2, 1, 101),
(7, 1, 102),
(8, 1, 103),
(6, 1, 104),
(10, 1, 105),
(14, 1, 106),
(15, 1, 107),
(16, 1, 108),
(18, 1, 109),
(1, 2, 101),
(4, 2, 102),
(5, 2, 103),
(3, 2, 104),
(9, 2, 105),
(11, 2, 106),
(12, 2, 107),
(13, 2, 108),
(17, 2, 109);

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add locale', 3, 'add_locale'),
(2, 'Can change locale', 3, 'change_locale'),
(3, 'Can delete locale', 3, 'delete_locale'),
(4, 'Can view locale', 3, 'view_locale'),
(5, 'Can add site', 4, 'add_site'),
(6, 'Can change site', 4, 'change_site'),
(7, 'Can delete site', 4, 'delete_site'),
(8, 'Can view site', 4, 'view_site'),
(9, 'Can add model log entry', 5, 'add_modellogentry'),
(10, 'Can change model log entry', 5, 'change_modellogentry'),
(11, 'Can delete model log entry', 5, 'delete_modellogentry'),
(12, 'Can view model log entry', 5, 'view_modellogentry'),
(13, 'Can add collection view restriction', 6, 'add_collectionviewrestriction'),
(14, 'Can change collection view restriction', 6, 'change_collectionviewrestriction'),
(15, 'Can delete collection view restriction', 6, 'delete_collectionviewrestriction'),
(16, 'Can view collection view restriction', 6, 'view_collectionviewrestriction'),
(17, 'Can add collection', 7, 'add_collection'),
(18, 'Can change collection', 7, 'change_collection'),
(19, 'Can delete collection', 7, 'delete_collection'),
(20, 'Can view collection', 7, 'view_collection'),
(21, 'Can add group collection permission', 8, 'add_groupcollectionpermission'),
(22, 'Can change group collection permission', 8, 'change_groupcollectionpermission'),
(23, 'Can delete group collection permission', 8, 'delete_groupcollectionpermission'),
(24, 'Can view group collection permission', 8, 'view_groupcollectionpermission'),
(25, 'Can add uploaded file', 9, 'add_uploadedfile'),
(26, 'Can change uploaded file', 9, 'change_uploadedfile'),
(27, 'Can delete uploaded file', 9, 'delete_uploadedfile'),
(28, 'Can view uploaded file', 9, 'view_uploadedfile'),
(29, 'Can add reference index', 10, 'add_referenceindex'),
(30, 'Can change reference index', 10, 'change_referenceindex'),
(31, 'Can delete reference index', 10, 'delete_referenceindex'),
(32, 'Can view reference index', 10, 'view_referenceindex'),
(33, 'Can add page', 1, 'add_page'),
(34, 'Can change page', 1, 'change_page'),
(35, 'Can delete page', 1, 'delete_page'),
(36, 'Can view page', 1, 'view_page'),
(37, 'Delete pages with children', 1, 'bulk_delete_page'),
(38, 'Lock/unlock pages you\'ve locked', 1, 'lock_page'),
(39, 'Publish any page', 1, 'publish_page'),
(40, 'Unlock any page', 1, 'unlock_page'),
(41, 'Can add revision', 11, 'add_revision'),
(42, 'Can change revision', 11, 'change_revision'),
(43, 'Can delete revision', 11, 'delete_revision'),
(44, 'Can view revision', 11, 'view_revision'),
(45, 'Can add group page permission', 12, 'add_grouppagepermission'),
(46, 'Can change group page permission', 12, 'change_grouppagepermission'),
(47, 'Can delete group page permission', 12, 'delete_grouppagepermission'),
(48, 'Can view group page permission', 12, 'view_grouppagepermission'),
(49, 'Can add page view restriction', 13, 'add_pageviewrestriction'),
(50, 'Can change page view restriction', 13, 'change_pageviewrestriction'),
(51, 'Can delete page view restriction', 13, 'delete_pageviewrestriction'),
(52, 'Can view page view restriction', 13, 'view_pageviewrestriction'),
(53, 'Can add workflow page', 14, 'add_workflowpage'),
(54, 'Can change workflow page', 14, 'change_workflowpage'),
(55, 'Can delete workflow page', 14, 'delete_workflowpage'),
(56, 'Can view workflow page', 14, 'view_workflowpage'),
(57, 'Can add workflow content type', 15, 'add_workflowcontenttype'),
(58, 'Can change workflow content type', 15, 'change_workflowcontenttype'),
(59, 'Can delete workflow content type', 15, 'delete_workflowcontenttype'),
(60, 'Can view workflow content type', 15, 'view_workflowcontenttype'),
(61, 'Can add workflow task order', 16, 'add_workflowtask'),
(62, 'Can change workflow task order', 16, 'change_workflowtask'),
(63, 'Can delete workflow task order', 16, 'delete_workflowtask'),
(64, 'Can view workflow task order', 16, 'view_workflowtask'),
(65, 'Can add task', 17, 'add_task'),
(66, 'Can change task', 17, 'change_task'),
(67, 'Can delete task', 17, 'delete_task'),
(68, 'Can view task', 17, 'view_task'),
(69, 'Can add workflow', 18, 'add_workflow'),
(70, 'Can change workflow', 18, 'change_workflow'),
(71, 'Can delete workflow', 18, 'delete_workflow'),
(72, 'Can view workflow', 18, 'view_workflow'),
(73, 'Can add Group approval task', 2, 'add_groupapprovaltask'),
(74, 'Can change Group approval task', 2, 'change_groupapprovaltask'),
(75, 'Can delete Group approval task', 2, 'delete_groupapprovaltask'),
(76, 'Can view Group approval task', 2, 'view_groupapprovaltask'),
(77, 'Can add Workflow state', 19, 'add_workflowstate'),
(78, 'Can change Workflow state', 19, 'change_workflowstate'),
(79, 'Can delete Workflow state', 19, 'delete_workflowstate'),
(80, 'Can view Workflow state', 19, 'view_workflowstate'),
(81, 'Can add Task state', 20, 'add_taskstate'),
(82, 'Can change Task state', 20, 'change_taskstate'),
(83, 'Can delete Task state', 20, 'delete_taskstate'),
(84, 'Can view Task state', 20, 'view_taskstate'),
(85, 'Can add page log entry', 21, 'add_pagelogentry'),
(86, 'Can change page log entry', 21, 'change_pagelogentry'),
(87, 'Can delete page log entry', 21, 'delete_pagelogentry'),
(88, 'Can view page log entry', 21, 'view_pagelogentry'),
(89, 'Can add comment', 22, 'add_comment'),
(90, 'Can change comment', 22, 'change_comment'),
(91, 'Can delete comment', 22, 'delete_comment'),
(92, 'Can view comment', 22, 'view_comment'),
(93, 'Can add comment reply', 23, 'add_commentreply'),
(94, 'Can change comment reply', 23, 'change_commentreply'),
(95, 'Can delete comment reply', 23, 'delete_commentreply'),
(96, 'Can view comment reply', 23, 'view_commentreply'),
(97, 'Can add page subscription', 24, 'add_pagesubscription'),
(98, 'Can change page subscription', 24, 'change_pagesubscription'),
(99, 'Can delete page subscription', 24, 'delete_pagesubscription'),
(100, 'Can view page subscription', 24, 'view_pagesubscription'),
(101, 'Can access Wagtail admin', 25, 'access_admin'),
(102, 'Can add document', 26, 'add_document'),
(103, 'Can change document', 26, 'change_document'),
(104, 'Can delete document', 26, 'delete_document'),
(105, 'Can choose document', 26, 'choose_document'),
(106, 'Can add image', 27, 'add_image'),
(107, 'Can change image', 27, 'change_image'),
(108, 'Can delete image', 27, 'delete_image'),
(109, 'Can choose image', 27, 'choose_image'),
(110, 'Can add home', 28, 'add_home'),
(111, 'Can change home', 28, 'change_home'),
(112, 'Can delete home', 28, 'delete_home'),
(113, 'Can view home', 28, 'view_home'),
(114, 'Can add informacion', 29, 'add_informacion'),
(115, 'Can change informacion', 29, 'change_informacion'),
(116, 'Can delete informacion', 29, 'delete_informacion'),
(117, 'Can view informacion', 29, 'view_informacion'),
(118, 'Can add inicio', 30, 'add_inicio'),
(119, 'Can change inicio', 30, 'change_inicio'),
(120, 'Can delete inicio', 30, 'delete_inicio'),
(121, 'Can view inicio', 30, 'view_inicio'),
(122, 'Can add Tour Category', 31, 'add_tourcategory'),
(123, 'Can change Tour Category', 31, 'change_tourcategory'),
(124, 'Can delete Tour Category', 31, 'delete_tourcategory'),
(125, 'Can view Tour Category', 31, 'view_tourcategory'),
(126, 'Can add cloudinary image', 32, 'add_cloudinaryimage'),
(127, 'Can change cloudinary image', 32, 'change_cloudinaryimage'),
(128, 'Can delete cloudinary image', 32, 'delete_cloudinaryimage'),
(129, 'Can view cloudinary image', 32, 'view_cloudinaryimage'),
(130, 'Can add destino', 33, 'add_destino'),
(131, 'Can change destino', 33, 'change_destino'),
(132, 'Can delete destino', 33, 'delete_destino'),
(133, 'Can view destino', 33, 'view_destino'),
(134, 'Can add gallery carousel', 34, 'add_gallerycarousel'),
(135, 'Can change gallery carousel', 34, 'change_gallerycarousel'),
(136, 'Can delete gallery carousel', 34, 'delete_gallerycarousel'),
(137, 'Can view gallery carousel', 34, 'view_gallerycarousel'),
(138, 'Can add faq', 35, 'add_faq'),
(139, 'Can change faq', 35, 'change_faq'),
(140, 'Can delete faq', 35, 'delete_faq'),
(141, 'Can view faq', 35, 'view_faq'),
(142, 'Can add nosotros', 36, 'add_nosotros'),
(143, 'Can change nosotros', 36, 'change_nosotros'),
(144, 'Can delete nosotros', 36, 'delete_nosotros'),
(145, 'Can view nosotros', 36, 'view_nosotros'),
(146, 'Can add estadisticas', 37, 'add_estadisticas'),
(147, 'Can change estadisticas', 37, 'change_estadisticas'),
(148, 'Can delete estadisticas', 37, 'delete_estadisticas'),
(149, 'Can view estadisticas', 37, 'view_estadisticas'),
(150, 'Can add certificados', 38, 'add_certificados'),
(151, 'Can change certificados', 38, 'change_certificados'),
(152, 'Can delete certificados', 38, 'delete_certificados'),
(153, 'Can view certificados', 38, 'view_certificados'),
(154, 'Can add partners', 39, 'add_partners'),
(155, 'Can change partners', 39, 'change_partners'),
(156, 'Can delete partners', 39, 'delete_partners'),
(157, 'Can view partners', 39, 'view_partners'),
(158, 'Can add valores', 40, 'add_valores'),
(159, 'Can change valores', 40, 'change_valores'),
(160, 'Can delete valores', 40, 'delete_valores'),
(161, 'Can view valores', 40, 'view_valores'),
(162, 'Can add cloudinary rendition', 41, 'add_cloudinaryrendition'),
(163, 'Can change cloudinary rendition', 41, 'change_cloudinaryrendition'),
(164, 'Can delete cloudinary rendition', 41, 'delete_cloudinaryrendition'),
(165, 'Can view cloudinary rendition', 41, 'view_cloudinaryrendition'),
(166, 'Can add paquete', 42, 'add_paquete'),
(167, 'Can change paquete', 42, 'change_paquete'),
(168, 'Can delete paquete', 42, 'delete_paquete'),
(169, 'Can view paquete', 42, 'view_paquete'),
(170, 'Can add incluido item paquete', 43, 'add_incluidoitempaquete'),
(171, 'Can change incluido item paquete', 43, 'change_incluidoitempaquete'),
(172, 'Can delete incluido item paquete', 43, 'delete_incluidoitempaquete'),
(173, 'Can view incluido item paquete', 43, 'view_incluidoitempaquete'),
(174, 'Can add gallery carousel', 44, 'add_gallerycarousel'),
(175, 'Can change gallery carousel', 44, 'change_gallerycarousel'),
(176, 'Can delete gallery carousel', 44, 'delete_gallerycarousel'),
(177, 'Can view gallery carousel', 44, 'view_gallerycarousel'),
(178, 'Can add excluido item paquete', 45, 'add_excluidoitempaquete'),
(179, 'Can change excluido item paquete', 45, 'change_excluidoitempaquete'),
(180, 'Can delete excluido item paquete', 45, 'delete_excluidoitempaquete'),
(181, 'Can view excluido item paquete', 45, 'view_excluidoitempaquete'),
(182, 'Can add dias', 46, 'add_dias'),
(183, 'Can change dias', 46, 'change_dias'),
(184, 'Can delete dias', 46, 'delete_dias'),
(185, 'Can view dias', 46, 'view_dias'),
(186, 'Can add tour', 47, 'add_tour'),
(187, 'Can change tour', 47, 'change_tour'),
(188, 'Can delete tour', 47, 'delete_tour'),
(189, 'Can view tour', 47, 'view_tour'),
(190, 'Can add incluido item paquete', 48, 'add_incluidoitempaquete'),
(191, 'Can change incluido item paquete', 48, 'change_incluidoitempaquete'),
(192, 'Can delete incluido item paquete', 48, 'delete_incluidoitempaquete'),
(193, 'Can view incluido item paquete', 48, 'view_incluidoitempaquete'),
(194, 'Can add gallery carousel', 49, 'add_gallerycarousel'),
(195, 'Can change gallery carousel', 49, 'change_gallerycarousel'),
(196, 'Can delete gallery carousel', 49, 'delete_gallerycarousel'),
(197, 'Can view gallery carousel', 49, 'view_gallerycarousel'),
(198, 'Can add excluido item paquete', 50, 'add_excluidoitempaquete'),
(199, 'Can change excluido item paquete', 50, 'change_excluidoitempaquete'),
(200, 'Can delete excluido item paquete', 50, 'delete_excluidoitempaquete'),
(201, 'Can view excluido item paquete', 50, 'view_excluidoitempaquete'),
(202, 'Can add log entry', 51, 'add_logentry'),
(203, 'Can change log entry', 51, 'change_logentry'),
(204, 'Can delete log entry', 51, 'delete_logentry'),
(205, 'Can view log entry', 51, 'view_logentry'),
(206, 'Can add permission', 52, 'add_permission'),
(207, 'Can change permission', 52, 'change_permission'),
(208, 'Can delete permission', 52, 'delete_permission'),
(209, 'Can view permission', 52, 'view_permission'),
(210, 'Can add group', 53, 'add_group'),
(211, 'Can change group', 53, 'change_group'),
(212, 'Can delete group', 53, 'delete_group'),
(213, 'Can view group', 53, 'view_group'),
(214, 'Can add user', 54, 'add_user'),
(215, 'Can change user', 54, 'change_user'),
(216, 'Can delete user', 54, 'delete_user'),
(217, 'Can view user', 54, 'view_user'),
(218, 'Can add content type', 55, 'add_contenttype'),
(219, 'Can change content type', 55, 'change_contenttype'),
(220, 'Can delete content type', 55, 'delete_contenttype'),
(221, 'Can view content type', 55, 'view_contenttype'),
(222, 'Can add session', 56, 'add_session'),
(223, 'Can change session', 56, 'change_session'),
(224, 'Can delete session', 56, 'delete_session'),
(225, 'Can view session', 56, 'view_session'),
(226, 'Can add form submission', 57, 'add_formsubmission'),
(227, 'Can change form submission', 57, 'change_formsubmission'),
(228, 'Can delete form submission', 57, 'delete_formsubmission'),
(229, 'Can view form submission', 57, 'view_formsubmission'),
(230, 'Can add redirect', 58, 'add_redirect'),
(231, 'Can change redirect', 58, 'change_redirect'),
(232, 'Can delete redirect', 58, 'delete_redirect'),
(233, 'Can view redirect', 58, 'view_redirect'),
(234, 'Can submit translations', 59, 'submit_translation'),
(235, 'Can add embed', 60, 'add_embed'),
(236, 'Can change embed', 60, 'change_embed'),
(237, 'Can delete embed', 60, 'delete_embed'),
(238, 'Can view embed', 60, 'view_embed'),
(239, 'Can add user profile', 61, 'add_userprofile'),
(240, 'Can change user profile', 61, 'change_userprofile'),
(241, 'Can delete user profile', 61, 'delete_userprofile'),
(242, 'Can view user profile', 61, 'view_userprofile'),
(243, 'Can view document', 26, 'view_document'),
(244, 'Can view image', 27, 'view_image'),
(245, 'Can add rendition', 62, 'add_rendition'),
(246, 'Can change rendition', 62, 'change_rendition'),
(247, 'Can delete rendition', 62, 'delete_rendition'),
(248, 'Can view rendition', 62, 'view_rendition'),
(249, 'Can add index entry', 63, 'add_indexentry'),
(250, 'Can change index entry', 63, 'change_indexentry'),
(251, 'Can delete index entry', 63, 'delete_indexentry'),
(252, 'Can view index entry', 63, 'view_indexentry'),
(253, 'Can add tag', 64, 'add_tag'),
(254, 'Can change tag', 64, 'change_tag'),
(255, 'Can delete tag', 64, 'delete_tag'),
(256, 'Can view tag', 64, 'view_tag'),
(257, 'Can add tagged item', 65, 'add_taggeditem'),
(258, 'Can change tagged item', 65, 'change_taggeditem'),
(259, 'Can delete tagged item', 65, 'delete_taggeditem'),
(260, 'Can view tagged item', 65, 'view_taggeditem'),
(261, 'Can add global', 66, 'add_global'),
(262, 'Can change global', 66, 'change_global'),
(263, 'Can delete global', 66, 'delete_global'),
(264, 'Can view global', 66, 'view_global'),
(265, 'Can add contacto', 67, 'add_contacto'),
(266, 'Can change contacto', 67, 'change_contacto'),
(267, 'Can delete contacto', 67, 'delete_contacto'),
(268, 'Can view contacto', 67, 'view_contacto');

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$720000$PyuflhSFRkh4Be63KeGbY2$/QRjpANEc8IrQpSXDILF7KMNOvI+LJ5Kwu22Za/lbA0=', '2024-07-29 21:17:52.530932', 1, 'admin', '', '', 'job@gmail.com', 1, 1, '2024-07-04 15:31:46.490579'),
(2, 'pbkdf2_sha256$720000$5VMCtvlfiwE3t6ZfEjcOD9$85MSp2/opLlqdkSBgzIgVWwdM6VxBCv0udTQ6nY5cAI=', '2024-07-23 16:26:49.288490', 0, 'David', 'David', 'Rondan', 'job@gmail.com', 0, 1, '2024-07-10 23:44:08.940235'),
(3, 'pbkdf2_sha256$720000$hauOzYAz5siaXUe2Z5SPKg$TVyimE3Q61ZwQjPgT+LDz0ReKRkrl9Uf+VLVz2jtATs=', '2024-07-25 21:23:18.659031', 0, 'Doris', 'Doris', 'Ataulluco Huaman', 'test@gmail.com', 0, 1, '2024-07-23 19:43:14.627461'),
(4, 'pbkdf2_sha256$720000$VRpbm7zJ2VKZ0YGzBx8vIo$rNvnqXo3/qcRJbbREMCpttrutOnaLwEgUavSNFuE9zk=', '2024-07-23 19:48:04.356916', 0, 'Israel', 'Israel', 'Rondan', 'test@gmail.com', 0, 1, '2024-07-23 19:46:37.181623');

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 2, 1),
(5, 3, 1),
(2, 3, 2),
(3, 4, 1),
(4, 4, 2);

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(51, 'admin', 'logentry'),
(53, 'auth', 'group'),
(52, 'auth', 'permission'),
(54, 'auth', 'user'),
(55, 'contenttypes', 'contenttype'),
(38, 'home', 'certificados'),
(32, 'home', 'cloudinaryimage'),
(41, 'home', 'cloudinaryrendition'),
(67, 'home', 'contacto'),
(33, 'home', 'destino'),
(37, 'home', 'estadisticas'),
(35, 'home', 'faq'),
(34, 'home', 'gallerycarousel'),
(66, 'home', 'global'),
(28, 'home', 'home'),
(29, 'home', 'informacion'),
(30, 'home', 'inicio'),
(36, 'home', 'nosotros'),
(39, 'home', 'partners'),
(31, 'home', 'tourcategory'),
(40, 'home', 'valores'),
(46, 'paquete', 'dias'),
(45, 'paquete', 'excluidoitempaquete'),
(44, 'paquete', 'gallerycarousel'),
(43, 'paquete', 'incluidoitempaquete'),
(42, 'paquete', 'paquete'),
(56, 'sessions', 'session'),
(59, 'simple_translation', 'simpletranslation'),
(64, 'taggit', 'tag'),
(65, 'taggit', 'taggeditem'),
(50, 'tour', 'excluidoitempaquete'),
(49, 'tour', 'gallerycarousel'),
(48, 'tour', 'incluidoitempaquete'),
(47, 'tour', 'tour'),
(25, 'wagtailadmin', 'admin'),
(7, 'wagtailcore', 'collection'),
(6, 'wagtailcore', 'collectionviewrestriction'),
(22, 'wagtailcore', 'comment'),
(23, 'wagtailcore', 'commentreply'),
(2, 'wagtailcore', 'groupapprovaltask'),
(8, 'wagtailcore', 'groupcollectionpermission'),
(12, 'wagtailcore', 'grouppagepermission'),
(3, 'wagtailcore', 'locale'),
(5, 'wagtailcore', 'modellogentry'),
(1, 'wagtailcore', 'page'),
(21, 'wagtailcore', 'pagelogentry'),
(24, 'wagtailcore', 'pagesubscription'),
(13, 'wagtailcore', 'pageviewrestriction'),
(10, 'wagtailcore', 'referenceindex'),
(11, 'wagtailcore', 'revision'),
(4, 'wagtailcore', 'site'),
(17, 'wagtailcore', 'task'),
(20, 'wagtailcore', 'taskstate'),
(9, 'wagtailcore', 'uploadedfile'),
(18, 'wagtailcore', 'workflow'),
(15, 'wagtailcore', 'workflowcontenttype'),
(14, 'wagtailcore', 'workflowpage'),
(19, 'wagtailcore', 'workflowstate'),
(16, 'wagtailcore', 'workflowtask'),
(26, 'wagtaildocs', 'document'),
(60, 'wagtailembeds', 'embed'),
(57, 'wagtailforms', 'formsubmission'),
(27, 'wagtailimages', 'image'),
(62, 'wagtailimages', 'rendition'),
(58, 'wagtailredirects', 'redirect'),
(63, 'wagtailsearch', 'indexentry'),
(61, 'wagtailusers', 'userprofile');

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-07-04 15:25:38.451427'),
(2, 'auth', '0001_initial', '2024-07-04 15:25:44.720689'),
(3, 'admin', '0001_initial', '2024-07-04 15:25:45.713739'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-07-04 15:25:45.868445'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-07-04 15:25:46.040558'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-07-04 15:25:47.335634'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-07-04 15:25:47.653922'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-07-04 15:25:47.995982'),
(9, 'auth', '0004_alter_user_username_opts', '2024-07-04 15:25:48.216885'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-07-04 15:25:50.297765'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-07-04 15:25:50.440978'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-07-04 15:25:50.723778'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-07-04 15:25:51.060229'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-07-04 15:25:51.383361'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-07-04 15:25:51.741984'),
(16, 'auth', '0011_update_proxy_permissions', '2024-07-04 15:25:52.508272'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-07-04 15:25:52.834450'),
(18, 'wagtailcore', '0001_initial', '2024-07-04 15:26:14.958068'),
(19, 'wagtailcore', '0002_initial_data', '2024-07-04 15:26:16.612514'),
(20, 'wagtailcore', '0003_add_uniqueness_constraint_on_group_page_permission', '2024-07-04 15:26:16.781123'),
(21, 'wagtailcore', '0004_page_locked', '2024-07-04 15:26:16.949584'),
(22, 'wagtailcore', '0005_add_page_lock_permission_to_moderators', '2024-07-04 15:26:17.101512'),
(23, 'wagtailcore', '0006_add_lock_page_permission', '2024-07-04 15:26:17.267052'),
(24, 'wagtailcore', '0007_page_latest_revision_created_at', '2024-07-04 15:26:17.423342'),
(25, 'wagtailcore', '0008_populate_latest_revision_created_at', '2024-07-04 15:26:19.440429'),
(26, 'wagtailcore', '0009_remove_auto_now_add_from_pagerevision_created_at', '2024-07-04 15:26:19.672373'),
(27, 'wagtailcore', '0010_change_page_owner_to_null_on_delete', '2024-07-04 15:26:21.016696'),
(28, 'wagtailcore', '0011_page_first_published_at', '2024-07-04 15:26:22.922243'),
(29, 'wagtailcore', '0012_extend_page_slug_field', '2024-07-04 15:26:25.985255'),
(30, 'wagtailcore', '0013_update_golive_expire_help_text', '2024-07-04 15:26:27.622078'),
(31, 'wagtailcore', '0014_add_verbose_name', '2024-07-04 15:26:28.170588'),
(32, 'wagtailcore', '0015_add_more_verbose_names', '2024-07-04 15:26:29.300466'),
(33, 'wagtailcore', '0016_change_page_url_path_to_text_field', '2024-07-04 15:26:30.737549'),
(34, 'wagtailcore', '0017_change_edit_page_permission_description', '2024-07-04 15:26:32.859382'),
(35, 'wagtailcore', '0018_pagerevision_submitted_for_moderation_index', '2024-07-04 15:26:35.609524'),
(36, 'wagtailcore', '0019_verbose_names_cleanup', '2024-07-04 15:26:35.804913'),
(37, 'wagtailcore', '0020_add_index_on_page_first_published_at', '2024-07-04 15:26:36.153112'),
(38, 'wagtailcore', '0021_capitalizeverbose', '2024-07-04 15:26:36.823337'),
(39, 'wagtailcore', '0022_add_site_name', '2024-07-04 15:26:41.600877'),
(40, 'wagtailcore', '0023_alter_page_revision_on_delete_behaviour', '2024-07-04 15:26:41.815211'),
(41, 'wagtailcore', '0024_collection', '2024-07-04 15:26:42.121085'),
(42, 'wagtailcore', '0025_collection_initial_data', '2024-07-04 15:26:42.940166'),
(43, 'wagtailcore', '0026_group_collection_permission', '2024-07-04 15:26:46.914091'),
(44, 'wagtailcore', '0027_fix_collection_path_collation', '2024-07-04 15:26:49.862925'),
(45, 'wagtailcore', '0024_alter_page_content_type_on_delete_behaviour', '2024-07-04 15:26:52.557340'),
(46, 'wagtailcore', '0028_merge', '2024-07-04 15:26:52.702669'),
(47, 'wagtailcore', '0029_unicode_slugfield_dj19', '2024-07-04 15:26:52.882939'),
(48, 'wagtailcore', '0030_index_on_pagerevision_created_at', '2024-07-04 15:26:53.278624'),
(49, 'wagtailcore', '0031_add_page_view_restriction_types', '2024-07-04 15:26:54.815044'),
(50, 'wagtailcore', '0032_add_bulk_delete_page_permission', '2024-07-04 15:26:55.011855'),
(51, 'wagtailcore', '0033_remove_golive_expiry_help_text', '2024-07-04 15:26:55.210939'),
(52, 'wagtailcore', '0034_page_live_revision', '2024-07-04 15:26:55.717650'),
(53, 'wagtailcore', '0035_page_last_published_at', '2024-07-04 15:26:56.396992'),
(54, 'wagtailcore', '0036_populate_page_last_published_at', '2024-07-04 15:26:59.508907'),
(55, 'wagtailcore', '0037_set_page_owner_editable', '2024-07-04 15:26:59.732524'),
(56, 'wagtailcore', '0038_make_first_published_at_editable', '2024-07-04 15:26:59.948266'),
(57, 'wagtailcore', '0039_collectionviewrestriction', '2024-07-04 15:27:01.659174'),
(58, 'wagtailcore', '0040_page_draft_title', '2024-07-04 15:27:02.826659'),
(59, 'wagtailcore', '0041_group_collection_permissions_verbose_name_plural', '2024-07-04 15:27:03.025168'),
(60, 'wagtailcore', '0042_index_on_pagerevision_approved_go_live_at', '2024-07-04 15:27:03.352746'),
(61, 'wagtailcore', '0043_lock_fields', '2024-07-04 15:27:06.761241'),
(62, 'wagtailcore', '0044_add_unlock_grouppagepermission', '2024-07-04 15:27:06.936023'),
(63, 'wagtailcore', '0045_assign_unlock_grouppagepermission', '2024-07-04 15:27:08.152484'),
(64, 'wagtailcore', '0046_site_name_remove_null', '2024-07-04 15:27:09.043609'),
(65, 'wagtailcore', '0047_add_workflow_models', '2024-07-04 15:27:16.113111'),
(66, 'wagtailcore', '0048_add_default_workflows', '2024-07-04 15:27:19.811572'),
(67, 'wagtailcore', '0049_taskstate_finished_by', '2024-07-04 15:27:20.421868'),
(68, 'wagtailcore', '0050_workflow_rejected_to_needs_changes', '2024-07-04 15:27:20.667459'),
(69, 'wagtailcore', '0051_taskstate_comment', '2024-07-04 15:27:21.179942'),
(70, 'wagtailcore', '0052_pagelogentry', '2024-07-04 15:27:23.429367'),
(71, 'wagtailcore', '0053_locale_model', '2024-07-04 15:27:23.752078'),
(72, 'wagtailcore', '0054_initial_locale', '2024-07-04 15:27:24.680600'),
(73, 'wagtailcore', '0055_page_locale_fields', '2024-07-04 15:27:25.952319'),
(74, 'wagtailcore', '0056_page_locale_fields_populate', '2024-07-04 15:27:27.347624'),
(75, 'wagtailcore', '0057_page_locale_fields_notnull', '2024-07-04 15:27:30.236971'),
(76, 'wagtailcore', '0058_page_alias_of', '2024-07-04 15:27:30.809336'),
(77, 'wagtailcore', '0059_apply_collection_ordering', '2024-07-04 15:27:32.340842'),
(78, 'wagtailcore', '0060_fix_workflow_unique_constraint', '2024-07-04 15:27:32.586126'),
(79, 'wagtailcore', '0061_change_promote_tab_helpt_text_and_verbose_names', '2024-07-04 15:27:32.811063'),
(80, 'wagtailcore', '0062_comment_models_and_pagesubscription', '2024-07-04 15:27:37.082055'),
(81, 'wagtailcore', '0063_modellogentry', '2024-07-04 15:27:39.307735'),
(82, 'wagtailcore', '0064_log_timestamp_indexes', '2024-07-04 15:27:39.872243'),
(83, 'wagtailcore', '0065_log_entry_uuid', '2024-07-04 15:27:40.456619'),
(84, 'wagtailcore', '0066_collection_management_permissions', '2024-07-04 15:27:41.665715'),
(85, 'wagtailcore', '0067_alter_pagerevision_content_json', '2024-07-04 15:27:42.272920'),
(86, 'wagtailcore', '0068_log_entry_empty_object', '2024-07-04 15:27:43.395998'),
(87, 'wagtailcore', '0069_log_entry_jsonfield', '2024-07-04 15:27:44.415533'),
(88, 'wagtailcore', '0070_rename_pagerevision_revision', '2024-07-04 15:27:52.790660'),
(89, 'wagtailcore', '0071_populate_revision_content_type', '2024-07-04 15:27:53.823178'),
(90, 'wagtailcore', '0072_alter_revision_content_type_notnull', '2024-07-04 15:28:00.275946'),
(91, 'wagtailcore', '0073_page_latest_revision', '2024-07-04 15:28:00.849723'),
(92, 'wagtailcore', '0074_revision_object_str', '2024-07-04 15:28:01.375376'),
(93, 'wagtailcore', '0075_populate_latest_revision_and_revision_object_str', '2024-07-04 15:28:02.886132'),
(94, 'wagtailcore', '0076_modellogentry_revision', '2024-07-04 15:28:03.585580'),
(95, 'wagtailcore', '0077_alter_revision_user', '2024-07-04 15:28:03.829108'),
(96, 'wagtailcore', '0078_referenceindex', '2024-07-04 15:28:05.357438'),
(97, 'wagtailcore', '0079_rename_taskstate_page_revision', '2024-07-04 15:28:07.188815'),
(98, 'wagtailcore', '0080_generic_workflowstate', '2024-07-04 15:28:12.151158'),
(99, 'wagtailcore', '0081_populate_workflowstate_content_type', '2024-07-04 15:28:13.116050'),
(100, 'wagtailcore', '0082_alter_workflowstate_content_type_notnull', '2024-07-04 15:28:18.534271'),
(101, 'wagtailcore', '0083_workflowcontenttype', '2024-07-04 15:28:19.412983'),
(102, 'wagtailcore', '0084_add_default_page_permissions', '2024-07-04 15:28:19.616222'),
(103, 'wagtailcore', '0085_add_grouppagepermission_permission', '2024-07-04 15:28:20.383279'),
(104, 'wagtailcore', '0086_populate_grouppagepermission_permission', '2024-07-04 15:28:26.536461'),
(105, 'wagtailcore', '0087_alter_grouppagepermission_unique_together_and_more', '2024-07-04 15:28:30.284440'),
(106, 'wagtailcore', '0088_fix_log_entry_json_timestamps', '2024-07-04 15:28:31.639201'),
(107, 'wagtailcore', '0089_log_entry_data_json_null_to_object', '2024-07-04 15:28:32.787936'),
(108, 'wagtailcore', '0090_remove_grouppagepermission_permission_type', '2024-07-04 15:28:36.645841'),
(109, 'wagtailcore', '0091_remove_revision_submitted_for_moderation', '2024-07-04 15:28:37.114731'),
(110, 'wagtailcore', '0092_alter_collectionviewrestriction_password_and_more', '2024-07-04 15:28:37.409427'),
(111, 'wagtailcore', '0093_uploadedfile', '2024-07-04 15:28:38.572726'),
(112, 'taggit', '0001_initial', '2024-07-04 15:28:40.398009'),
(113, 'taggit', '0002_auto_20150616_2121', '2024-07-04 15:28:40.872172'),
(114, 'taggit', '0003_taggeditem_add_unique_index', '2024-07-04 15:28:41.240003'),
(115, 'taggit', '0004_alter_taggeditem_content_type_alter_taggeditem_tag', '2024-07-04 15:28:41.540289'),
(116, 'taggit', '0005_auto_20220424_2025', '2024-07-04 15:28:41.700997'),
(117, 'taggit', '0006_rename_taggeditem_content_type_object_id_taggit_tagg_content_8fc721_idx', '2024-07-04 15:28:43.249346'),
(118, 'home', '0001_initial', '2024-07-04 15:28:55.951753'),
(119, 'paquete', '0001_initial', '2024-07-04 15:29:00.752978'),
(120, 'sessions', '0001_initial', '2024-07-04 15:29:01.476061'),
(121, 'simple_translation', '0001_initial', '2024-07-04 15:29:01.897067'),
(122, 'tour', '0001_initial', '2024-07-04 15:29:09.285795'),
(123, 'wagtailadmin', '0001_create_admin_access_permissions', '2024-07-04 15:29:11.872735'),
(124, 'wagtailadmin', '0002_admin', '2024-07-04 15:29:12.019089'),
(125, 'wagtailadmin', '0003_admin_managed', '2024-07-04 15:29:12.326951'),
(126, 'wagtaildocs', '0001_initial', '2024-07-04 15:29:13.078802'),
(127, 'wagtaildocs', '0002_initial_data', '2024-07-04 15:29:16.856390'),
(128, 'wagtaildocs', '0003_add_verbose_names', '2024-07-04 15:29:17.205515'),
(129, 'wagtaildocs', '0004_capitalizeverbose', '2024-07-04 15:29:17.816466'),
(130, 'wagtaildocs', '0005_document_collection', '2024-07-04 15:29:19.138232'),
(131, 'wagtaildocs', '0006_copy_document_permissions_to_collections', '2024-07-04 15:29:21.468791'),
(132, 'wagtaildocs', '0005_alter_uploaded_by_user_on_delete_action', '2024-07-04 15:29:21.754346'),
(133, 'wagtaildocs', '0007_merge', '2024-07-04 15:29:21.907335'),
(134, 'wagtaildocs', '0008_document_file_size', '2024-07-04 15:29:22.277879'),
(135, 'wagtaildocs', '0009_document_verbose_name_plural', '2024-07-04 15:29:22.495888'),
(136, 'wagtaildocs', '0010_document_file_hash', '2024-07-04 15:29:23.088821'),
(137, 'wagtaildocs', '0011_add_choose_permissions', '2024-07-04 15:29:26.890078'),
(138, 'wagtaildocs', '0012_uploadeddocument', '2024-07-04 15:29:27.717156'),
(139, 'wagtaildocs', '0013_delete_uploadeddocument', '2024-07-04 15:29:28.166960'),
(140, 'wagtailembeds', '0001_initial', '2024-07-04 15:29:28.836385'),
(141, 'wagtailembeds', '0002_add_verbose_names', '2024-07-04 15:29:29.000213'),
(142, 'wagtailembeds', '0003_capitalizeverbose', '2024-07-04 15:29:29.171642'),
(143, 'wagtailembeds', '0004_embed_verbose_name_plural', '2024-07-04 15:29:29.350970'),
(144, 'wagtailembeds', '0005_specify_thumbnail_url_max_length', '2024-07-04 15:29:29.748547'),
(145, 'wagtailembeds', '0006_add_embed_hash', '2024-07-04 15:29:30.286270'),
(146, 'wagtailembeds', '0007_populate_hash', '2024-07-04 15:29:31.386825'),
(147, 'wagtailembeds', '0008_allow_long_urls', '2024-07-04 15:29:34.458490'),
(148, 'wagtailembeds', '0009_embed_cache_until', '2024-07-04 15:29:35.125844'),
(149, 'wagtailforms', '0001_initial', '2024-07-04 15:29:35.914539'),
(150, 'wagtailforms', '0002_add_verbose_names', '2024-07-04 15:29:36.419469'),
(151, 'wagtailforms', '0003_capitalizeverbose', '2024-07-04 15:29:36.701191'),
(152, 'wagtailforms', '0004_add_verbose_name_plural', '2024-07-04 15:29:36.886851'),
(153, 'wagtailforms', '0005_alter_formsubmission_form_data', '2024-07-04 15:29:37.239594'),
(154, 'wagtailimages', '0001_initial', '2024-07-04 15:29:48.253307'),
(155, 'wagtailimages', '0002_initial_data', '2024-07-04 15:29:48.401880'),
(156, 'wagtailimages', '0003_fix_focal_point_fields', '2024-07-04 15:29:48.626937'),
(157, 'wagtailimages', '0004_make_focal_point_key_not_nullable', '2024-07-04 15:29:48.778926'),
(158, 'wagtailimages', '0005_make_filter_spec_unique', '2024-07-04 15:29:48.930283'),
(159, 'wagtailimages', '0006_add_verbose_names', '2024-07-04 15:29:49.073960'),
(160, 'wagtailimages', '0007_image_file_size', '2024-07-04 15:29:49.219765'),
(161, 'wagtailimages', '0008_image_created_at_index', '2024-07-04 15:29:49.455160'),
(162, 'wagtailimages', '0009_capitalizeverbose', '2024-07-04 15:29:49.605440'),
(163, 'wagtailimages', '0010_change_on_delete_behaviour', '2024-07-04 15:29:49.783058'),
(164, 'wagtailimages', '0011_image_collection', '2024-07-04 15:29:49.943335'),
(165, 'wagtailimages', '0012_copy_image_permissions_to_collections', '2024-07-04 15:29:50.094085'),
(166, 'wagtailimages', '0013_make_rendition_upload_callable', '2024-07-04 15:29:50.308991'),
(167, 'wagtailimages', '0014_add_filter_spec_field', '2024-07-04 15:29:50.472833'),
(168, 'wagtailimages', '0015_fill_filter_spec_field', '2024-07-04 15:29:50.641979'),
(169, 'wagtailimages', '0016_deprecate_rendition_filter_relation', '2024-07-04 15:29:50.795000'),
(170, 'wagtailimages', '0017_reduce_focal_point_key_max_length', '2024-07-04 15:29:50.948672'),
(171, 'wagtailimages', '0018_remove_rendition_filter', '2024-07-04 15:29:51.106532'),
(172, 'wagtailimages', '0019_delete_filter', '2024-07-04 15:29:51.304460'),
(173, 'wagtailimages', '0020_add-verbose-name', '2024-07-04 15:29:51.478175'),
(174, 'wagtailimages', '0021_image_file_hash', '2024-07-04 15:29:51.629838'),
(175, 'wagtailimages', '0022_uploadedimage', '2024-07-04 15:29:52.370151'),
(176, 'wagtailimages', '0023_add_choose_permissions', '2024-07-04 15:29:56.171231'),
(177, 'wagtailimages', '0024_index_image_file_hash', '2024-07-04 15:29:56.515303'),
(178, 'wagtailimages', '0025_alter_image_file_alter_rendition_file', '2024-07-04 15:29:56.888038'),
(179, 'wagtailimages', '0026_delete_uploadedimage', '2024-07-04 15:29:57.179812'),
(180, 'wagtailredirects', '0001_initial', '2024-07-04 15:29:58.313119'),
(181, 'wagtailredirects', '0002_add_verbose_names', '2024-07-04 15:29:58.619642'),
(182, 'wagtailredirects', '0003_make_site_field_editable', '2024-07-04 15:29:58.980905'),
(183, 'wagtailredirects', '0004_set_unique_on_path_and_site', '2024-07-04 15:30:00.903380'),
(184, 'wagtailredirects', '0005_capitalizeverbose', '2024-07-04 15:30:01.315049'),
(185, 'wagtailredirects', '0006_redirect_increase_max_length', '2024-07-04 15:30:01.698081'),
(186, 'wagtailredirects', '0007_add_autocreate_fields', '2024-07-04 15:30:03.038171'),
(187, 'wagtailredirects', '0008_add_verbose_name_plural', '2024-07-04 15:30:03.235325'),
(188, 'wagtailsearch', '0001_initial', '2024-07-04 15:30:05.654652'),
(189, 'wagtailsearch', '0002_add_verbose_names', '2024-07-04 15:30:05.978619'),
(190, 'wagtailsearch', '0003_remove_editors_pick', '2024-07-04 15:30:06.142286'),
(191, 'wagtailsearch', '0004_querydailyhits_verbose_name_plural', '2024-07-04 15:30:06.318559'),
(192, 'wagtailsearch', '0005_create_indexentry', '2024-07-04 15:30:07.296018'),
(193, 'wagtailsearch', '0006_customise_indexentry', '2024-07-04 15:30:09.289418'),
(194, 'wagtailsearch', '0007_delete_editorspick', '2024-07-04 15:30:10.010146'),
(195, 'wagtailsearch', '0008_remove_query_and_querydailyhits_models', '2024-07-04 15:30:15.032476'),
(196, 'wagtailusers', '0001_initial', '2024-07-04 15:30:15.668409'),
(197, 'wagtailusers', '0002_add_verbose_name_on_userprofile', '2024-07-04 15:30:15.981741'),
(198, 'wagtailusers', '0003_add_verbose_names', '2024-07-04 15:30:16.175821'),
(199, 'wagtailusers', '0004_capitalizeverbose', '2024-07-04 15:30:16.671101'),
(200, 'wagtailusers', '0005_make_related_name_wagtail_specific', '2024-07-04 15:30:17.000177'),
(201, 'wagtailusers', '0006_userprofile_prefered_language', '2024-07-04 15:30:17.737297'),
(202, 'wagtailusers', '0007_userprofile_current_time_zone', '2024-07-04 15:30:18.322795'),
(203, 'wagtailusers', '0008_userprofile_avatar', '2024-07-04 15:30:18.924855'),
(204, 'wagtailusers', '0009_userprofile_verbose_name_plural', '2024-07-04 15:30:19.138151'),
(205, 'wagtailusers', '0010_userprofile_updated_comments_notifications', '2024-07-04 15:30:19.741836'),
(206, 'wagtailusers', '0011_userprofile_dismissibles', '2024-07-04 15:30:20.361219'),
(207, 'wagtailusers', '0012_userprofile_theme', '2024-07-04 15:30:20.986567'),
(208, 'wagtailusers', '0013_userprofile_density', '2024-07-04 15:30:21.599547'),
(209, 'wagtailimages', '0001_squashed_0021', '2024-07-04 15:30:22.151047'),
(210, 'wagtailcore', '0001_squashed_0016_change_page_url_path_to_text_field', '2024-07-04 15:30:22.355827'),
(211, 'home', '0002_global', '2024-07-04 15:46:36.877001'),
(212, 'home', '0003_alter_global_body', '2024-07-04 15:57:32.043312'),
(213, 'paquete', '0002_alter_dias_item_alter_excluidoitempaquete_item_and_more', '2024-07-04 18:02:31.209745'),
(214, 'tour', '0002_alter_tour_categories_alter_tour_itinerario_and_more', '2024-07-05 15:23:58.762253'),
(215, 'home', '0004_gallerycarousel_carouselbuttonname_and_more', '2024-07-05 16:54:15.679368'),
(216, 'home', '0005_inicio_galleryini_alter_inicio_formulariosubtitulo_and_more', '2024-07-11 21:35:52.199525'),
(217, 'home', '0006_alter_inicio_galleryini', '2024-07-13 22:41:55.011168'),
(218, 'home', '0006_nosotros_certificadossubtitle_and_more', '2024-07-20 20:57:01.635449'),
(219, 'paquete', '0003_dias_titulo', '2024-07-25 21:05:06.577368');

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0gq0fr6wo8fno9qoc277zr4wrlbqlyag', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sU5dC:w5EYlTHBHHxe_j8Xs6-6ImT7PI3g-tO61dEFnPOqGUo', '2024-07-31 14:27:46.363102'),
('12dxslkm3nr32jbmj64bdotl9cytt5c1', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sPpoh:v0OlhLBxo-pvt4-FQHnFHgV6V8YU-zM4p9CU57ofA44', '2024-07-19 20:46:03.504493'),
('4llvvdonbh3ozxk48teme9eavw4g8ay1', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sRxgg:7PBYC8y1zhTGBssbbF5lJaoJsinjLpZgZUWZHxX2HZc', '2024-07-25 17:34:34.337036'),
('5k9do6pt2pcodfunj79cpw6abugls18t', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sS1WJ:nAb2wtq7sP3SWdxfQlGyMIQwolIUvEGuoSnpl2JyRmk', '2024-07-25 21:40:07.938935'),
('7p83vz8xqpfborfcixjfoowbfwp3unss', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sSkiT:OKc9inqQbYN_5FcAPdPfPRs6Yifs_JyE1XuT2V4H7us', '2024-07-27 21:55:41.193331'),
('8lf2e2gjof1x36vzxs4m1ctp84ytslaf', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sVzt7:FjxUsfIoq8ZziK1cwP9USBHXiGR6l3pabVcKnJbgnIA', '2024-08-05 20:44:05.038395'),
('9sl2kzd8d5fu8puzv4x4mfos2zedktu0', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sSOod:sYmNqblFOi4zN5kZeZPoy8C7CDN0TUmP5G_csjwsM64', '2024-07-26 22:32:35.143482'),
('bx3ly27lt3bzz5hqbo0wmppvunpfe2e6', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sYXke:zBzmocRl2663vImNmaPbIF1P6wayIEKrCVBS4K7Jw7U', '2024-08-12 21:17:52.671445'),
('c4e7ejtz4m4yl0sn2izpz6i28cqar3ry', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sSmLl:nBsVpzedWh7KmjOnrLv_uwJBXRigWvv8neBRK_V01dg', '2024-07-27 23:40:21.565867'),
('da9iyvsa45ezq1j5465ikwj9oucfsym1', '.eJxVjMEOwiAQBf-FsyEUlkJ79O43EFi2FjVgoE00xn_XJj3o9c28eTHn12V2a6PqUmQjk-zwuwWPV8obiBefz4VjyUtNgW8K32njpxLpdtzdv8Ds2_x94wBGByPBdsJYq6y2wmjl-x5AEw4awUaCECbVSVQqaqukV9ibSSAgbdFGraWSHT3uqT7ZKN4fPf4-MQ:1sRgzO:ZA0P8ltQd8vVaLtYiq0O1kSYtKwu5BJ8LZw1G8Ulnsk', '2024-07-24 23:44:46.452407'),
('dlatzy1ic498uwxx96k033h9atufnfkn', '.eJxVjMsOwiAQRf-FtSEUhke7dO83EBimFjVgSptojP-uTbrQ7T3nnhfzYV0mvzaafU5sYJIdfrcY8EplA-kSyrlyrGWZc-Sbwnfa-Kkmuh139y8whTZ939iD1dFKcJ2wzimnnbBaBWMANGGvEVwiiHFUnUSlknZKBoXGjgIBaYs2ai3X4ulxz_OTDZ0UvRHi_QG1sD9j:1sWILh:SOJlZYTmLhFd57YRlN2tqVi5f31ZFg8cJ9BNoERb_8o', '2024-08-06 16:26:49.382933'),
('dnuhrl7irkb7tlla5vf9oxami6tyrzrr', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sRYVx:JdU9v_8Jfraa2fqoT7ToHCIn9u8htfECyDCYPEcHeI4', '2024-07-24 14:41:49.767327'),
('en559iznf1b4xc6ptnsulsh4iak4pjf8', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sVHJA:MOKDsSXZoyb5E2Se8bcilJXzWZ2veB3DCta7gVi4Qag', '2024-08-03 21:08:00.166571'),
('ew2zm69512s806cmo71wei27o1meejre', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sPs4B:Mz9eVguGckIvBTqR0xw8LHJeWgwBJZGEXR27B6nFfVg', '2024-07-19 23:10:11.328506'),
('fzqdei4ponhgduc3650fez76evivx9fk', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sUCRv:Njz9BWhE6A53LL9eZ3C6yNVauzf2ykX7eUEhlSTC7cI', '2024-07-31 21:44:35.345938'),
('gj06gtwafkywlhg9u7nepxy0pqht4bm4', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sSQ9y:MMq0XJ9ql9aogNhgvSPEP9TvjZXRLb6iLg1N5Wpynjk', '2024-07-26 23:58:42.342973'),
('jlgnywofst6ov63tdac908nduugf062z', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sUw9Y:8fUEzVDYGNO-Ngheex1Wxod7kNKYvGtS6elCjbBGmjI', '2024-08-02 22:32:40.942276'),
('js24veykja3oy4ioco80lfzdppblr7p4', '.eJxVjMsOgjAQRf-la9OM9AUs3fsNTYeZStW0hkKiMf67kLDQ7Tnn3rfwYZlHv1SefCLRCyUOvwzDcOO8CbqGfClyKHmeEsotkbut8lyI76e9_TsYQx3XNXQYaGhZd0obts6RdjGCaY6q0cYZQmVb0NZqhJVjJGgsUBssxC4Y3E4r15pK9vx8pOklevh8AXDbPrI:1sX5vi:4gxT0M7Mzbqrc5ASW6jFMirPqGklwfQWVPAnTivNddk', '2024-08-08 21:23:18.745184'),
('kds3k6uslo3z8zxhq4r2xo3ei5u6jka6', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sRMcJ:GhjZ8laXN9noVR0hTag_tZKIdI-9xjAQ_NRiqmhz-LE', '2024-07-24 01:59:35.436777'),
('nnk5xct2mirmtgd8ua89wepsbjnww6ki', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sXNvH:J4yeXBxKRhzk2TB8rCH4hNZ04FOZ7pbZFAcZVbx4uBM', '2024-08-09 16:36:03.683207'),
('pdzxmj3f0qbp9c346bwilke1yoc0mrda', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sX6FA:fMv1XnGaz9mrhaw3EVxZssA1qn6qApCPNQofxWYIK-Y', '2024-08-08 21:43:24.225252'),
('qtxs7enhjc68abk3uhqj9ehyadkgc6yr', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sWik0:OyF9DvZJTE6qfJDA53dAexdgQCCZp3H9v8RD94yNKjE', '2024-08-07 20:37:40.240020'),
('qvfbz0h06l95ttsbbyfxx3rgdtqfcs3v', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sWelO:bJyFfA75WIgNzYFsmI1xPewy_-q6Pqwjf6jbO2yKvHQ', '2024-08-07 16:22:50.270343'),
('rlmoes6b7tjb0cdwlg05zx4pijctxebe', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sSiV9:J_E0baDngnTKEfrEpsWuEPTAJgmGGVzrgY0_3-n1lEc', '2024-07-27 19:33:47.274979'),
('ssz1bdjwq69ioae2dqcza5k90d5pones', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sSlHF:lyWsAh6Bgp4c30s6jfAU6g_vr_MsxLHAGFWfC6axjNY', '2024-07-27 22:31:37.117629'),
('tcisrrd99j0dqmayh6att7rw4adjyun0', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sX0qI:5PHZS_naF7GQIjjFdt2Tc2hBZLhxHLWH2EEjMRsjxtI', '2024-08-08 15:57:22.825007'),
('tldwsvwkksker278r0l715mxleo75rt4', '.eJxVjMsOwiAQRf-FtSFQKI8u3fsNZKYMFjVgSptojP-uTbrQ7T3nnhcLsC5TWBvNIUc2MMkOvxvCeKWygXiBcq58rGWZM_JN4Ttt_FQj3Y67-xeYoE3fd7JeYRIddFEioHRCR6-djsoDOpNQGRJa2b7z6JJC8Noa7MlZKY0nt0UbtZZrCfS45_nJBvH-AIOqPsI:1sPOUZ:BHrgvLHJyZ-oNAOYBfAnJ9fHVFx4de1pOggkBtF9jo8', '2024-07-18 15:35:27.659613'),
('tlpj33kiq8k4omgzi22nb80sko0tmxbi', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sX5nq:-UzkhxzYUxCKhtjnv0kCo1QCeioiYrMMN4lN6fuUT7g', '2024-08-08 21:15:10.664402'),
('tmeqchlk7c8iak8zs5ugcz0cz958xoxc', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sUZ3t:DksJh7SrbpqrLu5BLX3Xl5WWUZeEemD0vdikiOW6CAY', '2024-08-01 21:53:17.463574'),
('ypl6fp5lhori573xi7safc6aa5ik7c39', '.eJxVjEEOwiAQRe_C2hAodAhduvcMhM4MFjVgSptojHfXJl3o9r_330uEuC5TWBvPIZMYhBaH322MeOWyAbrEcq4Sa1nmPMpNkTtt8lSJb8fd_QtMsU3ft1NJO4qQvCGtMKURlPc9cQ-ddQa17bw2VjnyqDrNvSdrIEXtEMEDbNHGreVaAj_ueX6KQb0_avU-XA:1sTMlK:SsImW9zm8yZuN9ntuw7dJifsjrZNXRa-1swYMmd68sk', '2024-07-29 14:33:10.162804');

CREATE TABLE `home_certificados` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `image_id` bigint(20) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `home_cloudinaryimage` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_x` >= 0),
  `focal_point_y` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_y` >= 0),
  `focal_point_width` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_width` >= 0),
  `focal_point_height` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_height` >= 0),
  `file_size` int(10) UNSIGNED DEFAULT NULL CHECK (`file_size` >= 0),
  `file_hash` varchar(40) NOT NULL,
  `file` varchar(100) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_cloudinaryimage` (`id`, `title`, `width`, `height`, `created_at`, `focal_point_x`, `focal_point_y`, `focal_point_width`, `focal_point_height`, `file_size`, `file_hash`, `file`, `collection_id`, `uploaded_by_user_id`) VALUES
(1, 'Screenshot from 2024-05-24 14-58-35-1', 1920, 1080, '2024-07-04 16:25:29.162876', NULL, NULL, NULL, NULL, 255344, '2d310be9f7363cbabea60e4109888d35a35994fe', 'media/original_images/Screenshot_from_2024-05-24_14-58-35-1_qidbjw', 1, 1),
(2, 'Screenshot from 2024-02-20 05-52-15', 1920, 1080, '2024-07-04 16:26:23.883670', NULL, NULL, NULL, NULL, 430354, 'cc3ab2471b484542ce935d580abe786553762e3e', 'media/original_images/Screenshot_from_2024-02-20_05-52-15_lx2m45', 1, 1),
(3, 'graduacion', 1500, 1001, '2024-07-10 02:01:16.719846', NULL, NULL, NULL, NULL, 207281, '155230042b2326b0a83d46109c66c85256ef419f', 'media/original_images/graduacion_kvcogq', 1, 1),
(4, 'machuDestino', 434, 707, '2024-07-13 23:50:33.228489', NULL, NULL, NULL, NULL, 575608, '56ccf6dbf229474698c80b39f90a6e77989d3732', 'media/original_images/machuDestino_juxoyv', 1, 1),
(5, 'limaArequipa', 434, 345, '2024-07-13 23:53:02.124870', NULL, NULL, NULL, NULL, 265256, 'bc1508cd58a451b2824770e2d2e66575873e7af4', 'media/original_images/limaArequipa_i08qd0', 1, 1),
(6, 'arequipaDestino', 435, 345, '2024-07-13 23:58:12.505491', NULL, NULL, NULL, NULL, 256715, '9ac9e2d132719c52be773d45213489104dd3aa0b', 'media/original_images/arequipaDestino_ni8jb9', 1, 1),
(7, 'punoDestino', 435, 345, '2024-07-14 00:10:44.134909', NULL, NULL, NULL, NULL, 280497, '9010993542e3c30c8dab7753705c40dc86630475', 'media/original_images/punoDestino_x5mtvj', 1, 1),
(8, 'icaDestino', 434, 345, '2024-07-14 00:11:56.675451', NULL, NULL, NULL, NULL, 321697, 'd86b4008646a0f2ca9d9df82be7b850b244b6d3b', 'media/original_images/icaDestino_bmyihr', 1, 1),
(9, 'paq1', 425, 586, '2024-07-14 00:19:14.131895', NULL, NULL, NULL, NULL, 377773, 'f8dae5966f46ba8caef7608a92c708688ad2aa0d', 'media/original_images/paq1Featured_krcrvn', 1, 1),
(10, 'paq1', 595, 249, '2024-07-14 00:23:17.907040', NULL, NULL, NULL, NULL, 256421, 'f2b110e83f3a692bd228db20b5e9589ba92da832', 'media/original_images/paq1_stmpxd', 1, 1),
(11, 'backgroundNosotros', 1442, 348, '2024-07-17 18:01:56.177399', NULL, NULL, NULL, NULL, 1039304, '0a89e709faababd3c2168be9174473781d724d4e', 'media/original_images/backgroundNosotros_hcdmd7', 1, 1),
(12, 'imagenFundadores', 630, 442, '2024-07-17 18:03:19.080567', NULL, NULL, NULL, NULL, 544430, '38542d98234422667b8bff6a2c4345bd385b55ab', 'media/original_images/imagenFundadores_ef2qai', 1, 1),
(13, 'limaDestinoMob', 350, 655, '2024-07-17 22:13:34.863977', NULL, NULL, NULL, NULL, 303609, 'f20abe7679ac928a83337d4bc9a0da5cddedb931', 'media/original_images/limaDestinoMob_zs6bkn', 1, 1),
(14, 'arequipaDestinoMob', 350, 655, '2024-07-17 22:14:00.648346', NULL, NULL, NULL, NULL, 345856, '8c4ea22d4898bf7b1acd443376db6d9a47eba40c', 'media/original_images/arequipaDestinoMob_ptog3q', 1, 1),
(15, 'punoDestinoMob', 350, 655, '2024-07-17 22:14:54.657277', NULL, NULL, NULL, NULL, 391417, 'aed26e6dcbbb4b87de3f19eb3867fc43383e5cf0', 'media/original_images/punoDestinoMob_fdo0cs', 1, 1),
(16, 'contactarBack', 1442, 347, '2024-07-20 23:38:00.507078', NULL, NULL, NULL, NULL, 847612, '967b7581aa286f09d627ff4687346bc4f2e85a51', 'media/original_images/contactarBack_dx9qko', 1, 1),
(17, 'Group 1573', 206, 96, '2024-07-22 20:48:27.044773', NULL, NULL, NULL, NULL, 4431, 'a0ef2ac50b3d389de141361b31ab9370e2d7f37d', 'media/original_images/Group_1573_odq8rs', 1, 1),
(18, 'protegemeIcon', 261, 99, '2024-07-22 20:48:58.874506', NULL, NULL, NULL, NULL, 21406, 'f82614a7af1a9e6db643d9486e82bf6742273cc3', 'media/original_images/protegemeIcon_jivsh0', 1, 1),
(19, 'image 647', 233, 95, '2024-07-22 20:49:42.912398', NULL, NULL, NULL, NULL, 14240, '7250fe169303229221f35b713613d0cbf48415e2', 'media/original_images/image_647_qfoyhv', 1, 1),
(20, 'image 646', 114, 104, '2024-07-22 20:50:13.723099', NULL, NULL, NULL, NULL, 13120, '71982a45f0080e7a671deae47c194aa1b06be91b', 'media/original_images/image_646_dtv512', 1, 1),
(21, 'unnamed 1', 104, 102, '2024-07-22 20:50:57.424742', NULL, NULL, NULL, NULL, 9986, 'e4a251b340d1f7336666d3b0e79fb1eff27825c4', 'media/original_images/unnamed_1_zts58w', 1, 1),
(22, 'Group (5)', 82, 81, '2024-07-22 22:23:57.539296', NULL, NULL, NULL, NULL, 3053, '36fd62fdfd8c75ba63a91a90f4d493d65e990adf', 'media/original_images/Group_5_hwi9bp', 1, 1),
(23, 'Group (6)', 80, 83, '2024-07-22 22:24:36.658184', NULL, NULL, NULL, NULL, 2593, '0d86a7dc18dc75691238e8dfb78fead657f38090', 'media/original_images/Group_6_ax3h9b', 1, 1),
(24, 'Group (7)', 88, 80, '2024-07-22 22:25:23.601527', NULL, NULL, NULL, NULL, 2985, 'b488b6fc6a42c0df7aae2157de4cb3e5c3d93819', 'media/original_images/Group_7_tujnro', 1, 1),
(25, 'Group (8)', 91, 80, '2024-07-22 22:29:30.536308', NULL, NULL, NULL, NULL, 2709, '800f4ce9ed8403ed70aaf4f103bafa770978fcc6', 'media/original_images/Group_8_b7yyog', 1, 1),
(26, 'Vector', 87, 85, '2024-07-22 22:30:00.923105', NULL, NULL, NULL, NULL, 3235, '0a8667806e95f1812dd845bc5858391f8ae49a1a', 'media/original_images/Vector_vhzcne', 1, 1),
(27, 'Group (9)', 74, 88, '2024-07-22 22:30:39.277359', NULL, NULL, NULL, NULL, 2229, '51accf84aa6d60823ac0dc7d39289ca829d2b494', 'media/original_images/Group_9_axrenh', 1, 1),
(29, 'Mapi Full day', 1080, 1080, '2024-07-23 16:32:07.835162', NULL, NULL, NULL, NULL, 2254507, '93163cce6d3feefd971f2901bdc2eca9b044455f', 'media/original_images/Mapi_Full_day_jn5lgp', 1, 2),
(30, 'Inlcusiones Mapi', 1080, 1080, '2024-07-23 16:32:35.338741', NULL, NULL, NULL, NULL, 2282093, 'd15f07eadb81d5c29dfa7f1ce205e3b3b6f146f1', 'media/original_images/Inlcusiones_Mapi_fd9vbj', 1, 2),
(31, '338a6885465c49ecb03dbcb61783698b', 3840, 2160, '2024-07-23 16:35:50.135159', NULL, NULL, NULL, NULL, 1618780, '077427f3f043ab5fd45374e30548dd54d8e4914f', 'media/original_images/338a6885465c49ecb03dbcb61783698b_idluna', 1, 2),
(32, 'PROGRAMA 10D9N', 1080, 1080, '2024-07-24 21:59:05.771932', NULL, NULL, NULL, NULL, 1911438, 'a27665dee06edc660325561d4c1c17e2b7b20c19', 'media/original_images/PROGRAMA_10D9N_6_qlmm31', 1, 3),
(33, 'Machupicchu', 960, 1280, '2024-07-24 22:49:48.768346', NULL, NULL, NULL, NULL, 415021, '403e7af7342795e2f93e72bb19a1b7154ac24b0b', 'media/original_images/photo_4974404446641564972_y_rvqb3j', 1, 3),
(34, 'Ica', 1280, 855, '2024-07-24 22:50:34.258820', NULL, NULL, NULL, NULL, 193311, '3d2f0c95387794503cf164c098d33706685d2db0', 'media/original_images/photo_4963367750785412826_y_xr78xy', 1, 3),
(35, 'TRC', 1280, 960, '2024-07-24 22:51:16.355793', NULL, NULL, NULL, NULL, 315178, 'dd609e02aab1e091fcebe6b8a57a6df546db1f02', 'media/original_images/photo_4974404446641564987_y_e91dwo', 1, 3),
(36, 'PROGRAMA 10D9N', 1080, 1080, '2024-07-24 23:13:57.358248', NULL, NULL, NULL, NULL, 2079468, 'f7bbd581a4c9da8ce0f39518d35d2a5a77f4370a', 'media/original_images/PROGRAMA_8D7N_oskiq9', 1, 3),
(37, 'Maachupicchu', 720, 1280, '2024-07-24 23:18:02.764819', NULL, NULL, NULL, NULL, 301990, 'ac749ac7abfb4dc1f0005d5069d88fd5c4e68fce', 'media/original_images/photo_4965745552054660226_y_qwjzxv', 1, 3),
(38, 'Oasis', 855, 1280, '2024-07-24 23:21:20.655102', NULL, NULL, NULL, NULL, 145775, '61f9d380beb2631379747dbabce748f47b06f460', 'media/original_images/photo_4963367750785412823_y_kton2o', 1, 3),
(39, 'machuIni', 1443, 641, '2024-07-29 21:25:30.992790', NULL, NULL, NULL, NULL, 1355858, 'df4bd9b03e74dca90171dcb2d61f4e85b4cc91a7', 'media/original_images/machuIni_rqgydm', 1, 1);

CREATE TABLE `home_cloudinaryrendition` (
  `id` bigint(20) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `image_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_cloudinaryrendition` (`id`, `filter_spec`, `width`, `height`, `focal_point_key`, `image_id`) VALUES
(1, 'max-165x165', 165, 92, '', 1),
(2, 'max-165x165', 165, 92, '', 2),
(3, 'max-165x165', 165, 110, '', 3),
(4, 'width-1000', 1920, 1080, '', 2),
(5, 'width-1000', 1920, 1080, '', 1),
(6, 'original', 1920, 1080, '', 1),
(7, 'max-800x600', 800, 450, '', 1),
(8, 'max-165x165', 101, 165, '', 4),
(9, 'max-165x165', 165, 131, '', 5),
(10, 'max-165x165', 165, 130, '', 6),
(11, 'max-165x165', 165, 130, '', 7),
(12, 'max-165x165', 165, 131, '', 8),
(13, 'max-165x165', 119, 165, '', 9),
(14, 'max-165x165', 165, 69, '', 10),
(15, 'width-1000', 595, 249, '', 10),
(16, 'max-165x165', 165, 39, '', 11),
(17, 'max-165x165', 165, 115, '', 12),
(18, 'max-165x165', 88, 165, '', 13),
(19, 'max-165x165', 88, 165, '', 14),
(20, 'max-165x165', 88, 165, '', 15),
(21, 'width-1000', 350, 655, '', 13),
(22, 'width-1000', 350, 655, '', 14),
(23, 'width-1000', 350, 655, '', 15),
(24, 'max-165x165', 165, 39, '', 16),
(25, 'max-165x165', 165, 76, '', 17),
(26, 'max-165x165', 165, 62, '', 18),
(27, 'max-165x165', 165, 67, '', 19),
(28, 'max-165x165', 114, 104, '', 20),
(29, 'max-165x165', 104, 102, '', 21),
(30, 'max-165x165', 82, 81, '', 22),
(31, 'max-165x165', 80, 83, '', 23),
(32, 'max-165x165', 88, 80, '', 24),
(33, 'max-165x165', 91, 80, '', 25),
(34, 'max-165x165', 87, 85, '', 26),
(35, 'max-165x165', 74, 88, '', 27),
(37, 'max-165x165', 165, 165, '', 29),
(38, 'max-165x165', 165, 165, '', 30),
(39, 'max-165x165', 165, 92, '', 31),
(42, 'max-165x165', 165, 165, '', 32),
(43, 'max-165x165', 123, 165, '', 33),
(44, 'max-165x165', 165, 110, '', 34),
(45, 'max-165x165', 165, 123, '', 35),
(46, 'max-165x165', 165, 165, '', 36),
(47, 'max-165x165', 92, 165, '', 37),
(48, 'max-165x165', 110, 165, '', 38),
(49, 'max-165x165', 165, 73, '', 39),
(50, 'width-1000', 1443, 641, '', 39);

CREATE TABLE `home_contacto` (
  `page_ptr_id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `formTitle` varchar(100) NOT NULL,
  `ubicacion` varchar(100) NOT NULL,
  `background_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_contacto` (`page_ptr_id`, `titulo`, `formTitle`, `ubicacion`, `background_id`) VALUES
(16, 'Contáctanos', 'Contacto', 'Tacna 168, Cusco 08002', 16),
(17, 'Contact Us', 'Contact', 'Tacna 168, Cusco 08002', 16);

CREATE TABLE `home_destino` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `background_id` bigint(20) DEFAULT NULL,
  `backgroundMobile_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_destino` (`id`, `name`, `background_id`, `backgroundMobile_id`) VALUES
(1, 'Cusco', 4, 2),
(2, 'Lima', 5, 2),
(3, 'Arequipa', 6, 2),
(4, 'Puno', 7, 2),
(5, 'Ica', 8, 2);

CREATE TABLE `home_estadisticas` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `redLet` varchar(50) NOT NULL,
  `grayLet` varchar(50) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_estadisticas` (`id`, `sort_order`, `redLet`, `grayLet`, `page_id`) VALUES
(1, 0, '+5K', 'AGENCIAS DE VIAJES ATENDIDAS', 11),
(2, 0, '+5K', 'TRAVEL AGENCIES SERVED', 12),
(3, 1, '+30', 'DESTINOS', 11),
(4, 2, '+15', '15 AÑOS DE EXPERIENCIA', 11),
(5, 1, '+30', 'DESTINIES', 12),
(6, 2, '+15', '15 YEARS OF EXPERIENCE', 12);

CREATE TABLE `home_faq` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `question` varchar(250) NOT NULL,
  `answer` longtext NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_faq` (`id`, `sort_order`, `question`, `answer`, `page_id`) VALUES
(1, 0, 'Cuando debo viajar a Peru?', '<p data-block-key=\"v3p0b\">thicgidcg</p>', 13),
(2, 0, 'Cuando debo viajar a Peru?', '<p data-block-key=\"v3p0b\">thicgidcg</p>', 15);

CREATE TABLE `home_global` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_global` (`page_ptr_id`, `body`) VALUES
(4, '<p data-block-key=\"8c3rz\">uuu</p>'),
(8, '<p data-block-key=\"8c3rz\">uuu</p>');

CREATE TABLE `home_home` (
  `page_ptr_id` int(11) NOT NULL,
  `body` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_home` (`page_ptr_id`, `body`) VALUES
(3, ''),
(7, '');

CREATE TABLE `home_informacion` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `numero` varchar(255) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_informacion` (`id`, `name`, `numero`, `desc`, `link`) VALUES
(1, 'Jushka', '+51 956 231 682', 'Realiza tus consultas ¡Escríbenos!', 'asdasdasd');

CREATE TABLE `home_inicio` (
  `page_ptr_id` int(11) NOT NULL,
  `paqueteTitulo` varchar(30) NOT NULL,
  `destinoTitulo` varchar(30) NOT NULL,
  `formularioTitulo` varchar(75) NOT NULL,
  `formularioSubtitulo` varchar(200) NOT NULL,
  `galleryIni` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`galleryIni`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_inicio` (`page_ptr_id`, `paqueteTitulo`, `destinoTitulo`, `formularioTitulo`, `formularioSubtitulo`, `galleryIni`) VALUES
(13, 'Nuestros Paquetes', 'Destinos', '¿Tiene alguna pregunta especifica?', 'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum', '[{\"type\": \"Tipo1\", \"value\": {\"photo\": 39, \"carouselTitulo\": \"EL CAMINO DE LOS TIEMPOS\", \"carouselDuracion\": \"8-7\", \"carouselLink\": \"aoeuaoeuaoue\", \"carouselButtonName\": \"Ver\", \"miniPhotos\": [{\"type\": \"item\", \"value\": 13, \"id\": \"d0907c6b-a729-4408-bbc2-397646c664a1\"}, {\"type\": \"item\", \"value\": 14, \"id\": \"ac653cb6-8ebc-4d38-957b-e30c194b726c\"}, {\"type\": \"item\", \"value\": 15, \"id\": \"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\"}]}, \"id\": \"94ad5633-9fba-49dc-a3f7-695771818dbc\"}, {\"type\": \"Tipo2\", \"value\": {\"photo\": 1, \"carouselTitulo\": \"aoeuoaeu\", \"carouselButtonName\": \"aoeuaoeu\"}, \"id\": \"c4f7ff8e-c065-41da-852b-4f0246055475\"}]'),
(15, 'Nuestros Paquetes', 'Destinos', '¿Tiene alguna pregunta especifica?', 'i dont remenber what text is written here', '[{\"type\": \"Tipo1\", \"value\": {\"photo\": 10, \"carouselTitulo\": \"THE TIMES ROADS\", \"carouselDuracion\": \"8-7\", \"carouselLink\": \"aoeuaoeuaoue\", \"carouselButtonName\": \"Ver\", \"miniPhotos\": [{\"type\": \"item\", \"value\": 13, \"id\": \"d0907c6b-a729-4408-bbc2-397646c664a1\"}, {\"type\": \"item\", \"value\": 14, \"id\": \"ac653cb6-8ebc-4d38-957b-e30c194b726c\"}, {\"type\": \"item\", \"value\": 15, \"id\": \"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\"}]}, \"id\": \"94ad5633-9fba-49dc-a3f7-695771818dbc\"}, {\"type\": \"Tipo2\", \"value\": {\"photo\": 1, \"carouselTitulo\": \"aoeuoaeu\", \"carouselButtonName\": \"aoeuaoeu\"}, \"id\": \"c4f7ff8e-c065-41da-852b-4f0246055475\"}]');

CREATE TABLE `home_nosotros` (
  `page_ptr_id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `subTitulo` varchar(100) NOT NULL,
  `parrafo` longtext NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `numeroRuc` varchar(100) NOT NULL,
  `nombreComercial` varchar(100) NOT NULL,
  `certificadoAutorizacion` varchar(100) NOT NULL,
  `background_id` bigint(20) NOT NULL,
  `imageParrafo_id` bigint(20) NOT NULL,
  `certificadosSubtitle` varchar(100) NOT NULL,
  `partnersSubtitle` varchar(100) NOT NULL,
  `valoresSubtitle` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_nosotros` (`page_ptr_id`, `titulo`, `subTitulo`, `parrafo`, `razonSocial`, `numeroRuc`, `nombreComercial`, `certificadoAutorizacion`, `background_id`, `imageParrafo_id`, `certificadosSubtitle`, `partnersSubtitle`, `valoresSubtitle`) VALUES
(11, 'Sobre Nosotros', 'Sobre Nosotros', '<p data-block-key=\"8akow\">Españollll</p>', 'Perú Destino Seguro E.I.R.L.', '20601468582', 'PDS VIAJES', 'Perú Destino Seguro E.I.R.L.', 11, 12, 'Certificaciones', 'Nuestros Partners', 'Valores'),
(12, 'About Us', 'About Us', '<p data-block-key=\"8akow\">ENglish</p>', 'Perú Destino Seguro E.I.R.L.', '20601468582', 'PDS VIAJES', 'Perú Destino Seguro E.I.R.L.', 11, 12, 'TEST', 'TEST', 'TEST');

CREATE TABLE `home_partners` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `image_id` bigint(20) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_partners` (`id`, `sort_order`, `image_id`, `page_id`) VALUES
(1, 0, 17, 11),
(2, 1, 18, 11),
(3, 2, 19, 11),
(4, 3, 20, 11),
(5, 4, 21, 11);

CREATE TABLE `home_tourcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `home_valores` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `label` varchar(50) NOT NULL,
  `img_id` bigint(20) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `home_valores` (`id`, `sort_order`, `label`, `img_id`, `page_id`) VALUES
(1, 0, 'Responsabilidad', 22, 11),
(2, 1, 'Lealtad', 23, 11),
(3, 2, 'Honestidad', 24, 11),
(4, 3, 'Puntualidad', 25, 11),
(5, 4, 'Disciplina', 26, 11),
(6, 5, 'Confidencialidad', 27, 11);

CREATE TABLE `paquete_dias` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `item` longtext DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `titulo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `paquete_dias` (`id`, `sort_order`, `item`, `page_id`, `titulo`) VALUES
(2, 0, '<p data-block-key=\"5w3gq\">edwbredfbfr</p>', 9, NULL),
(3, 0, '<h2 data-block-key=\"17ptc\">Dia 1: Llegada a Lima</h2><p data-block-key=\"dqhi7\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estará esperando por ti. El número de puerta por donde tienes que salir es el N°3 o N°4, podrás identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con dirección a su alojamiento reservado en la Ciudad de Lima donde podrás descansar después de tu viaje</p><p data-block-key=\"cdujj\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitación con una tarifa adicional o puedes dejar maletas en recepción y salir a conocer la ciudad o esperar en el Lobby.</p>', 5, NULL),
(4, 0, '<h2 data-block-key=\"s2as0\">Dia 1: Llegada a Lima</h2><p data-block-key=\"c21p7\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estará esperando por ti.</p><p data-block-key=\"bhr0u\">El número de puerta por donde tienes que salir es el N°3 o N°4, podrás identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con dirección a su alojamiento reservado en la Ciudad de Lima donde podrás descansar después de tu viaje.</p><p data-block-key=\"bmnkj\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitación con una tarifa adicional o puedes dejar maletas en recepción y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\"45puv\"></p>', 18, 'LLegada a Lima'),
(5, 1, '<h2 data-block-key=\"s2as0\">Dia 2: City tour Lima</h2><p data-block-key=\"807gt\">Nuestro tour presenta Lima en sus tres períodos históricos: prehispánico, colonial y moderno. Primero disfrutaremos de una hermosa vista panorámica por Lima Ancestral, Huaca Pucllana, es un sitio arqueológico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\"affod\">Posteriormente conocemos Lima colonial en su centro histórico se encuentra la arquitectura urbana en este período, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\"dh2p5\">En el centro histórico apreciamos: El Palacio de Justicia, Plaza San Martín, Plaza Mayor, con vistas panorámicas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresarán al</p><p data-block-key=\"8o40k\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estará acompañado por un guía que estará siempre respondiendo sus preguntas.</p><p data-block-key=\"p2qc\">Lima Contemporánea: Vamos a ver las zonas más tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\"9l0j8\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>', 18, NULL),
(6, 0, '<p data-block-key=\"s2as0\">Llegada a Cusco</p>', 19, 'LLegada a Cusco'),
(7, 1, '<h2 data-block-key=\"s2as0\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\"807gt\">Viaje al valle Sagrado</p>', 19, 'aoeaoe'),
(8, 2, '<h2 data-block-key=\"tv6z1\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\"b0u50\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad turística, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partirá hacia las ISLAS BALLESTAS en modernos deslizadores donde podrán disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bahía de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, pingüinos de Humboldt también apreciarán el Candelabro donde el guía nos narrará las diferentes hipótesis sobre su formación.</p><p data-block-key=\"fn59g\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Después de visitar las instalaciones de la bodega, los visitantes serán invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\"1a2v0\">Finalmente nos dirigiremos a la Huacachina el cual está ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podrán disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\"4aumk\">Salida con destino a Lima.</p>', 18, NULL),
(9, 3, '<h2 data-block-key=\"tv6z1\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\"q5p5\">Nos dirigiremos hacía el aeropuerto Jorge Chávez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\"7fs20\">En las puertas de salida nos estarán esperando nuestro agente con un cartel para acompañarnos hasta nuestro alojamiento reservado, recibiremos una retroalimentación de nuestro itinerario y las mejores recomendaciones para los días de nuestra estadía en Cusco.</p><p data-block-key=\"lpsi\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\"c45ie\"></p>', 18, NULL),
(10, 4, '<h2 data-block-key=\"tv6z1\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\"c3dqa\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una práctica de 15 minutos el pasajero nos da el OK si no tiene ningún problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\"cbjae\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\"aa564\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Verónica y el nevado de Chicón acompañados de un mágico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\"9ovv0\">Nuestro tour finaliza en la Plaza San Francisco.</p>', 18, NULL),
(11, 5, '<h2 data-block-key=\"tv6z1\">Dia 6: Valle sagrado Conexión</h2><p data-block-key=\"9vp0h\">Este majestuoso tour empezará a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto será el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueológico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\"9tqc3\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes turísticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\"5bgfa\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueológico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\"a47k7\">Nos dirigiremos a la estación de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>', 18, NULL),
(12, 6, '<h2 data-block-key=\"tv6z1\">Dia 7 : Machupicchu</h2><p data-block-key=\"bp9fs\">Nuestro guía le estará esperando a la hora y en el lugar de encuentro (esto será coordinado una noche antes).</p><p data-block-key=\"1roq3\">Nos dirigiremos a la estación de buses Conssetur el cual nos transportará de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificación para poder ingresar a la Llaqta de Machupicchu, tendrá un recorrido de 2 horas a 2:30 min. como máximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotográficas.</p><p data-block-key=\"7eipf\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\"etnb5\">Nos dirigiremos a la estación de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\"aeaf3\">Nuestra movilidad estará esperándonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>', 18, NULL),
(13, 7, '<h2 data-block-key=\"tv6z1\">Dia 8: Montaña de Colores</h2><p data-block-key=\"70i1r\">Iniciaremos nuestro tour hacia la Montaña de 7 Colores - Vinicunca recogiéndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad turística dirigirnos hacia el sur del Cusco.</p><p data-block-key=\"mlog\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas más en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Montaña de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\"dqabv\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>', 18, NULL),
(14, 8, '<h2 data-block-key=\"tv6z1\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\"2q3su\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que está ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, teñido, y tejido de fibra de camélidos sudamericanos donde podrás apreciar la variedad de productos realizados a mano y un acabado único.</p><p data-block-key=\"3rf01\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentación de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\"6tbtl\">Espera un suculento almuerzo típico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde serás participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te hará vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedirán nuestros pobladores deseándote un buen por venir.</p><p data-block-key=\"2o8u1\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>', 18, NULL),
(15, 9, '<h2 data-block-key=\"tv6z1\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\"9hfcv\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con dirección al aeropuerto de Lima.</p><p data-block-key=\"a73r9\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su País de Origen.</p><p data-block-key=\"aj7pg\"></p>', 18, NULL),
(16, 1, '<h2 data-block-key=\"wip07\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\"6i70p\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad turística, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partirá hacia las ISLAS BALLESTAS en modernos deslizadores donde podrán disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bahía de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, pingüinos de Humboldt también apreciarán el Candelabro donde el guía nos narrará las diferentes hipótesis sobre su formación.</p><p data-block-key=\"7ot7t\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Después de visitar las instalaciones de la bodega, los visitantes serán invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\"79tk4\">Finalmente nos dirigiremos a la Huacachina el cual está ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podrán disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\"d1fn6\">Salida con destino a Lima.</p>', 5, NULL),
(17, 2, '<h2 data-block-key=\"wip07\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\"18bam\">Nos dirigiremos hacía el aeropuerto Jorge Chávez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\"37upu\">En las puertas de salida nos estarán esperando nuestro agente con un cartel para acompañarnos hasta nuestro alojamiento reservado, recibiremos una retroalimentación de nuestro itinerario y las mejores recomendaciones para los días de nuestra estadía en Cusco.</p><p data-block-key=\"9cld4\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>', 5, NULL),
(18, 3, '<h2 data-block-key=\"wip07\">Dia 4: Valle sagrado Conexión</h2><p data-block-key=\"asp0m\">Este majestuoso tour empezará a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto será el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueológico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\"c2o7h\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes turísticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueológico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\"84da3\">Nos dirigiremos a la estación de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>', 5, NULL),
(19, 4, '<h2 data-block-key=\"wip07\">Dia 5: Machupicchu</h2><p data-block-key=\"9akh3\"></p><p data-block-key=\"8hji2\">Nuestro guía le estará esperando a la hora y en el lugar de encuentro (esto será coordinado una noche antes).</p><p data-block-key=\"33v60\">Nos dirigiremos a la estación de buses Conssetur el cual nos transportará de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificación para poder ingresar a la Llaqta de Machupicchu, tendrá un recorrido de 2 horas a 2:30 min. como máximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotográficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\"7rj5\">Nos dirigiremos a la estación de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\"b9l95\">Nuestra movilidad estará esperándonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>', 5, NULL),
(20, 5, '<h2 data-block-key=\"wip07\">Dia 6: Montaña de Colores</h2><p data-block-key=\"dbi3g\">Iniciaremos nuestro tour hacia la Montaña de 7 Colores - Vinicunca recogiéndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad turística dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas más en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Montaña de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\"5ci7j\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>', 5, NULL),
(21, 6, '<h2 data-block-key=\"wip07\">Dia 7: TRC Ccaccaccollo</h2><p data-block-key=\"7edm5\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que está ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, teñido, y tejido de fibra de camélidos sudamericanos donde podrás apreciar la variedad de productos realizados a mano y un acabado único.</p><p data-block-key=\"52sh7\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentación de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\"8d4p2\">Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te hará vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedirán nuestros pobladores deseándote un buen por venir.</p><p data-block-key=\"diobk\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>', 5, NULL),
(22, 7, '<h2 data-block-key=\"wip07\">Dia 8: Retorno</h2><p data-block-key=\"6qg4c\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con dirección al aeropuerto de Lima.</p><p data-block-key=\"4uitg\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su País de Origen.</p>', 5, NULL),
(23, 0, '<h2 data-block-key=\"42wub\">Dia 1: Llegada a Lima</h2><p data-block-key=\"bcn9k\">De acuerdo al horario de su vuelo de llegada rastrearemos su Vuelo y estaremos al pendiente de tu llegada, nuestra movilidad estará esperando por tí. El número de puerta por donde tienes que salir es el N°3 o N°4 podrás identificar a nuestro agente por el Cartel con su nombre que tienen en mano, le llevara con dirección a su alojamiento reservado en la Ciudad de Lima donde podrás descansar después de su viaje.</p><p data-block-key=\"5bnj4\">Importante: Check in al Hotel es a Partir de las 15:00 Horas. si su vuelo llega antes de la hora indicada puede solicitar uso de habitación con un adicional o puedes dejar maletas en la recepción y salir a conocer la ciudad o esperar en el Lobby.</p>', 20, NULL),
(24, 1, '<h2 data-block-key=\"42wub\">Dia 2: City tour Lima</h2><p data-block-key=\"7f4si\">Nuestro tour presenta Lima en sus tres períodos históricos: prehispánico, colonial y moderno.</p><p data-block-key=\"cr249\">Primero disfrutaremos de una hermosa vista panorámica por Lima Ancestral, Huaca Pucllana, es un sitio arqueológico edificado en el siglo IV dc, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado. Posteriormente conocemos Lima colonial en su centro histórico se encuentra la arquitectura urbana en este período, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\"fniri\">En el centro histórico apreciamos: El Palacio de Justicia, Plaza San Martín, Plaza Mayor, con vistas panorámicas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresará en el monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, Estará acompañado por un guía que estará siempre respondiendo sus preguntas.</p><p data-block-key=\"60sgh\">Lima Contemporánea: Vamos a ver las zonas más tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar. Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>', 20, NULL),
(25, 2, '<h2 data-block-key=\"42wub\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\"1jaf8\">Nos dirigiremos rumbo al Balneario de Paracas, (04 horas aproximadamente de viaje) en movilidad turística, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partirá hacia las ISLAS BALLESTAS en modernos deslizadores donde podrán disfrutar de un maravilloso tour a las ISLAS BALLESTAS, localizadas en la Bahía de Paracas. Donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, pingüinos de Humboldt, También apreciarán el Candelabro donde el guía nos narrará las diferentes hipótesis sobre su formación.</p><p data-block-key=\"1hqq9\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos a la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Después de visitar las instalaciones de la bodega, los visitantes serán invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\"7fddu\">Finalmente nos dirigiremos a la Huacachina el cual está ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podrán disfrutar de la tranquilidad</p><p data-block-key=\"a30fa\">y aprovechar para realizar actividades de aventura como son los Tubulares y</p><p data-block-key=\"e39s5\">Sandboarding. salida con destino a Lima.</p>', 20, NULL),
(26, 3, '<h2 data-block-key=\"42wub\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\"7o9qm\">Nos dirigiremos hacía el aeropuerto Jorge Chavez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\"59jal\">En las puertas de salida nos estarán esperando nuestro agente con un cartel para acompañarnos hasta nuestro alojamiento reservado, recibiremos una retroalimentación de nuestro itinerario y las mejores recomendaciones para los días de nuestra estadía en Cusco.</p><p data-block-key=\"8h68q\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>', 20, NULL),
(27, 4, '', 20, NULL);

CREATE TABLE `paquete_excluidoitempaquete` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `item` varchar(80) DEFAULT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `paquete_excluidoitempaquete` (`id`, `sort_order`, `item`, `page_id`) VALUES
(2, 0, 'yourm', 9),
(3, 0, 'Snack', 5),
(4, 0, 'Snack', 18),
(5, 1, 'Gastos adicionales', 18),
(6, 0, 'Vuelo Lima Cusco', 19),
(7, 1, 'Caballos', 19),
(8, 2, 'Equipaje de mano - Bodega', 18),
(9, 3, 'Servicio de caballos', 18),
(10, 4, 'Seguro', 18),
(11, 1, 'Gastos adicionales', 5),
(12, 2, 'Equipaje de mano - Bodega', 5),
(13, 3, 'Servicio de caballos', 5);

CREATE TABLE `paquete_gallerycarousel` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `caption` varchar(250) DEFAULT NULL,
  `image_id` bigint(20) DEFAULT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `paquete_gallerycarousel` (`id`, `sort_order`, `caption`, `image_id`, `page_id`) VALUES
(2, 0, 'wedsvegv', 1, 9),
(5, 0, 'Caption', 29, 19),
(6, 1, 'Caption', 30, 19),
(7, 0, NULL, 33, 18),
(8, 1, NULL, 34, 18),
(9, 2, NULL, 35, 18),
(10, 0, NULL, 37, 5),
(11, 1, NULL, 38, 5),
(12, 0, NULL, 38, 20),
(13, 1, NULL, 37, 20),
(14, 3, NULL, 34, 18);

CREATE TABLE `paquete_incluidoitempaquete` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `item` varchar(80) DEFAULT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `paquete_incluidoitempaquete` (`id`, `sort_order`, `item`, `page_id`) VALUES
(2, 0, 'dfbdfbfdb', 9),
(3, 0, 'Desayuno', 5),
(4, 1, 'Almuerzos (especificados en el itinerario)', 18),
(5, 2, 'Alojamiento', 18),
(6, 0, 'Desayuno', 18),
(7, 4, 'Traslados', 18),
(8, 0, 'Almuerzo', 19),
(9, 1, 'Hotel', 19),
(10, 2, 'Guia', 19),
(11, 3, 'Transporte', 19),
(12, 3, 'Vuelo Lima -Cusco-Lima', 18),
(13, 5, 'Ticket de ingreso a los atractivos', 18),
(14, 6, 'Trenes', 18),
(15, 7, 'Asesoramiento constante', 18),
(16, 1, 'Almuerzos (especificados en el itinerario)', 5),
(17, 2, 'Alojamiento', 5),
(18, 3, 'Traslados', 5),
(19, 4, 'Vuelo Lima -Cusco-Lima', 5),
(20, 5, 'Ticket de ingreso a los atractivos', 5),
(21, 6, 'Trenes', 5),
(22, 7, 'Guía Oficial de Turismo', 5),
(23, 8, 'Asesoramiento constante', 5);

CREATE TABLE `paquete_paquete` (
  `page_ptr_id` int(11) NOT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  `duracion` varchar(12) DEFAULT NULL,
  `linkWord` varchar(100) DEFAULT NULL,
  `linkPdf` varchar(100) DEFAULT NULL,
  `linkFlyer` varchar(100) DEFAULT NULL,
  `background_id` bigint(20) DEFAULT NULL,
  `featuredImage_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `paquete_paquete` (`page_ptr_id`, `precio`, `duracion`, `linkWord`, `linkPdf`, `linkFlyer`, `background_id`, `featuredImage_id`) VALUES
(5, 997.00, '8-7', 'https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit', 'https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0', 'https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI', 1, 36),
(9, 1200.00, '10-8', 'aoeaoe', 'aoeaoe', 'aoeaoe', 2, 1),
(18, 1145.00, '10-9', 'https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit', 'https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k', 'https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi', 31, 32),
(19, 1289.00, '12-11', 'https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge', 'https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge', 'https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge', 31, 32),
(20, 1457.00, '12-11', 'https://docs.google.com/document/d/1hsAxkFf7CGpFuUq1HNm4YJvotpnE6ey4/edit', 'https://drive.google.com/drive/folders/1mmNh4a89WU3B4XEv6ICoc6YqKPiXgecs', 'https://drive.google.com/drive/folders/1Kan0WtsXxPMK93TadiPPhV5HECTFs3_1', 31, NULL);

CREATE TABLE `simple_translation_simpletranslation` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `taggit_tag` (`id`, `name`, `slug`) VALUES
(1, 'Machupicchu', 'machupicchu'),
(2, 'Perú', 'perú'),
(3, 'Ica', 'ica'),
(4, 'TRC', 'trc'),
(5, 'Paquetes', 'paquetes'),
(6, 'Oasis', 'oasis');

CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `taggit_taggeditem` (`id`, `object_id`, `content_type_id`, `tag_id`) VALUES
(2, 32, 32, 2),
(3, 33, 32, 1),
(4, 34, 32, 3),
(5, 35, 32, 4),
(6, 36, 32, 5),
(7, 37, 32, 1),
(8, 38, 32, 6);

CREATE TABLE `tour_excluidoitempaquete` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `item` varchar(80) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `tour_excluidoitempaquete` (`id`, `sort_order`, `item`, `page_id`) VALUES
(1, 0, 'oaeeaoe', 6),
(2, 1, 'oaeaoe', 6),
(3, 0, 'oaeeaoe', 10),
(4, 1, 'oaeaoe', 10),
(5, 0, 'asdasd', 14);

CREATE TABLE `tour_gallerycarousel` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `caption` varchar(250) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `tour_gallerycarousel` (`id`, `sort_order`, `caption`, `image_id`, `page_id`) VALUES
(1, 0, 'aoeaoe', 1, 6),
(2, 0, 'aoeaoe', 1, 10),
(3, 0, 'sss', 2, 14);

CREATE TABLE `tour_incluidoitempaquete` (
  `id` bigint(20) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `item` varchar(80) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `tour_incluidoitempaquete` (`id`, `sort_order`, `item`, `page_id`) VALUES
(1, 0, 'aoeaooo', 6),
(2, 0, 'aoeaooo', 10),
(3, 0, 'dssdsd', 14);

CREATE TABLE `tour_tour` (
  `page_ptr_id` int(11) NOT NULL,
  `precio` decimal(6,2) DEFAULT NULL,
  `linkWord` varchar(100) DEFAULT NULL,
  `linkPdf` varchar(100) DEFAULT NULL,
  `linkFlyer` varchar(100) DEFAULT NULL,
  `itinerario` longtext DEFAULT NULL,
  `background_id` bigint(20) DEFAULT NULL,
  `featuredImage_id` bigint(20) DEFAULT NULL,
  `tourDestino_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `tour_tour` (`page_ptr_id`, `precio`, `linkWord`, `linkPdf`, `linkFlyer`, `itinerario`, `background_id`, `featuredImage_id`, `tourDestino_id`) VALUES
(6, 123.00, 'aoeaoe', 'aoeao', 'aoeaoe', '<p data-block-key=\"5imeg\">oaeaoe</p>', 1, 2, 1),
(10, 123.00, 'aoeaoe', 'aoeao', 'aoeaoe', '<p data-block-key=\"5imeg\">oaeaoe</p>', 1, 2, 1),
(14, 1212.00, 'ascdasczxc', 'zxczx', 'ASDASDASD', '<p data-block-key=\"rlbyv\">asdasdasd</p>', 2, 9, 2);

CREATE TABLE `tour_tour_categories` (
  `id` bigint(20) NOT NULL,
  `tour_id` int(11) NOT NULL,
  `tourcategory_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailadmin_admin` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_collection` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `depth` int(10) UNSIGNED NOT NULL CHECK (`depth` >= 0),
  `numchild` int(10) UNSIGNED NOT NULL CHECK (`numchild` >= 0),
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_collection` (`id`, `path`, `depth`, `numchild`, `name`) VALUES
(1, '0001', 1, 0, 'Root');

CREATE TABLE `wagtailcore_collectionviewrestriction` (
  `id` int(11) NOT NULL,
  `restriction_type` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `collection_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_collectionviewrestriction_groups` (
  `id` bigint(20) NOT NULL,
  `collectionviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_comment` (
  `id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `contentpath` longtext NOT NULL,
  `position` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `resolved_at` datetime(6) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `resolved_by_id` int(11) DEFAULT NULL,
  `revision_created_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_commentreply` (
  `id` int(11) NOT NULL,
  `text` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_groupapprovaltask` (
  `task_ptr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_groupapprovaltask` (`task_ptr_id`) VALUES
(1);

CREATE TABLE `wagtailcore_groupapprovaltask_groups` (
  `id` bigint(20) NOT NULL,
  `groupapprovaltask_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_groupapprovaltask_groups` (`id`, `groupapprovaltask_id`, `group_id`) VALUES
(1, 1, 1);

CREATE TABLE `wagtailcore_groupcollectionpermission` (
  `id` int(11) NOT NULL,
  `collection_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_groupcollectionpermission` (`id`, `collection_id`, `group_id`, `permission_id`) VALUES
(2, 1, 1, 102),
(4, 1, 1, 103),
(6, 1, 1, 105),
(8, 1, 1, 106),
(10, 1, 1, 107),
(12, 1, 1, 109),
(1, 1, 2, 102),
(3, 1, 2, 103),
(5, 1, 2, 105),
(7, 1, 2, 106),
(9, 1, 2, 107),
(11, 1, 2, 109);

CREATE TABLE `wagtailcore_grouppagepermission` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_grouppagepermission` (`id`, `group_id`, `page_id`, `permission_id`) VALUES
(1, 1, 1, 33),
(2, 1, 1, 34),
(6, 1, 1, 38),
(3, 1, 1, 39),
(7, 1, 1, 40),
(4, 2, 1, 33),
(5, 2, 1, 34);

CREATE TABLE `wagtailcore_locale` (
  `id` int(11) NOT NULL,
  `language_code` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_locale` (`id`, `language_code`) VALUES
(2, 'en'),
(1, 'es');

CREATE TABLE `wagtailcore_modellogentry` (
  `id` int(11) NOT NULL,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL,
  `revision_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_modellogentry` (`id`, `label`, `action`, `data`, `timestamp`, `content_changed`, `deleted`, `object_id`, `content_type_id`, `user_id`, `uuid`, `revision_id`) VALUES
(1, 'Cusco', 'wagtail.create', '{}', '2024-07-05 16:06:46.579093', 1, 0, '1', 33, 1, '44321f43b79c466e89b7c3c391a8b06c', NULL),
(2, 'English', 'wagtail.create', '{}', '2024-07-05 16:21:59.448564', 1, 0, '2', 3, 1, 'cbc1da9aaacf4d3a978aa4b4f4464115', NULL),
(3, 'localhost [predeterminado]', 'wagtail.edit', '{}', '2024-07-05 16:25:25.301854', 1, 0, '1', 4, 1, 'd00818967d894343a1aef945c80e49c3', NULL),
(4, 'Informacion object (1)', 'wagtail.create', '{}', '2024-07-05 21:52:49.400676', 1, 0, '1', 29, 1, 'd5ab0e3a6ab84dad9748214fba3a24a4', NULL),
(5, 'David', 'wagtail.create', '{}', '2024-07-10 23:44:10.985395', 1, 0, '2', 54, 1, '8e7f125f5e594d73b6a00786397f4951', NULL),
(6, 'Lima', 'wagtail.create', '{}', '2024-07-12 22:36:07.178237', 1, 0, '2', 33, 1, '323651a49c214242bb01d0d2ac7b4fea', NULL),
(7, 'Cusco', 'wagtail.edit', '{}', '2024-07-13 23:50:59.236460', 1, 0, '1', 33, 1, 'e920459162a648d387b5b27184f06874', NULL),
(8, 'Lima', 'wagtail.edit', '{}', '2024-07-13 23:54:27.386724', 1, 0, '2', 33, 1, '53c1bb505b5d422bba18e56f6444c716', NULL),
(9, 'Arequipa', 'wagtail.create', '{}', '2024-07-14 00:00:21.883583', 1, 0, '3', 33, 1, '3c57af8d1082410198547d7df81bde17', NULL),
(10, 'Puno', 'wagtail.create', '{}', '2024-07-14 00:11:06.067695', 1, 0, '4', 33, 1, '9efb51d8951a426ba0ad7a7b152eb18a', NULL),
(11, 'Ica', 'wagtail.create', '{}', '2024-07-14 00:12:27.890637', 1, 0, '5', 33, 1, 'ee94f7d0a5904e268493adaacf4c6d7c', NULL),
(12, 'Doris', 'wagtail.create', '{}', '2024-07-23 19:43:16.398519', 1, 0, '3', 54, 1, 'a4e9749678394abdbb87dcdd70cda749', NULL),
(13, 'Israel', 'wagtail.create', '{}', '2024-07-23 19:46:39.106451', 1, 0, '4', 54, 1, '1c9c592b10984a88988b6cd5f8b35d83', NULL),
(14, 'Doris', 'wagtail.edit', '{}', '2024-07-24 21:43:36.685858', 1, 0, '3', 54, 1, 'f9fd5ce92eec40d78597b8724dd5200a', NULL),
(15, 'PERU perfil de grupo de Whatsapp', 'wagtail.delete', '{}', '2024-07-24 21:58:27.014603', 0, 0, '28', 32, 3, '8557f49752844b749e9eb10f2889b327', NULL),
(16, 'PERU perfil de grupo de Whatsapp', 'wagtail.delete', '{}', '2024-07-24 21:58:29.966011', 0, 0, '28', 32, 3, '18c25750b5e149f6a2094d28f1ae5c23', NULL);

CREATE TABLE `wagtailcore_page` (
  `id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `depth` int(10) UNSIGNED NOT NULL CHECK (`depth` >= 0),
  `numchild` int(10) UNSIGNED NOT NULL CHECK (`numchild` >= 0),
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `live` tinyint(1) NOT NULL,
  `has_unpublished_changes` tinyint(1) NOT NULL,
  `url_path` longtext NOT NULL,
  `seo_title` varchar(255) NOT NULL,
  `show_in_menus` tinyint(1) NOT NULL,
  `search_description` longtext NOT NULL,
  `go_live_at` datetime(6) DEFAULT NULL,
  `expire_at` datetime(6) DEFAULT NULL,
  `expired` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `latest_revision_created_at` datetime(6) DEFAULT NULL,
  `first_published_at` datetime(6) DEFAULT NULL,
  `live_revision_id` int(11) DEFAULT NULL,
  `last_published_at` datetime(6) DEFAULT NULL,
  `draft_title` varchar(255) NOT NULL,
  `locked_at` datetime(6) DEFAULT NULL,
  `locked_by_id` int(11) DEFAULT NULL,
  `translation_key` char(32) NOT NULL,
  `locale_id` int(11) NOT NULL,
  `alias_of_id` int(11) DEFAULT NULL,
  `latest_revision_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_page` (`id`, `path`, `depth`, `numchild`, `title`, `slug`, `live`, `has_unpublished_changes`, `url_path`, `seo_title`, `show_in_menus`, `search_description`, `go_live_at`, `expire_at`, `expired`, `content_type_id`, `owner_id`, `locked`, `latest_revision_created_at`, `first_published_at`, `live_revision_id`, `last_published_at`, `draft_title`, `locked_at`, `locked_by_id`, `translation_key`, `locale_id`, `alias_of_id`, `latest_revision_id`) VALUES
(1, '0001', 1, 2, 'Root', 'root', 1, 0, '/', '', 0, '', NULL, NULL, 0, 1, NULL, 0, NULL, NULL, NULL, NULL, 'Root', NULL, NULL, '0055b77bff564ed782006bfcc3ff5042', 1, NULL, NULL),
(3, '00010002', 2, 4, 'Peru Destino Seguro', 'peru-destino-seguro', 1, 0, '/peru-destino-seguro/', '', 0, '', NULL, NULL, 0, 28, 1, 0, '2024-07-04 15:52:30.000760', '2024-07-04 15:52:34.344599', 1, '2024-07-04 15:52:34.344599', 'Peru Destino Seguro', NULL, NULL, '1cb0f6f996114fdd84e11019992be35a', 1, NULL, 1),
(4, '000100020001', 3, 5, 'Global', 'global', 1, 0, '/peru-destino-seguro/global/', '', 0, '', NULL, NULL, 0, 66, 1, 0, '2024-07-04 16:14:43.199387', '2024-07-04 16:14:47.334848', 2, '2024-07-04 16:14:47.334848', 'Global', NULL, NULL, '868cfd12c7a04401962a96bf0dec4e54', 1, NULL, 2),
(5, '0001000200010001', 4, 0, 'PERÚ 8 DIAS 7 NOCHES', 'el-camino-de-los-dioses', 1, 0, '/peru-destino-seguro/global/el-camino-de-los-dioses/', '', 0, '', NULL, NULL, 0, 42, 1, 0, '2024-07-24 23:52:59.641708', '2024-07-04 21:10:27.232664', 105, '2024-07-24 23:53:04.737164', 'PERÚ 8 DIAS 7 NOCHES', NULL, NULL, 'f9aeab8b633a4c2c8dd66e54c0eafec8', 1, NULL, 105),
(6, '0001000200010002', 4, 0, 'Collpa de Guacamalleae', 'collpa-de-guacamallos', 1, 0, '/peru-destino-seguro/global/collpa-de-guacamallos/', '', 0, '', NULL, NULL, 0, 47, 1, 0, '2024-07-24 21:31:15.643031', '2024-07-05 16:09:03.315847', 96, '2024-07-24 21:31:18.998553', 'Collpa de Guacamalleae', NULL, NULL, '7516a6a3f8cf4eafa6aa94b0a620ea1c', 1, NULL, 96),
(7, '00010003', 2, 4, 'Peru Safe Destiny', 'peru-destino-seguro-en', 1, 0, '/peru-destino-seguro-en/', '', 0, '', NULL, NULL, 0, 28, 1, 0, '2024-07-05 21:16:32.500544', '2024-07-05 21:16:34.941733', 33, '2024-07-05 21:16:34.941733', 'Peru Safe Destiny', NULL, NULL, '1cb0f6f996114fdd84e11019992be35a', 2, NULL, 33),
(8, '000100030001', 3, 3, 'Global', 'global', 0, 1, '/peru-destino-seguro-en/global/', '', 0, '', NULL, NULL, 0, 66, 1, 0, '2024-07-05 21:17:57.335695', NULL, NULL, NULL, 'Global', NULL, NULL, '868cfd12c7a04401962a96bf0dec4e54', 2, NULL, 34),
(9, '0001000300010001', 4, 0, 'The roads of gods', 'the-roads-of-gods', 1, 0, '/peru-destino-seguro-en/global/the-roads-of-gods/', '', 0, '', NULL, NULL, 0, 42, 1, 0, '2024-07-05 22:29:45.191766', '2024-07-05 22:29:48.552540', 38, '2024-07-05 22:29:48.552540', 'The roads of gods', NULL, NULL, 'f9aeab8b633a4c2c8dd66e54c0eafec8', 2, NULL, 38),
(10, '0001000300010002', 4, 0, 'Collpa de Guacamallos', 'collpa-de-guacamallos', 1, 0, '/peru-destino-seguro-en/global/collpa-de-guacamallos/', '', 0, '', NULL, NULL, 0, 47, 1, 0, '2024-07-12 22:55:03.769212', '2024-07-12 22:55:07.408686', 45, '2024-07-12 22:55:07.408686', 'Collpa de Guacamallos', NULL, NULL, '7516a6a3f8cf4eafa6aa94b0a620ea1c', 2, NULL, 45),
(11, '000100020002', 3, 0, 'Nosotros', 'nosotros', 1, 0, '/peru-destino-seguro/nosotros/', '', 0, '', NULL, NULL, 0, 36, 1, 0, '2024-07-22 22:31:27.126856', '2024-07-10 02:04:41.698353', 68, '2024-07-22 22:31:32.260894', 'Nosotros', NULL, NULL, 'a03cc2c2e77945dcb7189ab537b64897', 1, NULL, 68),
(12, '000100030002', 3, 0, 'About', 'about', 1, 0, '/peru-destino-seguro-en/about/', '', 0, '', NULL, NULL, 0, 36, 1, 0, '2024-07-19 22:49:24.747091', '2024-07-10 02:29:09.405847', 62, '2024-07-19 22:49:27.811469', 'About', NULL, NULL, 'a03cc2c2e77945dcb7189ab537b64897', 2, NULL, 62),
(13, '000100020003', 3, 0, 'Inicio', 'inicios', 1, 0, '/peru-destino-seguro/inicios/', '', 0, '', NULL, NULL, 0, 30, 1, 0, '2024-07-29 21:25:52.950660', '2024-07-11 21:48:48.616315', 112, '2024-07-29 21:25:58.371424', 'Inicio', NULL, NULL, 'e0b70daf21af485cbeda143361b4ecb6', 1, NULL, 112),
(14, '0001000200010003', 4, 0, 'Collpa de Manu', 'collpa-de-ollaytamtanbo', 1, 0, '/peru-destino-seguro/global/collpa-de-ollaytamtanbo/', '', 0, '', NULL, NULL, 0, 47, 1, 0, '2024-07-24 21:14:53.699477', '2024-07-15 22:15:14.294149', 93, '2024-07-24 21:14:57.333466', 'Collpa de Manu', NULL, NULL, '6ffd7fe60e7941c682d411ab541bbdf4', 1, NULL, 93),
(15, '000100030003', 3, 0, 'Home', 'inicios', 1, 0, '/peru-destino-seguro-en/inicios/', '', 0, '', NULL, NULL, 0, 30, 1, 0, '2024-07-18 21:56:18.775768', '2024-07-18 21:56:21.498931', 59, '2024-07-18 21:56:21.498931', 'Home', NULL, NULL, 'e0b70daf21af485cbeda143361b4ecb6', 2, NULL, 59),
(16, '000100020004', 3, 0, 'Contactar', 'contactar', 1, 0, '/peru-destino-seguro/contactar/', '', 0, '', NULL, NULL, 0, 67, 1, 0, '2024-07-20 23:40:40.997743', '2024-07-20 23:40:43.627461', 64, '2024-07-20 23:40:43.627461', 'Contactar', NULL, NULL, '10aa4b6bc2a64b3cab084399c19bd262', 1, NULL, 64),
(17, '000100030004', 3, 0, 'Contact', 'contact', 1, 0, '/peru-destino-seguro-en/contact/', '', 0, '', NULL, NULL, 0, 67, 1, 0, '2024-07-20 23:46:31.998431', '2024-07-20 23:46:34.626587', 66, '2024-07-20 23:46:34.626587', 'Contact', NULL, NULL, '10aa4b6bc2a64b3cab084399c19bd262', 2, NULL, 66),
(18, '0001000200010004', 4, 0, 'PERÚ 10 DIAS 9 NOCHES', 'peru-12días-11noches', 1, 0, '/peru-destino-seguro/global/peru-12días-11noches/', '', 0, '', NULL, NULL, 0, 42, 2, 0, '2024-07-26 16:54:55.178281', '2024-07-23 16:36:15.872740', 111, '2024-07-26 16:55:07.025566', 'PERÚ 10 DIAS 9 NOCHES', NULL, NULL, 'fe4b57dd7f9948febb5fdfbca89eecba', 1, NULL, 111),
(19, '0001000300010003', 4, 0, 'Peru 12 days 11 nights', 'peru-12-days-11-nights', 1, 0, '/peru-destino-seguro-en/global/peru-12-days-11-nights/', '', 0, '', NULL, NULL, 0, 42, 2, 0, '2024-07-26 16:39:50.232677', '2024-07-23 22:53:21.482075', 110, '2024-07-26 16:39:57.227206', 'Peru 12 days 11 nights', NULL, NULL, 'fe4b57dd7f9948febb5fdfbca89eecba', 2, NULL, 110),
(20, '0001000200010005', 4, 0, 'PERÚ 12 DIAS 11 NOCHES', 'perú-12-dias-11-noches', 0, 1, '/peru-destino-seguro/global/perú-12-dias-11-noches/', '', 0, '', NULL, NULL, 0, 42, 3, 0, '2024-07-25 21:22:58.304554', NULL, NULL, NULL, 'PERÚ 12 DIAS 11 NOCHES', NULL, NULL, '65f6525138e84fdca87e2be6a096ef36', 1, NULL, 109);

CREATE TABLE `wagtailcore_pagelogentry` (
  `id` int(11) NOT NULL,
  `label` longtext NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `timestamp` datetime(6) NOT NULL,
  `content_changed` tinyint(1) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uuid` char(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_pagelogentry` (`id`, `label`, `action`, `data`, `timestamp`, `content_changed`, `deleted`, `content_type_id`, `page_id`, `revision_id`, `user_id`, `uuid`) VALUES
(1, 'Peru Destino Seguro', 'wagtail.create', '{}', '2024-07-04 15:52:27.924170', 1, 0, 28, 3, NULL, 1, 'dce97bfcc89344c28cdcd5a1bddf3b0e'),
(2, 'Peru Destino Seguro', 'wagtail.edit', '{}', '2024-07-04 15:52:32.488857', 1, 0, 28, 3, 1, 1, 'dce97bfcc89344c28cdcd5a1bddf3b0e'),
(3, 'Peru Destino Seguro', 'wagtail.publish', '{}', '2024-07-04 15:52:38.986907', 1, 0, 28, 3, 1, 1, 'dce97bfcc89344c28cdcd5a1bddf3b0e'),
(4, 'Global', 'wagtail.create', '{}', '2024-07-04 16:14:41.170279', 1, 0, 66, 4, NULL, 1, '74a9398db94247f4bf8b6b1fdb1506d0'),
(5, 'Global', 'wagtail.edit', '{}', '2024-07-04 16:14:45.538997', 1, 0, 66, 4, 2, 1, '74a9398db94247f4bf8b6b1fdb1506d0'),
(6, 'Global', 'wagtail.publish', '{}', '2024-07-04 16:14:52.044011', 1, 0, 66, 4, 2, 1, '74a9398db94247f4bf8b6b1fdb1506d0'),
(7, 'El camino de los Dioses', 'wagtail.create', '{}', '2024-07-04 19:44:06.486454', 1, 0, 42, 5, NULL, 1, '4766442144d04c25a8da029b2db99216'),
(8, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 19:44:14.562482', 1, 0, 42, 5, 3, 1, '4766442144d04c25a8da029b2db99216'),
(9, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:10:24.357540', 1, 0, 42, 5, 4, 1, '1eb995b1930d4529913879348fc25333'),
(10, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-04 21:10:35.605228', 0, 0, 42, 5, 4, 1, '1eb995b1930d4529913879348fc25333'),
(11, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:13:37.478565', 1, 0, 42, 5, 5, 1, '691bc6cd058749eb8cd6bdef47fb081f'),
(12, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:15:25.261273', 1, 0, 42, 5, 6, 1, '515156f3eba54bc786aaf55d31c7b335'),
(13, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-04 21:15:38.266079', 0, 0, 42, 5, 6, 1, '515156f3eba54bc786aaf55d31c7b335'),
(14, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:19:26.670531', 1, 0, 42, 5, 7, 1, 'ab5a1dc32b3c4300b9ccd98bd14a986d'),
(15, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:20:03.853796', 1, 0, 42, 5, 8, 1, 'a81a630189a44e97984361f92e2da852'),
(16, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-04 21:20:15.116402', 0, 0, 42, 5, 8, 1, 'a81a630189a44e97984361f92e2da852'),
(17, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:27:11.832671', 1, 0, 42, 5, 9, 1, '53d2e27151f041298c5107de30e23033'),
(18, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:27:48.774577', 1, 0, 42, 5, 10, 1, '7cdedf8a93ec44299778ce21e34ab8f1'),
(19, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-04 21:28:00.568534', 0, 0, 42, 5, 10, 1, '7cdedf8a93ec44299778ce21e34ab8f1'),
(20, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:47:17.646621', 1, 0, 42, 5, 11, 1, '027eedcf32e648469fb5fe4044ca9c8f'),
(21, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:47:49.882242', 1, 0, 42, 5, 12, 1, 'cd9cf8b999d74d56be8aa670b78ae76a'),
(22, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:53:40.107054', 1, 0, 42, 5, 13, 1, '8543bcc13b81445da05ce787d8f12121'),
(23, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 21:54:17.648487', 1, 0, 42, 5, 14, 1, '2d34ebf2f8884f67b727324f9de3e62e'),
(24, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 22:11:51.174672', 1, 0, 42, 5, 15, 1, '74b28f6f3cbc49709ecd4929a368d032'),
(25, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 22:15:08.934760', 1, 0, 42, 5, 16, 1, 'ea17bc0e10074fc0b29f8b13650784d3'),
(26, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-04 22:15:20.362651', 1, 0, 42, 5, 16, 1, 'ea17bc0e10074fc0b29f8b13650784d3'),
(27, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 22:24:56.623243', 1, 0, 42, 5, 17, 1, '5ef96adf6a30495dacf992854f9824ca'),
(28, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 22:27:21.037985', 1, 0, 42, 5, 18, 1, 'f281893c068f460b9a0d611994bbd4d3'),
(29, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-04 22:27:36.595479', 1, 0, 42, 5, 18, 1, 'f281893c068f460b9a0d611994bbd4d3'),
(30, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 22:31:22.115140', 1, 0, 42, 5, 19, 1, 'b0e0eff1fae04f05bfee1a979bb022e6'),
(31, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-04 23:00:34.502215', 1, 0, 42, 5, 20, 1, '9b6e94ee84604262b00887d6e6b33e28'),
(32, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-05 14:35:14.722130', 1, 0, 42, 5, 21, 1, 'aa4debad16614af1974744a10dab430f'),
(33, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-05 14:38:43.435955', 1, 0, 42, 5, 22, 1, 'ae5a8a2642ea486685789fc99c38b054'),
(34, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-05 14:43:50.466455', 1, 0, 42, 5, 23, 1, '408a86f1c60f4cd5ba33cea8e7aa2eef'),
(35, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-05 14:44:33.573054', 1, 0, 42, 5, 24, 1, 'ba1a3ca7be6547609f58e15c6f22d288'),
(36, 'Collpa de Guacamallos', 'wagtail.create', '{}', '2024-07-05 15:50:52.680774', 1, 0, 47, 6, NULL, 1, '596852ad871f479482487bd9b68aafc0'),
(37, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-05 15:51:00.954312', 1, 0, 47, 6, 25, 1, '596852ad871f479482487bd9b68aafc0'),
(38, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-05 16:03:43.733595', 1, 0, 47, 6, 26, 1, '63a6b3ecc75042e8b4b6700437ff5aac'),
(39, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-05 16:08:07.960473', 1, 0, 47, 6, 27, 1, 'f4022688e7954115967298e2d2833094'),
(40, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-05 16:09:00.211845', 1, 0, 47, 6, 28, 1, '85ca9d6ed84b4799ad13f471440f7f1f'),
(41, 'Collpa de Guacamallos', 'wagtail.publish', '{}', '2024-07-05 16:09:10.498793', 1, 0, 47, 6, 28, 1, '85ca9d6ed84b4799ad13f471440f7f1f'),
(42, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-05 16:11:56.984497', 1, 0, 47, 6, 29, 1, '0408d70cc01b40699bd12dc1f786abf7'),
(43, 'Collpa de Guacamallos', 'wagtail.publish', '{}', '2024-07-05 16:12:11.432696', 1, 0, 47, 6, 29, 1, '0408d70cc01b40699bd12dc1f786abf7'),
(44, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-05 16:16:44.843372', 1, 0, 47, 6, 30, 1, '7d490490a1274e73bf22f6d18506bc03'),
(45, 'Collpa de Guacamallos', 'wagtail.publish', '{}', '2024-07-05 16:16:57.425924', 1, 0, 47, 6, 30, 1, '7d490490a1274e73bf22f6d18506bc03'),
(46, 'Welcome to your new Wagtail site!', 'wagtail.delete', '{}', '2024-07-05 20:47:15.190068', 0, 1, 1, 2, NULL, 1, '6474211a46b64e04b5ecdb696c5627f7'),
(47, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-05 21:11:03.334868', 1, 0, 42, 5, 31, 1, 'eb56e60d85df492386a69e3af0cd2f59'),
(48, 'Peru Destino Seguro', 'wagtail.create', '{}', '2024-07-05 21:16:00.872814', 1, 0, 28, 7, NULL, 1, '8e204fe67ddf441eac0f8e60aca7a13e'),
(49, 'Peru Destino Seguro', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 7, \"title\": \"Peru Destino Seguro\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 1, \"title\": \"Root\"}, \"destination\": {\"id\": 1, \"title\": \"Root\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-05 21:16:02.921470', 0, 0, 28, 7, NULL, 1, '8e204fe67ddf441eac0f8e60aca7a13e'),
(50, 'Peru Safe Destiny', 'wagtail.edit', '{}', '2024-07-05 21:16:33.893205', 1, 0, 28, 7, 33, 1, 'a0809699b6d04b1cab8d892c88d934e1'),
(51, 'Peru Safe Destiny', 'wagtail.publish', '{}', '2024-07-05 21:16:37.659215', 1, 0, 28, 7, 33, 1, 'a0809699b6d04b1cab8d892c88d934e1'),
(52, 'Global', 'wagtail.create', '{}', '2024-07-05 21:17:56.709631', 1, 0, 66, 8, NULL, 1, '6c1a0a0c631a477ca267247384be2e18'),
(53, 'Global', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 8, \"title\": \"Global\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 3, \"title\": \"Peru Destino Seguro\"}, \"destination\": {\"id\": 7, \"title\": \"Peru Safe Destiny\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-05 21:17:58.765715', 0, 0, 66, 8, NULL, 1, '6c1a0a0c631a477ca267247384be2e18'),
(54, 'El camino de los Dioses', 'wagtail.create', '{}', '2024-07-05 21:18:05.304051', 1, 0, 42, 9, NULL, 1, '6c1a0a0c631a477ca267247384be2e18'),
(55, 'El camino de los Dioses', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 9, \"title\": \"El camino de los Dioses\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 4, \"title\": \"Global\"}, \"destination\": {\"id\": 8, \"title\": \"Global\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-05 21:18:08.076773', 0, 0, 42, 9, NULL, 1, '6c1a0a0c631a477ca267247384be2e18'),
(56, 'Collpa de Guacamallos', 'wagtail.create', '{}', '2024-07-05 21:18:13.982210', 1, 0, 47, 10, NULL, 1, '6c1a0a0c631a477ca267247384be2e18'),
(57, 'Collpa de Guacamallos', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 10, \"title\": \"Collpa de Guacamallos\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 4, \"title\": \"Global\"}, \"destination\": {\"id\": 8, \"title\": \"Global\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-05 21:18:16.663250', 0, 0, 47, 10, NULL, 1, '6c1a0a0c631a477ca267247384be2e18'),
(58, 'The roads of gods', 'wagtail.edit', '{}', '2024-07-05 21:20:41.251015', 1, 0, 42, 9, 37, 1, 'f4d76c1d2aa04d3b994ab7e2b05657b0'),
(59, 'The roads of gods', 'wagtail.edit', '{}', '2024-07-05 22:29:46.918389', 1, 0, 42, 9, 38, 1, 'd2309f3e9f8d42bf8f6aea8a21a94af6'),
(60, 'The roads of gods', 'wagtail.publish', '{}', '2024-07-05 22:29:53.207691', 1, 0, 42, 9, 38, 1, 'd2309f3e9f8d42bf8f6aea8a21a94af6'),
(61, 'Nosotros', 'wagtail.create', '{}', '2024-07-10 02:02:59.273558', 1, 0, 36, 11, NULL, 1, '6e92476f630346d29809814fa7ed6069'),
(62, 'Nosotros', 'wagtail.edit', '{}', '2024-07-10 02:03:02.663293', 1, 0, 36, 11, 39, 1, '6e92476f630346d29809814fa7ed6069'),
(63, 'Nosotros', 'wagtail.edit', '{}', '2024-07-10 02:04:40.430290', 1, 0, 36, 11, 40, 1, 'ed139297419f459f8b3ca988eb5045d1'),
(64, 'Nosotros', 'wagtail.publish', '{}', '2024-07-10 02:04:44.913940', 0, 0, 36, 11, 40, 1, 'ed139297419f459f8b3ca988eb5045d1'),
(65, 'Nosotros', 'wagtail.create', '{}', '2024-07-10 02:06:30.459967', 1, 0, 36, 12, NULL, 1, '3fa9a9e6448546daa6a57bc763740a2e'),
(66, 'Nosotros', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 12, \"title\": \"Nosotros\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 3, \"title\": \"Peru Destino Seguro\"}, \"destination\": {\"id\": 7, \"title\": \"Peru Safe Destiny\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-10 02:06:33.279879', 0, 0, 36, 12, NULL, 1, '3fa9a9e6448546daa6a57bc763740a2e'),
(67, 'About Us', 'wagtail.edit', '{}', '2024-07-10 02:29:08.036170', 1, 0, 36, 12, 42, 1, '402ec431f54a4a868f76b6768b9f46ad'),
(68, 'About Us', 'wagtail.publish', '{}', '2024-07-10 02:29:12.900029', 1, 0, 36, 12, 42, 1, '402ec431f54a4a868f76b6768b9f46ad'),
(69, 'Inicios', 'wagtail.create', '{}', '2024-07-11 21:48:41.975264', 1, 0, 30, 13, NULL, 1, '2e8937eb55a04e3da816de74a7e8c242'),
(70, 'Inicios', 'wagtail.edit', '{}', '2024-07-11 21:48:46.783122', 1, 0, 30, 13, 43, 1, '2e8937eb55a04e3da816de74a7e8c242'),
(71, 'Inicios', 'wagtail.publish', '{}', '2024-07-11 21:48:54.241527', 1, 0, 30, 13, 43, 1, '2e8937eb55a04e3da816de74a7e8c242'),
(72, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-12 22:43:07.239728', 1, 0, 47, 10, 44, 1, '7a0ad12e24af494d8b7b38a209d06f75'),
(73, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-12 22:55:05.542080', 1, 0, 47, 10, 45, 1, 'ff5d3d02a2344d78a37a34cc60f85ecd'),
(74, 'Collpa de Guacamallos', 'wagtail.publish', '{}', '2024-07-12 22:55:11.884196', 1, 0, 47, 10, 45, 1, 'ff5d3d02a2344d78a37a34cc60f85ecd'),
(75, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-14 00:21:38.826802', 1, 0, 42, 5, 46, 1, 'eb382f9c79b641ada91320a4352c571c'),
(76, 'El camino de los Dioses', 'wagtail.publish', '{}', '2024-07-14 00:21:46.298162', 1, 0, 42, 5, 46, 1, 'eb382f9c79b641ada91320a4352c571c'),
(77, 'Inicios', 'wagtail.edit', '{}', '2024-07-14 00:23:35.723256', 1, 0, 30, 13, 47, 1, '0fe5f070f81344959a250ee50a55171e'),
(78, 'Inicio', 'wagtail.rename', '{\"title\": {\"old\": \"Inicios\", \"new\": \"Inicio\"}}', '2024-07-14 00:23:40.825457', 0, 0, 30, 13, 47, 1, '0fe5f070f81344959a250ee50a55171e'),
(79, 'Inicio', 'wagtail.publish', '{\"title\": {\"old\": \"Inicios\", \"new\": \"Inicio\"}}', '2024-07-14 00:23:41.288391', 1, 0, 30, 13, 47, 1, '0fe5f070f81344959a250ee50a55171e'),
(80, 'Inicio', 'wagtail.edit', '{}', '2024-07-15 14:57:30.782343', 1, 0, 30, 13, 48, 1, 'd40d3564ffc8401ca4691e962969df5c'),
(81, 'Inicio', 'wagtail.publish', '{}', '2024-07-15 14:57:35.554537', 1, 0, 30, 13, 48, 1, 'd40d3564ffc8401ca4691e962969df5c'),
(82, 'Collpa de Ollaytamtanbo', 'wagtail.create', '{}', '2024-07-15 22:15:09.296750', 1, 0, 47, 14, NULL, 1, '0cc6fd31713b44cdb42b51e9f897262e'),
(83, 'Collpa de Ollaytamtanbo', 'wagtail.edit', '{}', '2024-07-15 22:15:12.685652', 1, 0, 47, 14, 49, 1, '0cc6fd31713b44cdb42b51e9f897262e'),
(84, 'Collpa de Ollaytamtanbo', 'wagtail.publish', '{}', '2024-07-15 22:15:18.393768', 1, 0, 47, 14, 49, 1, '0cc6fd31713b44cdb42b51e9f897262e'),
(85, 'About Us', 'wagtail.edit', '{}', '2024-07-17 14:50:05.223662', 1, 0, 36, 12, 50, 1, '3624f43c27d8424a9ea896dfe05926d9'),
(86, 'About', 'wagtail.rename', '{\"title\": {\"old\": \"About Us\", \"new\": \"About\"}}', '2024-07-17 14:50:09.957338', 0, 0, 36, 12, 50, 1, '3624f43c27d8424a9ea896dfe05926d9'),
(87, 'About', 'wagtail.publish', '{\"title\": {\"old\": \"About Us\", \"new\": \"About\"}}', '2024-07-17 14:50:10.378207', 1, 0, 36, 12, 50, 1, '3624f43c27d8424a9ea896dfe05926d9'),
(88, 'About', 'wagtail.edit', '{}', '2024-07-17 15:22:33.571207', 1, 0, 36, 12, 51, 1, 'dbe141e7cb4940a89d5a9f28912120cd'),
(89, 'About', 'wagtail.edit', '{}', '2024-07-17 15:23:07.665288', 1, 0, 36, 12, 52, 1, '1f23ade640b84c6eb89a19afa45ebb97'),
(90, 'About', 'wagtail.edit', '{}', '2024-07-17 15:23:26.547760', 1, 0, 36, 12, 53, 1, '509dea012df84d8c9b436773b2484c6b'),
(91, 'About', 'wagtail.publish', '{}', '2024-07-17 15:23:31.247193', 0, 0, 36, 12, 53, 1, '509dea012df84d8c9b436773b2484c6b'),
(92, 'Nosotros', 'wagtail.edit', '{}', '2024-07-17 18:03:38.089421', 1, 0, 36, 11, 54, 1, '5f2e6272b74f4e6c8a7b0666054a6220'),
(93, 'Nosotros', 'wagtail.publish', '{}', '2024-07-17 18:03:43.172508', 1, 0, 36, 11, 54, 1, '5f2e6272b74f4e6c8a7b0666054a6220'),
(94, 'About', 'wagtail.edit', '{}', '2024-07-17 18:07:06.653937', 1, 0, 36, 12, 55, 1, '813752849d2040f5b5d536cbc2187058'),
(95, 'About', 'wagtail.publish', '{}', '2024-07-17 18:07:11.898680', 1, 0, 36, 12, 55, 1, '813752849d2040f5b5d536cbc2187058'),
(96, 'Inicio', 'wagtail.edit', '{}', '2024-07-17 21:57:49.332013', 1, 0, 30, 13, 56, 1, '6a5a4570e7294e97aaaa371de0d61daf'),
(97, 'Inicio', 'wagtail.publish', '{}', '2024-07-17 21:57:57.992675', 1, 0, 30, 13, 56, 1, '6a5a4570e7294e97aaaa371de0d61daf'),
(98, 'Inicio', 'wagtail.edit', '{}', '2024-07-17 22:15:42.603405', 1, 0, 30, 13, 57, 1, '86adadf73b894d429bac6646e3a70a9b'),
(99, 'Inicio', 'wagtail.publish', '{}', '2024-07-17 22:15:47.749167', 1, 0, 30, 13, 57, 1, '86adadf73b894d429bac6646e3a70a9b'),
(100, 'Inicio', 'wagtail.create', '{}', '2024-07-18 21:54:19.135714', 1, 0, 30, 15, NULL, 1, '1e9cf19a556b4ea59124eabd419d40e1'),
(101, 'Inicio', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 15, \"title\": \"Inicio\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 3, \"title\": \"Peru Destino Seguro\"}, \"destination\": {\"id\": 7, \"title\": \"Peru Safe Destiny\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-18 21:54:21.408909', 0, 0, 30, 15, NULL, 1, '1e9cf19a556b4ea59124eabd419d40e1'),
(102, 'Home', 'wagtail.edit', '{}', '2024-07-18 21:56:20.320149', 1, 0, 30, 15, 59, 1, '83d134d332424628954bfaf911b97690'),
(103, 'Home', 'wagtail.publish', '{}', '2024-07-18 21:56:25.135846', 1, 0, 30, 15, 59, 1, '83d134d332424628954bfaf911b97690'),
(104, 'Inicio', 'wagtail.edit', '{}', '2024-07-18 21:58:02.354937', 1, 0, 30, 13, 60, 1, '5b26af226d304de68607c777fb68507a'),
(105, 'Inicio', 'wagtail.publish', '{}', '2024-07-18 21:58:07.111501', 1, 0, 30, 13, 60, 1, '5b26af226d304de68607c777fb68507a'),
(106, 'Nosotros', 'wagtail.edit', '{}', '2024-07-19 22:45:01.055961', 1, 0, 36, 11, 61, 1, '0cc29c6fb20941c4adf88f23e389a850'),
(107, 'Nosotros', 'wagtail.publish', '{}', '2024-07-19 22:45:06.547397', 1, 0, 36, 11, 61, 1, '0cc29c6fb20941c4adf88f23e389a850'),
(108, 'About', 'wagtail.edit', '{}', '2024-07-19 22:49:26.106020', 1, 0, 36, 12, 62, 1, '0472350c605a48e5a421b87e4cd3da5d'),
(109, 'About', 'wagtail.publish', '{}', '2024-07-19 22:49:31.214175', 1, 0, 36, 12, 62, 1, '0472350c605a48e5a421b87e4cd3da5d'),
(110, 'Nosotros', 'wagtail.edit', '{}', '2024-07-20 21:18:58.081616', 1, 0, 36, 11, 63, 1, '729cac8b5c8a47afbfac3ae0aa21dd8c'),
(111, 'Nosotros', 'wagtail.publish', '{}', '2024-07-20 21:19:03.548032', 1, 0, 36, 11, 63, 1, '729cac8b5c8a47afbfac3ae0aa21dd8c'),
(112, 'Contactar', 'wagtail.create', '{}', '2024-07-20 23:40:39.637944', 1, 0, 67, 16, NULL, 1, 'e6552739041b493e967e142942252981'),
(113, 'Contactar', 'wagtail.edit', '{}', '2024-07-20 23:40:42.445887', 1, 0, 67, 16, 64, 1, 'e6552739041b493e967e142942252981'),
(114, 'Contactar', 'wagtail.publish', '{}', '2024-07-20 23:40:46.439633', 1, 0, 67, 16, 64, 1, 'e6552739041b493e967e142942252981'),
(115, 'Contactar', 'wagtail.create', '{}', '2024-07-20 23:44:39.580045', 1, 0, 67, 17, NULL, 1, '0befa2d570084e5ba8aef622e5f38268'),
(116, 'Contactar', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 17, \"title\": \"Contactar\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 3, \"title\": \"Peru Destino Seguro\"}, \"destination\": {\"id\": 7, \"title\": \"Peru Safe Destiny\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-20 23:44:41.521628', 0, 0, 67, 17, NULL, 1, '0befa2d570084e5ba8aef622e5f38268'),
(117, 'Contact', 'wagtail.edit', '{}', '2024-07-20 23:46:33.450787', 1, 0, 67, 17, 66, 1, '97a96524ba384c459e333bfd522b7843'),
(118, 'Contact', 'wagtail.publish', '{}', '2024-07-20 23:46:37.536346', 1, 0, 67, 17, 66, 1, '97a96524ba384c459e333bfd522b7843'),
(119, 'Nosotros', 'wagtail.edit', '{}', '2024-07-22 20:51:14.088035', 1, 0, 36, 11, 67, 1, '77ecb0d2e23741b782b10894413ed299'),
(120, 'Nosotros', 'wagtail.publish', '{}', '2024-07-22 20:51:24.439303', 1, 0, 36, 11, 67, 1, '77ecb0d2e23741b782b10894413ed299'),
(121, 'Nosotros', 'wagtail.edit', '{}', '2024-07-22 22:31:28.604636', 1, 0, 36, 11, 68, 1, '8420730416d24b6582e74924f99259da'),
(122, 'Nosotros', 'wagtail.publish', '{}', '2024-07-22 22:31:42.939844', 1, 0, 36, 11, 68, 1, '8420730416d24b6582e74924f99259da'),
(123, 'Peru 12Días  11Noches', 'wagtail.create', '{}', '2024-07-23 16:36:10.133159', 1, 0, 42, 18, NULL, 2, '854dff0c23464d55a3f0d0c9d2928cb3'),
(124, 'Peru 12Días  11Noches', 'wagtail.edit', '{}', '2024-07-23 16:36:13.609038', 1, 0, 42, 18, 69, 2, '854dff0c23464d55a3f0d0c9d2928cb3'),
(125, 'Peru 12Días  11Noches', 'wagtail.publish', '{}', '2024-07-23 16:36:22.128627', 1, 0, 42, 18, 69, 2, '854dff0c23464d55a3f0d0c9d2928cb3'),
(126, 'Peru 12Días  11Noches', 'wagtail.create', '{}', '2024-07-23 22:49:12.505057', 1, 0, 42, 19, NULL, 2, 'edf2ec071545440dab761dbf8bbc9a60'),
(127, 'Peru 12Días  11Noches', 'wagtail.copy_for_translation', '{\"page\": {\"id\": 19, \"title\": \"Peru 12D\\u00edas  11Noches\", \"locale\": {\"id\": 2, \"language_code\": \"en\"}}, \"source\": {\"id\": 4, \"title\": \"Global\"}, \"destination\": {\"id\": 8, \"title\": \"Global\"}, \"keep_live\": false, \"source_locale\": {\"id\": 1, \"language_code\": \"es\"}}', '2024-07-23 22:49:17.835678', 0, 0, 42, 19, NULL, 1, 'edf2ec071545440dab761dbf8bbc9a60'),
(128, 'Peru 12 days 11 nights', 'wagtail.edit', '{}', '2024-07-23 22:53:17.166032', 1, 0, 42, 19, 71, 1, '35b9f53eb2a7470f80d75fe3f9bb190c'),
(129, 'Peru 12 days 11 nights', 'wagtail.publish', '{}', '2024-07-23 22:53:33.367386', 1, 0, 42, 19, 71, 1, '35b9f53eb2a7470f80d75fe3f9bb190c'),
(130, 'Peru 12 days 11 nights', 'wagtail.edit', '{}', '2024-07-23 22:59:39.895279', 1, 0, 42, 19, 72, 1, 'a3ad9c4a1ccc4711adb1366b5caed89a'),
(131, 'Peru 12 days 11 nights ga', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12 days 11 nights\", \"new\": \"Peru 12 days 11 nights ga\"}}', '2024-07-23 22:59:56.603277', 0, 0, 42, 19, 72, 1, 'a3ad9c4a1ccc4711adb1366b5caed89a'),
(132, 'Peru 12 days 11 nights ga', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12 days 11 nights\", \"new\": \"Peru 12 days 11 nights ga\"}}', '2024-07-23 22:59:57.362475', 1, 0, 42, 19, 72, 1, 'a3ad9c4a1ccc4711adb1366b5caed89a'),
(133, 'Peru 12Días  11Noches', 'wagtail.edit', '{}', '2024-07-24 14:23:08.942962', 1, 0, 42, 18, 73, 1, 'de3425a9d1534f1f84e7531b7cf7c8c8'),
(134, 'Peru 12Días  11Nochesoo', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noches\", \"new\": \"Peru 12D\\u00edas  11Nochesoo\"}}', '2024-07-24 14:23:24.881055', 0, 0, 42, 18, 73, 1, 'de3425a9d1534f1f84e7531b7cf7c8c8'),
(135, 'Peru 12Días  11Nochesoo', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noches\", \"new\": \"Peru 12D\\u00edas  11Nochesoo\"}}', '2024-07-24 14:23:25.642815', 1, 0, 42, 18, 73, 1, 'de3425a9d1534f1f84e7531b7cf7c8c8'),
(136, 'Peru 12Días  11Nochesoo', 'wagtail.edit', '{}', '2024-07-24 14:25:56.176934', 1, 0, 42, 18, 74, 1, '93629dc2de284e319a6bbd8349e5fcbc'),
(137, 'Peru 12Días  11Noche', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Nochesoo\", \"new\": \"Peru 12D\\u00edas  11Noche\"}}', '2024-07-24 14:26:12.731172', 0, 0, 42, 18, 74, 1, '93629dc2de284e319a6bbd8349e5fcbc'),
(138, 'Peru 12Días  11Noche', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Nochesoo\", \"new\": \"Peru 12D\\u00edas  11Noche\"}}', '2024-07-24 14:26:13.578245', 1, 0, 42, 18, 74, 1, '93629dc2de284e319a6bbd8349e5fcbc'),
(139, 'Peru 12Días  11Noche', 'wagtail.edit', '{}', '2024-07-24 14:30:18.262802', 1, 0, 42, 18, 75, 1, '0327c4212fa348b2a24937ca86b36faf'),
(140, 'Peru 12Días  11Noctthe', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noche\", \"new\": \"Peru 12D\\u00edas  11Noctthe\"}}', '2024-07-24 14:30:34.057201', 0, 0, 42, 18, 75, 1, '0327c4212fa348b2a24937ca86b36faf'),
(141, 'Peru 12Días  11Noctthe', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noche\", \"new\": \"Peru 12D\\u00edas  11Noctthe\"}}', '2024-07-24 14:30:34.799653', 1, 0, 42, 18, 75, 1, '0327c4212fa348b2a24937ca86b36faf'),
(142, 'Peru 12Días  11Noctthe', 'wagtail.edit', '{}', '2024-07-24 14:35:52.546490', 1, 0, 42, 18, 76, 1, 'ac8eb8a945034d1b92111fc2cec63662'),
(143, 'Peru 12Días  11Noche', 'wagtail.edit', '{}', '2024-07-24 14:36:36.590193', 1, 0, 42, 18, 77, 1, '469fa8ef0aee4911b446d4ceeb1ad0c6'),
(144, 'Peru 12Días  11Noche', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noctthe\", \"new\": \"Peru 12D\\u00edas  11Noche\"}}', '2024-07-24 14:36:52.712701', 0, 0, 42, 18, 77, 1, '469fa8ef0aee4911b446d4ceeb1ad0c6'),
(145, 'Peru 12Días  11Noche', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noctthe\", \"new\": \"Peru 12D\\u00edas  11Noche\"}}', '2024-07-24 14:36:53.426182', 1, 0, 42, 18, 77, 1, '469fa8ef0aee4911b446d4ceeb1ad0c6'),
(146, 'Peru 12Días  11Noche', 'wagtail.edit', '{}', '2024-07-24 14:39:25.051847', 1, 0, 42, 18, 78, 1, 'fc10394240ea409eaa0578f705c8376e'),
(147, 'Peru 12Días  11Nochen', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noche\", \"new\": \"Peru 12D\\u00edas  11Nochen\"}}', '2024-07-24 14:39:43.887963', 0, 0, 42, 18, 78, 1, 'fc10394240ea409eaa0578f705c8376e'),
(148, 'Peru 12Días  11Nochen', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noche\", \"new\": \"Peru 12D\\u00edas  11Nochen\"}}', '2024-07-24 14:39:44.704699', 1, 0, 42, 18, 78, 1, 'fc10394240ea409eaa0578f705c8376e'),
(149, 'Peru 12 days 11 nights ga', 'wagtail.edit', '{}', '2024-07-24 16:23:54.761595', 1, 0, 42, 19, 79, 1, 'f8433da82b79406d858a2f5ce5f5caa7'),
(150, 'Peru 12 days 11 nights', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12 days 11 nights ga\", \"new\": \"Peru 12 days 11 nights\"}}', '2024-07-24 16:24:11.475562', 0, 0, 42, 19, 79, 1, 'f8433da82b79406d858a2f5ce5f5caa7'),
(151, 'Peru 12 days 11 nights', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12 days 11 nights ga\", \"new\": \"Peru 12 days 11 nights\"}}', '2024-07-24 16:24:12.221284', 1, 0, 42, 19, 79, 1, 'f8433da82b79406d858a2f5ce5f5caa7'),
(152, 'Peru 12Días  11Nochen', 'wagtail.edit', '{}', '2024-07-24 19:47:25.117011', 1, 0, 42, 18, 80, 1, '5cb65881ae784f5b8c94134f3d7a218b'),
(153, 'Peru 12Días  11Noche', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Nochen\", \"new\": \"Peru 12D\\u00edas  11Noche\"}}', '2024-07-24 19:47:42.658831', 0, 0, 42, 18, 80, 1, '5cb65881ae784f5b8c94134f3d7a218b'),
(154, 'Peru 12Días  11Noche', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Nochen\", \"new\": \"Peru 12D\\u00edas  11Noche\"}}', '2024-07-24 19:47:43.437780', 1, 0, 42, 18, 80, 1, '5cb65881ae784f5b8c94134f3d7a218b'),
(155, 'Peru 12Días  11Noche', 'wagtail.edit', '{}', '2024-07-24 19:55:30.247508', 1, 0, 42, 18, 81, 1, 'd3c1e99eafef4f7ba64c58f0760bcca1'),
(156, 'Peru 12Días  11NocheMM', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noche\", \"new\": \"Peru 12D\\u00edas  11NocheMM\"}}', '2024-07-24 19:55:49.311141', 0, 0, 42, 18, 81, 1, 'd3c1e99eafef4f7ba64c58f0760bcca1'),
(157, 'Peru 12Días  11NocheMM', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noche\", \"new\": \"Peru 12D\\u00edas  11NocheMM\"}}', '2024-07-24 19:55:50.105691', 1, 0, 42, 18, 81, 1, 'd3c1e99eafef4f7ba64c58f0760bcca1'),
(158, 'Peru 12Días  11NocheMM', 'wagtail.edit', '{}', '2024-07-24 20:00:12.182753', 1, 0, 42, 18, 82, 1, 'd1c3e1ac1227460c981b85cfddeccd7b'),
(159, 'Peru 12Días  11Nochtt', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11NocheMM\", \"new\": \"Peru 12D\\u00edas  11Nochtt\"}}', '2024-07-24 20:00:30.484194', 0, 0, 42, 18, 82, 1, 'd1c3e1ac1227460c981b85cfddeccd7b'),
(160, 'Peru 12Días  11Nochtt', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11NocheMM\", \"new\": \"Peru 12D\\u00edas  11Nochtt\"}}', '2024-07-24 20:00:31.300295', 1, 0, 42, 18, 82, 1, 'd1c3e1ac1227460c981b85cfddeccd7b'),
(161, 'Peru 12Días  11Nochtt', 'wagtail.edit', '{}', '2024-07-24 20:15:08.100718', 1, 0, 42, 18, 83, 1, 'eee726ec734a4bf1a3fd607da37fbe5b'),
(162, 'Peru 12Días  11Nocheee', 'wagtail.edit', '{}', '2024-07-24 20:18:43.346078', 1, 0, 42, 18, 84, 1, '41fa5b9ccb4248ffbaad3365a6c00779'),
(163, 'Peru 12Días  11Noch', 'wagtail.edit', '{}', '2024-07-24 20:22:13.338750', 1, 0, 42, 18, 85, 1, 'd0644c70fff042499fb0099d2a30b33a'),
(164, 'Peru 12Días  11Nocha', 'wagtail.edit', '{}', '2024-07-24 20:25:05.679711', 1, 0, 42, 18, 86, 1, '5f4292d9677d451096178144e709b5aa'),
(165, 'Peru 12Días  11Nochad', 'wagtail.edit', '{}', '2024-07-24 20:27:22.289998', 1, 0, 42, 18, 87, 1, '137f15a75c9c4b0f8cb016976a6c4651'),
(166, 'Peru 12Días  11NochadT', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Nochad\", \"new\": \"Peru 12D\\u00edas  11NochadT\"}}', '2024-07-24 20:27:39.438814', 0, 0, 42, 18, 87, 1, '137f15a75c9c4b0f8cb016976a6c4651'),
(167, 'Peru 12Días  11NochadT', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Nochad\", \"new\": \"Peru 12D\\u00edas  11NochadT\"}}', '2024-07-24 20:27:40.189721', 1, 0, 42, 18, 87, 1, '137f15a75c9c4b0f8cb016976a6c4651'),
(168, 'Peru 12Días  11NochadT', 'wagtail.edit', '{}', '2024-07-24 20:38:18.670325', 1, 0, 42, 18, 88, 1, '217410d14ec6458a89b304dda73a4c75'),
(169, 'Peru 12Días  11Noc', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11NochadT\", \"new\": \"Peru 12D\\u00edas  11Noc\"}}', '2024-07-24 20:38:30.327985', 0, 0, 42, 18, 88, 1, '217410d14ec6458a89b304dda73a4c75'),
(170, 'Peru 12Días  11Noc', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11NochadT\", \"new\": \"Peru 12D\\u00edas  11Noc\"}}', '2024-07-24 20:38:30.760832', 1, 0, 42, 18, 88, 1, '217410d14ec6458a89b304dda73a4c75'),
(171, 'Collpa de Guacamallos', 'wagtail.edit', '{}', '2024-07-24 20:51:39.076780', 1, 0, 47, 6, 89, 1, '3aeb63b0813b4170aec5552838787bad'),
(172, 'Collpa de GuacamallosCGG', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Guacamallos\", \"new\": \"Collpa de GuacamallosCGG\"}}', '2024-07-24 20:51:50.355301', 0, 0, 47, 6, 89, 1, '3aeb63b0813b4170aec5552838787bad'),
(173, 'Collpa de GuacamallosCGG', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Guacamallos\", \"new\": \"Collpa de GuacamallosCGG\"}}', '2024-07-24 20:51:51.145470', 1, 0, 47, 6, 89, 1, '3aeb63b0813b4170aec5552838787bad'),
(174, 'Collpa de GuacamallosCGG', 'wagtail.edit', '{}', '2024-07-24 20:53:45.018145', 1, 0, 47, 6, 90, 1, 'eac60e435e7a4010ae7954c352b3ba16'),
(175, 'Collpa de Guacamall', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de GuacamallosCGG\", \"new\": \"Collpa de Guacamall\"}}', '2024-07-24 20:53:56.032621', 0, 0, 47, 6, 90, 1, 'eac60e435e7a4010ae7954c352b3ba16'),
(176, 'Collpa de Guacamall', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de GuacamallosCGG\", \"new\": \"Collpa de Guacamall\"}}', '2024-07-24 20:53:56.806582', 1, 0, 47, 6, 90, 1, 'eac60e435e7a4010ae7954c352b3ba16'),
(177, 'Collpa de Guacamall', 'wagtail.edit', '{}', '2024-07-24 20:55:27.532654', 1, 0, 47, 6, 91, 1, 'c1282f11a30e4ca9806d78db5fab4fb8'),
(178, 'Collpa de Guacamallaa', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Guacamall\", \"new\": \"Collpa de Guacamallaa\"}}', '2024-07-24 20:55:38.850689', 0, 0, 47, 6, 91, 1, 'c1282f11a30e4ca9806d78db5fab4fb8'),
(179, 'Collpa de Guacamallaa', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Guacamall\", \"new\": \"Collpa de Guacamallaa\"}}', '2024-07-24 20:55:39.634616', 1, 0, 47, 6, 91, 1, 'c1282f11a30e4ca9806d78db5fab4fb8'),
(180, 'Collpa de Guacamallaa', 'wagtail.edit', '{}', '2024-07-24 21:06:35.017774', 1, 0, 47, 6, 92, 1, '97aeea6258a24bce8c016af39271497c'),
(181, 'Collpa de Guacamall', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Guacamallaa\", \"new\": \"Collpa de Guacamall\"}}', '2024-07-24 21:06:47.426257', 0, 0, 47, 6, 92, 1, '97aeea6258a24bce8c016af39271497c'),
(182, 'Collpa de Guacamall', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Guacamallaa\", \"new\": \"Collpa de Guacamall\"}}', '2024-07-24 21:06:48.139996', 1, 0, 47, 6, 92, 1, '97aeea6258a24bce8c016af39271497c'),
(183, 'Collpa de Ollaytamtanbo', 'wagtail.edit', '{}', '2024-07-24 21:14:55.337467', 1, 0, 47, 14, 93, 1, '2620eb23a760423d91752daec1a2e7b2'),
(184, 'Collpa de Manu', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Ollaytamtanbo\", \"new\": \"Collpa de Manu\"}}', '2024-07-24 21:15:03.226720', 0, 0, 47, 14, 93, 1, '2620eb23a760423d91752daec1a2e7b2'),
(185, 'Collpa de Manu', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Ollaytamtanbo\", \"new\": \"Collpa de Manu\"}}', '2024-07-24 21:15:03.678761', 1, 0, 47, 14, 93, 1, '2620eb23a760423d91752daec1a2e7b2'),
(186, 'Collpa de Guacamall', 'wagtail.edit', '{}', '2024-07-24 21:16:39.470654', 1, 0, 47, 6, 94, 1, '90f31b2669444e24b668d646ae5bd4cb'),
(187, 'Collpa de Guacamallaa', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Guacamall\", \"new\": \"Collpa de Guacamallaa\"}}', '2024-07-24 21:16:46.212194', 0, 0, 47, 6, 94, 1, '90f31b2669444e24b668d646ae5bd4cb'),
(188, 'Collpa de Guacamallaa', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Guacamall\", \"new\": \"Collpa de Guacamallaa\"}}', '2024-07-24 21:16:46.642968', 1, 0, 47, 6, 94, 1, '90f31b2669444e24b668d646ae5bd4cb'),
(189, 'Collpa de Guacamallaa', 'wagtail.edit', '{}', '2024-07-24 21:26:25.963789', 1, 0, 47, 6, 95, 1, '8ad18ca22f9449fe9813791a837d4ad2'),
(190, 'Collpa de Guacamallee', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Guacamallaa\", \"new\": \"Collpa de Guacamallee\"}}', '2024-07-24 21:26:32.912560', 0, 0, 47, 6, 95, 1, '8ad18ca22f9449fe9813791a837d4ad2'),
(191, 'Collpa de Guacamallee', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Guacamallaa\", \"new\": \"Collpa de Guacamallee\"}}', '2024-07-24 21:26:33.333738', 1, 0, 47, 6, 95, 1, '8ad18ca22f9449fe9813791a837d4ad2'),
(192, 'Collpa de Guacamallee', 'wagtail.edit', '{}', '2024-07-24 21:31:17.020000', 1, 0, 47, 6, 96, 1, '3ed540b7e55c4c1e810cb33c03afb902'),
(193, 'Collpa de Guacamalleae', 'wagtail.rename', '{\"title\": {\"old\": \"Collpa de Guacamallee\", \"new\": \"Collpa de Guacamalleae\"}}', '2024-07-24 21:31:24.119547', 0, 0, 47, 6, 96, 1, '3ed540b7e55c4c1e810cb33c03afb902'),
(194, 'Collpa de Guacamalleae', 'wagtail.publish', '{\"title\": {\"old\": \"Collpa de Guacamallee\", \"new\": \"Collpa de Guacamalleae\"}}', '2024-07-24 21:31:24.548287', 1, 0, 47, 6, 96, 1, '3ed540b7e55c4c1e810cb33c03afb902'),
(195, 'Peru 12Días  11Noc', 'wagtail.edit', '{}', '2024-07-24 21:44:31.677830', 1, 0, 42, 18, 97, 3, 'f147bbf3ef544ba0ba78cf858f80a982'),
(196, 'Peru 12Días  doris', 'wagtail.edit', '{}', '2024-07-24 21:45:29.901342', 1, 0, 42, 18, 98, 3, '892f62cb06a7466f83270b78c513f2f0'),
(197, 'Peru 12Días  doris', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noc\", \"new\": \"Peru 12D\\u00edas  doris\"}}', '2024-07-24 21:45:39.185884', 0, 0, 42, 18, 98, 3, '892f62cb06a7466f83270b78c513f2f0'),
(198, 'Peru 12Días  doris', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  11Noc\", \"new\": \"Peru 12D\\u00edas  doris\"}}', '2024-07-24 21:45:39.614772', 1, 0, 42, 18, 98, 3, '892f62cb06a7466f83270b78c513f2f0'),
(199, 'Peru 12Días  doris', 'wagtail.edit', '{}', '2024-07-24 22:12:09.689380', 1, 0, 42, 18, 99, 3, '746381d6e7bf444d9a03cd86b7acbc5d'),
(200, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.edit', '{}', '2024-07-24 23:02:22.823390', 1, 0, 42, 18, 100, 3, '4e549abdf59f4ab1beda623d1e35bb08'),
(201, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.edit', '{}', '2024-07-24 23:06:16.495344', 1, 0, 42, 18, 101, 3, '6fe7e6c4387a4d1692143d3f43ab4f2d'),
(202, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.rename', '{\"title\": {\"old\": \"Peru 12D\\u00edas  doris\", \"new\": \"PER\\u00da 10 DIAS 9 NOCHES\"}}', '2024-07-24 23:06:36.188807', 0, 0, 42, 18, 101, 3, '6fe7e6c4387a4d1692143d3f43ab4f2d'),
(203, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.publish', '{\"title\": {\"old\": \"Peru 12D\\u00edas  doris\", \"new\": \"PER\\u00da 10 DIAS 9 NOCHES\"}}', '2024-07-24 23:06:36.640574', 1, 0, 42, 18, 101, 3, '6fe7e6c4387a4d1692143d3f43ab4f2d'),
(204, 'El camino de los Dioses', 'wagtail.edit', '{}', '2024-07-24 23:45:35.286279', 1, 0, 42, 5, 102, 3, '97fa2a2c4e554fa7897476017fba4d76'),
(205, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.edit', '{}', '2024-07-24 23:46:58.180015', 1, 0, 42, 18, 103, 3, '44752ae2f03647f4b7692654c032759f'),
(206, 'PERÚ 8 DIAS 7 NOCHES', 'wagtail.edit', '{}', '2024-07-24 23:52:36.346728', 1, 0, 42, 5, 104, 3, '604f9c3ea05c44c783b7a2de415cabba'),
(207, 'PERÚ 8 DIAS 7 NOCHES', 'wagtail.edit', '{}', '2024-07-24 23:53:01.094462', 1, 0, 42, 5, 105, 3, '120904be5a5344a197b2b8b04ec5626b'),
(208, 'PERÚ 8 DIAS 7 NOCHES', 'wagtail.rename', '{\"title\": {\"old\": \"El camino de los Dioses\", \"new\": \"PER\\u00da 8 DIAS 7 NOCHES\"}}', '2024-07-24 23:53:17.779629', 0, 0, 42, 5, 105, 3, '120904be5a5344a197b2b8b04ec5626b'),
(209, 'PERÚ 8 DIAS 7 NOCHES', 'wagtail.publish', '{\"title\": {\"old\": \"El camino de los Dioses\", \"new\": \"PER\\u00da 8 DIAS 7 NOCHES\"}}', '2024-07-24 23:53:18.238890', 1, 0, 42, 5, 105, 3, '120904be5a5344a197b2b8b04ec5626b'),
(210, 'PERÚ 12 DIAS 11 NOCHES', 'wagtail.create', '{}', '2024-07-25 00:03:59.322314', 1, 0, 42, 20, NULL, 3, '056e62cee2c4493aa6525520f9b7d48d'),
(211, 'PERÚ 12 DIAS 11 NOCHES', 'wagtail.edit', '{}', '2024-07-25 00:04:02.785443', 1, 0, 42, 20, 106, 3, '056e62cee2c4493aa6525520f9b7d48d'),
(212, 'Peru 12 days 11 nights', 'wagtail.edit', '{}', '2024-07-25 15:58:21.384068', 1, 0, 42, 19, 107, 1, 'f15271d644fe4176bffd0b638e2592e3'),
(213, 'Peru 12 days 11 nights', 'wagtail.publish', '{}', '2024-07-25 15:58:31.730448', 1, 0, 42, 19, 107, 1, 'f15271d644fe4176bffd0b638e2592e3'),
(214, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.edit', '{}', '2024-07-25 19:25:57.359553', 1, 0, 42, 18, 108, 1, 'f76fbad5831541e2bf63244fa272bc4d'),
(215, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.publish', '{}', '2024-07-25 19:26:17.474874', 1, 0, 42, 18, 108, 1, 'f76fbad5831541e2bf63244fa272bc4d'),
(216, 'PERÚ 12 DIAS 11 NOCHES', 'wagtail.edit', '{}', '2024-07-25 21:23:00.073130', 1, 0, 42, 20, 109, 3, 'c5fe61433f5b46d1b5ad1b1a95b506ca'),
(217, 'Peru 12 days 11 nights', 'wagtail.edit', '{}', '2024-07-26 16:39:52.978279', 1, 0, 42, 19, 110, 1, '1a3e4fbbdef2428cbbf2c23c3266b966'),
(218, 'Peru 12 days 11 nights', 'wagtail.publish', '{}', '2024-07-26 16:40:08.232504', 1, 0, 42, 19, 110, 1, '1a3e4fbbdef2428cbbf2c23c3266b966'),
(219, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.edit', '{}', '2024-07-26 16:54:57.727684', 1, 0, 42, 18, 111, 1, 'f6d1603dc1f645ecb1c2b26d021964bc'),
(220, 'PERÚ 10 DIAS 9 NOCHES', 'wagtail.publish', '{}', '2024-07-26 16:55:32.053921', 1, 0, 42, 18, 111, 1, 'f6d1603dc1f645ecb1c2b26d021964bc'),
(221, 'Inicio', 'wagtail.edit', '{}', '2024-07-29 21:25:55.931628', 1, 0, 30, 13, 112, 1, 'b8a7bc0b46fb4ae5b62edff9dd1d6f18'),
(222, 'Inicio', 'wagtail.publish', '{}', '2024-07-29 21:26:04.466651', 1, 0, 30, 13, 112, 1, 'b8a7bc0b46fb4ae5b62edff9dd1d6f18');

CREATE TABLE `wagtailcore_pagesubscription` (
  `id` int(11) NOT NULL,
  `comment_notifications` tinyint(1) NOT NULL,
  `page_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_pagesubscription` (`id`, `comment_notifications`, `page_id`, `user_id`) VALUES
(1, 1, 3, 1),
(2, 1, 4, 1),
(3, 1, 5, 1),
(4, 1, 6, 1),
(5, 0, 7, 1),
(6, 0, 8, 1),
(7, 0, 9, 1),
(8, 1, 11, 1),
(9, 0, 12, 1),
(10, 1, 13, 1),
(11, 0, 10, 1),
(12, 1, 14, 1),
(13, 0, 15, 1),
(14, 1, 16, 1),
(15, 0, 17, 1),
(16, 1, 18, 2),
(17, 0, 10, 2),
(18, 0, 6, 2),
(19, 0, 13, 2),
(20, 0, 15, 2),
(21, 0, 18, 4),
(22, 0, 14, 4),
(23, 0, 14, 3),
(24, 0, 13, 3),
(25, 0, 18, 1),
(26, 0, 19, 1),
(27, 0, 18, 3),
(28, 0, 19, 3),
(29, 0, 5, 3),
(30, 1, 20, 3);

CREATE TABLE `wagtailcore_pageviewrestriction` (
  `id` int(11) NOT NULL,
  `password` varchar(255) NOT NULL,
  `page_id` int(11) NOT NULL,
  `restriction_type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_pageviewrestriction_groups` (
  `id` bigint(20) NOT NULL,
  `pageviewrestriction_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_referenceindex` (
  `id` int(11) NOT NULL,
  `object_id` varchar(255) NOT NULL,
  `to_object_id` varchar(255) NOT NULL,
  `model_path` longtext NOT NULL,
  `content_path` longtext NOT NULL,
  `content_path_hash` char(32) NOT NULL,
  `base_content_type_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `to_content_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_referenceindex` (`id`, `object_id`, `to_object_id`, `model_path`, `content_path`, `content_path_hash`, `base_content_type_id`, `content_type_id`, `to_content_type_id`) VALUES
(1, '1', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(2, '2', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(7, '5', '1', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 42, 32),
(8, '6', '2', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 47, 32),
(9, '6', '1', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 47, 32),
(10, '1', '2', 'backgroundMobile', 'backgroundMobile', '75ec0f09b4d05e0e9a17c79c26a89ed2', 33, 33, 32),
(12, '6', '1', 'tourDestino', 'tourDestino', '8ec2f6a570f75083b662748bee197af4', 1, 47, 33),
(13, '6', '1', 'galleryTour.item.image', 'galleryTour.1.image', 'bcfa9319287f5b6b80ddafd5ede423fc', 1, 47, 32),
(14, '9', '1', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 42, 32),
(15, '9', '2', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 42, 32),
(17, '9', '1', 'galleryPaquete.item.image', 'galleryPaquete.2.image', '648ab6eebd9557818936b668433bc3a2', 1, 42, 32),
(19, '10', '1', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 47, 32),
(20, '10', '2', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 47, 32),
(21, '10', '1', 'tourDestino', 'tourDestino', '8ec2f6a570f75083b662748bee197af4', 1, 47, 33),
(22, '10', '1', 'galleryTour.item.image', 'galleryTour.2.image', '9fabf518f5c05f9399cdaceaaadcdee8', 1, 47, 32),
(23, '3', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(29, '13', '1', 'galleryIni.Tipo2.photo', 'galleryIni.c4f7ff8e-c065-41da-852b-4f0246055475.photo', '100d59cc6f3f534786be0a46eaed045f', 1, 30, 32),
(31, '2', '2', 'backgroundMobile', 'backgroundMobile', '75ec0f09b4d05e0e9a17c79c26a89ed2', 33, 33, 32),
(32, '4', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(33, '1', '4', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 33, 33, 32),
(34, '5', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(35, '2', '5', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 33, 33, 32),
(36, '6', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(37, '3', '6', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 33, 33, 32),
(38, '3', '2', 'backgroundMobile', 'backgroundMobile', '75ec0f09b4d05e0e9a17c79c26a89ed2', 33, 33, 32),
(39, '7', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(40, '4', '7', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 33, 33, 32),
(41, '4', '2', 'backgroundMobile', 'backgroundMobile', '75ec0f09b4d05e0e9a17c79c26a89ed2', 33, 33, 32),
(42, '8', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(43, '5', '8', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 33, 33, 32),
(44, '5', '2', 'backgroundMobile', 'backgroundMobile', '75ec0f09b4d05e0e9a17c79c26a89ed2', 33, 33, 32),
(45, '9', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(47, '10', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(49, '14', '2', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 47, 32),
(51, '14', '2', 'tourDestino', 'tourDestino', '8ec2f6a570f75083b662748bee197af4', 1, 47, 33),
(52, '14', '9', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 47, 32),
(53, '14', '2', 'galleryTour.item.image', 'galleryTour.3.image', '1fa4b8a9833b5017a87741226efbbb74', 1, 47, 32),
(54, '11', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(55, '12', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(56, '11', '11', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 36, 32),
(57, '11', '12', 'imageParrafo', 'imageParrafo', 'f8311bdfdedd56859c85364c03a5c949', 1, 36, 32),
(58, '12', '11', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 36, 32),
(59, '12', '12', 'imageParrafo', 'imageParrafo', 'f8311bdfdedd56859c85364c03a5c949', 1, 36, 32),
(60, '13', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(61, '14', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(62, '15', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(63, '13', '14', 'galleryIni.Tipo1.miniPhotos.item', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.ac653cb6-8ebc-4d38-957b-e30c194b726c', '22c5690f6c815e96b7f63edf613403d3', 1, 30, 32),
(64, '13', '13', 'galleryIni.Tipo1.miniPhotos.item', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.d0907c6b-a729-4408-bbc2-397646c664a1', '0817555f13195c0fa10c79706d19fcea', 1, 30, 32),
(65, '13', '15', 'galleryIni.Tipo1.miniPhotos.item', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.7d6839e5-b13f-4db8-8aea-9957c3cf88e5', '49c4b8c68ada5922af8fcd45012942db', 1, 30, 32),
(66, '15', '1', 'galleryIni.Tipo2.photo', 'galleryIni.c4f7ff8e-c065-41da-852b-4f0246055475.photo', '100d59cc6f3f534786be0a46eaed045f', 1, 30, 32),
(67, '15', '14', 'galleryIni.Tipo1.miniPhotos.item', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.ac653cb6-8ebc-4d38-957b-e30c194b726c', '22c5690f6c815e96b7f63edf613403d3', 1, 30, 32),
(68, '15', '15', 'galleryIni.Tipo1.miniPhotos.item', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.7d6839e5-b13f-4db8-8aea-9957c3cf88e5', '49c4b8c68ada5922af8fcd45012942db', 1, 30, 32),
(69, '15', '10', 'galleryIni.Tipo1.photo', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.photo', 'f1751e2c85295f4ebf110bff2d2afc8c', 1, 30, 32),
(70, '15', '13', 'galleryIni.Tipo1.miniPhotos.item', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.miniPhotos.d0907c6b-a729-4408-bbc2-397646c664a1', '0817555f13195c0fa10c79706d19fcea', 1, 30, 32),
(71, '16', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(72, '16', '16', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 67, 32),
(73, '17', '16', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 67, 32),
(74, '17', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(75, '18', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(76, '19', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(77, '20', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(78, '21', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(84, '11', '17', 'partnersNosotros.item.image', 'partnersNosotros.1.image', 'da7c1d8b7b075cc3b758eb342efe7cae', 1, 36, 32),
(85, '11', '18', 'partnersNosotros.item.image', 'partnersNosotros.2.image', '74b01f62e50f517a88519e1e2f4b9636', 1, 36, 32),
(86, '11', '19', 'partnersNosotros.item.image', 'partnersNosotros.3.image', '34a969c3a898574caec7e6e0771978f3', 1, 36, 32),
(87, '11', '20', 'partnersNosotros.item.image', 'partnersNosotros.4.image', 'c32cb89000395c53aacd394c34f6f869', 1, 36, 32),
(88, '11', '21', 'partnersNosotros.item.image', 'partnersNosotros.5.image', '9e8f82539f8e5fda951d288fd4735ec3', 1, 36, 32),
(89, '22', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(90, '23', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(91, '24', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(92, '25', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(93, '26', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(94, '27', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(101, '11', '22', 'valoresNosotros.item.img', 'valoresNosotros.1.img', 'bd0ea6d5a938509eab69366466d54af8', 1, 36, 32),
(102, '11', '23', 'valoresNosotros.item.img', 'valoresNosotros.2.img', '673ee85f065e5b499734d3b0621fffec', 1, 36, 32),
(103, '11', '24', 'valoresNosotros.item.img', 'valoresNosotros.3.img', '42e6b49b1427527f8242b617fb2bda4a', 1, 36, 32),
(104, '11', '25', 'valoresNosotros.item.img', 'valoresNosotros.4.img', 'fc1c7d0b47ef5ff6865efde72fc1fd0c', 1, 36, 32),
(105, '11', '26', 'valoresNosotros.item.img', 'valoresNosotros.5.img', '2d4d5fc880b65ded9654467112ce758a', 1, 36, 32),
(106, '11', '27', 'valoresNosotros.item.img', 'valoresNosotros.6.img', 'a889e4c01b15527db9a3a790448a471a', 1, 36, 32),
(108, '29', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(109, '30', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(110, '31', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(117, '19', '31', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 42, 32),
(121, '19', '29', 'galleryPaquete.item.image', 'galleryPaquete.5.image', 'd32cdc7a421a55d389a398aced025e0a', 1, 42, 32),
(122, '19', '30', 'galleryPaquete.item.image', 'galleryPaquete.6.image', '1e23caf2fb0b57d5b6e97813f54987f6', 1, 42, 32),
(123, '32', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(124, '18', '32', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 42, 32),
(125, '33', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(126, '34', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(127, '35', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(131, '18', '31', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 42, 32),
(132, '18', '33', 'galleryPaquete.item.image', 'galleryPaquete.7.image', '556858fd77135be690a304edbe51d28f', 1, 42, 32),
(133, '18', '34', 'galleryPaquete.item.image', 'galleryPaquete.8.image', 'dc6addcbb7de53c1ba55be1bac57c3bb', 1, 42, 32),
(134, '18', '35', 'galleryPaquete.item.image', 'galleryPaquete.9.image', '8662e84e9fc35e3fae3f26960b2e205e', 1, 42, 32),
(135, '36', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(136, '37', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(137, '38', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(138, '5', '36', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 42, 32),
(141, '5', '37', 'galleryPaquete.item.image', 'galleryPaquete.10.image', '121b242227d65c9d864e32522172b1c6', 1, 42, 32),
(142, '5', '38', 'galleryPaquete.item.image', 'galleryPaquete.11.image', '68e78bc9839253b199fb61ae098cc7a5', 1, 42, 32),
(143, '20', '31', 'background', 'background', 'b08f54a66b9d5174bbe47931cfa5f6bb', 1, 42, 32),
(146, '20', '38', 'galleryPaquete.item.image', 'galleryPaquete.12.image', '9e6e316f720c5552b30574db01959d53', 1, 42, 32),
(147, '20', '37', 'galleryPaquete.item.image', 'galleryPaquete.13.image', 'd7c1dd3baf3e50edb7bdd4039ea6c15b', 1, 42, 32),
(148, '19', '32', 'featuredImage', 'featuredImage', '6f2682b29ad05a61bc48dc62563d522c', 1, 42, 32),
(150, '18', '34', 'galleryPaquete.item.image', 'galleryPaquete.14.image', '580f6372315a534f824543cf45b64315', 1, 42, 32),
(151, '39', '1', 'collection', 'collection', 'b40b1263e92957f2a7f89dbce56b887b', 32, 32, 7),
(152, '13', '39', 'galleryIni.Tipo1.photo', 'galleryIni.94ad5633-9fba-49dc-a3f7-695771818dbc.photo', 'f1751e2c85295f4ebf110bff2d2afc8c', 1, 30, 32);

CREATE TABLE `wagtailcore_revision` (
  `id` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `approved_go_live_at` datetime(6) DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `base_content_type_id` int(11) NOT NULL,
  `object_str` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(1, '2024-07-04 15:52:30.000760', '{\"pk\": 3, \"path\": \"00010002\", \"depth\": 2, \"numchild\": 0, \"translation_key\": \"1cb0f6f9-9611-4fdd-84e1-1019992be35a\", \"locale\": 1, \"latest_revision\": null, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru Destino Seguro\", \"draft_title\": \"Peru Destino Seguro\", \"slug\": \"peru-destino-seguro\", \"content_type\": 28, \"url_path\": \"/peru-destino-seguro/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"body\": \"\", \"wagtail_admin_comments\": []}', NULL, '3', 1, 28, 1, 'Peru Destino Seguro'),
(2, '2024-07-04 16:14:43.199387', '{\"pk\": 4, \"path\": \"000100020001\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"868cfd12-c7a0-4401-962a-96bf0dec4e54\", \"locale\": 1, \"latest_revision\": null, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Global\", \"draft_title\": \"Global\", \"slug\": \"global\", \"content_type\": 66, \"url_path\": \"/peru-destino-seguro/global/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"body\": \"<p data-block-key=\\\"8c3rz\\\">uuu</p>\", \"wagtail_admin_comments\": []}', NULL, '4', 1, 66, 1, 'Global'),
(3, '2024-07-04 19:44:09.405977', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"htxdthdth\"}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(4, '2024-07-04 21:10:21.175252', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 3, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T19:44:09.405Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"htxdthdth\"}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(5, '2024-07-04 21:13:34.398970', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 4, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:10:27.232Z\", \"live_revision\": 4, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:10:21.175Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"htxdthdth\"}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(6, '2024-07-04 21:15:22.431248', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 5, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:10:27.232Z\", \"live_revision\": 4, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:13:34.398Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"htxdthdth\"}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(7, '2024-07-04 21:19:23.967533', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 6, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:15:28.611Z\", \"live_revision\": 6, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:15:22.431Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(8, '2024-07-04 21:20:01.264894', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 7, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:15:28.611Z\", \"live_revision\": 6, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:19:23.967Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(9, '2024-07-04 21:27:09.150190', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 8, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:20:06.868Z\", \"live_revision\": 8, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:20:01.264Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(10, '2024-07-04 21:27:46.079725', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 9, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:20:06.868Z\", \"live_revision\": 8, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:27:09.150Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(11, '2024-07-04 21:47:14.876227', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 10, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:27:51.814Z\", \"live_revision\": 10, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:27:46.079Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(12, '2024-07-04 21:47:47.295806', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 11, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:27:51.814Z\", \"live_revision\": 10, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:47:14.876Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(13, '2024-07-04 21:53:37.305123', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 12, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:47:52.871Z\", \"live_revision\": 12, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:47:47.295Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(14, '2024-07-04 21:54:15.092881', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 13, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:47:52.871Z\", \"live_revision\": 12, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:53:37.305Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(15, '2024-07-04 22:11:48.323330', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 14, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:54:20.655Z\", \"live_revision\": 14, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T21:54:15.092Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(16, '2024-07-04 22:15:06.406754', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 15, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T21:54:20.655Z\", \"live_revision\": 14, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T22:11:48.323Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(17, '2024-07-04 22:24:53.781663', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 16, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:15:12.027Z\", \"live_revision\": 16, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T22:15:06.406Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(18, '2024-07-04 22:27:16.740414', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 17, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:15:12.027Z\", \"live_revision\": 16, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T22:24:53.781Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(19, '2024-07-04 22:31:19.047659', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 18, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T22:27:16.740Z\", \"alias_of\": null, \"background\": null, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"item\": \"\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(20, '2024-07-04 23:00:31.312736', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 19, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T22:31:19.047Z\", \"alias_of\": null, \"background\": null, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": []}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(21, '2024-07-05 14:35:12.011013', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 20, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T23:00:31.312Z\", \"alias_of\": null, \"background\": null, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": []}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(22, '2024-07-05 14:38:40.651635', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 21, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T14:35:12.011Z\", \"alias_of\": null, \"background\": null, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": []}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(23, '2024-07-05 14:43:47.135369', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 22, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T14:38:40.651Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": []}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(24, '2024-07-05 14:44:30.957915', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 23, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T14:43:47.135Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"item\": \"aoeaoe\"}], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": []}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(25, '2024-07-05 15:50:58.062946', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"tourDestino\": null, \"background\": null, \"featuredImage\": null, \"precio\": null, \"linkWord\": null, \"linkPdf\": null, \"linkFlyer\": null, \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryTour\": [], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallos'),
(26, '2024-07-05 16:03:40.816254', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 25, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T15:50:58.062Z\", \"alias_of\": null, \"tourDestino\": null, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryTour\": [], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallos'),
(27, '2024-07-05 16:08:04.872949', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 26, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T16:03:40.816Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaoe\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallos'),
(28, '2024-07-05 16:08:56.940819', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 27, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T16:08:04.872Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaoe\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallos'),
(29, '2024-07-05 16:11:53.964644', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 28, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-05T16:09:03.315Z\", \"live_revision\": 28, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T16:08:56.940Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoea\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallos'),
(30, '2024-07-05 16:16:41.923123', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 29, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-05T16:12:00.486Z\", \"live_revision\": 29, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T16:11:53.964Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallos'),
(31, '2024-07-05 21:11:01.847073', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 24, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T14:44:30.957Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 1, \"precio\": null, \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": []}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(32, '2024-07-05 21:16:01.495825', '{\"pk\": 7, \"path\": \"00010003\", \"depth\": 2, \"numchild\": 0, \"translation_key\": \"1cb0f6f9-9611-4fdd-84e1-1019992be35a\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru Destino Seguro\", \"draft_title\": \"Peru Destino Seguro\", \"slug\": \"peru-destino-seguro-en\", \"content_type\": 28, \"url_path\": \"/peru-destino-seguro-en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T15:52:30.000Z\", \"alias_of\": null, \"body\": \"\", \"wagtail_admin_comments\": []}', NULL, '7', NULL, 28, 1, 'Peru Destino Seguro'),
(33, '2024-07-05 21:16:32.500544', '{\"pk\": 7, \"path\": \"00010003\", \"depth\": 2, \"numchild\": 0, \"translation_key\": \"1cb0f6f9-9611-4fdd-84e1-1019992be35a\", \"locale\": 2, \"latest_revision\": 32, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru Safe Destiny\", \"draft_title\": \"Peru Destino Seguro\", \"slug\": \"peru-destino-seguro-en\", \"content_type\": 28, \"url_path\": \"/peru-destino-seguro-en/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T21:16:01.495Z\", \"alias_of\": null, \"body\": \"\", \"wagtail_admin_comments\": []}', NULL, '7', 1, 28, 1, 'Peru Safe Destiny'),
(34, '2024-07-05 21:17:57.335695', '{\"pk\": 8, \"path\": \"000100030001\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"868cfd12-c7a0-4401-962a-96bf0dec4e54\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Global\", \"draft_title\": \"Global\", \"slug\": \"global\", \"content_type\": 66, \"url_path\": \"/peru-destino-seguro-en/global/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-04T16:14:43.199Z\", \"alias_of\": null, \"body\": \"<p data-block-key=\\\"8c3rz\\\">uuu</p>\", \"wagtail_admin_comments\": []}', NULL, '8', NULL, 66, 1, 'Global'),
(35, '2024-07-05 21:18:06.287542', '{\"pk\": 9, \"path\": \"0001000300010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T21:11:01.847Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": null}], \"galleryPaquete\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"\"}]}', NULL, '9', NULL, 42, 1, 'El camino de los Dioses'),
(36, '2024-07-05 21:18:14.964739', '{\"pk\": 10, \"path\": \"0001000300010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro-en/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T16:16:41.923Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 10, \"item\": \"oaeeaoe\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 10, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 10, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 10, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '10', NULL, 47, 1, 'Collpa de Guacamallos');
INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(37, '2024-07-05 21:20:39.341198', '{\"pk\": 9, \"path\": \"0001000300010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 2, \"latest_revision\": 35, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"The roads of gods\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"the-roads-of-gods\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T21:18:06.287Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": null}], \"galleryPaquete\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"\"}]}', NULL, '9', 1, 42, 1, 'The roads of gods'),
(38, '2024-07-05 22:29:45.191766', '{\"pk\": 9, \"path\": \"0001000300010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 2, \"latest_revision\": 37, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"The roads of gods\", \"draft_title\": \"The roads of gods\", \"slug\": \"the-roads-of-gods\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/the-roads-of-gods/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T21:20:39.341Z\", \"alias_of\": null, \"background\": 2, \"featuredImage\": 1, \"precio\": \"1200.00\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"yourm\"}], \"incluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"dfbdfbfdb\"}], \"galleryPaquete\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"image\": 1, \"caption\": \"wedsvegv\"}], \"dias\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 9, \"item\": \"<p data-block-key=\\\"5w3gq\\\">edwbredfbfr</p>\"}]}', NULL, '9', 1, 42, 1, 'The roads of gods'),
(39, '2024-07-10 02:03:00.969061', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"background\": 3, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros'),
(40, '2024-07-10 02:04:38.740505', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": 39, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-10T02:03:00.969Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros'),
(41, '2024-07-10 02:06:31.459499', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-10T02:04:38.740Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', NULL, 36, 1, 'Nosotros'),
(42, '2024-07-10 02:29:06.161130', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 41, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About Us\", \"draft_title\": \"Nosotros\", \"slug\": \"about-us\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-10T02:06:31.459Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About Us'),
(43, '2024-07-11 21:48:44.102255', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": null, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicios\", \"draft_title\": \"Inicios\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 2, \\\"carouselTitulo\\\": \\\"Hola\\\", \\\"carouselDuracion\\\": \\\"1212\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicios'),
(44, '2024-07-12 22:43:05.500676', '{\"pk\": 10, \"path\": \"0001000300010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 2, \"latest_revision\": 36, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro-en/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T21:18:14.964Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 10, \"item\": \"oaeeaoe\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 10, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 10, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 10, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '10', 1, 47, 1, 'Collpa de Guacamallos'),
(45, '2024-07-12 22:55:03.769212', '{\"pk\": 10, \"path\": \"0001000300010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 2, \"latest_revision\": 44, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallos\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro-en/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-12T22:43:05.500Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 10, \"item\": \"oaeeaoe\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 10, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 10, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 10, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '10', 1, 47, 1, 'Collpa de Guacamallos'),
(46, '2024-07-14 00:21:37.281292', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 31, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-04T22:27:25.351Z\", \"live_revision\": 18, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"El camino de los Dioses\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T21:11:01.847Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 9, \"precio\": \"1300\", \"duracion\": \"10-8\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeaoe\", \"linkFlyer\": \"aoeaoe\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"item\": \"asdasd\"}], \"incluidos\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"item\": \"asdasd\"}], \"galleryPaquete\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 5, \"image\": 1, \"caption\": null}], \"dias\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"item\": \"<p data-block-key=\\\"17ptc\\\">asdasd</p>\"}]}', NULL, '5', 1, 42, 1, 'El camino de los Dioses'),
(47, '2024-07-14 00:23:34.053787', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": 43, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-11T21:48:48.616Z\", \"last_published_at\": \"2024-07-11T21:48:48.616Z\", \"live_revision\": 43, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicios\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-11T21:48:44.102Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"Hola\\\", \\\"carouselDuracion\\\": \\\"1212\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicio'),
(48, '2024-07-15 14:57:29.297981', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": 47, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-11T21:48:48.616Z\", \"last_published_at\": \"2024-07-14T00:23:37.204Z\", \"live_revision\": 47, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-14T00:23:34.053Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"El Camino de los Tiempos\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\"}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicio'),
(49, '2024-07-15 22:15:11.078150', '{\"pk\": 14, \"path\": \"0001000200010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"6ffd7fe6-0e79-41c6-82d4-11ab541bbdf4\", \"locale\": 1, \"latest_revision\": null, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Ollaytamtanbo\", \"draft_title\": \"Collpa de Ollaytamtanbo\", \"slug\": \"collpa-de-ollaytamtanbo\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-ollaytamtanbo/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"tourDestino\": 2, \"background\": 2, \"featuredImage\": 9, \"precio\": \"1212\", \"linkWord\": \"ascdasczxc\", \"linkPdf\": \"zxczx\", \"linkFlyer\": \"ASDASDASD\", \"itinerario\": \"<p data-block-key=\\\"rlbyv\\\">asdasdasd</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 14, \"item\": \"asdasd\"}], \"incluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 14, \"item\": \"dssdsd\"}], \"galleryTour\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 14, \"image\": 2, \"caption\": \"sss\"}], \"categories\": []}', NULL, '14', 1, 47, 1, 'Collpa de Ollaytamtanbo'),
(50, '2024-07-17 14:50:03.778642', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 42, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:29:09.405Z\", \"last_published_at\": \"2024-07-10T02:29:09.405Z\", \"live_revision\": 42, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About\", \"draft_title\": \"About Us\", \"slug\": \"about-us\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/about-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-10T02:29:06.161Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About'),
(51, '2024-07-17 15:22:32.189633', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 50, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:29:09.405Z\", \"last_published_at\": \"2024-07-17T14:50:06.743Z\", \"live_revision\": 50, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/about-us/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T14:50:03.778Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About'),
(52, '2024-07-17 15:23:06.179931', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 51, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:29:09.405Z\", \"last_published_at\": \"2024-07-17T15:22:35.114Z\", \"live_revision\": 51, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T15:22:32.189Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About'),
(53, '2024-07-17 15:23:25.156175', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 52, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-10T02:29:09.405Z\", \"last_published_at\": \"2024-07-17T15:22:35.114Z\", \"live_revision\": 51, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T15:23:06.179Z\", \"alias_of\": null, \"background\": 3, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 2, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About'),
(54, '2024-07-17 18:03:36.479741', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": 40, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:04:41.698Z\", \"last_published_at\": \"2024-07-10T02:04:41.698Z\", \"live_revision\": 40, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-10T02:04:38.740Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 12, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros'),
(55, '2024-07-17 18:07:04.972423', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 53, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:29:09.405Z\", \"last_published_at\": \"2024-07-17T15:23:27.939Z\", \"live_revision\": 53, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T15:23:25.156Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 12, \"razonSocial\": \"asdasdasd\", \"numeroRuc\": \"asdasdasd\", \"nombreComercial\": \"asdasdsa\", \"certificadoAutorizacion\": \"asdsadasd\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"asdsadasd\", \"grayLet\": \"asdasdasd\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About'),
(56, '2024-07-17 21:57:46.436873', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": 48, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-11T21:48:48.616Z\", \"last_published_at\": \"2024-07-15T14:57:32.174Z\", \"live_revision\": 48, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-15T14:57:29.297Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"El Camino de los Tiempos\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\", \\\"miniPhotos\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": null, \\\"id\\\": \\\"d0907c6b-a729-4408-bbc2-397646c664a1\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": null, \\\"id\\\": \\\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\\"}]}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicio'),
(57, '2024-07-17 22:15:41.001386', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": 56, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-11T21:48:48.616Z\", \"last_published_at\": \"2024-07-17T21:57:51.806Z\", \"live_revision\": 56, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T21:57:46.436Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"El Camino de los Tiempos\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\", \\\"miniPhotos\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": 13, \\\"id\\\": \\\"d0907c6b-a729-4408-bbc2-397646c664a1\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 14, \\\"id\\\": \\\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 15, \\\"id\\\": \\\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\\"}]}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicio'),
(58, '2024-07-18 21:54:19.863696', '{\"pk\": 15, \"path\": \"000100030003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro-en/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T22:15:41.001Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"oeeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoeaoe\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"El Camino de los Tiempos\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\", \\\"miniPhotos\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": 13, \\\"id\\\": \\\"d0907c6b-a729-4408-bbc2-397646c664a1\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 14, \\\"id\\\": \\\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 15, \\\"id\\\": \\\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\\"}]}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 15, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '15', NULL, 30, 1, 'Inicio'),
(59, '2024-07-18 21:56:18.775768', '{\"pk\": 15, \"path\": \"000100030003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 2, \"latest_revision\": 58, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Home\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro-en/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-18T21:54:19.863Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"i dont remenber what text is written here\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"THE TIMES ROADS\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\", \\\"miniPhotos\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": 13, \\\"id\\\": \\\"d0907c6b-a729-4408-bbc2-397646c664a1\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 14, \\\"id\\\": \\\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 15, \\\"id\\\": \\\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\\"}]}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 15, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '15', 1, 30, 1, 'Home'),
(60, '2024-07-18 21:58:01.001853', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": 57, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-11T21:48:48.616Z\", \"last_published_at\": \"2024-07-17T22:15:44.068Z\", \"live_revision\": 57, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T22:15:41.001Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 10, \\\"carouselTitulo\\\": \\\"EL CAMINO DE LOS TIEMPOS\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\", \\\"miniPhotos\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": 13, \\\"id\\\": \\\"d0907c6b-a729-4408-bbc2-397646c664a1\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 14, \\\"id\\\": \\\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 15, \\\"id\\\": \\\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\\"}]}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicio'),
(61, '2024-07-19 22:44:59.489925', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": 54, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:04:41.698Z\", \"last_published_at\": \"2024-07-17T18:03:39.716Z\", \"live_revision\": 54, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T18:03:36.479Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 12, \"razonSocial\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"numeroRuc\": \"20601468582\", \"nombreComercial\": \"PDS VIAJES\", \"certificadoAutorizacion\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"+5K\", \"grayLet\": \"AGENCIAS DE VIAJES ATENDIDAS\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 11, \"redLet\": \"+30\", \"grayLet\": \"DESTINOS\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 11, \"redLet\": \"+15\", \"grayLet\": \"15 A\\u00d1OS DE EXPERIENCIA\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros'),
(62, '2024-07-19 22:49:24.747091', '{\"pk\": 12, \"path\": \"000100030002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 2, \"latest_revision\": 55, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:29:09.405Z\", \"last_published_at\": \"2024-07-17T18:07:08.328Z\", \"live_revision\": 55, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"About\", \"draft_title\": \"About\", \"slug\": \"about\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro-en/about/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-17T18:07:04.972Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"About Us\", \"subTitulo\": \"About Us\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">ENglish</p>\", \"imageParrafo\": 12, \"razonSocial\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"numeroRuc\": \"20601468582\", \"nombreComercial\": \"PDS VIAJES\", \"certificadoAutorizacion\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 2, \"sort_order\": 0, \"page\": 12, \"redLet\": \"+5K\", \"grayLet\": \"TRAVEL AGENCIES SERVED\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 12, \"redLet\": \"+30\", \"grayLet\": \"DESTINIES\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 12, \"redLet\": \"+15\", \"grayLet\": \"15 YEARS OF EXPERIENCE\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '12', 1, 36, 1, 'About'),
(63, '2024-07-20 21:18:56.538310', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": 61, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:04:41.698Z\", \"last_published_at\": \"2024-07-19T22:45:02.888Z\", \"live_revision\": 61, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-19T22:44:59.489Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 12, \"razonSocial\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"numeroRuc\": \"20601468582\", \"nombreComercial\": \"PDS VIAJES\", \"certificadoAutorizacion\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"valoresSubtitle\": \"Valores\", \"partnersSubtitle\": \"Nuestros Partners\", \"certificadosSubtitle\": \"Certificaciones\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"+5K\", \"grayLet\": \"AGENCIAS DE VIAJES ATENDIDAS\"}, {\"pk\": 3, \"sort_order\": 1, \"page\": 11, \"redLet\": \"+30\", \"grayLet\": \"DESTINOS\"}, {\"pk\": 4, \"sort_order\": 2, \"page\": 11, \"redLet\": \"+15\", \"grayLet\": \"15 A\\u00d1OS DE EXPERIENCIA\"}], \"valoresNosotros\": [], \"partnersNosotros\": [], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros'),
(64, '2024-07-20 23:40:40.997743', '{\"pk\": 16, \"path\": \"000100020004\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"10aa4b6b-c2a6-4b3c-ab08-4399c19bd262\", \"locale\": 1, \"latest_revision\": null, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Contactar\", \"draft_title\": \"Contactar\", \"slug\": \"contactar\", \"content_type\": 67, \"url_path\": \"/peru-destino-seguro/contactar/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"background\": 16, \"titulo\": \"Cont\\u00e1ctanos\", \"formTitle\": \"Contacto\", \"ubicacion\": \"Tacna 168, Cusco 08002\", \"wagtail_admin_comments\": []}', NULL, '16', 1, 67, 1, 'Contactar'),
(65, '2024-07-20 23:44:40.170718', '{\"pk\": 17, \"path\": \"000100030004\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"10aa4b6b-c2a6-4b3c-ab08-4399c19bd262\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Contactar\", \"draft_title\": \"Contactar\", \"slug\": \"contactar\", \"content_type\": 67, \"url_path\": \"/peru-destino-seguro-en/contactar/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-20T23:40:40.997Z\", \"alias_of\": null, \"background\": 16, \"titulo\": \"Cont\\u00e1ctanos\", \"formTitle\": \"Contacto\", \"ubicacion\": \"Tacna 168, Cusco 08002\", \"wagtail_admin_comments\": []}', NULL, '17', NULL, 67, 1, 'Contactar'),
(66, '2024-07-20 23:46:31.998431', '{\"pk\": 17, \"path\": \"000100030004\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"10aa4b6b-c2a6-4b3c-ab08-4399c19bd262\", \"locale\": 2, \"latest_revision\": 65, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Contact\", \"draft_title\": \"Contactar\", \"slug\": \"contact\", \"content_type\": 67, \"url_path\": \"/peru-destino-seguro-en/contactar/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-20T23:44:40.170Z\", \"alias_of\": null, \"background\": 16, \"titulo\": \"Contact Us\", \"formTitle\": \"Contact\", \"ubicacion\": \"Tacna 168, Cusco 08002\", \"wagtail_admin_comments\": []}', NULL, '17', 1, 67, 1, 'Contact'),
(67, '2024-07-22 20:51:12.552674', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": 63, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:04:41.698Z\", \"last_published_at\": \"2024-07-20T21:18:59.888Z\", \"live_revision\": 63, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-20T21:18:56.538Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 12, \"razonSocial\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"numeroRuc\": \"20601468582\", \"nombreComercial\": \"PDS VIAJES\", \"certificadoAutorizacion\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"valoresSubtitle\": \"Valores\", \"partnersSubtitle\": \"Nuestros Partners\", \"certificadosSubtitle\": \"Certificaciones\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"+5K\", \"grayLet\": \"AGENCIAS DE VIAJES ATENDIDAS\"}, {\"pk\": 3, \"sort_order\": 1, \"page\": 11, \"redLet\": \"+30\", \"grayLet\": \"DESTINOS\"}, {\"pk\": 4, \"sort_order\": 2, \"page\": 11, \"redLet\": \"+15\", \"grayLet\": \"15 A\\u00d1OS DE EXPERIENCIA\"}], \"valoresNosotros\": [], \"partnersNosotros\": [{\"pk\": null, \"sort_order\": 0, \"page\": 11, \"image\": 17}, {\"pk\": null, \"sort_order\": 1, \"page\": 11, \"image\": 18}, {\"pk\": null, \"sort_order\": 2, \"page\": 11, \"image\": 19}, {\"pk\": null, \"sort_order\": 3, \"page\": 11, \"image\": 20}, {\"pk\": null, \"sort_order\": 4, \"page\": 11, \"image\": 21}], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros');
INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(68, '2024-07-22 22:31:27.126856', '{\"pk\": 11, \"path\": \"000100020002\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"a03cc2c2-e779-45dc-b718-9ab537b64897\", \"locale\": 1, \"latest_revision\": 67, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-10T02:04:41.698Z\", \"last_published_at\": \"2024-07-22T20:51:16.791Z\", \"live_revision\": 67, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Nosotros\", \"draft_title\": \"Nosotros\", \"slug\": \"nosotros\", \"content_type\": 36, \"url_path\": \"/peru-destino-seguro/nosotros/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-22T20:51:12.552Z\", \"alias_of\": null, \"background\": 11, \"titulo\": \"Sobre Nosotros\", \"subTitulo\": \"Sobre Nosotros\", \"parrafo\": \"<p data-block-key=\\\"8akow\\\">Espa\\u00f1ollll</p>\", \"imageParrafo\": 12, \"razonSocial\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"numeroRuc\": \"20601468582\", \"nombreComercial\": \"PDS VIAJES\", \"certificadoAutorizacion\": \"Per\\u00fa Destino Seguro E.I.R.L.\", \"valoresSubtitle\": \"Valores\", \"partnersSubtitle\": \"Nuestros Partners\", \"certificadosSubtitle\": \"Certificaciones\", \"wagtail_admin_comments\": [], \"estadisticasNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"redLet\": \"+5K\", \"grayLet\": \"AGENCIAS DE VIAJES ATENDIDAS\"}, {\"pk\": 3, \"sort_order\": 1, \"page\": 11, \"redLet\": \"+30\", \"grayLet\": \"DESTINOS\"}, {\"pk\": 4, \"sort_order\": 2, \"page\": 11, \"redLet\": \"+15\", \"grayLet\": \"15 A\\u00d1OS DE EXPERIENCIA\"}], \"valoresNosotros\": [{\"pk\": null, \"sort_order\": 0, \"page\": 11, \"img\": 22, \"label\": \"Responsabilidad\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 11, \"img\": 23, \"label\": \"Lealtad\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 11, \"img\": 24, \"label\": \"Honestidad\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 11, \"img\": 25, \"label\": \"Puntualidad\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 11, \"img\": 26, \"label\": \"Disciplina\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 11, \"img\": 27, \"label\": \"Confidencialidad\"}], \"partnersNosotros\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 11, \"image\": 17}, {\"pk\": 2, \"sort_order\": 1, \"page\": 11, \"image\": 18}, {\"pk\": 3, \"sort_order\": 2, \"page\": 11, \"image\": 19}, {\"pk\": 4, \"sort_order\": 3, \"page\": 11, \"image\": 20}, {\"pk\": 5, \"sort_order\": 4, \"page\": 11, \"image\": 21}], \"certificadosNosotros\": []}', NULL, '11', 1, 36, 1, 'Nosotros'),
(69, '2024-07-23 16:36:11.873561', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": null, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noches\", \"draft_title\": \"Peru 12D\\u00edas  11Noches\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 2, 42, 1, 'Peru 12Días  11Noches'),
(70, '2024-07-23 22:49:14.223997', '{\"pk\": 19, \"path\": \"0001000300010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 2, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noches\", \"draft_title\": \"Peru 12D\\u00edas  11Noches\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-23T16:36:11.873Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 8, \"sort_order\": 0, \"page\": 19, \"item\": \"Almuerzo\"}, {\"pk\": 9, \"sort_order\": 1, \"page\": 19, \"item\": \"Hotel\"}, {\"pk\": 10, \"sort_order\": 2, \"page\": 19, \"item\": \"Guia\"}, {\"pk\": 11, \"sort_order\": 3, \"page\": 19, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 19, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 6, \"sort_order\": 1, \"page\": 19, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '19', NULL, 42, 1, 'Peru 12Días  11Noches'),
(71, '2024-07-23 22:53:13.664047', '{\"pk\": 19, \"path\": \"0001000300010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 2, \"latest_revision\": 70, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12 days 11 nights\", \"draft_title\": \"Peru 12D\\u00edas  11Noches\", \"slug\": \"peru-12-days-11-nights\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/peru-12-days-11-nights/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-23T22:49:14.223Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 8, \"sort_order\": 0, \"page\": 19, \"item\": \"Almuerzo\"}, {\"pk\": 9, \"sort_order\": 1, \"page\": 19, \"item\": \"Hotel\"}, {\"pk\": 10, \"sort_order\": 2, \"page\": 19, \"item\": \"Guia\"}, {\"pk\": 11, \"sort_order\": 3, \"page\": 19, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 19, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 6, \"sort_order\": 1, \"page\": 19, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '19', 1, 42, 1, 'Peru 12 days 11 nights'),
(72, '2024-07-23 22:59:37.097536', '{\"pk\": 19, \"path\": \"0001000300010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 2, \"latest_revision\": 71, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T22:53:21.482Z\", \"last_published_at\": \"2024-07-23T22:53:21.482Z\", \"live_revision\": 71, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12 days 11 nights ga\", \"draft_title\": \"Peru 12 days 11 nights\", \"slug\": \"peru-12-days-11-nights\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/peru-12-days-11-nights/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-23T22:53:13.664Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 8, \"sort_order\": 0, \"page\": 19, \"item\": \"Almuerzo\"}, {\"pk\": 9, \"sort_order\": 1, \"page\": 19, \"item\": \"Hotel\"}, {\"pk\": 10, \"sort_order\": 2, \"page\": 19, \"item\": \"Guia\"}, {\"pk\": 11, \"sort_order\": 3, \"page\": 19, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 19, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 6, \"sort_order\": 1, \"page\": 19, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '19', 1, 42, 1, 'Peru 12 days 11 nights ga'),
(73, '2024-07-24 14:23:06.236519', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 69, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-23T16:36:15.872Z\", \"live_revision\": 69, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Nochesoo\", \"draft_title\": \"Peru 12D\\u00edas  11Noches\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-23T16:36:11.873Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Nochesoo'),
(74, '2024-07-24 14:25:53.389873', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 73, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T14:23:13.448Z\", \"live_revision\": 73, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noche\", \"draft_title\": \"Peru 12D\\u00edas  11Nochesoo\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T14:23:06.236Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noche'),
(75, '2024-07-24 14:30:15.370083', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 74, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T14:26:00.666Z\", \"live_revision\": 74, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noctthe\", \"draft_title\": \"Peru 12D\\u00edas  11Noche\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T14:25:53.389Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noctthe'),
(76, '2024-07-24 14:35:49.777414', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 75, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T14:30:22.658Z\", \"live_revision\": 75, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noche\", \"draft_title\": \"Peru 12D\\u00edas  11Noctthe\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T14:30:15.370Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noche'),
(77, '2024-07-24 14:36:34.024171', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 76, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T14:30:22.658Z\", \"live_revision\": 75, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noche\", \"draft_title\": \"Peru 12D\\u00edas  11Noche\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T14:35:49.777Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noche'),
(78, '2024-07-24 14:39:22.075893', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 77, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T14:36:40.686Z\", \"live_revision\": 77, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Nochen\", \"draft_title\": \"Peru 12D\\u00edas  11Noche\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T14:36:34.024Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Nochen'),
(79, '2024-07-24 16:23:51.965131', '{\"pk\": 19, \"path\": \"0001000300010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 2, \"latest_revision\": 72, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T22:53:21.482Z\", \"last_published_at\": \"2024-07-23T22:59:44.393Z\", \"live_revision\": 72, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12 days 11 nights\", \"draft_title\": \"Peru 12 days 11 nights ga\", \"slug\": \"peru-12-days-11-nights\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/peru-12-days-11-nights/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-23T22:59:37.097Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 8, \"sort_order\": 0, \"page\": 19, \"item\": \"Almuerzo\"}, {\"pk\": 9, \"sort_order\": 1, \"page\": 19, \"item\": \"Hotel\"}, {\"pk\": 10, \"sort_order\": 2, \"page\": 19, \"item\": \"Guia\"}, {\"pk\": 11, \"sort_order\": 3, \"page\": 19, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 19, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 6, \"sort_order\": 1, \"page\": 19, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '19', 1, 42, 1, 'Peru 12 days 11 nights'),
(80, '2024-07-24 19:47:22.074911', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 78, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T14:39:29.650Z\", \"live_revision\": 78, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noche\", \"draft_title\": \"Peru 12D\\u00edas  11Nochen\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T14:39:22.075Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noche'),
(81, '2024-07-24 19:55:27.226929', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 80, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T19:47:29.679Z\", \"live_revision\": 80, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11NocheMM\", \"draft_title\": \"Peru 12D\\u00edas  11Noche\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T19:47:22.074Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11NocheMM'),
(82, '2024-07-24 20:00:09.196912', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 81, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T19:55:35.033Z\", \"live_revision\": 81, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Nochtt\", \"draft_title\": \"Peru 12D\\u00edas  11NocheMM\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T19:55:27.226Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Nochtt'),
(83, '2024-07-24 20:15:05.251104', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 82, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:00:17.207Z\", \"live_revision\": 82, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Nocheee\", \"draft_title\": \"Peru 12D\\u00edas  11Nochtt\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:00:09.196Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Nocheee'),
(84, '2024-07-24 20:18:40.358204', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 83, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:15:12.487Z\", \"live_revision\": 83, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noch\", \"draft_title\": \"Peru 12D\\u00edas  11Nocheee\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:15:05.251Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noch'),
(85, '2024-07-24 20:22:10.600349', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 84, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:18:50.951Z\", \"live_revision\": 84, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Nocha\", \"draft_title\": \"Peru 12D\\u00edas  11Noch\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:18:40.358Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Nocha'),
(86, '2024-07-24 20:25:02.860361', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 85, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:22:17.806Z\", \"live_revision\": 85, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Nochad\", \"draft_title\": \"Peru 12D\\u00edas  11Nocha\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:22:10.600Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Nochad'),
(87, '2024-07-24 20:27:17.169820', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 86, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:25:10.285Z\", \"live_revision\": 86, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11NochadT\", \"draft_title\": \"Peru 12D\\u00edas  11Nochad\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:25:02.860Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11NochadT');
INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(88, '2024-07-24 20:38:17.188523', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 87, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:27:26.879Z\", \"live_revision\": 87, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  11Noc\", \"draft_title\": \"Peru 12D\\u00edas  11NochadT\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:27:17.169Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 1, 42, 1, 'Peru 12Días  11Noc'),
(89, '2024-07-24 20:51:36.097858', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 30, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-05T16:16:48.420Z\", \"live_revision\": 30, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de GuacamallosCGG\", \"draft_title\": \"Collpa de Guacamallos\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-05T16:16:41.923Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de GuacamallosCGG'),
(90, '2024-07-24 20:53:42.063584', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 89, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-24T20:51:42.608Z\", \"live_revision\": 89, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamall\", \"draft_title\": \"Collpa de GuacamallosCGG\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:51:36.097Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamall'),
(91, '2024-07-24 20:55:24.588216', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 90, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-24T20:53:48.497Z\", \"live_revision\": 90, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallaa\", \"draft_title\": \"Collpa de Guacamall\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:53:42.063Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallaa'),
(92, '2024-07-24 21:06:32.114832', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 91, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-24T20:55:31.181Z\", \"live_revision\": 91, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamall\", \"draft_title\": \"Collpa de Guacamallaa\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:55:24.588Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamall'),
(93, '2024-07-24 21:14:53.699477', '{\"pk\": 14, \"path\": \"0001000200010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"6ffd7fe6-0e79-41c6-82d4-11ab541bbdf4\", \"locale\": 1, \"latest_revision\": 49, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-15T22:15:14.294Z\", \"last_published_at\": \"2024-07-15T22:15:14.294Z\", \"live_revision\": 49, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Manu\", \"draft_title\": \"Collpa de Ollaytamtanbo\", \"slug\": \"collpa-de-ollaytamtanbo\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-ollaytamtanbo/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-15T22:15:11.078Z\", \"alias_of\": null, \"tourDestino\": 2, \"background\": 2, \"featuredImage\": 9, \"precio\": \"1212.00\", \"linkWord\": \"ascdasczxc\", \"linkPdf\": \"zxczx\", \"linkFlyer\": \"ASDASDASD\", \"itinerario\": \"<p data-block-key=\\\"rlbyv\\\">asdasdasd</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 14, \"item\": \"asdasd\"}], \"incluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 14, \"item\": \"dssdsd\"}], \"galleryTour\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 14, \"image\": 2, \"caption\": \"sss\"}], \"categories\": []}', NULL, '14', 1, 47, 1, 'Collpa de Manu'),
(94, '2024-07-24 21:16:38.088114', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 92, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-24T21:06:38.561Z\", \"live_revision\": 92, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallaa\", \"draft_title\": \"Collpa de Guacamall\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T21:06:32.114Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallaa'),
(95, '2024-07-24 21:26:24.609269', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 94, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-24T21:16:41.458Z\", \"live_revision\": 94, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamallee\", \"draft_title\": \"Collpa de Guacamallaa\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T21:16:38.088Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamallee'),
(96, '2024-07-24 21:31:15.643031', '{\"pk\": 6, \"path\": \"0001000200010002\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"7516a6a3-f8cf-4eaf-a6aa-94b0a620ea1c\", \"locale\": 1, \"latest_revision\": 95, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-05T16:09:03.315Z\", \"last_published_at\": \"2024-07-24T21:26:27.908Z\", \"live_revision\": 95, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Collpa de Guacamalleae\", \"draft_title\": \"Collpa de Guacamallee\", \"slug\": \"collpa-de-guacamallos\", \"content_type\": 47, \"url_path\": \"/peru-destino-seguro/global/collpa-de-guacamallos/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T21:26:24.609Z\", \"alias_of\": null, \"tourDestino\": 1, \"background\": 1, \"featuredImage\": 2, \"precio\": \"123.00\", \"linkWord\": \"aoeaoe\", \"linkPdf\": \"aoeao\", \"linkFlyer\": \"aoeaoe\", \"itinerario\": \"<p data-block-key=\\\"5imeg\\\">oaeaoe</p>\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"oaeeaoe\"}, {\"pk\": 2, \"sort_order\": 1, \"page\": 6, \"item\": \"oaeaoe\"}], \"incluidos\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"item\": \"aoeaooo\"}], \"galleryTour\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 6, \"image\": 1, \"caption\": \"aoeaoe\"}], \"categories\": []}', NULL, '6', 1, 47, 1, 'Collpa de Guacamalleae'),
(97, '2024-07-24 21:44:30.325199', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 88, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:38:21.195Z\", \"live_revision\": 88, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  doris\", \"draft_title\": \"Peru 12D\\u00edas  11Noc\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T20:38:17.188Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 3, 42, 1, 'Peru 12Días  doris'),
(98, '2024-07-24 21:45:28.522938', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 97, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T20:38:21.195Z\", \"live_revision\": 88, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12D\\u00edas  doris\", \"draft_title\": \"Peru 12D\\u00edas  doris\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T21:44:30.325Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 28, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 3, 42, 1, 'Peru 12Días  doris'),
(99, '2024-07-24 22:12:07.968459', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 98, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T21:45:32.225Z\", \"live_revision\": 98, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PERU 10 DIAS 9 NOCHES\", \"draft_title\": \"Peru 12D\\u00edas  doris\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T21:45:28.522Z\", \"alias_of\": null, \"background\": null, \"featuredImage\": 32, \"precio\": \"1145.00\", \"duracion\": \"10-9\", \"linkWord\": \"https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k\", \"linkFlyer\": \"https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": null}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Almuerzo\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Hotel\"}, {\"pk\": 6, \"sort_order\": 2, \"page\": 18, \"item\": \"Guia\"}, {\"pk\": 7, \"sort_order\": 3, \"page\": 18, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 18, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '18', 3, 42, 1, 'PERU 10 DIAS 9 NOCHES'),
(100, '2024-07-24 23:02:21.135665', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 99, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T21:45:32.225Z\", \"live_revision\": 98, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"draft_title\": \"PERU 10 DIAS 9 NOCHES\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T22:12:07.968Z\", \"alias_of\": null, \"background\": null, \"featuredImage\": 32, \"precio\": \"1145.00\", \"duracion\": \"10-9\", \"linkWord\": \"https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k\", \"linkFlyer\": \"https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Snack\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Gastos adicionales\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 18, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"item\": \"Servicio de caballos\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 18, \"item\": \"Seguro\"}], \"incluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 18, \"item\": \"Desayuno\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": 5, \"sort_order\": 2, \"page\": 18, \"item\": \"Alojamiento\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": 7, \"sort_order\": 4, \"page\": 18, \"item\": \"Traslados\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 18, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 18, \"item\": \"Trenes\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 18, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": null, \"sort_order\": 0, \"page\": 18, \"image\": 33, \"caption\": null}, {\"pk\": null, \"sort_order\": 1, \"page\": 18, \"image\": 34, \"caption\": null}, {\"pk\": null, \"sort_order\": 2, \"page\": 18, \"image\": 35, \"caption\": null}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"c21p7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\\"bhr0u\\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\\"bmnkj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\\"45puv\\\"></p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"807gt\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\\"affod\\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"dh2p5\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\\"8o40k\\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"p2qc\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\\"9l0j8\\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"b0u50\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"fn59g\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"1a2v0\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"4aumk\\\">Salida con destino a Lima.</p>\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"q5p5\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"7fs20\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"lpsi\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\\"c45ie\\\"></p>\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\\"c3dqa\\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\\"cbjae\\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\\"aa564\\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\\"9ovv0\\\">Nuestro tour finaliza en la Plaza San Francisco.</p>\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"9vp0h\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"9tqc3\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\\"5bgfa\\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"a47k7\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 7 : Machupicchu</h2><p data-block-key=\\\"bp9fs\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"1roq3\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\\"7eipf\\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"etnb5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"aeaf3\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"70i1r\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\\"mlog\\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"dqabv\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 8, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\\"2q3su\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"3rf01\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"6tbtl\\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"2o8u1\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": null, \"sort_order\": 9, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\\"9hfcv\\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"a73r9\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\\"aj7pg\\\"></p>\"}]}', NULL, '18', 3, 42, 1, 'PERÚ 10 DIAS 9 NOCHES');
INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(101, '2024-07-24 23:06:14.859296', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 100, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T21:45:32.225Z\", \"live_revision\": 98, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"draft_title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T23:02:21.135Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 32, \"precio\": \"1145.00\", \"duracion\": \"10-9\", \"linkWord\": \"https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k\", \"linkFlyer\": \"https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Snack\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Gastos adicionales\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 18, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"item\": \"Servicio de caballos\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 18, \"item\": \"Seguro\"}], \"incluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 18, \"item\": \"Desayuno\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": 5, \"sort_order\": 2, \"page\": 18, \"item\": \"Alojamiento\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": 7, \"sort_order\": 4, \"page\": 18, \"item\": \"Traslados\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 18, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 18, \"item\": \"Trenes\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 18, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": null, \"sort_order\": 0, \"page\": 18, \"image\": 33, \"caption\": null}, {\"pk\": null, \"sort_order\": 1, \"page\": 18, \"image\": 34, \"caption\": null}, {\"pk\": null, \"sort_order\": 2, \"page\": 18, \"image\": 35, \"caption\": null}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"c21p7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\\"bhr0u\\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\\"bmnkj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\\"45puv\\\"></p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"807gt\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\\"affod\\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"dh2p5\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\\"8o40k\\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"p2qc\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\\"9l0j8\\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"b0u50\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"fn59g\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"1a2v0\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"4aumk\\\">Salida con destino a Lima.</p>\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"q5p5\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"7fs20\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"lpsi\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\\"c45ie\\\"></p>\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\\"c3dqa\\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\\"cbjae\\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\\"aa564\\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\\"9ovv0\\\">Nuestro tour finaliza en la Plaza San Francisco.</p>\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"9vp0h\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"9tqc3\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\\"5bgfa\\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"a47k7\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 7 : Machupicchu</h2><p data-block-key=\\\"bp9fs\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"1roq3\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\\"7eipf\\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"etnb5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"aeaf3\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"70i1r\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\\"mlog\\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"dqabv\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 8, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\\"2q3su\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"3rf01\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"6tbtl\\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"2o8u1\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": null, \"sort_order\": 9, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\\"9hfcv\\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"a73r9\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\\"aj7pg\\\"></p>\"}]}', NULL, '18', 3, 42, 1, 'PERÚ 10 DIAS 9 NOCHES'),
(102, '2024-07-24 23:45:33.763989', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 46, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-14T00:21:40.550Z\", \"live_revision\": 46, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 8 DIAS 7 NOCHES\", \"draft_title\": \"El camino de los Dioses\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-14T00:21:37.281Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 36, \"precio\": \"997.00\", \"duracion\": \"8-7\", \"linkWord\": \"https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0\", \"linkFlyer\": \"https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": null}], \"incluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"asdasd\"}], \"galleryPaquete\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"image\": 37, \"caption\": null}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"image\": 38, \"caption\": null}], \"dias\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"17ptc\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"dqhi7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje</p><p data-block-key=\\\"cdujj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\\\"6i70p\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"7ot7t\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"79tk4\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"d1fn6\\\">Salida con destino a Lima.</p>\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\\\"18bam\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"37upu\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"9cld4\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 4: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"asp0m\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"c2o7h\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"84da3\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 5: Machupicchu</h2><p data-block-key=\\\"9akh3\\\"></p><p data-block-key=\\\"8hji2\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"33v60\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"7rj5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"b9l95\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 6: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"dbi3g\\\"> Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel  en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"5ci7j\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 7: TRC Ccaccaccollo </h2><p data-block-key=\\\"7edm5\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"52sh7\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"8d4p2\\\"> Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"diobk\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 8: Retorno</h2><p data-block-key=\\\"6qg4c\\\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"4uitg\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p>\"}]}', NULL, '5', 3, 42, 1, 'PERÚ 8 DIAS 7 NOCHES'),
(103, '2024-07-24 23:46:56.642264', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 101, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T23:06:20.488Z\", \"live_revision\": 101, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"draft_title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T23:06:14.859Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 32, \"precio\": \"1145.00\", \"duracion\": \"10-9\", \"linkWord\": \"https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k\", \"linkFlyer\": \"https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Snack\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Gastos adicionales\"}, {\"pk\": 8, \"sort_order\": 2, \"page\": 18, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": 9, \"sort_order\": 3, \"page\": 18, \"item\": \"Servicio de caballos\"}, {\"pk\": 10, \"sort_order\": 4, \"page\": 18, \"item\": \"Seguro\"}], \"incluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 18, \"item\": \"Desayuno\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": 5, \"sort_order\": 2, \"page\": 18, \"item\": \"Alojamiento\"}, {\"pk\": 12, \"sort_order\": 3, \"page\": 18, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": 7, \"sort_order\": 4, \"page\": 18, \"item\": \"Traslados\"}, {\"pk\": 13, \"sort_order\": 5, \"page\": 18, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": 14, \"sort_order\": 6, \"page\": 18, \"item\": \"Trenes\"}, {\"pk\": 15, \"sort_order\": 7, \"page\": 18, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": 7, \"sort_order\": 0, \"page\": 18, \"image\": 33, \"caption\": null}, {\"pk\": 8, \"sort_order\": 1, \"page\": 18, \"image\": 34, \"caption\": null}, {\"pk\": 9, \"sort_order\": 2, \"page\": 18, \"image\": 35, \"caption\": null}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"c21p7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\\"bhr0u\\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\\"bmnkj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\\"45puv\\\"></p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"807gt\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\\"affod\\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"dh2p5\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\\"8o40k\\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"p2qc\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\\"9l0j8\\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": 8, \"sort_order\": 2, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"b0u50\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"fn59g\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"1a2v0\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"4aumk\\\">Salida con destino a Lima.</p>\"}, {\"pk\": 9, \"sort_order\": 3, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"q5p5\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"7fs20\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"lpsi\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\\"c45ie\\\"></p>\"}, {\"pk\": 10, \"sort_order\": 4, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\\"c3dqa\\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\\"cbjae\\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\\"aa564\\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\\"9ovv0\\\">Nuestro tour finaliza en la Plaza San Francisco.</p>\"}, {\"pk\": 11, \"sort_order\": 5, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"9vp0h\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"9tqc3\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\\"5bgfa\\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"a47k7\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": 12, \"sort_order\": 6, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 7 : Machupicchu</h2><p data-block-key=\\\"bp9fs\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"1roq3\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\\"7eipf\\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"etnb5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"aeaf3\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": 13, \"sort_order\": 7, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"70i1r\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\\"mlog\\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"dqabv\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": 14, \"sort_order\": 8, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\\"2q3su\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"3rf01\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"6tbtl\\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"2o8u1\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": 15, \"sort_order\": 9, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\\"9hfcv\\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"a73r9\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\\"aj7pg\\\"></p>\"}]}', NULL, '18', 3, 42, 1, 'PERÚ 10 DIAS 9 NOCHES');
INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(104, '2024-07-24 23:52:34.989607', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 102, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-14T00:21:40.550Z\", \"live_revision\": 46, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 8 DIAS 7 NOCHES\", \"draft_title\": \"PER\\u00da 8 DIAS 7 NOCHES\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T23:45:33.763Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 36, \"precio\": \"997.00\", \"duracion\": \"8-7\", \"linkWord\": \"https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0\", \"linkFlyer\": \"https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"Snack\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"Gastos adicionales\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"Servicio de caballos\"}], \"incluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"Desayuno\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"Alojamiento\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"Traslados\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 5, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 5, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 5, \"item\": \"Trenes\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 5, \"item\": \"Gu\\u00eda Oficial de Turismo\"}, {\"pk\": null, \"sort_order\": 8, \"page\": 5, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"image\": 37, \"caption\": null}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"image\": 38, \"caption\": null}], \"dias\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"17ptc\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"dqhi7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje</p><p data-block-key=\\\"cdujj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\\\"6i70p\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"7ot7t\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"79tk4\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"d1fn6\\\">Salida con destino a Lima.</p>\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\\\"18bam\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"37upu\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"9cld4\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 4: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"asp0m\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"c2o7h\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"84da3\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 5: Machupicchu</h2><p data-block-key=\\\"9akh3\\\"></p><p data-block-key=\\\"8hji2\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"33v60\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"7rj5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"b9l95\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 6: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"dbi3g\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"5ci7j\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 7: TRC Ccaccaccollo</h2><p data-block-key=\\\"7edm5\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"52sh7\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"8d4p2\\\">Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"diobk\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 8: Retorno</h2><p data-block-key=\\\"6qg4c\\\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"4uitg\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p>\"}]}', NULL, '5', 3, 42, 1, 'PERÚ 8 DIAS 7 NOCHES'),
(105, '2024-07-24 23:52:59.641708', '{\"pk\": 5, \"path\": \"0001000200010001\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"f9aeab8b-633a-4c2c-8dd6-6e54c0eafec8\", \"locale\": 1, \"latest_revision\": 104, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-04T21:10:27.232Z\", \"last_published_at\": \"2024-07-14T00:21:40.550Z\", \"live_revision\": 46, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 8 DIAS 7 NOCHES\", \"draft_title\": \"PER\\u00da 8 DIAS 7 NOCHES\", \"slug\": \"el-camino-de-los-dioses\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/el-camino-de-los-dioses/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T23:52:34.989Z\", \"alias_of\": null, \"background\": 1, \"featuredImage\": 36, \"precio\": \"997.00\", \"duracion\": \"8-7\", \"linkWord\": \"https://docs.google.com/document/d/1Ek8_O2XwxCn3vvXJ0edc_tr76z5V9zTB/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1Y6LUXa5CyQ0AuUbXGfY_-w7aCquM3eq0\", \"linkFlyer\": \"https://drive.google.com/drive/folders/1wMWiHxcKhupvLImMNRjoNbMdGQ_14BaI\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"Snack\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"Gastos adicionales\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"Servicio de caballos\"}], \"incluidos\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"Desayuno\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"Alojamiento\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"Traslados\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 5, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 5, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 5, \"item\": \"Trenes\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 5, \"item\": \"Gu\\u00eda Oficial de Turismo\"}, {\"pk\": null, \"sort_order\": 8, \"page\": 5, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": null, \"sort_order\": 0, \"page\": 5, \"image\": 37, \"caption\": null}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"image\": 38, \"caption\": null}], \"dias\": [{\"pk\": 3, \"sort_order\": 0, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"17ptc\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"dqhi7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje</p><p data-block-key=\\\"cdujj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>\"}, {\"pk\": null, \"sort_order\": 1, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 2 : Ica paracas Full Day</h2><p data-block-key=\\\"6i70p\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"7ot7t\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"79tk4\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"d1fn6\\\">Salida con destino a Lima.</p>\"}, {\"pk\": null, \"sort_order\": 2, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 3: Vuelo a Cusco</h2><p data-block-key=\\\"18bam\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"37upu\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"9cld4\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>\"}, {\"pk\": null, \"sort_order\": 3, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 4: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"asp0m\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"c2o7h\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"84da3\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": null, \"sort_order\": 4, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 5: Machupicchu</h2><p data-block-key=\\\"9akh3\\\"></p><p data-block-key=\\\"8hji2\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"33v60\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas. Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"7rj5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"b9l95\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 5, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 6: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"dbi3g\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco. Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"5ci7j\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": null, \"sort_order\": 6, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 7: TRC Ccaccaccollo</h2><p data-block-key=\\\"7edm5\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"52sh7\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"8d4p2\\\">Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua mater y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"diobk\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": null, \"sort_order\": 7, \"page\": 5, \"item\": \"<h2 data-block-key=\\\"wip07\\\">Dia 8: Retorno</h2><p data-block-key=\\\"6qg4c\\\"><br/>De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"4uitg\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p>\"}]}', NULL, '5', 3, 42, 1, 'PERÚ 8 DIAS 7 NOCHES'),
(106, '2024-07-25 00:04:01.009810', '{\"pk\": 20, \"path\": \"0001000200010005\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"65f65251-38e8-4fdc-a87e-2be6a096ef36\", \"locale\": 1, \"latest_revision\": null, \"live\": false, \"has_unpublished_changes\": false, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 12 DIAS 11 NOCHES\", \"draft_title\": \"PER\\u00da 12 DIAS 11 NOCHES\", \"slug\": \"per\\u00fa-12-dias-11-noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/per\\u00fa-12-dias-11-noches/\", \"owner\": 3, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": null, \"alias_of\": null, \"background\": 31, \"featuredImage\": null, \"precio\": \"1457.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://docs.google.com/document/d/1hsAxkFf7CGpFuUq1HNm4YJvotpnE6ey4/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1mmNh4a89WU3B4XEv6ICoc6YqKPiXgecs\", \"linkFlyer\": \"https://drive.google.com/drive/folders/1Kan0WtsXxPMK93TadiPPhV5HECTFs3_1\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 12, \"sort_order\": 0, \"page\": 20, \"image\": 38, \"caption\": null}, {\"pk\": 13, \"sort_order\": 1, \"page\": 20, \"image\": 37, \"caption\": null}], \"dias\": [{\"pk\": 23, \"sort_order\": 0, \"page\": 20, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 1: Llegada a Lima </h2><p data-block-key=\\\"bcn9k\\\">De acuerdo al horario de su vuelo de llegada rastrearemos su Vuelo y estaremos al pendiente de tu llegada, nuestra movilidad estar\\u00e1 esperando por t\\u00ed. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04 podr\\u00e1s identificar a nuestro agente por el Cartel con su nombre que tienen en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de su viaje.</p><p data-block-key=\\\"5bnj4\\\">Importante: Check in al Hotel es a Partir de las 15:00 Horas. si su vuelo llega antes de la hora indicada puede solicitar uso de habitaci\\u00f3n con un adicional o puedes dejar maletas en la recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>\"}, {\"pk\": 24, \"sort_order\": 1, \"page\": 20, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"7f4si\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno.</p><p data-block-key=\\\"cr249\\\">Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV dc, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado. Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"fniri\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1 en el monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, Estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"60sgh\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar. Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": 25, \"sort_order\": 2, \"page\": 20, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"1jaf8\\\">Nos dirigiremos rumbo al Balneario de Paracas, (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS, localizadas en la Bah\\u00eda de Paracas. Donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt, Tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"1hqq9\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos a la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"7fddu\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad</p><p data-block-key=\\\"a30fa\\\">y aprovechar para realizar actividades de aventura como son los Tubulares y</p><p data-block-key=\\\"e39s5\\\">Sandboarding. salida con destino a Lima.</p>\"}, {\"pk\": 26, \"sort_order\": 3, \"page\": 20, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"7o9qm\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Chavez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"59jal\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"8h68q\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>\"}]}', NULL, '20', 3, 42, 1, 'PERÚ 12 DIAS 11 NOCHES'),
(107, '2024-07-25 15:58:19.669499', '{\"pk\": 19, \"path\": \"0001000300010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 2, \"latest_revision\": 79, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T22:53:21.482Z\", \"last_published_at\": \"2024-07-24T16:23:59.350Z\", \"live_revision\": 79, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12 days 11 nights\", \"draft_title\": \"Peru 12 days 11 nights\", \"slug\": \"peru-12-days-11-nights\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/peru-12-days-11-nights/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T16:23:51.965Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 32, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 8, \"sort_order\": 0, \"page\": 19, \"item\": \"Almuerzo\"}, {\"pk\": 9, \"sort_order\": 1, \"page\": 19, \"item\": \"Hotel\"}, {\"pk\": 10, \"sort_order\": 2, \"page\": 19, \"item\": \"Guia\"}, {\"pk\": 11, \"sort_order\": 3, \"page\": 19, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 19, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 6, \"sort_order\": 1, \"page\": 19, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1 llegada a Cusco</h2><p data-block-key=\\\"45puv\\\">Llegada a Cusco</p>\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '19', 1, 42, 1, 'Peru 12 days 11 nights'),
(108, '2024-07-25 19:25:55.705561', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 103, \"live\": true, \"has_unpublished_changes\": true, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-24T23:06:20.488Z\", \"live_revision\": 101, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"draft_title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-24T23:46:56.642Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 32, \"precio\": \"1145.00\", \"duracion\": \"10-9\", \"linkWord\": \"https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k\", \"linkFlyer\": \"https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Snack\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Gastos adicionales\"}, {\"pk\": 8, \"sort_order\": 2, \"page\": 18, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": 9, \"sort_order\": 3, \"page\": 18, \"item\": \"Servicio de caballos\"}, {\"pk\": 10, \"sort_order\": 4, \"page\": 18, \"item\": \"Seguro\"}], \"incluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 18, \"item\": \"Desayuno\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": 5, \"sort_order\": 2, \"page\": 18, \"item\": \"Alojamiento\"}, {\"pk\": 12, \"sort_order\": 3, \"page\": 18, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": 7, \"sort_order\": 4, \"page\": 18, \"item\": \"Traslados\"}, {\"pk\": 13, \"sort_order\": 5, \"page\": 18, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": 14, \"sort_order\": 6, \"page\": 18, \"item\": \"Trenes\"}, {\"pk\": 15, \"sort_order\": 7, \"page\": 18, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": 7, \"sort_order\": 0, \"page\": 18, \"image\": 33, \"caption\": null}, {\"pk\": 8, \"sort_order\": 1, \"page\": 18, \"image\": 34, \"caption\": null}, {\"pk\": 9, \"sort_order\": 2, \"page\": 18, \"image\": 35, \"caption\": null}, {\"pk\": null, \"sort_order\": 3, \"page\": 18, \"image\": 34, \"caption\": null}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"c21p7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\\"bhr0u\\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\\"bmnkj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\\"45puv\\\"></p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"807gt\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\\"affod\\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"dh2p5\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\\"8o40k\\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"p2qc\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\\"9l0j8\\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": 8, \"sort_order\": 2, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"b0u50\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"fn59g\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"1a2v0\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"4aumk\\\">Salida con destino a Lima.</p>\"}, {\"pk\": 9, \"sort_order\": 3, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"q5p5\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"7fs20\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"lpsi\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\\"c45ie\\\"></p>\"}, {\"pk\": 10, \"sort_order\": 4, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\\"c3dqa\\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\\"cbjae\\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\\"aa564\\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\\"9ovv0\\\">Nuestro tour finaliza en la Plaza San Francisco.</p>\"}, {\"pk\": 11, \"sort_order\": 5, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"9vp0h\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"9tqc3\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\\"5bgfa\\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"a47k7\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": 12, \"sort_order\": 6, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 7 : Machupicchu</h2><p data-block-key=\\\"bp9fs\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"1roq3\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\\"7eipf\\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"etnb5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"aeaf3\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": 13, \"sort_order\": 7, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"70i1r\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\\"mlog\\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"dqabv\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": 14, \"sort_order\": 8, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\\"2q3su\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"3rf01\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"6tbtl\\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"2o8u1\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": 15, \"sort_order\": 9, \"page\": 18, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\\"9hfcv\\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"a73r9\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\\"aj7pg\\\"></p>\"}]}', NULL, '18', 1, 42, 1, 'PERÚ 10 DIAS 9 NOCHES');
INSERT INTO `wagtailcore_revision` (`id`, `created_at`, `content`, `approved_go_live_at`, `object_id`, `user_id`, `content_type_id`, `base_content_type_id`, `object_str`) VALUES
(109, '2024-07-25 21:22:58.304554', '{\"pk\": 20, \"path\": \"0001000200010005\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"65f65251-38e8-4fdc-a87e-2be6a096ef36\", \"locale\": 1, \"latest_revision\": 106, \"live\": false, \"has_unpublished_changes\": true, \"first_published_at\": null, \"last_published_at\": null, \"live_revision\": null, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 12 DIAS 11 NOCHES\", \"draft_title\": \"PER\\u00da 12 DIAS 11 NOCHES\", \"slug\": \"per\\u00fa-12-dias-11-noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/per\\u00fa-12-dias-11-noches/\", \"owner\": 3, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-25T00:04:01.009Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": null, \"precio\": \"1457.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://docs.google.com/document/d/1hsAxkFf7CGpFuUq1HNm4YJvotpnE6ey4/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1mmNh4a89WU3B4XEv6ICoc6YqKPiXgecs\", \"linkFlyer\": \"https://drive.google.com/drive/folders/1Kan0WtsXxPMK93TadiPPhV5HECTFs3_1\", \"wagtail_admin_comments\": [], \"excluidos\": [], \"incluidos\": [], \"galleryPaquete\": [{\"pk\": 12, \"sort_order\": 0, \"page\": 20, \"image\": 38, \"caption\": null}, {\"pk\": 13, \"sort_order\": 1, \"page\": 20, \"image\": 37, \"caption\": null}], \"dias\": [{\"pk\": 23, \"sort_order\": 0, \"page\": 20, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"bcn9k\\\">De acuerdo al horario de su vuelo de llegada rastrearemos su Vuelo y estaremos al pendiente de tu llegada, nuestra movilidad estar\\u00e1 esperando por t\\u00ed. El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04 podr\\u00e1s identificar a nuestro agente por el Cartel con su nombre que tienen en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de su viaje.</p><p data-block-key=\\\"5bnj4\\\">Importante: Check in al Hotel es a Partir de las 15:00 Horas. si su vuelo llega antes de la hora indicada puede solicitar uso de habitaci\\u00f3n con un adicional o puedes dejar maletas en la recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p>\"}, {\"pk\": 24, \"sort_order\": 1, \"page\": 20, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"7f4si\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno.</p><p data-block-key=\\\"cr249\\\">Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV dc, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado. Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"fniri\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1 en el monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, Estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"60sgh\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar. Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": 25, \"sort_order\": 2, \"page\": 20, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"1jaf8\\\">Nos dirigiremos rumbo al Balneario de Paracas, (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS, localizadas en la Bah\\u00eda de Paracas. Donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt, Tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"1hqq9\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos a la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"7fddu\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad</p><p data-block-key=\\\"a30fa\\\">y aprovechar para realizar actividades de aventura como son los Tubulares y</p><p data-block-key=\\\"e39s5\\\">Sandboarding. salida con destino a Lima.</p>\"}, {\"pk\": 26, \"sort_order\": 3, \"page\": 20, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"42wub\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"7o9qm\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Chavez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"59jal\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"8h68q\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p>\"}, {\"pk\": 27, \"sort_order\": 4, \"page\": 20, \"titulo\": null, \"item\": \"\"}]}', NULL, '20', 3, 42, 1, 'PERÚ 12 DIAS 11 NOCHES'),
(110, '2024-07-26 16:39:50.232677', '{\"pk\": 19, \"path\": \"0001000300010003\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 2, \"latest_revision\": 107, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T22:53:21.482Z\", \"last_published_at\": \"2024-07-25T15:58:24.125Z\", \"live_revision\": 107, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Peru 12 days 11 nights\", \"draft_title\": \"Peru 12 days 11 nights\", \"slug\": \"peru-12-days-11-nights\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro-en/global/peru-12-days-11-nights/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-25T15:58:19.669Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 32, \"precio\": \"1289.00\", \"duracion\": \"12-11\", \"linkWord\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkPdf\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"linkFlyer\": \"https://drive.google.com/drive/u/0/folders/135WhuDpWQcT6NvpMn1D9d6OwpaEouOge\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"item\": \"Vuelo Lima Cusco\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"item\": \"Caballos\"}], \"incluidos\": [{\"pk\": 8, \"sort_order\": 0, \"page\": 19, \"item\": \"Almuerzo\"}, {\"pk\": 9, \"sort_order\": 1, \"page\": 19, \"item\": \"Hotel\"}, {\"pk\": 10, \"sort_order\": 2, \"page\": 19, \"item\": \"Guia\"}, {\"pk\": 11, \"sort_order\": 3, \"page\": 19, \"item\": \"Transporte\"}], \"galleryPaquete\": [{\"pk\": 5, \"sort_order\": 0, \"page\": 19, \"image\": 29, \"caption\": \"Caption\"}, {\"pk\": 6, \"sort_order\": 1, \"page\": 19, \"image\": 30, \"caption\": \"Caption\"}], \"dias\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 19, \"titulo\": \"LLegada a Cusco\", \"item\": \"<p data-block-key=\\\"s2as0\\\">Llegada a Cusco</p>\"}, {\"pk\": 7, \"sort_order\": 1, \"page\": 19, \"titulo\": \"aoeaoe\", \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia2 Valle Sgarado Conexion</h2><p data-block-key=\\\"807gt\\\">Viaje al valle Sagrado</p>\"}]}', NULL, '19', 1, 42, 1, 'Peru 12 days 11 nights'),
(111, '2024-07-26 16:54:55.178281', '{\"pk\": 18, \"path\": \"0001000200010004\", \"depth\": 4, \"numchild\": 0, \"translation_key\": \"fe4b57dd-7f99-48fe-bb5f-dfbca89eecba\", \"locale\": 1, \"latest_revision\": 108, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-23T16:36:15.872Z\", \"last_published_at\": \"2024-07-25T19:26:01.591Z\", \"live_revision\": 108, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"draft_title\": \"PER\\u00da 10 DIAS 9 NOCHES\", \"slug\": \"peru-12d\\u00edas-11noches\", \"content_type\": 42, \"url_path\": \"/peru-destino-seguro/global/peru-12d\\u00edas-11noches/\", \"owner\": 2, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-25T19:25:55.705Z\", \"alias_of\": null, \"background\": 31, \"featuredImage\": 32, \"precio\": \"1145.00\", \"duracion\": \"10-9\", \"linkWord\": \"https://docs.google.com/document/d/1VR_QpecaKU2aXFeUs1wkRuWfEFXiy-Tr/edit\", \"linkPdf\": \"https://drive.google.com/drive/folders/1MpKYk-weERztnBDfrfQL-WMBTAIHoO8k\", \"linkFlyer\": \"https://drive.google.com/drive/folders/11MDHQV2hztNOrj_7DTvEHNV1QCVscbHi\", \"wagtail_admin_comments\": [], \"excluidos\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"item\": \"Snack\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"item\": \"Gastos adicionales\"}, {\"pk\": 8, \"sort_order\": 2, \"page\": 18, \"item\": \"Equipaje de mano - Bodega\"}, {\"pk\": 9, \"sort_order\": 3, \"page\": 18, \"item\": \"Servicio de caballos\"}, {\"pk\": 10, \"sort_order\": 4, \"page\": 18, \"item\": \"Seguro\"}], \"incluidos\": [{\"pk\": 6, \"sort_order\": 0, \"page\": 18, \"item\": \"Desayuno\"}, {\"pk\": 4, \"sort_order\": 1, \"page\": 18, \"item\": \"Almuerzos (especificados en el itinerario)\"}, {\"pk\": 5, \"sort_order\": 2, \"page\": 18, \"item\": \"Alojamiento\"}, {\"pk\": 12, \"sort_order\": 3, \"page\": 18, \"item\": \"Vuelo Lima -Cusco-Lima\"}, {\"pk\": 7, \"sort_order\": 4, \"page\": 18, \"item\": \"Traslados\"}, {\"pk\": 13, \"sort_order\": 5, \"page\": 18, \"item\": \"Ticket de ingreso a los atractivos\"}, {\"pk\": 14, \"sort_order\": 6, \"page\": 18, \"item\": \"Trenes\"}, {\"pk\": 15, \"sort_order\": 7, \"page\": 18, \"item\": \"Asesoramiento constante\"}], \"galleryPaquete\": [{\"pk\": 7, \"sort_order\": 0, \"page\": 18, \"image\": 33, \"caption\": null}, {\"pk\": 8, \"sort_order\": 1, \"page\": 18, \"image\": 34, \"caption\": null}, {\"pk\": 9, \"sort_order\": 2, \"page\": 18, \"image\": 35, \"caption\": null}, {\"pk\": 14, \"sort_order\": 3, \"page\": 18, \"image\": 34, \"caption\": null}], \"dias\": [{\"pk\": 4, \"sort_order\": 0, \"page\": 18, \"titulo\": \"LLegada a Lima\", \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 1: Llegada a Lima</h2><p data-block-key=\\\"c21p7\\\">De acuerdo al horario de su vuelo de llegada (rastrearemos tu vuelo y estaremos al pendiente de tu llegada), nuestra movilidad estar\\u00e1 esperando por ti.</p><p data-block-key=\\\"bhr0u\\\">El n\\u00famero de puerta por donde tienes que salir es el N\\u00b03 o N\\u00b04, podr\\u00e1s identificar a nuestro agente por el cartel con tu nombre que tiene en mano, le llevara con direcci\\u00f3n a su alojamiento reservado en la Ciudad de Lima donde podr\\u00e1s descansar despu\\u00e9s de tu viaje.</p><p data-block-key=\\\"bmnkj\\\">Importante: El check in del hotel es a partir de las 15:00 horas, si tu vuelo llega antes de la hora indicada puedes solicitar el uso de habitaci\\u00f3n con una tarifa adicional o puedes dejar maletas en recepci\\u00f3n y salir a conocer la ciudad o esperar en el Lobby.</p><p data-block-key=\\\"45puv\\\"></p>\"}, {\"pk\": 5, \"sort_order\": 1, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"s2as0\\\">Dia 2: City tour Lima</h2><p data-block-key=\\\"807gt\\\">Nuestro tour presenta Lima en sus tres per\\u00edodos hist\\u00f3ricos: prehisp\\u00e1nico, colonial y moderno. Primero disfrutaremos de una hermosa vista panor\\u00e1mica por Lima Ancestral, Huaca Pucllana, es un sitio arqueol\\u00f3gico edificado en el siglo IV DC, centro ceremonial y administrativo considerado por los Incas como un pueblo sagrado.</p><p data-block-key=\\\"affod\\\">Posteriormente conocemos Lima colonial en su centro hist\\u00f3rico se encuentra la arquitectura urbana en este per\\u00edodo, en las calles, mansiones coloniales, balcones y paredes.</p><p data-block-key=\\\"dh2p5\\\">En el centro hist\\u00f3rico apreciamos: El Palacio de Justicia, Plaza San Mart\\u00edn, Plaza Mayor, con vistas panor\\u00e1micas al Palacio de Gobierno, la Catedral de Lima, el Ayuntamiento, ingresar\\u00e1n al</p><p data-block-key=\\\"8o40k\\\">monumental Convento de Santo Domingo apreciaras su hermoso claustro cubierto de azulejos, estar\\u00e1 acompa\\u00f1ado por un gu\\u00eda que estar\\u00e1 siempre respondiendo sus preguntas.</p><p data-block-key=\\\"p2qc\\\">Lima Contempor\\u00e1nea: Vamos a ver las zonas m\\u00e1s tradicionales de la capital: San Isidro Parque El Olivar, el distrito financiero y residencial; Miraflores: el Parque Central de Miraflores, Parque del Amor, donde podremos disfrutar de una espectacular vista al Mar.</p><p data-block-key=\\\"9l0j8\\\">Nuestro tour culminara en las afueras del Centro Comercial de Larcomar.</p>\"}, {\"pk\": 8, \"sort_order\": 2, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 3: Ica paracas Full Day</h2><p data-block-key=\\\"b0u50\\\">Nos dirigiremos rumbo al Balneario de Paracas (04 horas aproximadamente de viaje) en movilidad tur\\u00edstica, al arribar en Paracas nos dirigiremos al embarcadero El Chaco, desde este lugar se partir\\u00e1 hacia las ISLAS BALLESTAS en modernos deslizadores donde podr\\u00e1n disfrutar de un maravilloso tour a las ISLAS BALLESTAS localizadas en la Bah\\u00eda de Paracas donde se puede apreciar esta maravilla de la naturaleza y la vida marina salvaje tales como los leones marinos, ping\\u00fcinos de Humboldt tambi\\u00e9n apreciar\\u00e1n el Candelabro donde el gu\\u00eda nos narrar\\u00e1 las diferentes hip\\u00f3tesis sobre su formaci\\u00f3n.</p><p data-block-key=\\\"fn59g\\\">Continuaremos nuestro viaje hacia Ica lugar donde visitaremos la Bodega Nietto donde se elabora el aguardiente de uva, conocido famosamente como Pisco. Despu\\u00e9s de visitar las instalaciones de la bodega, los visitantes ser\\u00e1n invitados a catar o probar los principales productos que se elaboran en la bodega: Vinos, Piscos, Cremas de Pisco y Macerados.</p><p data-block-key=\\\"1a2v0\\\">Finalmente nos dirigiremos a la Huacachina el cual est\\u00e1 ubicada a solo 5 Km. del centro de la ciudad de Ica. En esta hermosa laguna los visitantes podr\\u00e1n disfrutar de la tranquilidad y aprovechar para realizar actividades de aventura como son los Tubulares y Sandboarding.</p><p data-block-key=\\\"4aumk\\\">Salida con destino a Lima.</p>\"}, {\"pk\": 9, \"sort_order\": 3, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 4: Vuelo a Cusco</h2><p data-block-key=\\\"q5p5\\\">Nos dirigiremos hac\\u00eda el aeropuerto Jorge Ch\\u00e1vez para posteriormente tomar el vuelo hacia la ciudad del Cusco.</p><p data-block-key=\\\"7fs20\\\">En las puertas de salida nos estar\\u00e1n esperando nuestro agente con un cartel para acompa\\u00f1arnos hasta nuestro alojamiento reservado, recibiremos una retroalimentaci\\u00f3n de nuestro itinerario y las mejores recomendaciones para los d\\u00edas de nuestra estad\\u00eda en Cusco.</p><p data-block-key=\\\"lpsi\\\">Tendremos la tarde libre para conocer la Ciudad por cuenta propia.</p><p data-block-key=\\\"c45ie\\\"></p>\"}, {\"pk\": 10, \"sort_order\": 4, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 5: Cuatrimotos Maras Moray</h2><p data-block-key=\\\"c3dqa\\\">Iniciamos el tour con el recojo del hotel para luego dirigirnos en nuestro transporte, por 50 minutos aproximadamente hacia el poblado de Cruzpata donde tendremos una pr\\u00e1ctica de 15 minutos el pasajero nos da el OK si no tiene ning\\u00fan problema con la cuatrimoto para empezar el tour.</p><p data-block-key=\\\"cbjae\\\">Dando lugar al inicio del recorrido con las Cuatrimotos hacia las terrazas experimentales de Moray ida y vuelta con un manejo de 2 horas aprox. hasta regresar a Cruzpata.</p><p data-block-key=\\\"aa564\\\">Continuaremos en el transporte hacia las minas del sal desde Cruzpata, por medidas de seguridad y evitar accidentes trabajamos de esta manera en la pampa de las salineras y la bajada que es un abismo, en este recorrido podremos apreciar el nevado de Ver\\u00f3nica y el nevado de Chic\\u00f3n acompa\\u00f1ados de un m\\u00e1gico paisaje en contacto con la naturaleza y algunos pobladores de la zona, terminando el recorrido nos dirigimos hacia la ciudad del Cusco.</p><p data-block-key=\\\"9ovv0\\\">Nuestro tour finaliza en la Plaza San Francisco.</p>\"}, {\"pk\": 11, \"sort_order\": 5, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 6: Valle sagrado Conexi\\u00f3n</h2><p data-block-key=\\\"9vp0h\\\">Este majestuoso tour empezar\\u00e1 a las 7:30 am aproximadamente con el recojo de su alojamiento, donde tendremos la oportunidad de observar diferentes microclimas, nuestro primer punto ser\\u00e1 el mirador de Taray donde tendremos una impresionante vista del Valle Sagrado de los Incas, continuaremos a Pisaq donde visitaremos este gran complejo arqueol\\u00f3gico para posteriormente descender el pueblo de Pisaq para la visita de un taller orfebre.</p><p data-block-key=\\\"9tqc3\\\">Continuaremos a Urubamba donde tendremos nuestro almuerzo Buffet en uno de los mejores restaurantes tur\\u00edsticos de Urubamba, una vez culminado el tiempo del almuerzo</p><p data-block-key=\\\"5bgfa\\\">continuaremos el viaje por unos 40 minutos aproximadamente hasta llegar a Ollantaytambo conocido por las ruinas de Ollantaytambo, un enorme fuerte inca con grandes terrazas de piedra sobre una ladera, tendremos un recorrido dentro del sitio arqueol\\u00f3gico por un tiempo promedio de 30 a 40 minutos.</p><p data-block-key=\\\"a47k7\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar nuestro tren y partir rumbo a Aguas Calientes (Machupicchu Pueblo).</p>\"}, {\"pk\": 12, \"sort_order\": 6, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 7 : Machupicchu</h2><p data-block-key=\\\"bp9fs\\\">Nuestro gu\\u00eda le estar\\u00e1 esperando a la hora y en el lugar de encuentro (esto ser\\u00e1 coordinado una noche antes).</p><p data-block-key=\\\"1roq3\\\">Nos dirigiremos a la estaci\\u00f3n de buses Conssetur el cual nos transportar\\u00e1 de Aguas Calientes hasta la Ciudadela de Machupicchu, presentaremos el ticket de ingresos y los documentos de identificaci\\u00f3n para poder ingresar a la Llaqta de Machupicchu, tendr\\u00e1 un recorrido de 2 horas a 2:30 min. como m\\u00e1ximo para poder recorrer dentro del atractivo y aprovechar las mejores tomas fotogr\\u00e1ficas.</p><p data-block-key=\\\"7eipf\\\">Tomaremos el bus de retorno hacia Machupicchu Pueblo, para aprovechar el tiempo en poder almorzar y conocer el pueblo.</p><p data-block-key=\\\"etnb5\\\">Nos dirigiremos a la estaci\\u00f3n de tren para posteriormente abordar y retornar hasta Ollantaytambo.</p><p data-block-key=\\\"aeaf3\\\">Nuestra movilidad estar\\u00e1 esper\\u00e1ndonos en Ollantaytambo para retornarnos hasta la ciudad del Cusco.</p>\"}, {\"pk\": 13, \"sort_order\": 7, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 8: Monta\\u00f1a de Colores</h2><p data-block-key=\\\"70i1r\\\">Iniciaremos nuestro tour hacia la Monta\\u00f1a de 7 Colores - Vinicunca recogi\\u00e9ndote de tu hotel en Cusco entre las 04:00 a 04:30 am para luego abordo de nuestra movilidad tur\\u00edstica dirigirnos hacia el sur del Cusco.</p><p data-block-key=\\\"mlog\\\">Nos dirigiremos hacia el distrito de Cusipata donde tendremos nuestro desayuno buffet. Viajaremos 1 horas m\\u00e1s en el transporte hasta la localidad de Chillihuani donde empezaremos nuestra caminata, 3km de subida aguardan por nosotros lo cual lo realizaremos en 1 hora con 30 minutos aproximadamente llegando a la cumbre a 5100 m.s.n.m y poder observar la Monta\\u00f1a de Colores, descenderemos por el mismo camino hasta el estacionamiento.</p><p data-block-key=\\\"dqabv\\\">Retornaremos a la localidad de Cusipata para el almuerzo buffet y finalmente a la ciudad del Cusco.</p>\"}, {\"pk\": 14, \"sort_order\": 8, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 9: TRC Ccaccaccollo</h2><p data-block-key=\\\"2q3su\\\">Iniciamos con el recojo de su Alojamiento, luego dirigirnos hacia la C.C de Ccaccaccollo que est\\u00e1 ubicado a 45 Minutos de la Ciudad del Cusco para luego ser recepcionado por pobladores de la Localidad en la Zona textil donde observaremos el Proceso de hilado, te\\u00f1ido, y tejido de fibra de cam\\u00e9lidos sudamericanos donde podr\\u00e1s apreciar la variedad de productos realizados a mano y un acabado \\u00fanico.</p><p data-block-key=\\\"3rf01\\\">Nuestra unidad nos transportara hacia Puka qaqa (Inicio de la caminata del circuito de Miradores ) dando inicio a nuestra caminata con la presentaci\\u00f3n de una Danza propia de la comunidad continuando el recorrido llegaremos al primer mirador donde seremos parte de una Ceremonia Andina y el ritual con la Coca, seguiremos nuestro recorrido llegando a un segundo mirador donde tendremos una amplia perspectiva del valle sagrado para luego retornar al poblado.</p><p data-block-key=\\\"6tbtl\\\">Espera un suculento almuerzo t\\u00edpico preparado al estilo de Ccaccaccollo, para posteriormente dirigirnos al campo donde ser\\u00e1s participe del trabajo cotidiano de los pobladores, adquiriendo conocimientos sobre la agricultura y compartiendo experiencias. Retornaremos a la vivienda para iniciar con nuestra tarde cultural actividad que te har\\u00e1 vivir la esencia de la comunidad con cuentos, cantos en nuestra lengua materna y baile con musical tradicional. de esta forma se despedir\\u00e1n nuestros pobladores dese\\u00e1ndote un buen por venir.</p><p data-block-key=\\\"2o8u1\\\">Retornaremos a la ciudad del Cusco terminando nuestro tour en tu alojamiento.</p>\"}, {\"pk\": 15, \"sort_order\": 9, \"page\": 18, \"titulo\": null, \"item\": \"<h2 data-block-key=\\\"tv6z1\\\">Dia 10: Retorno -Vuelo a Lima</h2><p data-block-key=\\\"9hfcv\\\">De acuerdo al horario de vuelo adquirido nuestra movilidad pasara por su alojamiento para luego tomar el vuelo con direcci\\u00f3n al aeropuerto de Lima.</p><p data-block-key=\\\"a73r9\\\">En el Aeropuerto realizaras el check in correspondiente para el vuelo internacional y continuar tu viaje hacia su Pa\\u00eds de Origen.</p><p data-block-key=\\\"aj7pg\\\"></p>\"}]}', NULL, '18', 1, 42, 1, 'PERÚ 10 DIAS 9 NOCHES'),
(112, '2024-07-29 21:25:52.950660', '{\"pk\": 13, \"path\": \"000100020003\", \"depth\": 3, \"numchild\": 0, \"translation_key\": \"e0b70daf-21af-485c-beda-143361b4ecb6\", \"locale\": 1, \"latest_revision\": 60, \"live\": true, \"has_unpublished_changes\": false, \"first_published_at\": \"2024-07-11T21:48:48.616Z\", \"last_published_at\": \"2024-07-18T21:58:03.709Z\", \"live_revision\": 60, \"go_live_at\": null, \"expire_at\": null, \"expired\": false, \"locked\": false, \"locked_at\": null, \"locked_by\": null, \"title\": \"Inicio\", \"draft_title\": \"Inicio\", \"slug\": \"inicios\", \"content_type\": 30, \"url_path\": \"/peru-destino-seguro/inicios/\", \"owner\": 1, \"seo_title\": \"\", \"show_in_menus\": false, \"search_description\": \"\", \"latest_revision_created_at\": \"2024-07-18T21:58:01.001Z\", \"alias_of\": null, \"paqueteTitulo\": \"Nuestros Paquetes\", \"destinoTitulo\": \"Destinos\", \"formularioTitulo\": \"\\u00bfTiene alguna pregunta especifica?\", \"formularioSubtitulo\": \"Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum\", \"galleryIni\": \"[{\\\"type\\\": \\\"Tipo1\\\", \\\"value\\\": {\\\"photo\\\": 39, \\\"carouselTitulo\\\": \\\"EL CAMINO DE LOS TIEMPOS\\\", \\\"carouselDuracion\\\": \\\"8-7\\\", \\\"carouselLink\\\": \\\"aoeuaoeuaoue\\\", \\\"carouselButtonName\\\": \\\"Ver\\\", \\\"miniPhotos\\\": [{\\\"type\\\": \\\"item\\\", \\\"value\\\": 13, \\\"id\\\": \\\"d0907c6b-a729-4408-bbc2-397646c664a1\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 14, \\\"id\\\": \\\"ac653cb6-8ebc-4d38-957b-e30c194b726c\\\"}, {\\\"type\\\": \\\"item\\\", \\\"value\\\": 15, \\\"id\\\": \\\"7d6839e5-b13f-4db8-8aea-9957c3cf88e5\\\"}]}, \\\"id\\\": \\\"94ad5633-9fba-49dc-a3f7-695771818dbc\\\"}, {\\\"type\\\": \\\"Tipo2\\\", \\\"value\\\": {\\\"photo\\\": 1, \\\"carouselTitulo\\\": \\\"aoeuoaeu\\\", \\\"carouselButtonName\\\": \\\"aoeuaoeu\\\"}, \\\"id\\\": \\\"c4f7ff8e-c065-41da-852b-4f0246055475\\\"}]\", \"wagtail_admin_comments\": [], \"faqInicio\": [{\"pk\": 1, \"sort_order\": 0, \"page\": 13, \"question\": \"Cuando debo viajar a Peru?\", \"answer\": \"<p data-block-key=\\\"v3p0b\\\">thicgidcg</p>\"}]}', NULL, '13', 1, 30, 1, 'Inicio');

CREATE TABLE `wagtailcore_site` (
  `id` int(11) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `port` int(11) NOT NULL,
  `is_default_site` tinyint(1) NOT NULL,
  `root_page_id` int(11) NOT NULL,
  `site_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_site` (`id`, `hostname`, `port`, `is_default_site`, `root_page_id`, `site_name`) VALUES
(1, 'localhost', 80, 1, 3, '');

CREATE TABLE `wagtailcore_task` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_task` (`id`, `name`, `active`, `content_type_id`) VALUES
(1, 'Moderators approval', 1, 2);

CREATE TABLE `wagtailcore_taskstate` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `started_at` datetime(6) NOT NULL,
  `finished_at` datetime(6) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `workflow_state_id` int(11) NOT NULL,
  `finished_by_id` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_uploadedfile` (
  `id` int(11) NOT NULL,
  `file` varchar(200) NOT NULL,
  `for_content_type_id` int(11) DEFAULT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_workflow` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_workflow` (`id`, `name`, `active`) VALUES
(1, 'Moderators approval', 1);

CREATE TABLE `wagtailcore_workflowcontenttype` (
  `content_type_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_workflowpage` (
  `page_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_workflowpage` (`page_id`, `workflow_id`) VALUES
(1, 1);

CREATE TABLE `wagtailcore_workflowstate` (
  `id` int(11) NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `current_task_state_id` int(11) DEFAULT NULL,
  `object_id` varchar(255) NOT NULL,
  `requested_by_id` int(11) DEFAULT NULL,
  `workflow_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `base_content_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailcore_workflowtask` (
  `id` int(11) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `task_id` int(11) NOT NULL,
  `workflow_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailcore_workflowtask` (`id`, `sort_order`, `task_id`, `workflow_id`) VALUES
(1, 0, 1, 1);

CREATE TABLE `wagtaildocs_document` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `collection_id` int(11) NOT NULL,
  `file_size` int(10) UNSIGNED DEFAULT NULL CHECK (`file_size` >= 0),
  `file_hash` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailembeds_embed` (
  `id` int(11) NOT NULL,
  `url` longtext NOT NULL,
  `max_width` smallint(6) DEFAULT NULL,
  `type` varchar(10) NOT NULL,
  `html` longtext NOT NULL,
  `title` longtext NOT NULL,
  `author_name` longtext NOT NULL,
  `provider_name` longtext NOT NULL,
  `thumbnail_url` longtext NOT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `last_updated` datetime(6) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `cache_until` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailforms_formsubmission` (
  `id` int(11) NOT NULL,
  `form_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`form_data`)),
  `submit_time` datetime(6) NOT NULL,
  `page_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailimages_image` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `focal_point_x` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_x` >= 0),
  `focal_point_y` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_y` >= 0),
  `focal_point_width` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_width` >= 0),
  `focal_point_height` int(10) UNSIGNED DEFAULT NULL CHECK (`focal_point_height` >= 0),
  `uploaded_by_user_id` int(11) DEFAULT NULL,
  `file_size` int(10) UNSIGNED DEFAULT NULL CHECK (`file_size` >= 0),
  `collection_id` int(11) NOT NULL,
  `file_hash` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailimages_rendition` (
  `id` int(11) NOT NULL,
  `file` varchar(100) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `focal_point_key` varchar(16) NOT NULL,
  `filter_spec` varchar(255) NOT NULL,
  `image_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

CREATE TABLE `wagtailredirects_redirect` (
  `id` int(11) NOT NULL,
  `old_path` varchar(255) NOT NULL,
  `is_permanent` tinyint(1) NOT NULL,
  `redirect_link` varchar(255) NOT NULL,
  `redirect_page_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT NULL,
  `automatically_created` tinyint(1) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `redirect_page_route_path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailredirects_redirect` (`id`, `old_path`, `is_permanent`, `redirect_link`, `redirect_page_id`, `site_id`, `automatically_created`, `created_at`, `redirect_page_route_path`) VALUES
(1, '/pages/global/peru-12d%C3%ADas-11noches', 1, '', 19, 1, 1, '2024-07-23 22:52:57.611603', '');

CREATE TABLE `wagtailsearch_indexentry` (
  `id` int(11) NOT NULL,
  `object_id` varchar(50) NOT NULL,
  `title_norm` double NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `autocomplete` longtext DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `title` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailsearch_indexentry` (`id`, `object_id`, `title_norm`, `content_type_id`, `autocomplete`, `body`, `title`) VALUES
(1, '3', 0.6578947368421053, 28, 'Peru Destino Seguro', '', 'Peru Destino Seguro'),
(2, '4', 2.0833333333333335, 66, 'Global', '', 'Global'),
(3, '1', 0.5585594594594594, 32, 'Screenshot from 2024-05-24 14-58-35-1', '', 'Screenshot from 2024-05-24 14-58-35-1'),
(4, '2', 0.6928571428571428, 32, 'Screenshot from 2024-02-20 05-52-15', '', 'Screenshot from 2024-02-20 05-52-15'),
(5, '5', 1.0434782608695652, 42, 'PERÚ 8 DIAS 7 NOCHES', '', 'PERÚ 8 DIAS 7 NOCHES'),
(6, '6', 1.119047619047619, 47, 'Collpa de Guacamalleae', '', 'Collpa de Guacamalleae'),
(7, '1', 5.178575, 1, 'Root', '', 'Root'),
(8, '7', 1.0789473684210527, 28, 'Peru Safe Destiny', '', 'Peru Safe Destiny'),
(9, '8', 3.1111166666666663, 66, 'Global', '', 'Global'),
(10, '9', 0.8304347826086957, 42, 'The roads of gods', '', 'The roads of gods'),
(11, '10', 0.917747619047619, 47, 'Collpa de Guacamallos', '', 'Collpa de Guacamallos'),
(12, '3', 1.8, 32, 'graduacion', '', 'graduacion'),
(13, '11', 2.15385, 36, 'Nosotros', '', 'Nosotros'),
(14, '12', 2.071425, 36, 'About', '', 'About'),
(15, '13', 2.276185714285714, 30, 'Inicio', '', 'Inicio'),
(16, '4', 1.3072916666666667, 32, 'machuDestino', '', 'machuDestino'),
(17, '5', 1.2892166666666667, 32, 'limaArequipa', '', 'limaArequipa'),
(18, '6', 1.0296266666666667, 32, 'arequipaDestino', '', 'arequipaDestino'),
(19, '7', 1.3827727272727273, 32, 'punoDestino', '', 'punoDestino'),
(20, '8', 1.4949999999999999, 32, 'icaDestino', '', 'icaDestino'),
(21, '9', 3.60715, 32, 'paq1', '', 'paq1'),
(22, '10', 3.488625, 32, 'paq1', '', 'paq1'),
(23, '14', 0.6219260869565217, 47, 'Collpa de Manu', '', 'Collpa de Manu'),
(24, '11', 0.7962944444444444, 32, 'backgroundNosotros', '', 'backgroundNosotros'),
(25, '12', 0.9, 32, 'imagenFundadores', '', 'imagenFundadores'),
(26, '13', 1.0274714285714286, 32, 'limaDestinoMob', '', 'limaDestinoMob'),
(27, '14', 0.8065833333333333, 32, 'arequipaDestinoMob', '', 'arequipaDestinoMob'),
(28, '15', 1.0357142857142858, 32, 'punoDestinoMob', '', 'punoDestinoMob'),
(29, '15', 2.3678166666666667, 30, 'Home', '', 'Home'),
(30, '16', 1.0846153846153845, 32, 'contactarBack', '', 'contactarBack'),
(31, '16', 1.5483888888888888, 67, 'Contactar', '', 'Contactar'),
(32, '17', 1.5312555555555556, 67, 'Contact', '', 'Contact'),
(33, '17', 1.3606099999999999, 32, 'Group 1573', '', 'Group 1573'),
(34, '18', 1.045246153846154, 32, 'protegemeIcon', '', 'protegemeIcon'),
(35, '19', 1.4952333333333334, 32, 'image 647', '', 'image 647'),
(36, '20', 1.4814777777777777, 32, 'image 646', '', 'image 646'),
(37, '21', 1.4684666666666668, 32, 'unnamed 1', '', 'unnamed 1'),
(38, '22', 1.4561444444444445, 32, 'Group (5)', '', 'Group (5)'),
(39, '23', 1.4444444444444444, 32, 'Group (6)', '', 'Group (6)'),
(40, '24', 1.4333333333333333, 32, 'Group (7)', '', 'Group (7)'),
(41, '25', 1.4227666666666667, 32, 'Group (8)', '', 'Group (8)'),
(42, '26', 2.10715, 32, 'Vector', '', 'Vector'),
(43, '27', 1.3953444444444445, 32, 'Group (9)', '', 'Group (9)'),
(45, '29', 1.0050153846153846, 32, 'Mapi Full day', '', 'Mapi Full day'),
(46, '30', 0.816575, 32, 'Inlcusiones Mapi', '', 'Inlcusiones Mapi'),
(47, '31', 0.420878125, 32, '338a6885465c49ecb03dbcb61783698b', '', '338a6885465c49ecb03dbcb61783698b'),
(48, '18', 0.6488095238095238, 42, 'PERÚ 10 DIAS 9 NOCHES', '', 'PERÚ 10 DIAS 9 NOCHES'),
(49, '19', 0.6559761904761905, 42, 'Peru 12 days 11 nights', '', 'Peru 12 days 11 nights'),
(50, '32', 0.7380944444444445, 32, 'PROGRAMA 10D9N Perú', 'Perú', 'PROGRAMA 10D9N'),
(51, '33', 1.1963636363636363, 32, 'Machupicchu Machupicchu', 'Machupicchu', 'Machupicchu'),
(52, '34', 4.320266666666667, 32, 'Ica Ica', 'Ica', 'Ica'),
(53, '35', 4.2564, 32, 'TRC TRC', 'TRC', 'TRC'),
(54, '36', 0.9177928571428572, 32, 'PROGRAMA 10D9N Paquetes', 'Paquetes', 'PROGRAMA 10D9N'),
(55, '37', 1.0694416666666666, 32, 'Maachupicchu Machupicchu', 'Machupicchu', 'Maachupicchu'),
(56, '38', 2.5381799999999997, 32, 'Oasis Oasis', 'Oasis', 'Oasis'),
(57, '20', 0.5819818181818182, 42, 'PERÚ 12 DIAS 11 NOCHES', '', 'PERÚ 12 DIAS 11 NOCHES'),
(58, '39', 1.5899125, 32, 'machuIni', '', 'machuIni');

CREATE TABLE `wagtailusers_userprofile` (
  `id` int(11) NOT NULL,
  `submitted_notifications` tinyint(1) NOT NULL,
  `approved_notifications` tinyint(1) NOT NULL,
  `rejected_notifications` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preferred_language` varchar(10) NOT NULL,
  `current_time_zone` varchar(40) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `updated_comments_notifications` tinyint(1) NOT NULL,
  `dismissibles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`dismissibles`)),
  `theme` varchar(40) NOT NULL,
  `density` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `wagtailusers_userprofile` (`id`, `submitted_notifications`, `approved_notifications`, `rejected_notifications`, `user_id`, `preferred_language`, `current_time_zone`, `avatar`, `updated_comments_notifications`, `dismissibles`, `theme`, `density`) VALUES
(1, 1, 1, 1, 1, '', '', '', 1, '{}', 'system', 'default');


ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

ALTER TABLE `home_certificados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_certificados_image_id_410cc776_fk_home_cloudinaryimage_id` (`image_id`),
  ADD KEY `home_certificados_page_id_c529d124` (`page_id`);

ALTER TABLE `home_cloudinaryimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_cloudinaryimage_collection_id_311638fc_fk_wagtailco` (`collection_id`),
  ADD KEY `home_cloudinaryimage_uploaded_by_user_id_a9d4bb73_fk_auth_user` (`uploaded_by_user_id`),
  ADD KEY `home_cloudinaryimage_created_at_654e00fa` (`created_at`),
  ADD KEY `home_cloudinaryimage_file_hash_33f6569f` (`file_hash`);

ALTER TABLE `home_cloudinaryrendition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `home_cloudinaryrendition_image_id_filter_spec_foc_7d9b6946_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  ADD KEY `home_cloudinaryrendition_filter_spec_21cedd8e` (`filter_spec`);

ALTER TABLE `home_contacto`
  ADD PRIMARY KEY (`page_ptr_id`),
  ADD KEY `home_contacto_background_id_812a8659_fk_home_cloudinaryimage_id` (`background_id`);

ALTER TABLE `home_destino`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_destino_background_id_8c39578d_fk_home_cloudinaryimage_id` (`background_id`),
  ADD KEY `home_destino_backgroundMobile_id_e70cd017_fk_home_clou` (`backgroundMobile_id`);

ALTER TABLE `home_estadisticas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_estadisticas_page_id_6e7f74bd` (`page_id`);

ALTER TABLE `home_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_faq_page_id_0e8eefe9` (`page_id`);

ALTER TABLE `home_global`
  ADD PRIMARY KEY (`page_ptr_id`);

ALTER TABLE `home_home`
  ADD PRIMARY KEY (`page_ptr_id`);

ALTER TABLE `home_informacion`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `home_inicio`
  ADD PRIMARY KEY (`page_ptr_id`);

ALTER TABLE `home_nosotros`
  ADD PRIMARY KEY (`page_ptr_id`),
  ADD KEY `home_nosotros_background_id_da3ca9b2_fk_home_cloudinaryimage_id` (`background_id`),
  ADD KEY `home_nosotros_imageParrafo_id_8e5db0b2_fk_home_clou` (`imageParrafo_id`);

ALTER TABLE `home_partners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_partners_image_id_e0614efb_fk_home_cloudinaryimage_id` (`image_id`),
  ADD KEY `home_partners_page_id_b6820531` (`page_id`);

ALTER TABLE `home_tourcategory`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `home_valores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `home_valores_img_id_99f5e35b_fk_home_cloudinaryimage_id` (`img_id`),
  ADD KEY `home_valores_page_id_4754f79e` (`page_id`);

ALTER TABLE `paquete_dias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete_dias_page_id_837da2f5` (`page_id`);

ALTER TABLE `paquete_excluidoitempaquete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete_excluidoitempaquete_page_id_b1311125` (`page_id`);

ALTER TABLE `paquete_gallerycarousel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete_gallerycarousel_page_id_18f80dd1` (`page_id`),
  ADD KEY `paquete_gallerycarou_image_id_c2e364b2_fk_home_clou` (`image_id`);

ALTER TABLE `paquete_incluidoitempaquete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paquete_incluidoitempaquete_page_id_01be5d1a` (`page_id`);

ALTER TABLE `paquete_paquete`
  ADD PRIMARY KEY (`page_ptr_id`),
  ADD KEY `paquete_paquete_background_id_408962cd_fk_home_clou` (`background_id`),
  ADD KEY `paquete_paquete_featuredImage_id_c1251166_fk_home_clou` (`featuredImage_id`);

ALTER TABLE `simple_translation_simpletranslation`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `taggit_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `slug` (`slug`);

ALTER TABLE `taggit_taggeditem`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  ADD KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  ADD KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  ADD KEY `taggit_tagg_content_8fc721_idx` (`content_type_id`,`object_id`);

ALTER TABLE `tour_excluidoitempaquete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_excluidoitempaquete_page_id_3176f6fd` (`page_id`);

ALTER TABLE `tour_gallerycarousel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_gallerycarousel_image_id_b6cf3765_fk_home_clou` (`image_id`),
  ADD KEY `tour_gallerycarousel_page_id_e3894881` (`page_id`);

ALTER TABLE `tour_incluidoitempaquete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_incluidoitempaquete_page_id_e64ef6bc` (`page_id`);

ALTER TABLE `tour_tour`
  ADD PRIMARY KEY (`page_ptr_id`),
  ADD KEY `tour_tour_background_id_57ff5614_fk_home_cloudinaryimage_id` (`background_id`),
  ADD KEY `tour_tour_featuredImage_id_6cc0a601_fk_home_cloudinaryimage_id` (`featuredImage_id`),
  ADD KEY `tour_tour_tourDestino_id_c3ed0f76_fk_home_destino_id` (`tourDestino_id`);

ALTER TABLE `tour_tour_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tour_tour_categories_tour_id_tourcategory_id_c784b55d_uniq` (`tour_id`,`tourcategory_id`),
  ADD KEY `tour_tour_categories_tourcategory_id_5c0462c4_fk_home_tour` (`tourcategory_id`);

ALTER TABLE `wagtailadmin_admin`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `wagtailcore_collection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`);

ALTER TABLE `wagtailcore_collectionviewrestriction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` (`collection_id`);

ALTER TABLE `wagtailcore_collectionviewrestriction_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_collectionvi_collectionviewrestrictio_988995ae_uniq` (`collectionviewrestriction_id`,`group_id`),
  ADD KEY `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` (`group_id`);

ALTER TABLE `wagtailcore_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` (`resolved_by_id`),
  ADD KEY `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` (`user_id`),
  ADD KEY `wagtailcore_comment_page_id_108444b5` (`page_id`),
  ADD KEY `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` (`revision_created_id`);

ALTER TABLE `wagtailcore_commentreply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` (`user_id`),
  ADD KEY `wagtailcore_commentreply_comment_id_afc7e027` (`comment_id`);

ALTER TABLE `wagtailcore_groupapprovaltask`
  ADD PRIMARY KEY (`task_ptr_id`);

ALTER TABLE `wagtailcore_groupapprovaltask_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_groupapprova_groupapprovaltask_id_gro_bb5ee7eb_uniq` (`groupapprovaltask_id`,`group_id`),
  ADD KEY `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` (`group_id`);

ALTER TABLE `wagtailcore_groupcollectionpermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_groupcollect_group_id_collection_id_p_a21cefe9_uniq` (`group_id`,`collection_id`,`permission_id`),
  ADD KEY `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` (`collection_id`),
  ADD KEY `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` (`permission_id`);

ALTER TABLE `wagtailcore_grouppagepermission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_permission` (`group_id`,`page_id`,`permission_id`),
  ADD KEY `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` (`page_id`),
  ADD KEY `wagtailcore_grouppagepermission_group_id_fc07e671` (`group_id`),
  ADD KEY `wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm` (`permission_id`);

ALTER TABLE `wagtailcore_locale`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `language_code` (`language_code`);

ALTER TABLE `wagtailcore_modellogentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` (`content_type_id`),
  ADD KEY `wagtailcore_modellogentry_action_d2d856ee` (`action`),
  ADD KEY `wagtailcore_modellogentry_content_changed_8bc39742` (`content_changed`),
  ADD KEY `wagtailcore_modellogentry_object_id_e0e7d4ef` (`object_id`),
  ADD KEY `wagtailcore_modellogentry_user_id_0278d1bf` (`user_id`),
  ADD KEY `wagtailcore_modellogentry_timestamp_9694521b` (`timestamp`),
  ADD KEY `wagtailcore_modellogentry_revision_id_df6ca33a` (`revision_id`);

ALTER TABLE `wagtailcore_page`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD UNIQUE KEY `wagtailcore_page_translation_key_locale_id_9b041bad_uniq` (`translation_key`,`locale_id`),
  ADD KEY `wagtailcore_page_content_type_id_c28424df_fk_django_co` (`content_type_id`),
  ADD KEY `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` (`owner_id`),
  ADD KEY `wagtailcore_page_slug_e7c11b8f` (`slug`),
  ADD KEY `wagtailcore_page_first_published_at_2b5dd637` (`first_published_at`),
  ADD KEY `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` (`live_revision_id`),
  ADD KEY `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` (`locked_by_id`),
  ADD KEY `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` (`locale_id`),
  ADD KEY `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` (`alias_of_id`),
  ADD KEY `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` (`latest_revision_id`);

ALTER TABLE `wagtailcore_pagelogentry`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` (`content_type_id`),
  ADD KEY `wagtailcore_pagelogentry_action_c2408198` (`action`),
  ADD KEY `wagtailcore_pagelogentry_content_changed_99f27ade` (`content_changed`),
  ADD KEY `wagtailcore_pagelogentry_page_id_8464e327` (`page_id`),
  ADD KEY `wagtailcore_pagelogentry_revision_id_8043d103` (`revision_id`),
  ADD KEY `wagtailcore_pagelogentry_user_id_604ccfd8` (`user_id`),
  ADD KEY `wagtailcore_pagelogentry_timestamp_deb774c4` (`timestamp`);

ALTER TABLE `wagtailcore_pagesubscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_pagesubscription_page_id_user_id_0cef73ed_uniq` (`page_id`,`user_id`),
  ADD KEY `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` (`user_id`);

ALTER TABLE `wagtailcore_pageviewrestriction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` (`page_id`);

ALTER TABLE `wagtailcore_pageviewrestriction_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_pageviewrest_pageviewrestriction_id_g_d23f80bb_uniq` (`pageviewrestriction_id`,`group_id`),
  ADD KEY `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` (`group_id`);

ALTER TABLE `wagtailcore_referenceindex`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_referenceind_base_content_type_id_obj_9e6ccd6a_uniq` (`base_content_type_id`,`object_id`,`to_content_type_id`,`to_object_id`,`content_path_hash`),
  ADD KEY `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` (`content_type_id`),
  ADD KEY `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` (`to_content_type_id`);

ALTER TABLE `wagtailcore_revision`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` (`user_id`),
  ADD KEY `wagtailcore_pagerevision_created_at_66954e3b` (`created_at`),
  ADD KEY `wagtailcore_pagerevision_approved_go_live_at_e56afc67` (`approved_go_live_at`),
  ADD KEY `content_object_idx` (`content_type_id`,`object_id`),
  ADD KEY `base_content_object_idx` (`base_content_type_id`,`object_id`);

ALTER TABLE `wagtailcore_site`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_site_hostname_port_2c626d70_uniq` (`hostname`,`port`),
  ADD KEY `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` (`root_page_id`),
  ADD KEY `wagtailcore_site_hostname_96b20b46` (`hostname`);

ALTER TABLE `wagtailcore_task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` (`content_type_id`);

ALTER TABLE `wagtailcore_taskstate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` (`workflow_state_id`),
  ADD KEY `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` (`content_type_id`),
  ADD KEY `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` (`task_id`),
  ADD KEY `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` (`finished_by_id`),
  ADD KEY `wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco` (`revision_id`);

ALTER TABLE `wagtailcore_uploadedfile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co` (`for_content_type_id`),
  ADD KEY `wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user` (`uploaded_by_user_id`);

ALTER TABLE `wagtailcore_workflow`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `wagtailcore_workflowcontenttype`
  ADD PRIMARY KEY (`content_type_id`),
  ADD KEY `wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco` (`workflow_id`);

ALTER TABLE `wagtailcore_workflowpage`
  ADD PRIMARY KEY (`page_id`),
  ADD KEY `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` (`workflow_id`);

ALTER TABLE `wagtailcore_workflowstate`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `current_task_state_id` (`current_task_state_id`),
  ADD KEY `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` (`requested_by_id`),
  ADD KEY `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` (`workflow_id`),
  ADD KEY `workflowstate_ct_id_idx` (`content_type_id`,`object_id`),
  ADD KEY `workflowstate_base_ct_id_idx` (`base_content_type_id`,`object_id`);

ALTER TABLE `wagtailcore_workflowtask`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailcore_workflowtask_workflow_id_task_id_4ec7a62b_uniq` (`workflow_id`,`task_id`),
  ADD KEY `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` (`task_id`),
  ADD KEY `wagtailcore_workflowtask_workflow_id_b9717175` (`workflow_id`);

ALTER TABLE `wagtaildocs_document`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` (`uploaded_by_user_id`),
  ADD KEY `wagtaildocs_document_collection_id_23881625_fk_wagtailco` (`collection_id`);

ALTER TABLE `wagtailembeds_embed`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailembeds_embed_hash_c9bd8c9a_uniq` (`hash`),
  ADD KEY `wagtailembeds_embed_cache_until_26c94bb0` (`cache_until`);

ALTER TABLE `wagtailforms_formsubmission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` (`page_id`);

ALTER TABLE `wagtailimages_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` (`uploaded_by_user_id`),
  ADD KEY `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` (`collection_id`),
  ADD KEY `wagtailimages_image_created_at_86fa6cd4` (`created_at`),
  ADD KEY `wagtailimages_image_file_hash_fb5bbb23` (`file_hash`);

ALTER TABLE `wagtailimages_rendition`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailimages_rendition_image_id_filter_spec_foc_323c8fe0_uniq` (`image_id`,`filter_spec`,`focal_point_key`),
  ADD KEY `wagtailimages_rendition_filter_spec_1cba3201` (`filter_spec`);

ALTER TABLE `wagtailredirects_redirect`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailredirects_redirect_old_path_site_id_783622d7_uniq` (`old_path`,`site_id`),
  ADD KEY `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` (`redirect_page_id`),
  ADD KEY `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` (`site_id`),
  ADD KEY `wagtailredirects_redirect_old_path_bb35247b` (`old_path`);

ALTER TABLE `wagtailsearch_indexentry`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wagtailsearch_indexentry_content_type_id_object_id_bcd7ba73_uniq` (`content_type_id`,`object_id`);
ALTER TABLE `wagtailsearch_indexentry` ADD FULLTEXT KEY `fulltext_body` (`body`);
ALTER TABLE `wagtailsearch_indexentry` ADD FULLTEXT KEY `fulltext_title` (`title`);
ALTER TABLE `wagtailsearch_indexentry` ADD FULLTEXT KEY `fulltext_title_body` (`title`,`body`);
ALTER TABLE `wagtailsearch_indexentry` ADD FULLTEXT KEY `fulltext_autocomplete` (`autocomplete`);

ALTER TABLE `wagtailusers_userprofile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);


ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=269;

ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=220;

ALTER TABLE `home_certificados`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `home_cloudinaryimage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

ALTER TABLE `home_cloudinaryrendition`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

ALTER TABLE `home_destino`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `home_estadisticas`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `home_faq`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `home_informacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `home_partners`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `home_tourcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `home_valores`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `paquete_dias`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

ALTER TABLE `paquete_excluidoitempaquete`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

ALTER TABLE `paquete_gallerycarousel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

ALTER TABLE `paquete_incluidoitempaquete`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

ALTER TABLE `simple_translation_simpletranslation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `taggit_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

ALTER TABLE `taggit_taggeditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

ALTER TABLE `tour_excluidoitempaquete`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

ALTER TABLE `tour_gallerycarousel`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `tour_incluidoitempaquete`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `tour_tour_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailadmin_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_collection`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtailcore_collectionviewrestriction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_collectionviewrestriction_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_commentreply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_groupapprovaltask_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtailcore_groupcollectionpermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

ALTER TABLE `wagtailcore_grouppagepermission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

ALTER TABLE `wagtailcore_locale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `wagtailcore_modellogentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

ALTER TABLE `wagtailcore_page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

ALTER TABLE `wagtailcore_pagelogentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

ALTER TABLE `wagtailcore_pagesubscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

ALTER TABLE `wagtailcore_pageviewrestriction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_pageviewrestriction_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_referenceindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=153;

ALTER TABLE `wagtailcore_revision`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

ALTER TABLE `wagtailcore_site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtailcore_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtailcore_taskstate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_uploadedfile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_workflow`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtailcore_workflowstate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailcore_workflowtask`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtaildocs_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailembeds_embed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailforms_formsubmission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailimages_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailimages_rendition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `wagtailredirects_redirect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `wagtailsearch_indexentry`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

ALTER TABLE `wagtailusers_userprofile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `home_certificados`
  ADD CONSTRAINT `home_certificados_image_id_410cc776_fk_home_cloudinaryimage_id` FOREIGN KEY (`image_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_certificados_page_id_c529d124_fk_home_nosotros_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_nosotros` (`page_ptr_id`);

ALTER TABLE `home_cloudinaryimage`
  ADD CONSTRAINT `home_cloudinaryimage_collection_id_311638fc_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  ADD CONSTRAINT `home_cloudinaryimage_uploaded_by_user_id_a9d4bb73_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `home_cloudinaryrendition`
  ADD CONSTRAINT `home_cloudinaryrendi_image_id_f21c0f3e_fk_home_clou` FOREIGN KEY (`image_id`) REFERENCES `home_cloudinaryimage` (`id`);

ALTER TABLE `home_contacto`
  ADD CONSTRAINT `home_contacto_background_id_812a8659_fk_home_cloudinaryimage_id` FOREIGN KEY (`background_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_contacto_page_ptr_id_59340c12_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `home_destino`
  ADD CONSTRAINT `home_destino_backgroundMobile_id_e70cd017_fk_home_clou` FOREIGN KEY (`backgroundMobile_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_destino_background_id_8c39578d_fk_home_cloudinaryimage_id` FOREIGN KEY (`background_id`) REFERENCES `home_cloudinaryimage` (`id`);

ALTER TABLE `home_estadisticas`
  ADD CONSTRAINT `home_estadisticas_page_id_6e7f74bd_fk_home_nosotros_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_nosotros` (`page_ptr_id`);

ALTER TABLE `home_faq`
  ADD CONSTRAINT `home_faq_page_id_0e8eefe9_fk_home_inicio_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_inicio` (`page_ptr_id`);

ALTER TABLE `home_global`
  ADD CONSTRAINT `home_global_page_ptr_id_e7e81c96_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `home_home`
  ADD CONSTRAINT `home_home_page_ptr_id_940e97b3_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `home_inicio`
  ADD CONSTRAINT `home_inicio_page_ptr_id_a32ce4ac_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `home_nosotros`
  ADD CONSTRAINT `home_nosotros_background_id_da3ca9b2_fk_home_cloudinaryimage_id` FOREIGN KEY (`background_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_nosotros_imageParrafo_id_8e5db0b2_fk_home_clou` FOREIGN KEY (`imageParrafo_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_nosotros_page_ptr_id_9b411183_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `home_partners`
  ADD CONSTRAINT `home_partners_image_id_e0614efb_fk_home_cloudinaryimage_id` FOREIGN KEY (`image_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_partners_page_id_b6820531_fk_home_nosotros_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_nosotros` (`page_ptr_id`);

ALTER TABLE `home_valores`
  ADD CONSTRAINT `home_valores_img_id_99f5e35b_fk_home_cloudinaryimage_id` FOREIGN KEY (`img_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `home_valores_page_id_4754f79e_fk_home_nosotros_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `home_nosotros` (`page_ptr_id`);

ALTER TABLE `paquete_dias`
  ADD CONSTRAINT `paquete_dias_page_id_837da2f5_fk_paquete_paquete_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `paquete_paquete` (`page_ptr_id`);

ALTER TABLE `paquete_excluidoitempaquete`
  ADD CONSTRAINT `paquete_excluidoitem_page_id_b1311125_fk_paquete_p` FOREIGN KEY (`page_id`) REFERENCES `paquete_paquete` (`page_ptr_id`);

ALTER TABLE `paquete_gallerycarousel`
  ADD CONSTRAINT `paquete_gallerycarou_image_id_c2e364b2_fk_home_clou` FOREIGN KEY (`image_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `paquete_gallerycarou_page_id_18f80dd1_fk_paquete_p` FOREIGN KEY (`page_id`) REFERENCES `paquete_paquete` (`page_ptr_id`);

ALTER TABLE `paquete_incluidoitempaquete`
  ADD CONSTRAINT `paquete_incluidoitem_page_id_01be5d1a_fk_paquete_p` FOREIGN KEY (`page_id`) REFERENCES `paquete_paquete` (`page_ptr_id`);

ALTER TABLE `paquete_paquete`
  ADD CONSTRAINT `paquete_paquete_background_id_408962cd_fk_home_clou` FOREIGN KEY (`background_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `paquete_paquete_featuredImage_id_c1251166_fk_home_clou` FOREIGN KEY (`featuredImage_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `paquete_paquete_page_ptr_id_ec3e0569_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `taggit_taggeditem`
  ADD CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`);

ALTER TABLE `tour_excluidoitempaquete`
  ADD CONSTRAINT `tour_excluidoitempaq_page_id_3176f6fd_fk_tour_tour` FOREIGN KEY (`page_id`) REFERENCES `tour_tour` (`page_ptr_id`);

ALTER TABLE `tour_gallerycarousel`
  ADD CONSTRAINT `tour_gallerycarousel_image_id_b6cf3765_fk_home_clou` FOREIGN KEY (`image_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `tour_gallerycarousel_page_id_e3894881_fk_tour_tour_page_ptr_id` FOREIGN KEY (`page_id`) REFERENCES `tour_tour` (`page_ptr_id`);

ALTER TABLE `tour_incluidoitempaquete`
  ADD CONSTRAINT `tour_incluidoitempaq_page_id_e64ef6bc_fk_tour_tour` FOREIGN KEY (`page_id`) REFERENCES `tour_tour` (`page_ptr_id`);

ALTER TABLE `tour_tour`
  ADD CONSTRAINT `tour_tour_background_id_57ff5614_fk_home_cloudinaryimage_id` FOREIGN KEY (`background_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `tour_tour_featuredImage_id_6cc0a601_fk_home_cloudinaryimage_id` FOREIGN KEY (`featuredImage_id`) REFERENCES `home_cloudinaryimage` (`id`),
  ADD CONSTRAINT `tour_tour_page_ptr_id_5917fdc0_fk_wagtailcore_page_id` FOREIGN KEY (`page_ptr_id`) REFERENCES `wagtailcore_page` (`id`),
  ADD CONSTRAINT `tour_tour_tourDestino_id_c3ed0f76_fk_home_destino_id` FOREIGN KEY (`tourDestino_id`) REFERENCES `home_destino` (`id`);

ALTER TABLE `tour_tour_categories`
  ADD CONSTRAINT `tour_tour_categories_tour_id_bd4bf9c2_fk_tour_tour_page_ptr_id` FOREIGN KEY (`tour_id`) REFERENCES `tour_tour` (`page_ptr_id`),
  ADD CONSTRAINT `tour_tour_categories_tourcategory_id_5c0462c4_fk_home_tour` FOREIGN KEY (`tourcategory_id`) REFERENCES `home_tourcategory` (`id`);

ALTER TABLE `wagtailcore_collectionviewrestriction`
  ADD CONSTRAINT `wagtailcore_collecti_collection_id_761908ec_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`);

ALTER TABLE `wagtailcore_collectionviewrestriction_groups`
  ADD CONSTRAINT `wagtailcore_collecti_collectionviewrestri_47320efd_fk_wagtailco` FOREIGN KEY (`collectionviewrestriction_id`) REFERENCES `wagtailcore_collectionviewrestriction` (`id`),
  ADD CONSTRAINT `wagtailcore_collecti_group_id_1823f2a3_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

ALTER TABLE `wagtailcore_comment`
  ADD CONSTRAINT `wagtailcore_comment_page_id_108444b5_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  ADD CONSTRAINT `wagtailcore_comment_resolved_by_id_a282aa0e_fk_auth_user_id` FOREIGN KEY (`resolved_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wagtailcore_comment_revision_created_id_1d058279_fk_wagtailco` FOREIGN KEY (`revision_created_id`) REFERENCES `wagtailcore_revision` (`id`),
  ADD CONSTRAINT `wagtailcore_comment_user_id_0c577ca6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailcore_commentreply`
  ADD CONSTRAINT `wagtailcore_commentr_comment_id_afc7e027_fk_wagtailco` FOREIGN KEY (`comment_id`) REFERENCES `wagtailcore_comment` (`id`),
  ADD CONSTRAINT `wagtailcore_commentreply_user_id_d0b3b9c3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailcore_groupapprovaltask`
  ADD CONSTRAINT `wagtailcore_groupapp_task_ptr_id_cfe58781_fk_wagtailco` FOREIGN KEY (`task_ptr_id`) REFERENCES `wagtailcore_task` (`id`);

ALTER TABLE `wagtailcore_groupapprovaltask_groups`
  ADD CONSTRAINT `wagtailcore_groupapp_group_id_2e64b61f_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `wagtailcore_groupapp_groupapprovaltask_id_9a9255ea_fk_wagtailco` FOREIGN KEY (`groupapprovaltask_id`) REFERENCES `wagtailcore_groupapprovaltask` (`task_ptr_id`);

ALTER TABLE `wagtailcore_groupcollectionpermission`
  ADD CONSTRAINT `wagtailcore_groupcol_collection_id_5423575a_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  ADD CONSTRAINT `wagtailcore_groupcol_group_id_05d61460_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `wagtailcore_groupcol_permission_id_1b626275_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

ALTER TABLE `wagtailcore_grouppagepermission`
  ADD CONSTRAINT `wagtailcore_grouppag_group_id_fc07e671_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `wagtailcore_grouppag_page_id_710b114a_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  ADD CONSTRAINT `wagtailcore_grouppag_permission_id_05acb22e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

ALTER TABLE `wagtailcore_modellogentry`
  ADD CONSTRAINT `wagtailcore_modellog_content_type_id_68849e77_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `wagtailcore_page`
  ADD CONSTRAINT `wagtailcore_page_alias_of_id_12945502_fk_wagtailcore_page_id` FOREIGN KEY (`alias_of_id`) REFERENCES `wagtailcore_page` (`id`),
  ADD CONSTRAINT `wagtailcore_page_content_type_id_c28424df_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_page_latest_revision_id_e60fef51_fk_wagtailco` FOREIGN KEY (`latest_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  ADD CONSTRAINT `wagtailcore_page_live_revision_id_930bd822_fk_wagtailco` FOREIGN KEY (`live_revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  ADD CONSTRAINT `wagtailcore_page_locale_id_3c7e30a6_fk_wagtailcore_locale_id` FOREIGN KEY (`locale_id`) REFERENCES `wagtailcore_locale` (`id`),
  ADD CONSTRAINT `wagtailcore_page_locked_by_id_bcb86245_fk_auth_user_id` FOREIGN KEY (`locked_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wagtailcore_page_owner_id_fbf7c332_fk_auth_user_id` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailcore_pagelogentry`
  ADD CONSTRAINT `wagtailcore_pageloge_content_type_id_74e7708a_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `wagtailcore_pagesubscription`
  ADD CONSTRAINT `wagtailcore_pagesubs_page_id_a085e7a6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`),
  ADD CONSTRAINT `wagtailcore_pagesubscription_user_id_89d7def9_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailcore_pageviewrestriction`
  ADD CONSTRAINT `wagtailcore_pageview_page_id_15a8bea6_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `wagtailcore_pageviewrestriction_groups`
  ADD CONSTRAINT `wagtailcore_pageview_group_id_6460f223_fk_auth_grou` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `wagtailcore_pageview_pageviewrestriction__f147a99a_fk_wagtailco` FOREIGN KEY (`pageviewrestriction_id`) REFERENCES `wagtailcore_pageviewrestriction` (`id`);

ALTER TABLE `wagtailcore_referenceindex`
  ADD CONSTRAINT `wagtailcore_referenc_base_content_type_id_313cf40f_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_referenc_content_type_id_766e0336_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_referenc_to_content_type_id_93690bbd_fk_django_co` FOREIGN KEY (`to_content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `wagtailcore_revision`
  ADD CONSTRAINT `wagtailcore_pagerevision_user_id_2409d2f4_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wagtailcore_revision_base_content_type_id_5b4ef7bd_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_revision_content_type_id_c8cb69c0_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `wagtailcore_site`
  ADD CONSTRAINT `wagtailcore_site_root_page_id_e02fb95c_fk_wagtailcore_page_id` FOREIGN KEY (`root_page_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `wagtailcore_task`
  ADD CONSTRAINT `wagtailcore_task_content_type_id_249ab8ba_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `wagtailcore_taskstate`
  ADD CONSTRAINT `wagtailcore_taskstat_content_type_id_0a758fdc_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_taskstat_revision_id_df25a499_fk_wagtailco` FOREIGN KEY (`revision_id`) REFERENCES `wagtailcore_revision` (`id`),
  ADD CONSTRAINT `wagtailcore_taskstat_workflow_state_id_9239a775_fk_wagtailco` FOREIGN KEY (`workflow_state_id`) REFERENCES `wagtailcore_workflowstate` (`id`),
  ADD CONSTRAINT `wagtailcore_taskstate_finished_by_id_13f98229_fk_auth_user_id` FOREIGN KEY (`finished_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wagtailcore_taskstate_task_id_c3677c34_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`);

ALTER TABLE `wagtailcore_uploadedfile`
  ADD CONSTRAINT `wagtailcore_uploaded_for_content_type_id_b0fc87b2_fk_django_co` FOREIGN KEY (`for_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_uploaded_uploaded_by_user_id_c7580fe8_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailcore_workflowcontenttype`
  ADD CONSTRAINT `wagtailcore_workflow_content_type_id_b261bb37_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_workflow_workflow_id_9aad7cd2_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`);

ALTER TABLE `wagtailcore_workflowpage`
  ADD CONSTRAINT `wagtailcore_workflow_workflow_id_56f56ff6_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  ADD CONSTRAINT `wagtailcore_workflowpage_page_id_81e7bab6_fk_wagtailcore_page_id` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `wagtailcore_workflowstate`
  ADD CONSTRAINT `wagtailcore_workflow_base_content_type_id_a30dc576_fk_django_co` FOREIGN KEY (`base_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_workflow_content_type_id_2bb78ce1_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `wagtailcore_workflow_current_task_state_i_3a1a0632_fk_wagtailco` FOREIGN KEY (`current_task_state_id`) REFERENCES `wagtailcore_taskstate` (`id`),
  ADD CONSTRAINT `wagtailcore_workflow_requested_by_id_4090bca3_fk_auth_user` FOREIGN KEY (`requested_by_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `wagtailcore_workflow_workflow_id_1f18378f_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`);

ALTER TABLE `wagtailcore_workflowtask`
  ADD CONSTRAINT `wagtailcore_workflow_workflow_id_b9717175_fk_wagtailco` FOREIGN KEY (`workflow_id`) REFERENCES `wagtailcore_workflow` (`id`),
  ADD CONSTRAINT `wagtailcore_workflowtask_task_id_ce7716fe_fk_wagtailcore_task_id` FOREIGN KEY (`task_id`) REFERENCES `wagtailcore_task` (`id`);

ALTER TABLE `wagtaildocs_document`
  ADD CONSTRAINT `wagtaildocs_document_collection_id_23881625_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  ADD CONSTRAINT `wagtaildocs_document_uploaded_by_user_id_17258b41_fk_auth_user` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailforms_formsubmission`
  ADD CONSTRAINT `wagtailforms_formsub_page_id_e48e93e7_fk_wagtailco` FOREIGN KEY (`page_id`) REFERENCES `wagtailcore_page` (`id`);

ALTER TABLE `wagtailimages_image`
  ADD CONSTRAINT `wagtailimages_image_collection_id_c2f8af7e_fk_wagtailco` FOREIGN KEY (`collection_id`) REFERENCES `wagtailcore_collection` (`id`),
  ADD CONSTRAINT `wagtailimages_image_uploaded_by_user_id_5d73dc75_fk_auth_user_id` FOREIGN KEY (`uploaded_by_user_id`) REFERENCES `auth_user` (`id`);

ALTER TABLE `wagtailimages_rendition`
  ADD CONSTRAINT `wagtailimages_rendit_image_id_3e1fd774_fk_wagtailim` FOREIGN KEY (`image_id`) REFERENCES `wagtailimages_image` (`id`);

ALTER TABLE `wagtailredirects_redirect`
  ADD CONSTRAINT `wagtailredirects_red_redirect_page_id_b5728a8f_fk_wagtailco` FOREIGN KEY (`redirect_page_id`) REFERENCES `wagtailcore_page` (`id`),
  ADD CONSTRAINT `wagtailredirects_red_site_id_780a0e1e_fk_wagtailco` FOREIGN KEY (`site_id`) REFERENCES `wagtailcore_site` (`id`);

ALTER TABLE `wagtailsearch_indexentry`
  ADD CONSTRAINT `wagtailsearch_indexe_content_type_id_62ed694f_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

ALTER TABLE `wagtailusers_userprofile`
  ADD CONSTRAINT `wagtailusers_userprofile_user_id_59c92331_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
