-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2022 at 10:56 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_keuangan`
--

DELIMITER $$
--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `kode_automatis` (`kode` INT) RETURNS CHAR(7) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(7);
DECLARE urut INT;
 
SET urut = IF(kode IS NULL, 1, kode + 1);
SET kodebaru = CONCAT("TRX", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `kode_automatis2` (`kode` INT) RETURNS CHAR(7) CHARSET latin1 BEGIN
DECLARE kodebaru CHAR(7);
DECLARE urut INT;
 
SET urut = IF(kode IS NULL, 1, kode + 1);
SET kodebaru = CONCAT("TRF", LPAD(urut, 4, 0));
 
RETURN kodebaru;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pemasukkan`
--

CREATE TABLE `pemasukkan` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(30) NOT NULL,
  `sumber` varchar(30) NOT NULL,
  `jumlah` varchar(250) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pemasukkan`
--

INSERT INTO `pemasukkan` (`id`, `tanggal`, `keterangan`, `sumber`, `jumlah`, `username`) VALUES
(32, '2022-07-01', 'Gaji Bulanan', 'ATM', '75.000.000', 'admin'),
(34, '2022-08-05', 'Desain Poster', 'ATM', '150.000', 'admin'),
(35, '2022-08-09', 'Design Website Pemerintah', 'ATM', '25.000.000', 'admin'),
(36, '2022-08-18', 'Adsense Youtube', 'Pekerjaan', '45.000.000', 'admin'),
(37, '2022-08-18', 'Pembuatan Aplikasi Mobile', 'ATM', '55.000.000', 'admin'),
(38, '2022-08-18', 'Pembuatan IoT', 'ATM', '7.500.000', 'admin'),
(39, '2022-08-30', 'Design Website Sekkolahan', 'ATM', '7.500.000', 'admin'),
(40, '2022-08-30', 'Tarik tunai', 'ATM', '25000000', 'admin'),
(41, '2022-08-01', 'Gaji Bulanan', 'Pekerjaan', '75.000.000', 'andi'),
(42, '2022-08-01', 'Pembuatan Poster Kegiatan', 'Lain - lain', '250.000', 'andi'),
(43, '2022-08-11', 'Pembuatan Video Promosi', 'Lain - lain', '2.000.000', 'andi'),
(44, '2022-08-13', 'Perancangan Sistem IoT', 'Lain - lain', '7.500.000', 'andi'),
(45, '2022-08-13', 'Installasi OS', 'Lain - lain', '500.000', 'andi'),
(46, '2022-08-16', 'Pembayaran Hutang Budi', 'Piutang', '75.000', 'andi'),
(47, '2022-08-18', 'Jual Saham Perusahaan xyz', 'Laba penjualan', '150.000.000', 'andi'),
(48, '2022-08-24', 'Pembuatan Website Pemerintah', 'ATM', '25.000.000', 'andi'),
(49, '2022-08-30', 'Pembuatan Website Perusahaan', 'ATM', '55.500.000', 'andi'),
(50, '2022-08-31', 'Pembuatan Aplikasi Pemerintaha', 'Pekerjaan', '25.000.000', 'andi'),
(51, '2022-08-31', 'Pembuatan Poster Pendidikan', 'ATM', '75.000', 'andi');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `keperluan` varchar(30) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id`, `tanggal`, `keterangan`, `keperluan`, `jumlah`, `username`) VALUES
(15, '2022-08-06', 'Pembayaran uang kuliah', 'Lain - lain', '7.500.000', 'admin'),
(16, '2022-08-09', 'Pembayarn Kos', 'Keperluan pribadi', '1.500.000', 'admin'),
(17, '2022-08-19', 'Peralatan mandi', 'Peralatan', '45.000', 'admin'),
(18, '2022-08-30', 'Beli Pertamax', 'Kendaraan', '150.000', 'admin'),
(19, '2022-08-02', 'Belanja Kebutuhan Makan 1 bulan', 'Makan dan Minum', '750.000', 'andi'),
(20, '2022-08-05', 'Pembayaran Uang Kuliah', 'Lain - lain', '7.500.000', 'andi'),
(21, '2022-08-08', 'Pembelian Meja Komputer', 'Peralatan', '2.500.000', 'andi'),
(22, '2022-08-15', 'Pembayaran Uang Kas KSPM', 'Organisasi', '15.000', 'andi'),
(23, '2022-08-25', 'Beli Peralatan Mandi', 'Keperluan pribadi', '55.000', 'andi'),
(25, '2022-08-26', 'Pertamax', 'Lain - lain', '350.000', 'andi'),
(26, '2022-08-30', 'Pembelian Montor ZX-25r', 'Kendaraan', '113.000.000', 'andi'),
(27, '2022-08-31', 'Perpanjang layanan hosting', 'Lain - lain', '5.475.000', 'andi'),
(28, '2022-08-31', 'Pembayaran Uang Kas ', 'Organisasi', '15.000', 'andi');

