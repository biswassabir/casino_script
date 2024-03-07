-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2022 at 11:37 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xaxino_update`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@site.com', 'admin', NULL, '634fe61d433921666180637.jpg', '$2y$10$el35r0DVW8rbSEx0xm5xDu5IsbxmiaA1CZe3tfeub4iA4HxD1QSxq', NULL, NULL, '2022-10-19 09:27:17');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `who` int(10) NOT NULL DEFAULT 0,
  `level` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `main_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `title` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_amo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `btc_wallet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `script` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcode` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'object',
  `support` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Tawk.to', 'Key location is shown bellow', 'tawky_big.png', '<script>\r\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\r\n                        (function(){\r\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\r\n                        s1.async=true;\r\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\r\n                        s1.charset=\"UTF-8\";\r\n                        s1.setAttribute(\"crossorigin\",\"*\");\r\n                        s0.parentNode.insertBefore(s1,s0);\r\n                        })();\r\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'twak.png', 0, '2019-10-18 23:16:05', '2022-09-17 05:59:49'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha3.png', '\r\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\r\n<div class=\"g-recaptcha\" data-sitekey=\"{{sitekey}}\" data-callback=\"verifyCaptcha\"></div>\r\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, '2019-10-18 23:16:05', '2022-10-19 06:00:35'),
(3, 'custom-captcha', 'Custom Captcha', 'Just put any random string', 'customcaptcha.png', NULL, '{\"random_key\":{\"title\":\"Random String\",\"value\":\"SecureString\"}}', 'na', 0, '2019-10-18 23:16:05', '2022-10-16 03:57:59'),
(4, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"------\"}}', 'ganalytics.png', 0, NULL, '2021-05-04 10:19:12'),
(5, 'fb-comment', 'Facebook Comment ', 'Key location is shown bellow', 'Facebook.png', '<div id=\"fb-root\"></div><script async defer crossorigin=\"anonymous\" src=\"https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v4.0&appId={{app_key}}&autoLogAppEvents=1\"></script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"713047905830100\"}}', 'fb_com.PNG', 0, NULL, '2022-10-19 06:00:26');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(1, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-04-11 03:23:40');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_values` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int(10) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `views`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"live game\",\"xaxino game\",\"casino platform\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Xaxino - Ultimate Casino Platform\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"634fe7ee36d6d1666181102.png\"}', 0, '2020-07-04 23:42:52', '2022-10-19 06:05:11'),
(41, 'cookie.data', '{\"short_desc\":\"We may use cookies or any other tracking technologies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the Site and improve your experience.\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">What information do we collect?<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">How do we protect your information?<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">All provided delicate\\/credit data is sent through Stripe.<br>After an exchange, your private data (credit cards, social security numbers, financials, and so on) won\'t be put away on our workers.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Do we disclose any information to outside parties?<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">We don\'t sell, exchange, or in any case move to outside gatherings by and by recognizable data. This does exclude confided in outsiders who help us in working our site, leading our business, or adjusting you, since those gatherings consent to keep this data private. We may likewise deliver your data when we accept discharge is suitable to follow the law, implement our site strategies, or ensure our own or others\' rights, property, or wellbeing.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Children\'s Online Privacy Protection Act Compliance<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">We are consistent with the prerequisites of COPPA (Children\'s Online Privacy Protection Act), we don\'t gather any data from anybody under 13 years old. Our site, items, and administrations are completely coordinated to individuals who are in any event 13 years of age or more established.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">Changes to our Privacy Policy<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">If we decide to change our privacy policy, we will post those changes on this page.<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">How long we retain your information?<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">At the point when you register for our site, we cycle and keep your information we have about you however long you don\'t erase the record or withdraw yourself (subject to laws and guidelines).<\\/font><\\/p><\\/div><div class=\\\"mb-5\\\" style=\\\"font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif;\\\"><font color=\\\"#ffffff\\\">What we don\\u2019t do with your data<\\/font><\\/h3><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\"><font color=\\\"#ffffff\\\">We don\'t and will never share, unveil, sell, or in any case give your information to different organizations for the promoting of their items or administrations.<\\/font><\\/p><\\/div>\",\"status\":1}', 0, '2020-07-04 23:42:52', '2022-08-25 03:51:03'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">ipsum dolor sit amet, consectetur adipiscing elit. Sed in orci eros. Phasellus pulvinar in lectus vestibulum blandit. Aenean lacus mauris, egestas vitae augue pulvinar, accumsan egestas sapien. Ut viverra dolor non augue ullamcorper, blandit viverra risus auctor. Curabitur blandit lectus in arcu iaculis pretium. Proin venenatis neque a magna gravida, non fringilla diam suscipit. Maecenas dictum turpis magna, nec aliquam felis sollicitudin ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque gravida nibh vel ultricies auctor. Vivamus non convallis purus. Nunc sollicitudin diam leo, a suscipit lorem tempor nec. Phasellus tellus ligula, gravida rhoncus mattis vitae, lacinia sit amet nulla. Sed vestibulum cursus diam, non ornare tortor egestas dictum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Phasellus tincidunt pharetra lobortis. Fusce cursus dictum sapien. Aliquam enim lorem, rhoncus vitae sagittis vel, faucibus et erat. Sed at posuere neque, hendrerit pulvinar augue. Nulla iaculis orci vel nulla aliquam, lobortis sodales purus porta. Duis id lacinia nisl. Fusce eu neque in nibh luctus posuere sit amet non odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget risus eget urna tincidunt dapibus. In maximus scelerisque nulla, ut luctus nunc luctus eu. In hac habitasse platea dictumst. Fusce sapien massa, placerat sed lectus in, faucibus pretium erat. Quisque et cursus purus, vitae efficitur libero. Aenean iaculis sollicitudin placerat.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Vivamus aliquam mi neque, vel efficitur justo rutrum id. Aliquam erat volutpat. Nunc mattis a diam vel auctor. Pellentesque vestibulum massa arcu, sit amet imperdiet lacus aliquet eu. Praesent aliquam mauris sit amet libero congue, sit amet aliquam sapien laoreet. Sed dignissim augue non lectus scelerisque, a posuere elit ultricies. Morbi nec fermentum arcu. Duis pretium convallis tempus. Suspendisse mollis, nisi ac porttitor gravida, nibh nisl pharetra sapien, nec tincidunt turpis dolor in velit. Integer dolor dui, varius vel auctor a, viverra sit amet lacus.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Fusce blandit, lorem at mollis pretium, est leo scelerisque dolor, feugiat pharetra sapien elit bibendum libero. Morbi faucibus eleifend cursus. Vestibulum fermentum eros pulvinar elit ultrices maximus. Aliquam erat volutpat. Suspendisse quis diam vitae metus maximus viverra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec fringilla neque turpis, sed tincidunt risus lacinia quis. Fusce eget nisl venenatis, fermentum turpis eget, ultricies mi. Donec ut justo non nunc accumsan aliquet eget eu nisi. Ut varius purus ut eleifend hendrerit. Phasellus sed consectetur ex, eu ultrices est.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque cursus turpis quis ante efficitur tempus. In eu dignissim enim. Phasellus sit amet accumsan justo. Suspendisse tincidunt, massa at cursus consectetur, sapien turpis lacinia nulla, a luctus ex arcu sed lorem. Nullam vel ante ultrices, accumsan turpis vel, convallis sem. Ut ac finibus odio, ut placerat elit. Nunc aliquam, nunc ac placerat sodales, eros velit dictum est, quis pellentesque ipsum sapien vitae erat. Nunc euismod id nisl ac interdum. Pellentesque sodales ex at tellus facilisis, quis gravida mi fermentum. Cras et bibendum lectus. Nullam laoreet, risus eget consequat tristique, purus risus malesuada risus, ac eleifend erat turpis nec eros. Pellentesque vitae ex purus. Vestibulum eget orci leo. Donec ut orci ac dolor finibus fringilla.<\\/font><\\/p>\"}', 0, '2021-06-09 08:50:42', '2022-10-13 06:29:58'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">ipsum dolor sit amet, consectetur adipiscing elit. Sed in orci eros. Phasellus pulvinar in lectus vestibulum blandit. Aenean lacus mauris, egestas vitae augue pulvinar, accumsan egestas sapien. Ut viverra dolor non augue ullamcorper, blandit viverra risus auctor. Curabitur blandit lectus in arcu iaculis pretium. Proin venenatis neque a magna gravida, non fringilla diam suscipit. Maecenas dictum turpis magna, nec aliquam felis sollicitudin ut. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque gravida nibh vel ultricies auctor. Vivamus non convallis purus. Nunc sollicitudin diam leo, a suscipit lorem tempor nec. Phasellus tellus ligula, gravida rhoncus mattis vitae, lacinia sit amet nulla. Sed vestibulum cursus diam, non ornare tortor egestas dictum.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Phasellus tincidunt pharetra lobortis. Fusce cursus dictum sapien. Aliquam enim lorem, rhoncus vitae sagittis vel, faucibus et erat. Sed at posuere neque, hendrerit pulvinar augue. Nulla iaculis orci vel nulla aliquam, lobortis sodales purus porta. Duis id lacinia nisl. Fusce eu neque in nibh luctus posuere sit amet non odio. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eget risus eget urna tincidunt dapibus. In maximus scelerisque nulla, ut luctus nunc luctus eu. In hac habitasse platea dictumst. Fusce sapien massa, placerat sed lectus in, faucibus pretium erat. Quisque et cursus purus, vitae efficitur libero. Aenean iaculis sollicitudin placerat.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Vivamus aliquam mi neque, vel efficitur justo rutrum id. Aliquam erat volutpat. Nunc mattis a diam vel auctor. Pellentesque vestibulum massa arcu, sit amet imperdiet lacus aliquet eu. Praesent aliquam mauris sit amet libero congue, sit amet aliquam sapien laoreet. Sed dignissim augue non lectus scelerisque, a posuere elit ultricies. Morbi nec fermentum arcu. Duis pretium convallis tempus. Suspendisse mollis, nisi ac porttitor gravida, nibh nisl pharetra sapien, nec tincidunt turpis dolor in velit. Integer dolor dui, varius vel auctor a, viverra sit amet lacus.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Fusce blandit, lorem at mollis pretium, est leo scelerisque dolor, feugiat pharetra sapien elit bibendum libero. Morbi faucibus eleifend cursus. Vestibulum fermentum eros pulvinar elit ultrices maximus. Aliquam erat volutpat. Suspendisse quis diam vitae metus maximus viverra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec fringilla neque turpis, sed tincidunt risus lacinia quis. Fusce eget nisl venenatis, fermentum turpis eget, ultricies mi. Donec ut justo non nunc accumsan aliquet eget eu nisi. Ut varius purus ut eleifend hendrerit. Phasellus sed consectetur ex, eu ultrices est.<\\/font><\\/p><p style=\\\"margin-right:0px;margin-bottom:15px;margin-left:0px;padding:0px;text-align:justify;font-family:\'Open Sans\', Arial, sans-serif;font-size:14px;\\\"><font color=\\\"#ffffff\\\">Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque cursus turpis quis ante efficitur tempus. In eu dignissim enim. Phasellus sit amet accumsan justo. Suspendisse tincidunt, massa at cursus consectetur, sapien turpis lacinia nulla, a luctus ex arcu sed lorem. Nullam vel ante ultrices, accumsan turpis vel, convallis sem. Ut ac finibus odio, ut placerat elit. Nunc aliquam, nunc ac placerat sodales, eros velit dictum est, quis pellentesque ipsum sapien vitae erat. Nunc euismod id nisl ac interdum. Pellentesque sodales ex at tellus facilisis, quis gravida mi fermentum. Cras et bibendum lectus. Nullam laoreet, risus eget consequat tristique, purus risus malesuada risus, ac eleifend erat turpis nec eros. Pellentesque vitae ex purus. Vestibulum eget orci leo. Donec ut orci ac dolor finibus fringilla.<\\/font><\\/p>\"}', 0, '2021-06-09 08:51:18', '2022-10-13 06:30:37'),
(44, 'maintenance.data', '{\"heading\":\"THE SITE IS UNDER MAINTENANCE\",\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"font-weight: 600; line-height: 1.3; font-size: 24px; text-align: center; font-family: Exo, sans-serif;\\\"><font color=\\\"#FFFFFF\\\">We\'ll Be Right Back!<\\/font><\\/h3><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\"><p class=\\\"font-18\\\" style=\\\"margin-right: 0px; margin-left: 0px; font-family: Nunito, sans-serif; font-size: 18px !important;\\\"><font color=\\\"#FFFFFF\\\">Sorry, we are down for maintenance but we will be back as soon as possible.<\\/font><\\/p><\\/h3><\\/div>\"}', 0, '2020-07-04 23:42:52', '2022-08-31 05:52:05'),
(45, 'banner.content', '{\"has_image\":\"1\",\"heading\":\"Play online games and win a lot of bonuses\",\"subheading\":\"Lorem ipsum dolor sit amet consectetur adipisicing elit. Quos error quo cum illum, alias similique, suscipit nihil tempore.\",\"button_one\":\"Sign Up\",\"button_url_one\":\"user\\/register\",\"button_two\":\"Sign In\",\"button_url_two\":\"user\\/login\",\"image\":\"6305cef1a72c51661325041.jpg\"}', 0, '2022-08-24 05:40:41', '2022-10-19 06:11:22'),
(46, 'about.content', '{\"has_image\":\"1\",\"heading\":\"About\",\"description\":\"Maecenas sagittis turpis vel orci malesuada\",\"button\":\"Learn More\",\"button_url\":\"about-us\",\"image\":\"6305cf36ddbcf1661325110.png\"}', 0, '2022-08-24 05:41:50', '2022-09-25 07:47:59'),
(47, 'about.element', '{\"icon\":\"<i class=\\\"las la-cogs\\\"><\\/i>\",\"title\":\"Best Platform\"}', 0, '2022-08-24 05:42:12', '2022-08-24 05:42:12'),
(48, 'about.element', '{\"icon\":\"<i class=\\\"las la-credit-card\\\"><\\/i>\",\"title\":\"Quick Deposit\"}', 0, '2022-08-24 05:42:24', '2022-08-24 05:42:24'),
(49, 'about.element', '{\"icon\":\"<i class=\\\"las la-cloud-download-alt\\\"><\\/i>\",\"title\":\"Quick Withdraw\"}', 0, '2022-08-24 05:42:34', '2022-08-24 05:42:34'),
(50, 'about.element', '{\"icon\":\"<i class=\\\"las la-hands-helping\\\"><\\/i>\",\"title\":\"24\\/7 Support\"}', 0, '2022-08-24 05:42:44', '2022-08-24 05:42:44'),
(52, 'game.content', '{\"heading\":\"Our Awesome Games\",\"subheading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2022-08-24 05:43:37', '2022-08-24 05:43:37'),
(53, 'trx_win.content', '{\"heading\":\"Latest Transactions And Winners\",\"subheading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2022-08-24 05:44:18', '2022-08-24 05:44:18'),
(54, 'why_choose_us.content', '{\"has_image\":\"1\",\"heading\":\"Why Choose Xaxino\",\"subheading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi tempor\",\"image\":\"6305d01520d811661325333.jpg\"}', 0, '2022-08-24 05:45:33', '2022-08-24 05:45:33'),
(55, 'why_choose_us.element', '{\"icon\":\"<i class=\\\"far fa-heart\\\"><\\/i>\",\"title\":\"Awesome Gaming Platform\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2022-08-24 05:45:47', '2022-08-24 05:45:47'),
(56, 'why_choose_us.element', '{\"icon\":\"<i class=\\\"fab fa-hubspot\\\"><\\/i>\",\"title\":\"Referral Commission System\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2022-08-24 05:46:00', '2022-08-24 05:46:00'),
(57, 'why_choose_us.element', '{\"icon\":\"<i class=\\\"las la-lock\\\"><\\/i>\",\"title\":\"Secure Betting Platform\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2022-08-24 05:46:12', '2022-08-24 05:46:12'),
(58, 'why_choose_us.element', '{\"icon\":\"<i class=\\\"las la-dollar-sign\\\"><\\/i>\",\"title\":\"Invest Win And Earn\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2022-08-24 05:46:24', '2022-08-24 05:46:24'),
(59, 'why_choose_us.element', '{\"icon\":\"<i class=\\\"lar la-hand-paper\\\"><\\/i>\",\"title\":\"Quick Response\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2022-08-24 05:46:37', '2022-08-24 05:46:37'),
(60, 'why_choose_us.element', '{\"icon\":\"<i class=\\\"lab la-amazon-pay\\\"><\\/i>\",\"title\":\"26+ Payment Gateway\",\"description\":\"Adipisci harum cum, ipsum nulla hic earum quidem repellat ad! At quam odio non harum minima nihil exercitationem ex, distinctio.\"}', 0, '2022-08-24 05:46:48', '2022-08-24 05:46:48'),
(61, 'statistics.element', '{\"icon\":\"<i class=\\\"las la-users\\\"><\\/i>\",\"title\":\"Total User\",\"amount\":\"1,255,000\"}', 0, '2022-08-24 05:52:06', '2022-08-24 05:52:06'),
(62, 'statistics.element', '{\"icon\":\"<i class=\\\"las la-trophy\\\"><\\/i>\",\"title\":\"Total Winners\",\"amount\":\"845,000\"}', 0, '2022-08-24 05:52:22', '2022-08-24 05:52:22'),
(63, 'statistics.element', '{\"icon\":\"<i class=\\\"lar la-credit-card\\\"><\\/i>\",\"title\":\"Total Deposit\",\"amount\":\"4,845,000\"}', 0, '2022-08-24 05:52:36', '2022-08-24 05:52:37'),
(64, 'statistics.element', '{\"icon\":\"<i class=\\\"las la-download\\\"><\\/i>\",\"title\":\"Total Withdraw\",\"amount\":\"945,000\"}', 0, '2022-08-24 05:52:48', '2022-08-24 05:52:48'),
(65, 'faq.content', '{\"heading\":\"Frequently Asked Questions\",\"subheading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2022-08-24 05:53:26', '2022-08-24 05:53:26'),
(66, 'faq.element', '{\"question\":\"Why Xaxino?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:53:34', '2022-08-24 05:53:34'),
(67, 'faq.element', '{\"question\":\"How to prediction?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:53:43', '2022-08-24 05:53:43'),
(68, 'faq.element', '{\"question\":\"Our vission And mission?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:53:52', '2022-08-24 05:53:52'),
(69, 'faq.element', '{\"question\":\"Why Xaxino?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:54:02', '2022-08-24 05:54:02'),
(70, 'faq.element', '{\"question\":\"How to prediction?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:54:15', '2022-08-24 05:54:15'),
(71, 'faq.element', '{\"question\":\"Our vission And mission?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:54:23', '2022-08-24 05:54:23'),
(72, 'faq.element', '{\"question\":\"Our vission And mission?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:54:31', '2022-08-24 05:54:31'),
(73, 'faq.element', '{\"question\":\"How to predict?\",\"answer\":\"Donec quisque sem molestie tortor ut, libero libero interdum nec quisque, et scelerisque nam, elit lectus mauris sed maecenas. Veniam urna eget habitasse aliquam\"}', 0, '2022-08-24 05:54:38', '2022-08-24 05:54:38'),
(74, 'how_work.content', '{\"heading\":\"How Work Xaxino\"}', 0, '2022-08-24 05:56:32', '2022-08-24 05:56:32'),
(75, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-trophy\\\"><\\/i>\",\"title\":\"Win Lottery!\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2022-08-24 05:56:43', '2022-08-24 05:56:43'),
(76, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-check-circle\\\"><\\/i>\",\"title\":\"Confirm Lottery\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2022-08-24 05:56:54', '2022-08-24 05:56:54'),
(77, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-hand-pointer\\\"><\\/i>\",\"title\":\"Pick Number\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2022-08-24 05:57:06', '2022-08-24 05:57:06'),
(78, 'how_work.element', '{\"icon\":\"<i class=\\\"las la-check-square\\\"><\\/i>\",\"title\":\"Choose Lottery\",\"description\":\"Amet odit iure eaeos autiste perferendis numquam sint excepturi.\"}', 0, '2022-08-24 05:57:19', '2022-08-24 05:57:19'),
(79, 'cta.content', '{\"has_image\":\"1\",\"heading\":\"Buy ticket and get million dollars for a click\",\"button\":\"Play Now\",\"button_url\":\"games\",\"image\":\"6305d32481af81661326116.jpg\"}', 0, '2022-08-24 05:58:36', '2022-09-03 07:19:55'),
(80, 'referral.content', '{\"has_image\":\"1\",\"heading\":\"15% Referral Commission\",\"description\":\"<p style=\\\"margin-right:0px;margin-left:0px;font-size:16px;color:rgba(255,255,255,0.7);font-family:\'Open Sans\', sans-serif;background-color:rgb(6,3,34);\\\">Lorem\\r\\n ipsum dolor sit amet consectetur adipisicing elit. Reiciendis omnis \\r\\nrecusandae non quos aspernatur? Quisquam excepturi nobis laborum minima \\r\\nrecusandae, quidem voluptas, iusto fuga animi omnis eius eos assumenda \\r\\ndolore ipsum adipisci, iure aliquam exercitationem qui aliquid aperiam \\r\\ndolorum voluptate? Esse corrupti quia voluptatum minima natus voluptas \\r\\naspernatur quisquam id.<\\/p><p style=\\\"margin-right:0px;margin-left:0px;color:rgba(255,255,255,0.85);font-family:Roboto, sans-serif;font-size:16px;background-color:rgb(2,12,37);\\\"><\\/p><ul class=\\\"cmn-list\\\" style=\\\"margin-top:20px;color:rgba(255,255,255,0.85);font-family:Roboto, sans-serif;background-color:rgb(2,12,37);\\\"><li style=\\\"margin-top:0px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">10% Bibendum purus feugiat at, dolor convallis auctor congue Aliquam urna et neque nulla proin<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">03% Magnis faucibus amet irure metus, adipiscing ultricies elit interdum odio vel nibh.<\\/li><li style=\\\"margin-top:15px;margin-right:0px;margin-left:0px;padding-left:40px;\\\">02% Magnis faucibus amet irure metus, adipiscing ultricies elit interdu<\\/li><\\/ul>\",\"image\":\"6305d36b4f7971661326187.png\"}', 0, '2022-08-24 05:59:47', '2022-08-24 05:59:47'),
(81, 'testimonial.content', '{\"heading\":\"What User Say About Xaxino\"}', 0, '2022-08-24 06:00:21', '2022-08-24 06:00:21'),
(82, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Auyesha Hatun\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"image\":\"6305d39d9015f1661326237.jpg\"}', 0, '2022-08-24 06:00:37', '2022-08-24 06:00:37'),
(83, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Raba Khan\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"image\":\"6305d3aa9b8261661326250.jpg\"}', 0, '2022-08-24 06:00:50', '2022-08-24 06:00:50'),
(84, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Shunil Bhat\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"image\":\"6305d3b9248db1661326265.jpg\"}', 0, '2022-08-24 06:01:05', '2022-08-24 06:01:05'),
(85, 'testimonial.element', '{\"has_image\":\"1\",\"name\":\"Raziya Khanam\",\"quote\":\"Doloribus porro nobis in provident rem eum reandae quasi voluptatum, quibusdam et itaque tenetur quos alias quo harum officiis quis vero. Enim omnis porro, cupiditate repellat harum et eius distinctio neque dolorem expedita obcaecati commodi.\",\"image\":\"6305d3c84dc131661326280.jpg\"}', 0, '2022-08-24 06:01:20', '2022-08-24 06:01:20'),
(86, 'payment_method.content', '{\"heading\":\"We accept 21+ payment methods\"}', 0, '2022-08-24 06:01:53', '2022-08-24 06:01:53'),
(87, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d3f9179791661326329.png\"}', 0, '2022-08-24 06:02:09', '2022-08-24 06:02:09'),
(88, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d3ff200c91661326335.png\"}', 0, '2022-08-24 06:02:15', '2022-08-24 06:02:15'),
(89, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d40c7367b1661326348.png\"}', 0, '2022-08-24 06:02:28', '2022-08-24 06:02:28'),
(90, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d415136441661326357.png\"}', 0, '2022-08-24 06:02:37', '2022-08-24 06:02:37'),
(91, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d41c12b091661326364.png\"}', 0, '2022-08-24 06:02:44', '2022-08-24 06:02:44'),
(92, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d4214a6f11661326369.png\"}', 0, '2022-08-24 06:02:49', '2022-08-24 06:02:49'),
(93, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d426e29921661326374.png\"}', 0, '2022-08-24 06:02:54', '2022-08-24 06:02:54'),
(94, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d42ca68b61661326380.png\"}', 0, '2022-08-24 06:03:00', '2022-08-24 06:03:00'),
(95, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d433a7d4e1661326387.png\"}', 0, '2022-08-24 06:03:07', '2022-08-24 06:03:07'),
(96, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d43cd9bed1661326396.png\"}', 0, '2022-08-24 06:03:16', '2022-08-24 06:03:16'),
(97, 'payment_method.element', '{\"has_image\":\"1\",\"image\":\"6305d44335e851661326403.png\"}', 0, '2022-08-24 06:03:23', '2022-08-24 06:03:23'),
(98, 'blog.content', '{\"heading\":\"Our Blog News\",\"subheading\":\"Dolor sit amet consectetur adipisicing elit. Ipsa, harum quidem fuga ipsam dolores odio architecto, non neque minima atque nisi temporibus ullam\"}', 0, '2022-08-24 07:03:26', '2022-08-24 07:03:26'),
(99, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque\\r\\n magna vel fermentum, libero nulla fermentum integer elit ut maecenas, \\r\\ndiam suspendisse lectus, felis elit cras sint orci. Neque sit donec \\r\\narcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci \\r\\na, eros blan proin vehicula morbi. Sed dui ut odio tristique, \\r\\nsuspendisse sapien laoreet, placerat lectus ornare placerat, libero ac \\r\\nsapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc \\r\\nconvallis ornare non eget vitae, lectus pleradibus molestie, egestas \\r\\namet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi \\r\\nparturient, donec tempus suspendisse scelerisque phasellus. Porttitor \\r\\nultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed \\r\\nviverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat \\r\\nelit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam\\r\\n enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi\\r\\n libero maxime lectus. In massa semper reiciendis nulla a ante, quis \\r\\nvel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada\\r\\n massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae\\r\\n eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa \\r\\nmollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npraesent duis eu amet at. Interdum urna eu malesuada vestibulum \\r\\ncurabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, \\r\\negestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis\\r\\n fusce dui, sed dui donec pharetra, integer imperdiet molestie \\r\\ntristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut \\r\\ntortor cras senectus fusce, euismod etiam mollis pharetra, commodo \\r\\ninceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer \\r\\nleo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a \\r\\nnam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet\\r\\n odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, \\r\\nullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque \\r\\nmetus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim\\r\\n malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, \\r\\nnec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna,\\r\\n ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur \\r\\nvelit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas \\r\\nmagna commodo vestibulum, amet libero. commodo erat justo, volutpat elit\\r\\n iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam \\r\\nenim felis turpis quis magnis consectetuer, tristique justo pulvinar mi \\r\\nlibero maxime lectus. In massa semper reiciendis nulla a ante quis \\r\\nvelcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat\\r\\n nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum \\r\\nnec montes, enim vitae interdum. Id elementum enim volutpat pharetra \\r\\nerat sapien. Penatibus tincidunt praesent fringilla, dui eget in \\r\\ntristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam \\r\\ninterdum nulla vestibulum sit, molestie elit eros mi, at nunc eget \\r\\nposuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse \\r\\nadipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, \\r\\nodio iaculis placerat, neque integer. Sagittis mauris egestas consequat \\r\\nsunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, \\r\\nerat tristique tristique vitae mi augue.<\\/p>\",\"image\":\"630600f0daf711661337840.jpg\"}', 7, '2022-08-24 07:05:20', '2022-09-17 06:03:43'),
(100, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque\\r\\n magna vel fermentum, libero nulla fermentum integer elit ut maecenas, \\r\\ndiam suspendisse lectus, felis elit cras sint orci. Neque sit donec \\r\\narcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci \\r\\na, eros blan proin vehicula morbi. Sed dui ut odio tristique, \\r\\nsuspendisse sapien laoreet, placerat lectus ornare placerat, libero ac \\r\\nsapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc \\r\\nconvallis ornare non eget vitae, lectus pleradibus molestie, egestas \\r\\namet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi \\r\\nparturient, donec tempus suspendisse scelerisque phasellus. Porttitor \\r\\nultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed \\r\\nviverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat \\r\\nelit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam\\r\\n enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi\\r\\n libero maxime lectus. In massa semper reiciendis nulla a ante, quis \\r\\nvel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada\\r\\n massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae\\r\\n eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa \\r\\nmollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npraesent duis eu amet at. Interdum urna eu malesuada vestibulum \\r\\ncurabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, \\r\\negestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis\\r\\n fusce dui, sed dui donec pharetra, integer imperdiet molestie \\r\\ntristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut \\r\\ntortor cras senectus fusce, euismod etiam mollis pharetra, commodo \\r\\ninceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer \\r\\nleo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a \\r\\nnam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet\\r\\n odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, \\r\\nullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque \\r\\nmetus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim\\r\\n malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, \\r\\nnec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna,\\r\\n ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur \\r\\nvelit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas \\r\\nmagna commodo vestibulum, amet libero. commodo erat justo, volutpat elit\\r\\n iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam \\r\\nenim felis turpis quis magnis consectetuer, tristique justo pulvinar mi \\r\\nlibero maxime lectus. In massa semper reiciendis nulla a ante quis \\r\\nvelcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat\\r\\n nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum \\r\\nnec montes, enim vitae interdum. Id elementum enim volutpat pharetra \\r\\nerat sapien. Penatibus tincidunt praesent fringilla, dui eget in \\r\\ntristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam \\r\\ninterdum nulla vestibulum sit, molestie elit eros mi, at nunc eget \\r\\nposuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse \\r\\nadipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, \\r\\nodio iaculis placerat, neque integer. Sagittis mauris egestas consequat \\r\\nsunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, \\r\\nerat tristique tristique vitae mi augue.<\\/p>\",\"image\":\"630600fc05c8a1661337852.jpg\"}', 14, '2022-08-24 07:05:44', '2022-10-20 03:01:59'),
(101, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque\\r\\n magna vel fermentum, libero nulla fermentum integer elit ut maecenas, \\r\\ndiam suspendisse lectus, felis elit cras sint orci. Neque sit donec \\r\\narcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci \\r\\na, eros blan proin vehicula morbi. Sed dui ut odio tristique, \\r\\nsuspendisse sapien laoreet, placerat lectus ornare placerat, libero ac \\r\\nsapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc \\r\\nconvallis ornare non eget vitae, lectus pleradibus molestie, egestas \\r\\namet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi \\r\\nparturient, donec tempus suspendisse scelerisque phasellus. Porttitor \\r\\nultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed \\r\\nviverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat \\r\\nelit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam\\r\\n enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi\\r\\n libero maxime lectus. In massa semper reiciendis nulla a ante, quis \\r\\nvel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada\\r\\n massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae\\r\\n eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa \\r\\nmollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npraesent duis eu amet at. Interdum urna eu malesuada vestibulum \\r\\ncurabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, \\r\\negestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis\\r\\n fusce dui, sed dui donec pharetra, integer imperdiet molestie \\r\\ntristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut \\r\\ntortor cras senectus fusce, euismod etiam mollis pharetra, commodo \\r\\ninceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer \\r\\nleo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a \\r\\nnam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet\\r\\n odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, \\r\\nullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque \\r\\nmetus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim\\r\\n malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, \\r\\nnec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna,\\r\\n ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur \\r\\nvelit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas \\r\\nmagna commodo vestibulum, amet libero. commodo erat justo, volutpat elit\\r\\n iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam \\r\\nenim felis turpis quis magnis consectetuer, tristique justo pulvinar mi \\r\\nlibero maxime lectus. In massa semper reiciendis nulla a ante quis \\r\\nvelcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat\\r\\n nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum \\r\\nnec montes, enim vitae interdum. Id elementum enim volutpat pharetra \\r\\nerat sapien. Penatibus tincidunt praesent fringilla, dui eget in \\r\\ntristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam \\r\\ninterdum nulla vestibulum sit, molestie elit eros mi, at nunc eget \\r\\nposuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse \\r\\nadipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, \\r\\nodio iaculis placerat, neque integer. Sagittis mauris egestas consequat \\r\\nsunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, \\r\\nerat tristique tristique vitae mi augue.<\\/p>\",\"image\":\"6306010648eec1661337862.jpg\"}', 2, '2022-08-24 07:06:08', '2022-10-13 07:33:10'),
(102, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque\\r\\n magna vel fermentum, libero nulla fermentum integer elit ut maecenas, \\r\\ndiam suspendisse lectus, felis elit cras sint orci. Neque sit donec \\r\\narcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci \\r\\na, eros blan proin vehicula morbi. Sed dui ut odio tristique, \\r\\nsuspendisse sapien laoreet, placerat lectus ornare placerat, libero ac \\r\\nsapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc \\r\\nconvallis ornare non eget vitae, lectus pleradibus molestie, egestas \\r\\namet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi \\r\\nparturient, donec tempus suspendisse scelerisque phasellus. Porttitor \\r\\nultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed \\r\\nviverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat \\r\\nelit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam\\r\\n enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi\\r\\n libero maxime lectus. In massa semper reiciendis nulla a ante, quis \\r\\nvel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada\\r\\n massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae\\r\\n eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa \\r\\nmollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npraesent duis eu amet at. Interdum urna eu malesuada vestibulum \\r\\ncurabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, \\r\\negestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis\\r\\n fusce dui, sed dui donec pharetra, integer imperdiet molestie \\r\\ntristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut \\r\\ntortor cras senectus fusce, euismod etiam mollis pharetra, commodo \\r\\ninceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer \\r\\nleo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a \\r\\nnam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet\\r\\n odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, \\r\\nullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque \\r\\nmetus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim\\r\\n malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, \\r\\nnec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna,\\r\\n ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur \\r\\nvelit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas \\r\\nmagna commodo vestibulum, amet libero. commodo erat justo, volutpat elit\\r\\n iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam \\r\\nenim felis turpis quis magnis consectetuer, tristique justo pulvinar mi \\r\\nlibero maxime lectus. In massa semper reiciendis nulla a ante quis \\r\\nvelcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat\\r\\n nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum \\r\\nnec montes, enim vitae interdum. Id elementum enim volutpat pharetra \\r\\nerat sapien. Penatibus tincidunt praesent fringilla, dui eget in \\r\\ntristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam \\r\\ninterdum nulla vestibulum sit, molestie elit eros mi, at nunc eget \\r\\nposuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse \\r\\nadipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, \\r\\nodio iaculis placerat, neque integer. Sagittis mauris egestas consequat \\r\\nsunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, \\r\\nerat tristique tristique vitae mi augue.<\\/p>\",\"image\":\"63060112437731661337874.jpg\"}', 1, '2022-08-24 07:06:28', '2022-08-31 07:56:53');
INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `views`, `created_at`, `updated_at`) VALUES
(103, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque\\r\\n magna vel fermentum, libero nulla fermentum integer elit ut maecenas, \\r\\ndiam suspendisse lectus, felis elit cras sint orci. Neque sit donec \\r\\narcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci \\r\\na, eros blan proin vehicula morbi. Sed dui ut odio tristique, \\r\\nsuspendisse sapien laoreet, placerat lectus ornare placerat, libero ac \\r\\nsapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc \\r\\nconvallis ornare non eget vitae, lectus pleradibus molestie, egestas \\r\\namet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi \\r\\nparturient, donec tempus suspendisse scelerisque phasellus. Porttitor \\r\\nultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed \\r\\nviverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat \\r\\nelit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam\\r\\n enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi\\r\\n libero maxime lectus. In massa semper reiciendis nulla a ante, quis \\r\\nvel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada\\r\\n massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae\\r\\n eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa \\r\\nmollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npraesent duis eu amet at. Interdum urna eu malesuada vestibulum \\r\\ncurabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, \\r\\negestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis\\r\\n fusce dui, sed dui donec pharetra, integer imperdiet molestie \\r\\ntristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut \\r\\ntortor cras senectus fusce, euismod etiam mollis pharetra, commodo \\r\\ninceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer \\r\\nleo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a \\r\\nnam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet\\r\\n odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, \\r\\nullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque \\r\\nmetus commod<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim\\r\\n malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, \\r\\nnec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna,\\r\\n ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur \\r\\nvelit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas \\r\\nmagna commodo vestibulum, amet libero. commodo erat justo, volutpat elit\\r\\n iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam \\r\\nenim felis turpis quis magnis consectetuer, tristique justo pulvinar mi \\r\\nlibero maxime lectus. In massa semper reiciendis nulla a ante quis \\r\\nvelcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat\\r\\n nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum \\r\\nnec montes, enim vitae interdum. Id elementum enim volutpat pharetra \\r\\nerat sapien. Penatibus tincidunt praesent fringilla, dui eget in \\r\\ntristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam \\r\\ninterdum nulla vestibulum sit, molestie elit eros mi, at nunc eget \\r\\nposuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse \\r\\nadipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, \\r\\nodio iaculis placerat, neque integer. Sagittis mauris egestas consequat \\r\\nsunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, \\r\\nerat tristique tristique vitae mi augue.<\\/p>\",\"image\":\"6306011c5afd11661337884.jpg\"}', 12, '2022-08-24 07:06:51', '2022-10-19 07:16:25'),
(104, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"Aut modi soluta nihil, repellat adipisci similique dolores.\",\"preview\":\"Delectus velit adipisci amet offici molestias minus qui praesentium itaque incidunt sunt porro maxime sit veniam facere, reprehen.\",\"description\":\"<p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Pellentesque\\r\\n magna vel fermentum, libero nulla fermentum integer elit ut maecenas, \\r\\ndiam suspendisse lectus, felis elit cras sint orci. Neque sit donec \\r\\narcu, ornare odio pulvinar ante aliquam, luctus ac ut justo sapien orci \\r\\na, eros blan proin vehicula morbi. Sed dui ut odio tristique, \\r\\nsuspendisse sapien laoreet, placerat lectus ornare placerat, libero ac \\r\\nsapien tincidunt consectetuer, vestibulum vivamus at nonummy sem. Nunc \\r\\nconvallis ornare non eget vitae, lectus pleradibus molestie, egestas \\r\\namet vestibulum ac faucibus mi, ultricies atque ornare malesuada morbi \\r\\nparturient, donec tempus suspendisse scelerisque phasellus. Porttitor \\r\\nultricies porttitor lacus arcu ultricies vitae, tempor mattis arcu sed \\r\\nviverra arcu natus, in wisi wisi dictum commodo erat justo, volutpat \\r\\nelit iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam\\r\\n enim felis turpis quis magnis consectetuer, tristique justo pulvinar mi\\r\\n libero maxime lectus. In massa semper reiciendis nulla a ante, quis \\r\\nvel, cras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Malesuada\\r\\n massa nibh interdum vel, adipiscing amet, vestibulum pede, nec ut vitae\\r\\n eros volutpat cras. Sed venenatis hymenaeos vestibulum at magna, ipsa \\r\\nmollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npraesent duis eu amet at. Interdum urna eu malesuada vestibulum \\r\\ncurabitur velit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, \\r\\negestas magna commodo vestibulum amet libero.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Turpis\\r\\n fusce dui, sed dui donec pharetra, integer imperdiet molestie \\r\\ntristique. Eros non et consectetuer sem, saepe nec nunc, feugiat ut \\r\\ntortor cras senectus fusce, euismod etiam mollis pharetra, commodo \\r\\ninceptos arcu aliquam lormet dui sit rutrum feugiat vivamus, integer \\r\\nleo. Hac eu urna eleifend quisque, at urna. Urna vel cras, pulvinar a \\r\\nnam leo gravida pede curabitur. Id justo dignissim pellentesque at, amet\\r\\n odit fusce, sit rutrum justo. Ornare nec nunc nibh consectetuer, \\r\\nullamcorper montes sociis. Etiam luctus porta velit, sed pellentesque \\r\\nmetus commodo<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Enim\\r\\n malesuada massa nibh interdum vel, adipiscing amet, vestibulum pede, \\r\\nnec ut vitae eros volutpat crasSeivenatis hymenaeos vestibulum at magna,\\r\\n ipsa mollis posuere ante lorem, sed erat, pulvinar vestibulum. Litora \\r\\npesent duis eu amet at. Interdum urna eu malesuada vestibulum curabitur \\r\\nvelit, wisi vitae. Nulla sem. Mauris venenatis a vivamus sit, egestas \\r\\nmagna commodo vestibulum, amet libero. commodo erat justo, volutpat elit\\r\\n iaculis. Sit vel mauris nec magna odio. Et vel lobortis et. Aliquam \\r\\nenim felis turpis quis magnis consectetuer, tristique justo pulvinar mi \\r\\nlibero maxime lectus. In massa semper reiciendis nulla a ante quis \\r\\nvelcras morbi sed.<\\/p><p style=\\\"margin-top:20px;margin-right:0px;margin-left:0px;color:rgb(151,175,213);font-size:16px;font-family:Roboto, sans-serif;\\\">Feugiat\\r\\n nibh, dis magna fusce turpis ut ante quam, ante neque non condimentum \\r\\nnec montes, enim vitae interdum. Id elementum enim volutpat pharetra \\r\\nerat sapien. Penatibus tincidunt praesent fringilla, dui eget in \\r\\ntristique nam nullam feugiat, sit auctor integer arcu risus. Aliquam \\r\\ninterdum nulla vestibulum sit, molestie elit eros mi, at nunc eget \\r\\nposuere duis. Gravida cum sit, nam nibh interdum nulla, suspendisse \\r\\nadipiscing fusce wisi. Curabitur ac non aptent volutpat nascetur sed, \\r\\nodio iaculis placerat, neque integer. Sagittis mauris egestas consequat \\r\\nsunt cras, sapien ac nunc magnis nisl, sed mi integer in. Accumsan dui, \\r\\nerat tristique tristique vitae mi augue.<\\/p>\",\"image\":\"63060126b38011661337894.jpg\"}', 39, '2022-08-24 07:07:24', '2022-10-16 09:52:06'),
(105, 'login.content', '{\"has_image\":\"1\",\"title\":\"Welcome to Xaxino\",\"subtitle\":\"Sit iste delectus iure animi facere. Est veritatis illo officia.\",\"image\":\"6305e36cea4e31661330284.jpg\"}', 0, '2022-08-24 07:08:04', '2022-08-24 07:08:05'),
(106, 'register.content', '{\"has_image\":\"1\",\"title\":\"Welcome to Xaxino\",\"subtitle\":\"Sit iste delectus iure animi facere. Est veritatis illo officia.\",\"image\":\"6305e38a6e8981661330314.jpg\"}', 0, '2022-08-24 07:08:34', '2022-08-24 07:08:34'),
(107, 'contact_us.content', '{\"has_image\":\"1\",\"heading\":\"Quick Support\",\"subheading\":\"You can get all information\",\"title\":\"Get in touch\",\"image\":\"6305e3b0bf5fe1661330352.jpg\"}', 0, '2022-08-24 07:09:12', '2022-10-12 03:28:54'),
(108, 'footer.content', '{\"footer_content\":\"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ea possimus facilis aut veritatis, voluptate ullam, dolorem fugiat maxime cupiditate reiciendis voluptatum  incidunt deserunt.\",\"subscribe_title\":\"Subscribe to get updates\",\"subscribe_content\":\"Lorem ipsum dolor sit amet soluta consectetur adipisicing elit. Iste amet soluta possimus veniam non eaque.\"}', 0, '2022-08-24 07:10:20', '2022-08-24 07:10:20'),
(109, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.facebook.com\\/\"}', 0, '2022-08-24 07:11:53', '2022-08-31 10:05:49'),
(110, 'social_icon.element', '{\"title\":\"Linkedin\",\"social_icon\":\"<i class=\\\"lab la-linkedin-in\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', 0, '2022-08-24 07:12:15', '2022-10-19 06:19:47'),
(111, 'social_icon.element', '{\"title\":\"Twitter\",\"social_icon\":\"<i class=\\\"fab fa-twitter\\\"><\\/i>\",\"url\":\"https:\\/\\/www.twitter.com\\/\"}', 0, '2022-08-24 07:12:29', '2022-08-24 07:12:29'),
(112, 'social_icon.element', '{\"title\":\"Instagram\",\"social_icon\":\"<i class=\\\"fab fa-instagram\\\"><\\/i>\",\"url\":\"https:\\/\\/www.instagram.com\\/\"}', 0, '2022-08-24 07:18:46', '2022-08-24 07:18:46'),
(113, 'breadcrumb.content', '{\"has_image\":\"1\",\"image\":\"6305e6a01b29d1661331104.jpg\"}', 0, '2022-08-24 07:21:44', '2022-08-24 07:21:44'),
(114, 'user_kyc.content', '{\"verification_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet? Ratione voluptates beatae numquam.\",\"pending_content\":\"Lorem ipsum, dolor sit amet consectetur adipisicing elit. Hic officia quod natus, non dicta perspiciatis, quae repellendus ea illum aut debitis sint amet .\"}', 0, '2022-08-31 05:32:19', '2022-08-31 05:32:19'),
(116, 'contact_us.element', '{\"icon\":\"<i class=\\\"las la-phone\\\"><\\/i>\",\"title\":\"Call Us\",\"contact_info\":\"+7556555555555\"}', 0, '2022-10-12 03:23:54', '2022-10-12 03:23:54'),
(117, 'contact_us.element', '{\"icon\":\"<i class=\\\"far fa-envelope\\\"><\\/i>\",\"title\":\"Mail Us\",\"contact_info\":\"jawimycava@mailinator.com\"}', 0, '2022-10-12 03:24:25', '2022-10-12 03:24:25'),
(119, 'contact_us.element', '{\"icon\":\"<i class=\\\"las la-map-marker\\\"><\\/i>\",\"title\":\"Visit Us\",\"contact_info\":\"Velit minus rerum si\"}', 0, '2022-10-12 03:25:02', '2022-10-12 03:25:02'),
(120, 'banned.content', '{\"has_image\":\"1\",\"heading\":\"You Are Banned\",\"image\":\"63467ec50796c1665564357.png\"}', 0, '2022-10-12 06:15:57', '2022-10-12 06:15:57');

-- --------------------------------------------------------

--
-- Table structure for table `games`
--

CREATE TABLE `games` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `win` decimal(28,8) DEFAULT 0.00000000 COMMENT 'Win Bonus',
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `min_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `invest_back` tinyint(1) DEFAULT 0,
  `probable_win` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `games`
--

INSERT INTO `games` (`id`, `name`, `alias`, `image`, `status`, `win`, `max_limit`, `min_limit`, `invest_back`, `probable_win`, `type`, `level`, `instruction`, `created_at`, `updated_at`) VALUES
(1, 'Head & Tail', 'head_tail', '6345218eda3c71665474958.jpg', 1, '50.00000000', '100.00000000', '1.00000000', 1, '\"90\"', NULL, NULL, '<br><h2 style=\"font-family: Roboto, \" open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\">How to Play (Rule)</h2><div><br></div><div><b>Admin can write as he want. This text is controllable from admin panel.</b></div><div><br></div><div> Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel. Admin can write as he want. This text is controllable from admin panel.</div>', NULL, '2022-10-19 08:41:02'),
(2, 'Rock Paper scissors', 'rock_paper_scissors', '610515f76a27a1627723255.jpg', 1, '20.00000000', '100.00000000', '1.00000000', 1, '\"15\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\">How to play: Rock Paper &amp; Scissors</h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2022-10-16 06:33:05'),
(3, 'Spin Wheel', 'spin_wheel', '61051d8469d731627725188.jpg', 1, '50.00000000', '10000.00000000', '1.00000000', 1, '\"100\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\">How to play: Spin Wheel</h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price</p></div>', NULL, '2022-10-16 06:33:09'),
(4, 'Number Guessing', 'number_guess', '61051a9ed28511627724446.jpg', 1, NULL, '100.00000000', '1.00000000', 0, NULL, NULL, NULL, '<div><span style=\"color: inherit; font-family: var(--heading-font); font-size: 44px; font-weight: 600;\">How to play: Number Guessing Game</span><br></div><div><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p><blockquote open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; padding: 0.5625rem 1.25rem 0px 1.1875rem; border-left: 1px solid rgb(221, 221, 221); line-height: 1.6; color: rgb(145, 145, 145);\"><p style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: inherit; padding: 0px 0px 0px 30px; font-size: 1rem; line-height: 1.6; text-rendering: optimizelegibility;\">Generally, 20-25% of your guests will participate in a raffle—so the more guests you have, the more tickets you’ll sell.</p></blockquote><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">Price your raffle ticket conscientious of your guests’ budgets; for your average smaller event, $15 is great. For larger events, $25. Big events can sometimes charge $50 or $100 depending on the value of the raffle prize.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Promote the Game</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">The best way to sell more raffle tickets? Promote it! Start spreading the word about the raffle prior to the event—put up a page on your event website about it, send out fliers advertising your prize, and make tickets available for sale online. Just be sure to track who’s already bought one, then add them to the list of event night raffle participants.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Make it Fun</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">Instead of giving out a ticket stub to raffle participants, give guests participating in Heads and Tails a&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">fun and inexpensive party favor</span>, such as a light stick, a toy, a noisemaker, or another raffle favor tied into your event theme.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">For guests who purchased raffle tickets in advance, include the favors in the bidder packet that guests pick up at check-in.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Maximize Participation</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">A Heads and Tails raffle is a great way to&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\"><a href=\"https://blog.greatergiving.com/top-7-ways-to-keep-your-audience-engaged-during-the-live-auction/\" target=\"_blank\" style=\"color: rgb(120, 160, 37); font-family: var(--para-font); line-height: inherit;\">spur engagement during the entertainment portion of your event</a></span>, before or during the live auction, so be sure to make arrangements with your auctioneer in advance of event night to announce and host it.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px=\"\" 30px;\"=\"\">While the auctioneer is announcing the raffle, encourage last-minute participation. For guests who do decide to participate in the raffle at the last minute, make sign-up sheets available at each table, and send out a few volunteers to walk among the tables with extra raffle favors. Be sure to collect the sign-up sheets before the raffle starts.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" padding:=\"\" 0px;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">How “Heads and Tails” Works</span></p><ol open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; margin-left: 1.4rem;\"><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">When it’s time, your auctioneer should ask all Heads and Tails participants to stand up. Then participants select either “heads” or “tails” by putting their hands on their heads—or their tails!</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer flips a coin and announces whether the coin came up heads or tails. Those participants whose choice matches the coin flip get to stay standing—everyone else sits down.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer continues asking participants to select “heads” or “tails,” then flipping the coin, eliminating more players until only a handful are left.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">Ask these few finalists to come to the stage for the last few coin tosses, until only one player is left standing. This is your raffle winner!</li></ol></div>', NULL, '2022-10-16 06:33:15'),
(5, 'Dice Rolling', 'dice_rolling', '61051cb37ad601627724979.jpg', 1, '5.00000000', '100.00000000', '1.00000000', 1, '\"5\"', NULL, NULL, '<font color=\"#000000\"><br></font><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \" rgb(33,=\"\" 37,=\"\" 41);\"=\"\"><font color=\"#ffffff\">How to play: Dice Rolling</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" sans-serif;\"=\"\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" sans-serif;\"=\"\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \" sans-serif;\"=\"\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2022-10-16 06:33:22'),
(6, 'Card Finding', 'card_finding', '610521608fde21627726176.jpg', 1, '50.00000000', '100.00000000', '1.00000000', 1, '\"10\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" rgb(33,=\"\" 37,=\"\" 41);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \"><font color=\"#ffffff\">How to play: Card Finding</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2022-10-16 06:33:26'),
(7, 'Number Slot', 'number_slot', '61052482a60ed1627726978.jpg', 1, NULL, '100.00000000', '1.00000000', 0, '[\"50\",\"40\",\"6\",\"4\"]', NULL, '[\"100\",\"150\",\"200\"]', '<br><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" rgb(33,=\"\" 37,=\"\" 41);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem;\"><font color=\"#ffffff\">How to play: Number Slot</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px;\">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px;\"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px;\">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p></div>', NULL, '2022-10-16 06:33:29'),
(8, 'Pool Number', 'number_pool', '610526fa315241627727610.jpg', 1, '50.00000000', '1000.00000000', '1.00000000', 1, '\"3\"', NULL, NULL, '<div><br></div><div><h2 open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-weight:=\"\" 400;=\"\" line-height:=\"\" 1.4;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" font-size:=\"\" 2.3125rem;=\"\" background-color:=\"transparent\" color:=\"\" rgb(85,=\"\" 85,=\"\" 85);\"=\"\" rgb(33,=\"\" 37,=\"\" 41);\"=\"\" style=\"margin-top: 0.2rem; margin-bottom: 0.5rem; font-family: \"><font color=\"#ffffff\">How to play: Pool Number</font></h2><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Finding engaging ways to generate more revenue at your event (aka: giving donors every opportunity to give) is a key task. Don’t knock the traditional activities like Wall of Wine or Heads and Tails, just add your own flare.&nbsp;A Heads and Tails game isn’t your usual raffle;&nbsp;it’s a fun, novel way to engage event guests who might otherwise be hesitant to participate and bid in the live auction. It operates the same way as a standard raffle, but with a twist!</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Pick Your Prize</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">First, select an item for your raffle that will appeal to a broad audience, to get as many people as possible to participate. The value of the prize itself can vary, but pick something that costs relative &nbsp;in relation to the ticket sale price.</p><blockquote open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; padding: 0.5625rem 1.25rem 0px 1.1875rem; border-left: 1px solid rgb(221, 221, 221); line-height: 1.6; color: rgb(145, 145, 145);\"><p style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: inherit; padding: 0px 0px 0px 30px; font-size: 1rem; line-height: 1.6; text-rendering: optimizelegibility;\">Generally, 20-25% of your guests will participate in a raffle—so the more guests you have, the more tickets you’ll sell.</p></blockquote><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Price your raffle ticket conscientious of your guests’ budgets; for your average smaller event, $15 is great. For larger events, $25. Big events can sometimes charge $50 or $100 depending on the value of the raffle prize.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Promote the Game</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">The best way to sell more raffle tickets? Promote it! Start spreading the word about the raffle prior to the event—put up a page on your event website about it, send out fliers advertising your prize, and make tickets available for sale online. Just be sure to track who’s already bought one, then add them to the list of event night raffle participants.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Make it Fun</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">Instead of giving out a ticket stub to raffle participants, give guests participating in Heads and Tails a&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">fun and inexpensive party favor</span>, such as a light stick, a toy, a noisemaker, or another raffle favor tied into your event theme.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">For guests who purchased raffle tickets in advance, include the favors in the bidder packet that guests pick up at check-in.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">Maximize Participation</span></p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">A Heads and Tails raffle is a great way to&nbsp;<span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\"><a href=\"https://blog.greatergiving.com/top-7-ways-to-keep-your-audience-engaged-during-the-live-auction/\" target=\"_blank\" style=\"color: rgb(120, 160, 37); font-family: var(--para-font); line-height: inherit;\">spur engagement during the entertainment portion of your event</a></span>, before or during the live auction, so be sure to make arrangements with your auctioneer in advance of event night to announce and host it.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px=\"\" 30px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \">While the auctioneer is announcing the raffle, encourage last-minute participation. For guests who do decide to participate in the raffle at the last minute, make sign-up sheets available at each table, and send out a few volunteers to walk among the tables with extra raffle favors. Be sure to collect the sign-up sheets before the raffle starts.</p><p open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" text-rendering:=\"\" optimizelegibility;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" padding:=\"\" 0px;\"=\"\" sans-serif;\"=\"\" style=\"margin-right: 0px; margin-bottom: 1.25rem; margin-left: 0px; font-family: \"><span style=\"font-family: var(--para-font); font-weight: 700; line-height: inherit;\">How “Heads and Tails” Works</span></p><ol open=\"\" sans\",=\"\" helvetica,=\"\" arial,=\"\" sans-serif;=\"\" font-size:=\"\" 16px;=\"\" line-height:=\"\" 1.6;=\"\" color:=\"\" rgb(68,=\"\" 68,=\"\" 68);=\"\" background-color:=\"transparent\" style=\"margin-bottom: 1.25rem; margin-left: 1.4rem;\"><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">When it’s time, your auctioneer should ask all Heads and Tails participants to stand up. Then participants select either “heads” or “tails” by putting their hands on their heads—or their tails!</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer flips a coin and announces whether the coin came up heads or tails. Those participants whose choice matches the coin flip get to stay standing—everyone else sits down.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">The auctioneer continues asking participants to select “heads” or “tails,” then flipping the coin, eliminating more players until only a handful are left.</li><li style=\"font-family: var(--para-font); margin: 0px 0px 0.75rem; padding: 0px; counter-increment: item 1;\">Ask these few finalists to come to the stage for the last few coin tosses, until only one player is left standing. This is your raffle winner!</li></ol></div>', NULL, '2022-10-16 06:33:44');

-- --------------------------------------------------------

--
-- Table structure for table `game_logs`
--

CREATE TABLE `game_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `game_id` int(10) NOT NULL DEFAULT 0,
  `user_select` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `result` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `invest` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `win_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `try` int(11) DEFAULT 0,
  `win_status` tinyint(1) DEFAULT 0,
  `game_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alias` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supported_currencies` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-owud61543012@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:04:38'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"hR26aw02Q1eEeUPSIfuwNypXX\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:35:33'),
(3, 0, 103, 'Stripe Hosted', 'Stripe', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:48:36'),
(4, 0, 104, 'Skrill', 'Skrill', 1, '{\"pay_to_email\":{\"title\":\"Skrill Email\",\"global\":true,\"value\":\"merchant@skrill.com\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"---\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"MAD\":\"MAD\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PLN\":\"PLN\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"SAR\":\"SAR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TND\":\"TND\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\",\"COP\":\"COP\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:30:16'),
(5, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"DIY12386817555501617\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"bKMfNxPPf_QdZppa\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"DIYtestingweb\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 03:00:44'),
(6, 0, 106, 'Payeer', 'Payeer', 0, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"866989763\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"7575\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"RUB\":\"RUB\"}', 0, '{\"status\":{\"title\": \"Status URL\",\"value\":\"ipn.Payeer\"}}', NULL, '2019-09-14 13:14:22', '2020-12-28 01:26:58'),
(7, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"pk_test_cd330608eb47970889bca397ced55c1dd5ad3783\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"sk_test_8a0b1f199362d7acc9c390bff72c4e81f74e2ac3\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2021-05-21 01:49:51'),
(8, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"demo\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 01:22:38'),
(9, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(10, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"rzp_test_kiOtejPbRZU90E\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"osRDebzEqbsE1kbyQJ4y0re7\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(11, 0, 111, 'Stripe Storefront', 'StripeJs', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 00:53:10'),
(12, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_2241633c3bc44a3de84a3b33969\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"test_279f083f7bebefd35217feef22d\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"19d38908eeff4f58b2ddda2c6d86ca25\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:56:20'),
(13, 0, 501, 'Blockchain', 'Blockchain', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"55529946-05ca-48ff-8710-f279d86b1cc5\"},\"xpub_code\":{\"title\":\"XPUB CODE\",\"global\":true,\"value\":\"xpub6CKQ3xxWyBoFAF83izZCSFUorptEU9AF8TezhtWeMU5oefjX3sFSBw62Lr9iHXPkXmDQJJiHZeTRtD9Vzt8grAYRhvbz4nEvBu3QKELVzFK\"}}', '{\"BTC\":\"BTC\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-03-21 07:41:56'),
(15, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"93a1e014c4ad60a7980b4a7239673cb4\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:14'),
(16, 0, 504, 'CoinPayments Fiat', 'CoinpaymentsFiat', 1, '{\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"6515561\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:07:44'),
(17, 0, 505, 'Coingate', 'Coingate', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"6354mwVCEw5kHzRJ6thbGo-N\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-03-30 09:24:57'),
(18, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"c47cd7df-d8e8-424b-a20a\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"55871878-2c32-4f64-ab66\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 02:02:47'),
(24, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"Ae0-tixtSV7DvLwIh3Bmu7JvHrjh5EfGdXr_cEklKAVjjezRZ747BxKILiBdzlKKyp-W8W_T7CKH1Ken\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"EOhbvHZgFNO21soQJT1L9Q00M3rK6PIEsdiTgXRBt2gtGtxwRer5JvKnVUGNU5oE63fFnjnYY7hq3HBA\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(25, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51I6GGiCGv1sRiQlEi5v1or9eR0HVbuzdMd2rW4n3DxC8UKfz66R4X6n4yYkzvI2LeAIuRU9H99ZpY7XCNFC9xMs500vBjZGkKG\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51I6GGiCGv1sRiQlEOisPKrjBqQqqcFsw8mXNaZ2H2baN6R01NulFS7dKFji1NRRxuchoUTEDdB7ujKcyKYSVc0z500eth7otOM\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"whsec_lUmit1gtxwKTveLnSe88xCSDdnPOt8g5\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2021-05-21 00:58:38'),
(27, 0, 115, 'Mollie', 'Mollie', 1, '{\"mollie_email\":{\"title\":\"Mollie Email \",\"global\":true,\"value\":\"vi@gmail.com\"},\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"test_cucfwKTWfft9s337qsVfn5CC4vNkrn\"}}', '{\"AED\":\"AED\",\"AUD\":\"AUD\",\"BGN\":\"BGN\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"HRK\":\"HRK\",\"HUF\":\"HUF\",\"ILS\":\"ILS\",\"ISK\":\"ISK\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:44:45'),
(30, 0, 116, 'Cashmaal', 'Cashmaal', 1, '{\"web_id\":{\"title\":\"Web Id\",\"global\":true,\"value\":\"3748\"},\"ipn_key\":{\"title\":\"IPN Key\",\"global\":true,\"value\":\"546254628759524554647987\"}}', '{\"PKR\":\"PKR\",\"USD\":\"USD\"}', 0, '{\"webhook\":{\"title\": \"IPN URL\",\"value\":\"ipn.Cashmaal\"}}', NULL, NULL, '2021-06-22 08:05:04'),
(36, 0, 119, 'Mercado Pago', 'MercadoPago', 1, '{\"access_token\":{\"title\":\"Access Token\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(44, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"3Vee5S2F\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(45, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:12:37'),
(46, 0, 122, 'Two Checkout', 'TwoCheckout', 1, '{\"merchant_code\":{\"title\":\"Merchant Code\",\"global\":true,\"value\":\"----\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----\"}}', '{\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"AZN\":\"AZN\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"BSD\":\"BSD\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"FJD\":\"FJD\",\"GBP\":\"GBP\",\"GTQ\":\"GTQ\",\"HKD\":\"HKD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"KRW\":\"KRW\",\"KWD\":\"KWD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LRD\":\"LRD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MMK\":\"MMK\",\"MOP\":\"MOP\",\"MRU\":\"MRU\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NOK\":\"NOK\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RUB\":\"RUB\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SEK\":\"SEK\",\"SGD\":\"SGD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"THB\":\"THB\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TRY\":\"TRY\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"UAH\":\"UAH\",\"USD\":\"USD\",\"UYU\":\"UYU\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XCD\":\"XCD\",\"XOF\":\"XOF\",\"YER\":\"YER\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:32:31'),
(47, 0, 123, 'Advance Cash', 'AdvCash', 1, '{\"account_email\":{\"title\":\"Account Email\",\"global\":true,\"value\":\"----\"},\"api_name\":{\"title\":\"API Name\",\"global\":true,\"value\":\"----\"},\"api_password\":{\"title\":\"API Password\",\"global\":true,\"value\":\"----\"}}', '{\"USD\":\"USD\", \"EUR\":\"EUR\", \"GBP\":\"GBP\", \"RUB\":\"RUB\", \"BRL\":\"BRL\", \"TRY\":\"TRY\", \"UAH\":\"UAH\", \"KZT\":\"KZT\", \"VND\":\"VND\"}', 0, '', NULL, NULL, '2022-08-31 06:21:15'),
(48, 0, 120, 'Authorize.net', 'Authorize', 1, '{\"login_id\":{\"title\":\"Login ID\",\"global\":true,\"value\":\"3Vee5S2F\"},\"transaction_key\":{\"title\":\"Transaction Key\",\"global\":true,\"value\":\"3Vee5S2F\"}}', '{\"USD\":\"USD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"NOK\":\"NOK\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"AUD\":\"AUD\",\"NZD\":\"NZD\"}', 0, NULL, NULL, NULL, '2021-07-17 09:44:29'),
(49, 0, 121, 'NMI', 'NMI', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"-------\"}}', '{\"AED\":\"AED\",\"ARS\":\"ARS\",\"AUD\":\"AUD\",\"BOB\":\"BOB\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"KRW\":\"KRW\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"RUB\":\"RUB\",\"SEC\":\"SEC\",\"SGD\":\"SGD\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"TWD\":\"TWD\",\"USD\":\"USD\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, NULL, '2022-08-28 10:12:37');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `gateway_parameter` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cur_text` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_template` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_from` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `base_color` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `global_shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `dc` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'dc => deposit commission',
  `rb` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'rb => register bonus\r\n',
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `system_info` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `register_bonus` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `last_cron` datetime DEFAULT NULL,
  `language` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `dc`, `rb`, `registration`, `active_template`, `system_info`, `register_bonus`, `last_cron`, `language`, `created_at`, `updated_at`) VALUES
(1, 'Xaxino', 'USD', '$', 'info@viserlab.com', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">This is a System Generated Email</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/Z1qtvtV.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello {{fullname}} ({{username}})</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">{{message}}</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2021 <a href=\"#\">{{site_name}}</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'hi {{fullname}} ({{username}}), {{message}}', 'ViserAdmin', 'E3BC3F', '{\"name\":\"php\"}', '{\"name\":\"nexmo\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 'basic', '[]', '10.00000000', '2022-10-11 09:48:17', 1, NULL, '2022-10-20 03:11:23');

-- --------------------------------------------------------

--
-- Table structure for table `guess_bonuses`
--

CREATE TABLE `guess_bonuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `chance` int(11) NOT NULL DEFAULT 0,
  `percent` decimal(5,2) DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', 1, '2020-07-06 03:47:55', '2022-04-09 03:47:04'),
(5, 'Hindi', 'hn', 0, '2020-12-29 02:20:07', '2022-04-09 03:47:04'),
(9, 'Bangla', 'bn', 0, '2021-03-14 04:37:41', '2022-03-30 12:31:55');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_from` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sent_to` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notification_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subj` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sms_body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shortcodes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:18:28'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', 'Your email verification code is: {{code}}', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-10-12 06:19:59'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55'),
(16, 'KYC_APPROVE', 'KYC Approved', 'KYC has been approved', 'Your KYC has been approved by Admin', 'Your KYC has been approved by Admin', '[]', 1, 1, NULL, '2022-10-12 06:21:25'),
(17, 'KYC_REJECT', 'KYC Rejected Successfully', 'KYC has been rejected', '<span style=\"color: rgb(33, 37, 41);\">Your KYC has been rejected by Admin</span><br>', 'Your KYC has been rejected by Admin', '[]', 1, 1, NULL, '2022-10-12 06:22:07'),
(18, 'REFERRAL_COMMISSION', 'Referral Commission', 'User Referral Commission', 'Bonus: {{amount}}&nbsp;<span style=\"color: rgb(33, 37, 41);\">{{currency}}</span>,&nbsp;<div>Current Balance: {{post_balance}},</div><div><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">{{level}}</span><span style=\"font-family: &quot;Open Sans&quot;, sans-serif;\">,</span></div><div>Transaction: {{trx}},</div>', 'Bonus: {{amount}} {{currency}}, \r\nTransaction: {{trx}},', '{\"amount\":\"Amount\", \"post_balance\":\"Post Balance\", \"trx\":\"Transaction\",\"level\":\"Level\", 	\"currency\":\"currency\" }', 1, 1, NULL, '2022-08-31 04:48:11'),
(19, 'REGISTER_BONUS', 'Register Bonus', 'User Register Bonus', '<div>Hi, {{username}}</div><div></div><div>You have got {{amount}} {{site_currency}} for register bonus.&nbsp;<br></div><div>Your current Balance: {{post_balance}} {{site_currency}},</div><div>Transaction Number : {{trx}},</div>', 'You have got {{amount}} {{site_currency}} for register bonus. \r\nTransaction: {{trx}},', '{\"trx\":\"Transaction number\",\"amount\":\"Bonus Amount\",\"username\":\"User name\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, NULL, '2022-09-01 10:50:58');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'template name',
  `secs` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'templates.basic.', '[\"statistics\",\"game\",\"about\",\"trx_win\",\"why_choose_us\",\"how_work\",\"faq\",\"cta\",\"referral\",\"testimonial\",\"blog\"]', 1, '2020-07-11 06:23:58', '2022-10-15 06:08:45'),
(4, 'Blog', 'blog', 'templates.basic.', NULL, 1, '2020-10-22 01:14:43', '2022-08-31 07:46:38'),
(5, 'Contact', 'contact', 'templates.basic.', NULL, 1, '2020-10-22 01:14:53', '2022-08-31 07:48:18'),
(19, 'About Us', 'about-us', 'templates.basic.', '[\"about\",\"why_choose_us\",\"faq\",\"testimonial\"]', 0, '2022-08-24 09:25:39', '2022-08-24 09:26:12'),
(20, 'Games', 'games', 'templates.basic.', '[\"game\"]', 1, '2022-08-24 09:26:42', '2022-08-31 07:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `referrals`
--

CREATE TABLE `referrals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `level` int(11) NOT NULL DEFAULT 0,
  `percent` decimal(5,2) DEFAULT 0.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remark` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ref_by` int(10) UNSIGNED DEFAULT NULL,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: sms unverified, 1: sms verified',
  `ver_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc_data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `profile_complete` tinyint(1) NOT NULL DEFAULT 0,
  `ban_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_ip` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_code` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `browser` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `os` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel, ',
  `admin_feedback` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commission_logs`
--
ALTER TABLE `commission_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `game_logs`
--
ALTER TABLE `game_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `guess_bonuses`
--
ALTER TABLE `guess_bonuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `referrals`
--
ALTER TABLE `referrals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_logs`
--
ALTER TABLE `commission_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT for table `games`
--
ALTER TABLE `games`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `game_logs`
--
ALTER TABLE `game_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `guess_bonuses`
--
ALTER TABLE `guess_bonuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `referrals`
--
ALTER TABLE `referrals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
