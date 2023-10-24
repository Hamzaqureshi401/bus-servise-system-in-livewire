-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 24, 2023 at 11:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus`
--

-- --------------------------------------------------------

--
-- Table structure for table `alwaqat_buses`
--

CREATE TABLE `alwaqat_buses` (
  `id` int(11) NOT NULL,
  `file_no` varchar(50) DEFAULT NULL,
  `plate_no` varchar(15) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `alwaqat_buses`
--

INSERT INTO `alwaqat_buses` (`id`, `file_no`, `plate_no`, `owner_name`, `vehicle_type`, `vehicle_model`, `registration_date`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '12', '03839', 'Baba', 'Coaster', '2013', '2023-10-18', 1, '2023-10-18 09:31:36', '2023-10-18 09:31:36');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `site_branch` varchar(100) DEFAULT NULL,
  `project_area` varchar(100) DEFAULT NULL,
  `project_owner` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `site_branch`, `project_area`, `project_owner`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Tng / Aldayeen', 'Aldayeen', 'School', ' ', 1, '2023-10-15 16:44:22', '2023-10-15 16:44:22'),
(3, 'TNG/ ankhalid', 'Ankhalid', '', 'Mr Khitab', 1, '2023-10-21 13:55:26', '2023-10-21 13:55:26'),
(6, 'Tng/ naija', 'naija', 'Main School', 'Mr Khitab', 1, '2023-10-21 13:55:41', '2023-10-21 13:55:41');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `phone` varchar(191) NOT NULL,
  `email` varchar(191) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `lead_id` bigint(20) UNSIGNED NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `lead_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'mzdvsdj', '4589578', NULL, '', 1, 1, '2023-10-08 21:28:12', '2023-10-08 21:28:12');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `monthly_salary` decimal(10,2) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `name`, `mobile_no`, `registration_date`, `monthly_salary`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Mr Usama', '090990', '2023-10-05', 1000.00, 0, 1, '2023-10-20 16:18:53', '2023-10-20 16:18:53'),