-- --------------------------------------------------------

--
-- Table structure for table `rekening_keluar`
--

CREATE TABLE `rekening_keluar` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `aksi` varchar(10) NOT NULL DEFAULT 'keluar',
  `tanggal` date NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening_keluar`
--

INSERT INTO `rekening_keluar` (`id`, `kode`, `jumlah`, `aksi`, `tanggal`, `username`) VALUES
(16, 'TRF0001', '7.850.000', 'keluar', '2022-08-30', 'andi');

--
-- Triggers `rekening_keluar`
--
DELIMITER $$
CREATE TRIGGER `tg_kodekeluar` BEFORE INSERT ON `rekening_keluar` FOR EACH ROW BEGIN
DECLARE s VARCHAR(8);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(kode,4,4) AS Nomer
FROM rekening_keluar ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kode_automatis2(i));
 
IF(NEW.kode IS NULL OR NEW.kode = '')
 THEN SET NEW.kode =s;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rekening_masuk`
--

CREATE TABLE `rekening_masuk` (
  `id` int(11) NOT NULL,
  `kode` varchar(10) NOT NULL,
  `jumlah` varchar(255) NOT NULL,
  `aksi` varchar(20) NOT NULL DEFAULT 'masuk',
  `tanggal` date NOT NULL,
  `username` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rekening_masuk`
--

INSERT INTO `rekening_masuk` (`id`, `kode`, `jumlah`, `aksi`, `tanggal`, `username`) VALUES
(17, 'TRX0001', '15.000.000', 'masuk', '2022-08-30', 'andi'),
(18, 'TRX0002', '50.000.000', 'masuk', '2022-08-30', 'andi'),
(19, 'TRX0003', '7.850.000', 'masuk', '2022-08-30', 'admin');

--
-- Triggers `rekening_masuk`
--
DELIMITER $$
CREATE TRIGGER `tg_kodemasuk` BEFORE INSERT ON `rekening_masuk` FOR EACH ROW BEGIN
DECLARE s VARCHAR(8);
DECLARE i INTEGER;
 
SET i = (SELECT SUBSTRING(kode,4,4) AS Nomer
FROM rekening_masuk ORDER BY Nomer DESC LIMIT 1);
 
SET s = (SELECT kode_automatis(i));
 
IF(NEW.kode IS NULL OR NEW.kode = '')
 THEN SET NEW.kode =s;
END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'aktif',
  `level` varchar(10) NOT NULL DEFAULT 'user',
  `no_rek` char(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `email`, `username`, `password`, `status`, `level`, `no_rek`) VALUES
(2, 'admin@gmail.com', 'admin', '$2y$10$P4k6qW8ppAqWfectI0tT/OOirNUFiHDA2j7.miX5Hv6XQ34/0AlK.', 'aktif', 'user', '000123456789'),
(17, 'andifirmansyah@gmail.com', 'andi', '$2y$10$mSLQZVX.jbEhVWZ3/ZSMsuLwm4yYBKP7w1SX5zWzr1v1/wM3T1VFq', 'aktif', 'user', '012345678900');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pemasukkan`
--
ALTER TABLE `pemasukkan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_username_masuk` (`username`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_username_keluar` (`username`);

--
-- Indexes for table `rekening_keluar`
--
ALTER TABLE `rekening_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_username_rekening_keluar` (`username`);

--
-- Indexes for table `rekening_masuk`
--
ALTER TABLE `rekening_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_username_rekening_masuk` (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pemasukkan`
--
ALTER TABLE `pemasukkan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `rekening_keluar`
--
ALTER TABLE `rekening_keluar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `rekening_masuk`
--
ALTER TABLE `rekening_masuk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pemasukkan`
--
ALTER TABLE `pemasukkan`
  ADD CONSTRAINT `fk_username_masuk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD CONSTRAINT `fk_username_keluar` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekening_keluar`
--
ALTER TABLE `rekening_keluar`
  ADD CONSTRAINT `fk_username_rekening_keluar` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rekening_masuk`
--
ALTER TABLE `rekening_masuk`
  ADD CONSTRAINT `fk_username_rekening_masuk` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
