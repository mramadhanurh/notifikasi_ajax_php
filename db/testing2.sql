-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Jun 2022 pada 09.49
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `testing2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `content`
--

CREATE TABLE `content` (
  `content_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `content`
--

INSERT INTO `content` (`content_id`, `user_id`, `description`) VALUES
(1, 2, 'Apple Phone is a best phone ever.'),
(2, 2, 'Google is most visited site all over the world.'),
(3, 1, 'Google is world biggest Internet company.'),
(7, 1, 'Google\'s New Street View Cameras Will Help Algorithms Index The Real World'),
(9, 2, 'Youtube new look is very nice for any user'),
(10, 1, 'blublubluew'),
(11, 2, 'testing'),
(12, 3, 'Hallo world');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_content_like`
--

CREATE TABLE `user_content_like` (
  `user_content_like_id` int(11) NOT NULL,
  `content_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('not-seen','seen') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_content_like`
--

INSERT INTO `user_content_like` (`user_content_like_id`, `content_id`, `user_id`, `status`) VALUES
(1, 1, 3, 'seen'),
(2, 2, 3, 'seen'),
(3, 2, 4, 'seen'),
(4, 1, 4, 'seen'),
(5, 1, 2, 'seen'),
(6, 2, 2, 'seen'),
(7, 1, 6, 'seen'),
(8, 1, 5, 'seen'),
(9, 2, 5, 'seen'),
(10, 2, 6, 'seen'),
(11, 2, 1, 'seen'),
(12, 1, 1, 'seen'),
(13, 3, 2, 'seen'),
(14, 3, 1, 'seen'),
(15, 4, 1, 'seen'),
(16, 4, 2, 'seen'),
(17, 5, 2, 'seen'),
(18, 8, 1, 'not-seen'),
(19, 7, 1, 'seen'),
(20, 7, 2, 'seen'),
(21, 9, 1, 'seen'),
(22, 9, 2, 'seen'),
(23, 11, 3, 'seen'),
(24, 10, 2, 'seen'),
(25, 10, 6, 'seen'),
(26, 9, 6, 'seen'),
(27, 12, 3, 'seen'),
(28, 12, 1, 'seen');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_details`
--

CREATE TABLE `user_details` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_name` varchar(200) NOT NULL,
  `user_type` enum('master','user') NOT NULL,
  `user_image` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `user_details`
--

INSERT INTO `user_details` (`user_id`, `user_email`, `user_password`, `user_name`, `user_type`, `user_image`) VALUES
(1, 'john_smith@gmail.com', '$2y$10$cHpf3TzonURXDENRiRF0de1ycSfnM4NJ27sdwyUCf5L.sewDlkCBe', 'John Smith', 'master', 'john_smith.png'),
(2, 'dona_huber@gmail.com', '$2y$10$lcLYyNeK1adgzYcBplv45uuXHFuFyWYThnj3nB2SZ/LbQvtWSoGjO', 'Dona Huber', 'user', 'dona_huber.png'),
(3, 'roy_hise@gmail.com', '$2y$10$XlyVI9an5B6rHW3SS9vQpesJssKJxzMQYPbSaR7dnpWjDI5fpxJSS', 'Roy Hise', 'user', 'roy_hise.png'),
(4, 'peter_goad@gmail.com', '$2y$10$n1B.FdHNwufTkmzp/pNqc.EiwjB8quQ1tBCEC7nkaldI5pS.et04e', 'Peter Goad', 'user', 'peter_goad.png'),
(5, 'sarah_thomas@gmail.com', '$2y$10$s57SErOPlgkIZf1lxzlX3.hMt8LSSKaYig5rusxghDm7LW8RtQc/W', 'Sarah Thomas', 'user', 'sarah_thomas.png'),
(6, 'edna_william@gmail.com', '$2y$10$mfMXnH.TCmg5tlYRhqjxu.ILly8s9.qsLKOpyxgUl6h1fZt6x/B5C', 'Edna William', 'user', 'edna_william.png');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `content`
--
ALTER TABLE `content`
  ADD PRIMARY KEY (`content_id`);

--
-- Indeks untuk tabel `user_content_like`
--
ALTER TABLE `user_content_like`
  ADD PRIMARY KEY (`user_content_like_id`);

--
-- Indeks untuk tabel `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `content`
--
ALTER TABLE `content`
  MODIFY `content_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `user_content_like`
--
ALTER TABLE `user_content_like`
  MODIFY `user_content_like_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `user_details`
--
ALTER TABLE `user_details`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