(16, 'انزر قول', '55780475', '2022-08-25', 2200.00, 0, 1, '2023-10-11 17:53:54', '2023-10-11 17:53:54'),
(3, 'وحيد', '66966486', '2023-08-25', 2500.00, 0, 1, '2023-10-21 14:01:43', '2023-10-21 14:01:43'),
(4, 'نادر نايب', '74004813', '2022-08-20', 2500.00, 0, 1, '2023-10-11 17:52:25', '2023-10-11 17:52:25'),
(5, 'عاطيق', '00000000', '2022-08-25', 2500.00, 0, 1, '2023-10-11 17:52:10', '2023-10-11 17:52:10'),
(6, 'نايب رحمن', '70966958', '2022-08-25', 2500.00, 1, 1, '2023-10-21 13:59:52', '2023-10-21 13:59:52'),
(7, 'اسلام ص', '70080515', '0002-08-25', 2500.00, 1, 1, '2023-10-21 14:04:35', '2023-10-21 14:04:35'),
(8, 'شير خان', '66406493', '2022-08-25', 2500.00, 1, 1, '2023-10-21 14:08:01', '2023-10-21 14:08:01'),
(9, 'عاطيف', '66651840', '2022-08-25', 2200.00, 0, 1, '2023-10-20 16:20:03', '2023-10-20 16:20:03'),
(10, 'قول احمد', '30460419', '2022-08-25', 2500.00, 0, 1, '2023-10-11 17:23:13', '2023-10-11 17:23:13'),
(11, 'ناب خان', '70676759', '2022-08-25', 2500.00, 1, 1, '2023-10-21 14:05:50', '2023-10-21 14:05:50'),
(12, 'قيوم', '33279075', '2015-08-25', 2200.00, 0, 1, '2023-10-11 17:28:17', '2023-10-11 17:28:17'),
(13, 'تسليم', '30597712', '2022-08-25', 2200.00, 0, 1, '2023-10-11 17:30:13', '2023-10-11 17:30:13'),
(14, 'احمد وكره', '66491591', '2022-08-25', 2200.00, 0, 1, '2023-10-11 17:30:58', '2023-10-11 17:30:58'),
(15, 'امير خان', '70562440', '2022-08-25', 2500.00, 1, 1, '2023-10-21 14:01:43', '2023-10-21 14:01:43'),
(17, 'دلور خان', '70048653', '2022-08-25', 2200.00, 0, 1, '2023-10-11 17:54:36', '2023-10-11 17:54:36'),
(18, 'افضل حق', '55770483', '2022-08-25', 3000.00, 0, 1, '2023-10-11 17:55:09', '2023-10-11 17:55:09'),
(19, 'اسماعيل', '55021954', '2022-08-25', 2200.00, 0, 1, '2023-10-11 17:55:53', '2023-10-11 17:55:53'),
(20, 'ظافر', '30899568', '2022-08-25', 2200.00, 0, 1, '2023-10-11 17:56:48', '2023-10-11 17:56:48'),
(21, 'خليل', '77043543', '2023-08-25', 2200.00, 0, 1, '2023-10-11 17:59:13', '2023-10-11 17:59:13'),
(22, 'امانوالله', '66293390', '2022-08-25', 2200.00, 0, 1, '2023-10-20 16:20:08', '2023-10-20 16:20:08'),
(23, 'صاديق خان', '55684153', '2023-08-25', 2200.00, 1, 1, '2023-10-21 20:34:52', '2023-10-21 20:34:52'),
(24, 'نادر خان', '66631600', '2022-08-25', 2200.00, 0, 1, '2023-10-11 18:03:19', '2023-10-11 18:03:19'),
(25, 'الودين', '55349030', '2022-08-25', 2200.00, 0, 1, '2023-10-11 18:03:51', '2023-10-11 18:03:51'),
(26, 'راشيد', '55287969', '2022-08-25', 2200.00, 0, 1, '2023-10-11 18:04:56', '2023-10-11 18:04:56'),
(27, 'ايوب خان', '55069355', '2022-08-26', 2200.00, 0, 1, '2023-10-18 17:01:05', '2023-10-18 17:01:05'),
(29, 'افتبابدين', '30683728', '2021-07-01', 2500.00, 0, 1, '2023-10-21 14:12:33', '2023-10-21 14:12:33');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mobile_no` varchar(20) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `vehicle_file_no` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `expense_type_id` int(11) NOT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `assignment_id`, `vehicle_file_no`, `date`, `expense_type_id`, `amount`, `description`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, 12, '2023-10-20', 1, 1500.00, NULL, 1, '2023-10-20 16:22:45', '2023-10-20 16:22:45'),
(2, 2, 12, '2023-10-20', 2, 2000.00, NULL, 1, '2023-10-22 17:12:58', '2023-10-22 17:12:58'),
(3, 7, 10, '2023-10-21', 1, 4000.00, 'petrol expense', 1, '2023-10-21 20:35:29', '2023-10-21 20:35:29'),
(4, 7, 10, '2023-10-21', 2, 2000.00, 'Driver Salary', 1, '2023-10-21 20:35:46', '2023-10-21 20:35:46');

-- --------------------------------------------------------

--
-- Table structure for table `expense_types`
--

CREATE TABLE `expense_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expense_types`
--

INSERT INTO `expense_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Petrol', 1, '2023-10-05 15:51:48', '2023-10-05 15:51:48'),
(2, 'Driver Salary', 1, '2023-10-07 16:53:46', '2023-10-07 16:53:46');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(191) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `limousines`
--

