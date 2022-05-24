-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2022 at 04:34 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `verent`
--

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `kd_k` int(11) NOT NULL,
  `namak` varchar(255) NOT NULL,
  `plat` varchar(255) NOT NULL,
  `jenis` varchar(255) DEFAULT NULL,
  `harga` int(50) DEFAULT NULL,
  `stat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kendaraan`
--

INSERT INTO `kendaraan` (`kd_k`, `namak`, `plat`, `jenis`, `harga`, `stat`) VALUES
(10, 'Brio', 'AB 1223 GR', 'Mobil', 150000, 'Tersedia'),
(13, 'Ertiga', 'AB 1345 UY', 'Mobil', 125000, 'Tersedia'),
(3, 'Supra 125', 'AB 1351 FE', 'Motor', 25000, 'Tersedia'),
(1, 'Mio', 'AB 1412 UY', 'Motor', 50000, 'Tersedia'),
(14, 'Jazz', 'AB 4555 UT', 'Mobil', 150000, 'Tersedia'),
(15, 'Civic', 'AB 4719 HA', 'Mobil', 200000, 'Tersedia'),
(11, 'Avanza', 'AB 7738 GH', 'Mobil', 100000, 'Tersedia'),
(2, 'Vario', 'AB 8135 BA', 'Motor', 30000, 'Tersedia'),
(16, 'Inova', 'AB 8859 OP', 'Mobil', 150000, 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pengembalian`
--

CREATE TABLE `pengembalian` (
  `id` int(11) NOT NULL,
  `kd_k` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `pengembalian`
--
DELIMITER $$
CREATE TRIGGER `trig_A` AFTER INSERT ON `pengembalian` FOR EACH ROW BEGIN
	UPDATE kendaraan SET stat=NEW.status
	WHERE kd_k = NEW.kd_k;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `id` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `noktp` varchar(255) DEFAULT NULL,
  `nohp` varchar(255) DEFAULT NULL,
  `kd_k` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `durasi` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Triggers `sewa`
--
DELIMITER $$
CREATE TRIGGER `trig_NA` AFTER INSERT ON `sewa` FOR EACH ROW BEGIN
	UPDATE kendaraan SET stat=NEW.status
	WHERE kd_k = NEW.kd_k;
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`plat`),
  ADD UNIQUE KEY `kd_k` (`kd_k`);

--
-- Indexes for table `pengembalian`
--
ALTER TABLE `pengembalian`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kendaraan`
--
ALTER TABLE `kendaraan`
  MODIFY `kd_k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
