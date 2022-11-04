-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2022 at 03:57 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `brgy-project`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `log_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `subject_id`, `causer_type`, `causer_id`, `properties`, `created_at`, `updated_at`) VALUES
(1, 'default', 'created', 'App\\Models\\User', 1, NULL, NULL, '{\"attributes\":{\"firstname\":\"ian\",\"lastname\":\"roy\",\"username\":\"winstarstun\",\"email\":\"admin@gmail.com\",\"password\":\"$2y$10$flNi6loDfBdO6\\/vtteBYI.ZtE8cTFMosOrIphbzg70OX80yTSsw66\"}}', '2022-04-19 16:42:25', '2022-04-19 16:42:25'),
(2, 'default', 'created', 'App\\Models\\Post', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"INTER-BARANGAY BASKETBALL TOURNAMENT\",\"content\":\"The City Government of Ligao and the Liga ng mga Barangay \\u2013 Ligao City Chapter invite you to the Inter-Barangay Basketball Tournament on March 20, 2017, Monday.\\nThe opening parade will start at 4 p.m. at the City Pavilion, and the opening ceremonies will be held at the City Gymnasium .\"}}', '2022-04-19 16:54:50', '2022-04-19 16:54:50'),
(3, 'default', 'created', 'App\\Models\\Post', 2, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"CENTER MANAGER TRAINING ON MARCH 7 & 8\",\"content\":\"Center Manager Training\\nParticipants:\\nLGU Oas\\nLGU Polangui\\nCity of Ligao (Barangay Bagumbayan and Paulba)\\nVenue: Information Technology Center\"}}', '2022-04-19 16:55:27', '2022-04-19 16:55:27'),
(4, 'default', 'created', 'App\\Models\\Post', 3, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"RURAL IMPACT SOURCING WORKSHOP\",\"content\":\"RURAL IMPACT SOURCING WORKSHOP \\u201cPromoting Online Jobs in the Countryside\\u201d\\nVenue: Ligao City Gym\\nMarch 22, 2017 @ 8:00am\"}}', '2022-04-19 16:56:01', '2022-04-19 16:56:01'),
(5, 'default', 'created', 'App\\Models\\Post', 4, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"INVITATION TO THE 2ND SUNFLOWER FESTIVAL ENDURO CHALLENGE\",\"content\":\"The Masaraga Uragon Dirt Bikers (MUDBikers) in partnership with the City Government of Ligao, headed by Mayor Patricia Gonzalez Alsua, and the Honorable Congressman of the 3rd District of Albay, Fernando V. Gonzalez, is inviting you to join and witness the 2nd Sunflower Festival Enduro Challenge on March 25, 2017.\"}}', '2022-04-19 16:56:15', '2022-04-19 16:56:15'),
(6, 'default', 'created', 'App\\Models\\Post', 5, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"COVID-19\",\"content\":\"500 186 525\\nConfirmed cases\\nLast update: 15 April 2022, 02:36 am GMT+8\\n\\n6 190 349\\nConfirmed deaths\\nLast update: 15 April 2022, 02:36 am GMT+8\\n\\n11 294 502 059\\nVaccine doses administered\\nLast update: 14 April 2022\"}}', '2022-04-19 16:57:07', '2022-04-19 16:57:07'),
(7, 'default', 'created', 'App\\Models\\Post', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"Get Vaccinated and stay up to date\",\"content\":\"COVID-19 vaccines are effective at preventing you from getting sick. COVID-19 vaccines are highly effective at preventing severe illness, hospitalizations, and death.\"}}', '2022-04-19 16:57:33', '2022-04-19 16:57:33'),
(8, 'default', 'created', 'App\\Models\\Post', 7, 'App\\Models\\User', 1, '{\"attributes\":{\"title\":\"Wear a mask\",\"content\":\"People who have a condition or are taking medications that weaken their immune system may not be fully protected even if they are up to date on their COVID-19 vaccines. They should talk to their healthcare providers about what additional precautions may be necessary.\"}}', '2022-04-19 16:57:47', '2022-04-19 16:57:47'),
(9, 'default', 'created', 'App\\Models\\User', 2, NULL, NULL, '{\"attributes\":{\"firstname\":\"exampl,e\",\"lastname\":\"user\",\"username\":\"user\",\"email\":\"mircesguerra@tip.edu.ph\",\"password\":\"$2y$10$VX3kWR8XyGpskMNSiXvzA.cSikzoROkhnW85YDzm5hPHJuUhRW1P.\"}}', '2022-04-19 17:02:25', '2022-04-19 17:02:25');

-- --------------------------------------------------------

--
-- Table structure for table `covids`
--

CREATE TABLE `covids` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_04_01_101256_create_sessions_table', 1),
(7, '2021_04_01_102503_add_role_column_to_users_table', 1),
(8, '2021_04_04_161417_create_posts_table', 1),
(9, '2021_04_26_184347_create_covids_table', 1),
(10, '2021_04_27_035324_create_resreport_table', 1),
(11, '2021_04_28_095311_create_activity_log_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
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
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `content`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'INTER-BARANGAY BASKETBALL TOURNAMENT', 'The City Government of Ligao and the Liga ng mga Barangay – Ligao City Chapter invite you to the Inter-Barangay Basketball Tournament on March 20, 2017, Monday.\nThe opening parade will start at 4 p.m. at the City Pavilion, and the opening ceremonies will be held at the City Gymnasium .', 1, '2022-04-19 16:54:50', '2022-04-19 16:54:50'),
(2, 'CENTER MANAGER TRAINING ON MARCH 7 & 8', 'Center Manager Training\nParticipants:\nLGU Oas\nLGU Polangui\nCity of Ligao (Barangay Bagumbayan and Paulba)\nVenue: Information Technology Center', 1, '2022-04-19 16:55:27', '2022-04-19 16:55:27'),
(3, 'RURAL IMPACT SOURCING WORKSHOP', 'RURAL IMPACT SOURCING WORKSHOP “Promoting Online Jobs in the Countryside”\nVenue: Ligao City Gym\nMarch 22, 2017 @ 8:00am', 1, '2022-04-19 16:56:01', '2022-04-19 16:56:01'),
(4, 'INVITATION TO THE 2ND SUNFLOWER FESTIVAL ENDURO CHALLENGE', 'The Masaraga Uragon Dirt Bikers (MUDBikers) in partnership with the City Government of Ligao, headed by Mayor Patricia Gonzalez Alsua, and the Honorable Congressman of the 3rd District of Albay, Fernando V. Gonzalez, is inviting you to join and witness the 2nd Sunflower Festival Enduro Challenge on March 25, 2017.', 1, '2022-04-19 16:56:15', '2022-04-19 16:56:15'),
(5, 'COVID-19', '500 186 525\nConfirmed cases\nLast update: 15 April 2022, 02:36 am GMT+8\n\n6 190 349\nConfirmed deaths\nLast update: 15 April 2022, 02:36 am GMT+8\n\n11 294 502 059\nVaccine doses administered\nLast update: 14 April 2022', 1, '2022-04-19 16:57:07', '2022-04-19 16:57:07'),
(6, 'Get Vaccinated and stay up to date', 'COVID-19 vaccines are effective at preventing you from getting sick. COVID-19 vaccines are highly effective at preventing severe illness, hospitalizations, and death.', 1, '2022-04-19 16:57:33', '2022-04-19 16:57:33'),
(7, 'Wear a mask', 'People who have a condition or are taking medications that weaken their immune system may not be fully protected even if they are up to date on their COVID-19 vaccines. They should talk to their healthcare providers about what additional precautions may be necessary.', 1, '2022-04-19 16:57:47', '2022-04-19 16:57:47'),
(8, 'Ayuda Cancel', 'Sorry', 1, NULL, NULL),
(9, 'Cancel', 'Sorry', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `resreports`
--

CREATE TABLE `resreports` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('8rMty0iSA7WzJJpiS7mm3p5gAZe2wL3Ossc7PjY8', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36 OPR/85.0.4341.72', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiMW1nTjNMc3p1NTdtUEFYa0gxUVJkYWpmRGFmT1QzaXF1OXhuS3Q5SiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToyO3M6MTc6InBhc3N3b3JkX2hhc2hfd2ViIjtzOjYwOiIkMnkkMTAkVlgza1dSOFh5R3Bza01OU2lYdnpBLmNTaWt6b1JPa2huVzg1WUR6bTVoUEhKdVVoUlcxUC4iO3M6MjE6InBhc3N3b3JkX2hhc2hfc2FuY3R1bSI7czo2MDoiJDJ5JDEwJFZYM2tXUjhYeUdwc2tNTlNpWHZ6QS5jU2lrem9ST2toblc4NVlEem01aFBISnVVaFJXMVAuIjt9', 1650443129),
('ZvxlgDJjyaF4rpk91dhUdsnATwBDXoyMZbEkr6AW', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.84 Safari/537.36 OPR/85.0.4341.68', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiMzllTEhEblkwOGEzTjhSYkU2Tk9zMXgyTVlDandDR295dnhtSHdXTSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1650388746);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `role`) VALUES
(1, 'ian', 'roy', 'winstarstun', 'admin@gmail.com', NULL, '$2y$10$flNi6loDfBdO6/vtteBYI.ZtE8cTFMosOrIphbzg70OX80yTSsw66', NULL, NULL, NULL, NULL, NULL, '2022-04-19 16:42:25', '2022-04-19 16:42:25', 'admin'),
(2, 'exampl,e', 'user', 'user', 'mircesguerra@tip.edu.ph', NULL, '$2y$10$VX3kWR8XyGpskMNSiXvzA.cSikzoROkhnW85YDzm5hPHJuUhRW1P.', NULL, NULL, NULL, NULL, NULL, '2022-04-19 17:02:25', '2022-04-19 17:02:25', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subject` (`subject_type`,`subject_id`),
  ADD KEY `causer` (`causer_type`,`causer_id`),
  ADD KEY `activity_log_log_name_index` (`log_name`);

--
-- Indexes for table `covids`
--
ALTER TABLE `covids`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `resreports`
--
ALTER TABLE `resreports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `covids`
--
ALTER TABLE `covids`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `resreports`
--
ALTER TABLE `resreports`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