CREATE TABLE `limousines` (
  `id` int(11) NOT NULL,
  `file_no` varchar(50) DEFAULT NULL,
  `plate_no` varchar(15) DEFAULT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `rent_amount` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(1) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mailsettings`
--

CREATE TABLE `mailsettings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `mail_transport` varchar(191) NOT NULL,
  `mail_host` varchar(191) NOT NULL,
  `mail_port` varchar(191) NOT NULL,
  `mail_username` varchar(191) NOT NULL,
  `mail_password` varchar(191) NOT NULL,
  `mail_encryption` varchar(191) NOT NULL,
  `mail_from` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mailsettings`
--

INSERT INTO `mailsettings` (`id`, `mail_transport`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_encryption`, `mail_from`, `created_at`, `updated_at`) VALUES
(1, 'smtp', 'sandbox.smtp.mailtrap.io', '2525', 'c9b9e7731309e8', '********1819', 'tls', 'appemailtest12@gmail.com', '2023-10-08 21:22:48', '2023-10-08 21:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `maintainances`
--

CREATE TABLE `maintainances` (
  `id` int(11) NOT NULL,
  `assignment_id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `vehicle_file_no` int(11) DEFAULT NULL,
  `parts_type_id` int(11) DEFAULT NULL,
  `payment` decimal(10,2) DEFAULT NULL,
  `garage_services_charges` decimal(10,2) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintainances`
--

INSERT INTO `maintainances` (`id`, `assignment_id`, `date`, `vehicle_file_no`, `parts_type_id`, `payment`, `garage_services_charges`, `description`, `total`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 1, '2023-10-20', 12, 1, 400.00, 100.00, NULL, 500.00, 1, '2023-10-20 16:22:17', '2023-10-20 16:22:17'),
(2, 2, '2023-10-21', 10, 4, 200.00, 100.00, NULL, 300.00, 1, '2023-10-23 08:42:25', '2023-10-23 08:42:25'),
(3, 7, '2023-10-21', 10, 9, 300.00, 200.00, NULL, 500.00, 1, '2023-10-21 20:36:45', '2023-10-21 20:36:45');

-- --------------------------------------------------------

--
-- Table structure for table `master_settings`
--

CREATE TABLE `master_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_title` text NOT NULL,
  `master_value` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_settings`
--

INSERT INTO `master_settings` (`id`, `master_title`, `master_value`, `created_at`, `updated_at`) VALUES
(1, 'store_name', 'Al Waqt Transport', NULL, NULL),
(2, 'store_phone', '000000002', NULL, NULL),
(3, 'store_email', 'jsjs@gmail.com', NULL, NULL),
(4, 'currency_symbol', 'QR', NULL, NULL),
(5, 'tax_percentage', '0', NULL, NULL),
(6, 'address', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_01_03_110853_create_product_categories_table', 1),
(6, '2023_01_03_112634_create_products_table', 1),
(7, '2023_01_03_121155_create_addons_table', 1),
(8, '2023_01_03_130000_create_tables_table', 1),
(9, '2023_01_03_135206_create_customers_table', 1),
(10, '2023_01_04_045410_create_orders_table', 1),
(11, '2023_01_04_045419_create_order_details_table', 1),
(12, '2023_01_04_045426_create_order_detail_addons_table', 1),
(13, '2023_01_04_103009_create_order_payments_table', 1),
(14, '2023_01_05_113536_create_master_settings_table', 1),
(15, '2023_01_06_102531_create_translations_table', 1),
(16, '2023_01_07_083933_create_permissions_table', 1),
(17, '2023_01_07_084129_create_model_permissions_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_permissions`
--

CREATE TABLE `model_permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `permission_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_permissions`
--

INSERT INTO `model_permissions` (`id`, `user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(2, 1, 2, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(3, 1, 3, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(4, 1, 4, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(5, 1, 5, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(6, 1, 6, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(7, 1, 7, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(8, 1, 8, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(9, 1, 9, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(10, 1, 10, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(11, 1, 11, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(12, 1, 12, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(13, 1, 13, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(14, 1, 14, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(15, 1, 15, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(16, 1, 16, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(17, 1, 17, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(18, 1, 18, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(19, 1, 19, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(20, 1, 20, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(21, 1, 21, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(22, 1, 22, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(23, 1, 23, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(24, 1, 24, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(25, 1, 25, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(26, 1, 26, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(27, 1, 27, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(28, 1, 28, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(29, 1, 29, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(30, 1, 30, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(31, 1, 31, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(32, 1, 32, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(33, 1, 33, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(34, 1, 34, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(35, 1, 35, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(36, 1, 36, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(37, 1, 37, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(38, 1, 38, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(39, 1, 39, NULL, NULL),
(40, 1, 40, NULL, NULL),
(41, 1, 41, NULL, NULL),
(42, 1, 42, NULL, NULL),
(43, 1, 43, NULL, NULL),
(44, 1, 44, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(45, 1, 45, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(46, 1, 46, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(47, 1, 47, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(48, 1, 48, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(49, 1, 49, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(50, 1, 50, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(51, 1, 51, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(52, 1, 52, '2023-09-05 19:24:23', '2023-09-05 19:24:23'),
(53, 1, 53, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(54, 1, 54, '2023-09-09 09:01:11', '2023-08-22 09:01:11'),
(55, 1, 55, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(56, 1, 56, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(57, 1, 57, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(58, 1, 58, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(59, 1, 59, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(60, 1, 60, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(61, 1, 61, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(62, 1, 62, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(63, 1, 63, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(64, 1, 64, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(65, 1, 65, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(66, 1, 66, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(67, 1, 67, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(68, 1, 68, '2023-09-09 09:01:11', '2023-09-09 09:01:11'),
(69, 1, 69, '2023-09-18 09:01:11', '2023-09-18 09:01:11'),
(70, 1, 70, '2023-09-18 09:01:11', '2023-09-18 09:01:11'),
(71, 1, 71, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(72, 1, 72, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(73, 1, 73, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(74, 1, 74, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(75, 1, 75, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(76, 1, 76, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(77, 1, 77, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(78, 1, 78, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(79, 1, 79, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(80, 1, 80, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(81, 1, 81, '2023-08-22 09:01:11', '2023-08-22 09:01:11'),
(82, 1, 82, '2023-08-22 09:01:11', '2023-08-22 09:01:11');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(191) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `parts_types`
--

CREATE TABLE `parts_types` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `parts_types`
--

INSERT INTO `parts_types` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Battery', 1, '2023-09-13 13:35:35', '2023-09-13 13:35:35'),
(2, 'Tyers', 1, '2023-09-13 13:36:03', '2023-09-13 13:36:03'),
(9, 'Seats Cover', 1, '2023-10-03 20:32:30', '2023-10-03 20:32:30'),
(4, 'Clutch plates', 1, '2023-09-13 10:49:30', '2023-09-13 10:49:30'),
(7, 'Tyerssss', 1, '2023-09-13 12:08:09', '2023-09-13 12:08:09'),
(8, 'Breaks Leather', 1, '2023-09-24 10:02:50', '2023-09-24 10:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `category` varchar(191) NOT NULL,
  `step` varchar(191) NOT NULL,
  `list` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `slug`, `name`, `category`, `step`, `list`, `created_at`, `updated_at`) VALUES
(25, 'staffs_list', 'View', 'Staff', '1', 8, NULL, NULL),
(26, 'add_staff', 'Create', 'Staff', '2', 8, NULL, NULL),
(27, 'edit_staff', 'Edit', 'Staff', '3', 8, NULL, NULL),
(28, 'delete_staff', 'Delete', 'Staff', '4', 8, NULL, NULL),
(29, 'sales_report', 'Maintainance Report', 'Reports', '1', 9, NULL, NULL),
(30, 'day_wise_sales_report', 'Expense Report', 'Reports', '2', 9, NULL, NULL),
(31, 'item_wise_sales_report', 'Vehicle Report', 'Reports', '3', 9, NULL, NULL),
(32, 'customer_report', 'Company Report', 'Reports', '4', 9, NULL, NULL),
(33, 'translations_list', 'View', 'Translation', '1', 10, NULL, NULL),
(34, 'add_translation', 'Create', 'Translation', '2', 10, NULL, NULL),
(35, 'edit_translation', 'Edit', 'Translation', '3', 10, NULL, NULL),
(36, 'delete_translation', 'Delete', 'Translation', '4', 10, NULL, NULL),
(37, 'account_settings', 'Account Settings', 'Settings', '1', 11, NULL, NULL),
(38, 'app_settings', 'App Settings', 'Settings', '2', 11, NULL, NULL),
(39, 'driver_list', 'View', 'Driver', '1', 1, NULL, NULL),
(40, 'add_driver', 'Create', 'Driver', '2', 1, NULL, NULL),
(41, 'employee_list', 'View', 'Employee', '1', 2, NULL, NULL),
(42, 'add_employee', 'Create', 'Employee', '2', 2, NULL, NULL),
(43, 'edit_employees', 'Edit', 'Employee', '3', 2, NULL, NULL),
(44, 'delete_employees', 'Delete', 'Employee', '4', 2, NULL, NULL),
(45, 'vehicles_list', 'View', 'Vehicles', '1', 3, NULL, NULL),
(46, 'add_vehicles', 'Create', 'Vehicles', '2', 3, NULL, NULL),
(47, 'edit_vehicles', 'Edit', 'Vehicles', '3', 3, NULL, NULL),
(48, 'delete_vehicles', 'Delete', 'Vehicles', '4', 3, NULL, NULL),
(49, 'company_list', 'View', 'Companies', '1', 4, NULL, NULL),
(50, 'add_company', 'Create', 'Companies', '2', 4, NULL, NULL),
(51, 'edit_company', 'Edit', 'Companies', '3', 4, NULL, NULL),
(52, 'delete_company', 'Delete', 'Companies', '4', 4, NULL, NULL),
(53, 'expensetypes_list', 'View', 'Expensetypes', '1', 16, NULL, NULL),
(54, 'add_expensetype', 'Create', 'Expensetypes', '2', 16, NULL, NULL),
(55, 'edit_expensetype', 'Edit', 'Expensetypes', '3', 16, NULL, NULL),
(56, 'delete_expensetype', 'Delete', 'Expensetypes', '4', 16, NULL, NULL),
(57, 'expenses_list', 'View', 'Expenses', '1', 17, NULL, NULL),
(58, 'add_expenses', 'Create', 'Expenses', '2', 17, NULL, NULL),
(59, 'edit_expenses', 'Edit', 'Expenses', '3', 17, NULL, NULL),
(60, 'delete_expenses', 'Delete', 'Expenses', '4', 17, NULL, NULL),
(61, 'parts_list', 'View', 'Parts Types', '1', 18, NULL, NULL),
(62, 'add_parts', 'Create', 'Parts Types', '2', 18, NULL, NULL),
(63, 'edit_parts', 'Edit', 'Parts Types', '3', 18, NULL, NULL),
(64, 'delete_parts', 'Delete', 'Parts Types', '4', 18, NULL, NULL),
(65, 'maintainance_list', 'View', 'Maintainance', '1', 19, NULL, NULL),
(66, 'add_maintainance', 'Create', 'Maintainance', '2', 19, NULL, NULL),
(67, 'edit_maintainance', 'Edit', 'Maintainance', '3', 19, NULL, NULL),
(68, 'delete_maintainance', 'Delete', 'Maintainance', '4', 19, NULL, NULL),
(69, 'limousine_list', 'View', 'Limousine', '1', 5, NULL, NULL),
(70, 'add_limousine', 'Create', 'Limousine', '2', 5, NULL, NULL),
(71, 'edit_limousine', 'Edit', 'Limousine', '3', 5, NULL, NULL),
(72, 'delete_limousine', 'Delete', 'Limousine', '4', 5, NULL, NULL),
(73, 'edit_driver', 'Edit', 'Driver', '3', 1, NULL, NULL),
(74, 'delete_driver', 'Delete', 'Driver', '4', 1, NULL, NULL),
(75, 'assigning_list', 'View', 'Vehicle Assigning', '1', 6, NULL, NULL),
(76, 'add_assigning', 'Create', 'Vehicle Assigning', '2', 6, NULL, NULL),
(77, 'edit_assigning', 'Edit', 'Vehicle Assigning', '3', 6, NULL, NULL),
(78, 'delete_assigning', 'Delete', 'Vehicle Assigning', '4', 6, NULL, NULL),
(79, 'alwaqatbus_list', 'View', 'Alwaqat Buses', '1', 15, NULL, NULL),
(80, 'add_alwaqatbus', 'Create', 'Alwaqat Buses', '2', 15, NULL, NULL),
(81, 'edit_alwaqatbus', 'Edit', 'Alwaqat Buses', '3', 15, NULL, NULL),
(82, 'delete_alwaqatbus', 'Delete', 'Alwaqat Buses', '4', 15, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(191) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `business_name` longtext DEFAULT NULL,
  `phone_no` longtext DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `business_name`, `phone_no`, `address`, `is_active`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'mc dfk', '', NULL, NULL, 1, 1, '2023-10-08 21:25:29', '2023-10-08 21:25:29');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `data` longtext NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `default` int(11) DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `image` varchar(191) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `user_type` int(11) NOT NULL DEFAULT 2,
  `phone` varchar(191) DEFAULT NULL,
  `avatar` varchar(191) DEFAULT NULL,
  `address` longtext DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `user_type`, `phone`, `avatar`, `address`, `is_active`, `created_by`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Al Waqt ', 'admin@admin.com', NULL, '$2y$10$Rqsxm80qppUPe1feCi8Mu.NN0p9wknzLVSJdzURs3xvqJIKuiw4Gu', 1, '000000000', NULL, NULL, 1, NULL, NULL, '2023-08-22 09:01:11', '2023-09-05 08:37:00');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_no` int(11) NOT NULL,
  `plate_no` varchar(30) NOT NULL,
  `owner_name` varchar(255) DEFAULT NULL,
  `vehicle_type` varchar(50) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `registration_date` date DEFAULT NULL,
  `istamara_end_date` date DEFAULT NULL,
  `insurance_end_date` date DEFAULT NULL,
  `fuel_type` varchar(255) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `file_no`, `plate_no`, `owner_name`, `vehicle_type`, `vehicle_model`, `status`, `registration_date`, `istamara_end_date`, `insurance_end_date`, `fuel_type`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 12, '233795', 'Baba', 'Daewoo 46 seater', '2012', 1, '2017-07-08', '2024-01-04', '2024-01-08', 'deisal', 1, '2023-10-21 13:53:50', '2023-10-21 13:53:50'),
(2, 10, '294130', 'Babas', 'Coaster ', '2014', 1, '2014-01-04', '2023-11-21', '2023-11-30', 'petrol', 1, '2023-10-21 20:56:28', '2023-10-21 20:56:28'),
(3, 14, '294122', 'Dagi', '30 seater', '2015', 0, '2015-10-10', '2023-10-12', '2023-10-12', 'petrol', 1, '2023-10-20 16:20:30', '2023-10-20 16:20:30'),
(4, 1, '198579', 'Baba', '30', '2014', 1, '2013-10-10', '2024-08-30', '2024-09-01', 'deisal', 1, '2023-10-21 14:08:01', '2023-10-21 14:08:01'),
(5, 2, '215631', 'Mr.Jassim', '30 seater', '2011', 0, '2015-01-01', '2024-05-21', '2024-04-25', 'petrol', 1, '2023-10-11 20:15:16', '2023-10-11 20:15:16'),
(7, 3, '275100', 'Baba', '30 coaster', '2014', 1, '2015-08-18', '2024-08-05', '2024-08-20', 'petrol', 1, '2023-10-21 13:59:52', '2023-10-21 13:59:52'),
(8, 4, '275440', 'Baba', '30 coaster', '2014', 0, '2015-08-18', '2024-08-23', '2024-08-28', 'petrol', 1, '2023-10-21 14:12:33', '2023-10-21 14:12:33'),
(9, 5, '184543', 'Dagi', '30 coaster', '2013', 0, '2013-01-10', '2024-01-20', '2024-01-22', 'deisal', 1, '2023-10-14 09:48:30', '2023-10-14 09:48:30'),
(11, 13, '226373', 'Nasir', '30 coaster', '', 0, '2017-02-21', '2024-01-15', '2024-01-29', 'petrol', 1, '2023-10-15 16:22:21', '2023-10-15 16:22:21'),
(12, 23, '156495', 'Jassim', '30 coaster', '2015', 1, '2021-08-01', '2024-03-24', '2024-03-26', 'petrol', 1, '2023-10-21 14:03:02', '2023-10-21 14:03:02'),
(13, 31, '297137', 'Jassim', '30 coaster', '2015', 1, '2022-08-01', '2026-01-01', '2024-07-20', 'deisal', 1, '2023-10-21 14:05:50', '2023-10-21 14:05:50'),
(14, 30, '286930', 'Baba', '30 coaster', '2014', 0, '2022-08-01', '2023-11-23', '2023-11-27', 'petrol', 1, '2023-10-18 14:14:44', '2023-10-18 14:14:44'),
(15, 15, '233795', 'Baba', 'Daewoo46 seater', '2012', 0, '2017-01-04', '2024-01-04', '2023-10-22', 'petrol', 1, '2023-10-22 08:50:36', '2023-10-22 08:50:36');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_assignings`
--

CREATE TABLE `vehicle_assignings` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `vehicle_id` int(11) DEFAULT NULL,
  `vehicle_file_no` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `end_of_time` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vehicle_assignings`
--

INSERT INTO `vehicle_assignings` (`id`, `date`, `company_id`, `vehicle_id`, `vehicle_file_no`, `driver_id`, `amount`, `end_of_time`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(1, '2023-10-20', 1, 1, 12, 15, 10000.00, '2024-06-30', 1, 1, '2023-10-21 14:01:43', '2023-10-21 14:01:43'),
(2, '2023-08-27', 6, 7, 3, 6, 7000.00, '2024-07-01', 1, 1, '2023-10-21 13:59:52', '2023-10-21 13:59:52'),
(3, '2023-08-27', 3, 12, 23, 7, 7000.00, '2024-06-30', 1, 1, '2023-10-21 14:04:35', '2023-10-21 14:04:35'),
(4, '2023-08-25', 3, 13, 31, 11, 7000.00, '2024-06-30', 1, 1, '2023-10-21 14:05:50', '2023-10-21 14:05:50'),
(5, '2023-08-25', 1, 2, 1, 8, 7500.00, '2024-06-30', 1, 1, '2023-10-22 13:59:28', '2023-10-22 13:59:28'),
(6, '2023-08-25', 6, 8, 4, 29, 7000.00, '2024-06-30', 0, 1, '2023-10-21 14:12:33', '2023-10-21 14:12:33'),
(7, '2023-10-21', 1, 2, 10, 23, 6000.00, '2025-01-22', 1, 1, '2023-10-21 20:34:52', '2023-10-21 20:34:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alwaqat_buses`
--
ALTER TABLE `alwaqat_buses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignment_id` (`assignment_id`),
  ADD KEY `expense_type_id` (`expense_type_id`);

--
-- Indexes for table `expense_types`
--
ALTER TABLE `expense_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `limousines`
--
ALTER TABLE `limousines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_no` (`file_no`),
  ADD UNIQUE KEY `plate_no` (`plate_no`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `maintainances`
--
ALTER TABLE `maintainances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_type_id` (`parts_type_id`),
  ADD KEY `assignment_id` (`assignment_id`);

--
-- Indexes for table `master_settings`
--
ALTER TABLE `master_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_permissions`
--
ALTER TABLE `model_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts_types`
--
ALTER TABLE `parts_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_no` (`file_no`);

--
-- Indexes for table `vehicle_assignings`
--
ALTER TABLE `vehicle_assignings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alwaqat_buses`
--
ALTER TABLE `alwaqat_buses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `expense_types`
--
ALTER TABLE `expense_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `limousines`
--
ALTER TABLE `limousines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintainances`
--
ALTER TABLE `maintainances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `master_settings`
--
ALTER TABLE `master_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `model_permissions`
--
ALTER TABLE `model_permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `parts_types`
--
ALTER TABLE `parts_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vehicle_assignings`
--
ALTER TABLE `vehicle_assignings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
