-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 08 Bulan Mei 2024 pada 14.17
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dblaundry_kel6`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `harga`
--

CREATE TABLE `harga` (
  `id_transaksi` char(10) NOT NULL,
  `harga_perkilo` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `harga`
--

INSERT INTO `harga` (`id_transaksi`, `harga_perkilo`) VALUES
('TRL001', 4000),
('TRL002', 5000),
('TRL003', 6000),
('TRL004', 7000),
('TRL005', 8000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pakaian`
--

CREATE TABLE `pakaian` (
  `id_pakaian` char(10) NOT NULL,
  `id_transaksi` char(10) DEFAULT NULL,
  `berat_pakaian` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pakaian`
--

INSERT INTO `pakaian` (`id_pakaian`, `id_transaksi`, `berat_pakaian`) VALUES
('PAL001', 'TRL001', '3 kg'),
('PL002', 'TRL002', '5 kg'),
('PL003', 'TRL003', '7 kg'),
('PL004', 'TRL004', '9 kg'),
('PL005', 'TRL005', '11 kg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` char(10) NOT NULL,
  `nama_pelanggan` varchar(100) DEFAULT NULL,
  `nohp` varchar(15) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `nama_pelanggan`, `nohp`, `alamat`) VALUES
('KPL001', 'Cundamani', '08155431677', 'Jalan Mangga Besar'),
('KPL002', 'Jundi', '082265883994', 'Jalan Duri Kosambi'),
('KPL003', 'Satria', '085335621775', 'Jalan Kebayoran Baru'),
('KPL004', 'Asmara', '087666735442', 'Jalan Juanda Lama'),
('KPL005', 'Zaskia', '089333742618', 'Jalan Soekarno Hatta');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` char(10) NOT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `tgl_keluar` date DEFAULT NULL,
  `id_pelanggan` char(10) DEFAULT NULL,
  `berat_pakaian` text DEFAULT NULL,
  `harga_perkilo` int(20) DEFAULT NULL,
  `status_transaksi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `tgl_masuk`, `tgl_keluar`, `id_pelanggan`, `berat_pakaian`, `harga_perkilo`, `status_transaksi`) VALUES
('TRL001', '2024-05-01', '2024-05-03', 'KPL001', '3 kg', 4000, 'Selesai'),
('TRL002', '2024-05-04', '2024-05-06', 'KPL002', '5 kg', 5000, 'Selesai'),
('TRL003', '2024-05-07', '2024-05-09', 'KPL003', '7 kg', 6000, 'Selesai'),
('TRL004', '2024-05-10', '2024-05-12', 'KPL004', '9 kg', 7000, 'Dalam Proses'),
('TRL005', '2024-05-13', '2024-05-15', 'KPL005', '11 kg', 8000, 'Dalam Proses');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id_transaksi` char(10) NOT NULL,
  `id_pakaian` char(10) NOT NULL,
  `harga_perkilo` int(20) DEFAULT NULL,
  `total_transaksi` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id_transaksi`, `id_pakaian`, `harga_perkilo`, `total_transaksi`) VALUES
('TRL001', 'PAL001', 4000, 12000),
('TRL002', 'PAL002', 5000, 25000),
('TRL003', 'PAL003', 6000, 42000),
('TRL004', 'PAL004', 7000, 56000),
('TRL005', 'PAL005', 8000, 88000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `harga`
--
ALTER TABLE `harga`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `pakaian`
--
ALTER TABLE `pakaian`
  ADD PRIMARY KEY (`id_pakaian`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indeks untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD UNIQUE KEY `id_pakaian` (`id_pakaian`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `harga`
--
ALTER TABLE `harga`
  ADD CONSTRAINT `harga_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Ketidakleluasaan untuk tabel `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
