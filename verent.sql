-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 17, 2022 at 06:24 AM
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
(1, 'Mio', 'AB 1412 UY', 'Motor', 50000, 'Tidak Tersedia');

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
-- Dumping data for table `pengembalian`
--

INSERT INTO `pengembalian` (`id`, `kd_k`, `status`) VALUES
(1, '1', 'Tersedia');

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
-- Table structure for table `roda2`
--

CREATE TABLE `roda2` (
  `plat` varchar(225) NOT NULL,
  `tipe` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `roda4`
--

CREATE TABLE `roda4` (
  `plat` varchar(225) NOT NULL,
  `seat` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `durasi` int(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `harga` int(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`id`, `nama`, `noktp`, `nohp`, `kd_k`, `durasi`, `status`, `harga`) VALUES
(1, 'Tester', '125135', '123515', '1', 5, 'Tidak Tersedia', 20000),
(2, 'twtwt', '124515', '125125', '1', 2, 'Tidak Tersedia', 0);

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
-- Indexes for table `roda2`
--
ALTER TABLE `roda2`
  ADD PRIMARY KEY (`plat`);

--
-- Indexes for table `roda4`
--
ALTER TABLE `roda4`
  ADD PRIMARY KEY (`plat`);

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
  MODIFY `kd_k` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pengembalian`
--
ALTER TABLE `pengembalian`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sewa`
--
ALTER TABLE `sewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
