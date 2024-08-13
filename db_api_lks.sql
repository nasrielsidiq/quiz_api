-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Agu 2024 pada 04.22
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_api_lks`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `answers`
--

CREATE TABLE `answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_detail` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_choice` bigint(20) UNSIGNED NOT NULL,
  `id_quiz` bigint(20) UNSIGNED NOT NULL,
  `is_true` tinyint(1) NOT NULL,
  `time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `choices`
--

CREATE TABLE `choices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `choice` varchar(255) NOT NULL,
  `is_true` tinyint(1) NOT NULL,
  `id_question` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `choices`
--

INSERT INTO `choices` (`id`, `choice`, `is_true`, `id_question`, `created_at`, `updated_at`) VALUES
(1, '2', 1, 1, '2024-08-12 19:13:11', '2024-08-12 19:13:11'),
(2, '5', 0, 1, '2024-08-12 19:13:11', '2024-08-12 19:13:11'),
(3, '4', 0, 1, '2024-08-12 19:13:11', '2024-08-12 19:13:11'),
(4, '1', 0, 1, '2024-08-12 19:13:11', '2024-08-12 19:13:11'),
(5, '2', 0, 2, '2024-08-12 19:14:13', '2024-08-12 19:14:13'),
(6, '5', 0, 2, '2024-08-12 19:14:13', '2024-08-12 19:14:13'),
(7, '4', 1, 2, '2024-08-12 19:14:13', '2024-08-12 19:14:13'),
(8, '1', 0, 2, '2024-08-12 19:14:13', '2024-08-12 19:14:13'),
(9, '2', 0, 3, '2024-08-12 19:14:26', '2024-08-12 19:14:26'),
(10, '5', 1, 3, '2024-08-12 19:14:26', '2024-08-12 19:14:26'),
(11, '4', 0, 3, '2024-08-12 19:14:26', '2024-08-12 19:14:26'),
(12, '1', 0, 3, '2024-08-12 19:14:26', '2024-08-12 19:14:26'),
(13, 'benar', 0, 4, '2024-08-12 19:16:29', '2024-08-12 19:16:29'),
(14, 'salah', 1, 4, '2024-08-12 19:16:29', '2024-08-12 19:16:29'),
(15, 'benar', 0, 5, '2024-08-12 19:18:26', '2024-08-12 19:18:26'),
(16, 'salah', 1, 5, '2024-08-12 19:18:26', '2024-08-12 19:18:26'),
(17, 'bola', 0, 6, '2024-08-12 19:21:30', '2024-08-12 19:21:30'),
(18, 'gawang', 0, 6, '2024-08-12 19:21:30', '2024-08-12 19:21:30'),
(19, 'wasit', 0, 6, '2024-08-12 19:21:30', '2024-08-12 19:21:30'),
(20, 'tv', 1, 6, '2024-08-12 19:21:30', '2024-08-12 19:21:30'),
(21, 'bola', 0, 7, '2024-08-12 19:21:37', '2024-08-12 19:21:37'),
(22, 'gawang', 0, 7, '2024-08-12 19:21:37', '2024-08-12 19:21:37'),
(23, 'wasit', 0, 7, '2024-08-12 19:21:37', '2024-08-12 19:21:37'),
(24, 'tv', 1, 7, '2024-08-12 19:21:37', '2024-08-12 19:21:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_quizzes`
--

CREATE TABLE `detail_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_quiz` bigint(20) UNSIGNED NOT NULL,
  `id_question` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_quizzes`
--

INSERT INTO `detail_quizzes` (`id`, `id_quiz`, `id_question`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-08-12 19:13:11', '2024-08-12 19:13:11'),
(2, 1, 2, '2024-08-12 19:14:13', '2024-08-12 19:14:13'),
(3, 1, 3, '2024-08-12 19:14:26', '2024-08-12 19:14:26'),
(4, 2, 4, '2024-08-12 19:16:29', '2024-08-12 19:16:29'),
(5, 2, 5, '2024-08-12 19:18:26', '2024-08-12 19:18:26'),
(6, 2, 6, '2024-08-12 19:21:30', '2024-08-12 19:21:30'),
(7, 3, 7, '2024-08-12 19:21:37', '2024-08-12 19:21:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `history_quizzes`
--

CREATE TABLE `history_quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_quiz` bigint(20) UNSIGNED NOT NULL,
  `score` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_12_042717_create_questions_table', 1),
(6, '2024_08_12_042742_create_choices_table', 1),
(7, '2024_08_12_042756_create_quizzes_table', 1),
(8, '2024_08_12_042809_create_detail_quizzes_table', 1),
(9, '2024_08_12_042818_create_answers_table', 1),
(10, '2024_08_12_113507_create_history_quizzes_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `questions`
--

CREATE TABLE `questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `text_question` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `questions`
--

INSERT INTO `questions` (`id`, `text_question`, `status`, `created_at`, `updated_at`) VALUES
(1, '1+1=?', 0, '2024-08-12 19:13:11', '2024-08-12 19:13:11'),
(2, '2+2=?', 0, '2024-08-12 19:14:13', '2024-08-12 19:14:13'),
(3, '2+3=?', 0, '2024-08-12 19:14:26', '2024-08-12 19:14:26'),
(4, 'jika semua burung bisa terbang, dan salah satu burung adalah pinguin. apakah pinguin bisa terbang?', 0, '2024-08-12 19:16:29', '2024-08-12 19:16:29'),
(5, 'jika kucing adalah hewan peliharaan, dan beberapa hewan peliharaan adalah anjing. apakah beberapa anjing adalah kucing?', 0, '2024-08-12 19:18:26', '2024-08-12 19:18:26'),
(6, 'mana dari pernyataan di bawah yang bukan bagian dari sepak bola', 0, '2024-08-12 19:21:30', '2024-08-12 19:21:30'),
(7, 'mana dari pernyataan di bawah yang bukan bagian dari sepak bola', 0, '2024-08-12 19:21:37', '2024-08-12 19:21:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `time` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `quizzes`
--

INSERT INTO `quizzes` (`id`, `title`, `time`, `duration`, `id_user`, `created_at`, `updated_at`) VALUES
(1, 'test matematika', '2024-08-12 22:36:00', 120, 2, '2024-08-12 19:12:58', '2024-08-12 19:12:58'),
(2, 'test psikotes', '2024-08-12 22:36:00', 120, 2, '2024-08-12 19:14:41', '2024-08-12 19:14:41'),
(3, 'test olahraga', '2024-08-12 22:36:00', 120, 2, '2024-08-12 19:19:08', '2024-08-12 19:19:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` enum('siswa','admin','teacher') NOT NULL,
  `username` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `level`, `username`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin', NULL, '$2y$10$GA5.yBI6oa2Sd7GIXouRK.geVAn1jqJi5qnQLJjMkL5jNXznGGjf.', NULL, '2024-08-12 19:11:31', '2024-08-12 19:11:31'),
(2, 'Geusan', 'teacher', 'geusan', NULL, '$2y$10$cHRJd7viUhRZTmionpQ.bu/LBOIi0o8vbWJER8MnZ2bmd/fFtZ.N2', NULL, '2024-08-12 19:11:31', '2024-08-12 19:11:31'),
(3, 'Naufal', 'teacher', 'naufal', NULL, '$2y$10$scGBLxAd2CFh9VQzOU4hFugIEkqP2N6fHdIMSR7kgndXi.w79hOfC', NULL, '2024-08-12 19:11:31', '2024-08-12 19:11:31'),
(4, 'Rizal', 'siswa', 'rizal', NULL, '$2y$10$riqF6FIp5GnQcJbJEss4yurTSRiPtb8owRm2rSHyKyCjUDmEqe7wC', NULL, '2024-08-12 19:11:31', '2024-08-12 19:11:31'),
(5, 'Hilman', 'siswa', 'hilman', NULL, '$2y$10$QmEnOH2YiwGehaLAopEBaeycL5QmmEiQhmGKT6LC2vqvNvXxkJBKS', NULL, '2024-08-12 19:11:31', '2024-08-12 19:11:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answers_id_detail_foreign` (`id_detail`),
  ADD KEY `answers_id_user_foreign` (`id_user`),
  ADD KEY `answers_id_choice_foreign` (`id_choice`),
  ADD KEY `answers_id_quiz_foreign` (`id_quiz`);

--
-- Indeks untuk tabel `choices`
--
ALTER TABLE `choices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `choices_id_question_foreign` (`id_question`);

--
-- Indeks untuk tabel `detail_quizzes`
--
ALTER TABLE `detail_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_quizzes_id_quiz_foreign` (`id_quiz`),
  ADD KEY `detail_quizzes_id_question_foreign` (`id_question`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `history_quizzes`
--
ALTER TABLE `history_quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `history_quizzes_id_user_foreign` (`id_user`),
  ADD KEY `history_quizzes_id_quiz_foreign` (`id_quiz`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quizzes_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `answers`
--
ALTER TABLE `answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `choices`
--
ALTER TABLE `choices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `detail_quizzes`
--
ALTER TABLE `detail_quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `history_quizzes`
--
ALTER TABLE `history_quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `questions`
--
ALTER TABLE `questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_id_choice_foreign` FOREIGN KEY (`id_choice`) REFERENCES `choices` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_id_detail_foreign` FOREIGN KEY (`id_detail`) REFERENCES `detail_quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_id_quiz_foreign` FOREIGN KEY (`id_quiz`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `choices`
--
ALTER TABLE `choices`
  ADD CONSTRAINT `choices_id_question_foreign` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `detail_quizzes`
--
ALTER TABLE `detail_quizzes`
  ADD CONSTRAINT `detail_quizzes_id_question_foreign` FOREIGN KEY (`id_question`) REFERENCES `questions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detail_quizzes_id_quiz_foreign` FOREIGN KEY (`id_quiz`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `history_quizzes`
--
ALTER TABLE `history_quizzes`
  ADD CONSTRAINT `history_quizzes_id_quiz_foreign` FOREIGN KEY (`id_quiz`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `history_quizzes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
