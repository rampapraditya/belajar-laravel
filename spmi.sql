-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 25, 2026 at 08:28 AM
-- Server version: 8.4.7
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `spmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `akses`
--

DROP TABLE IF EXISTS `akses`;
CREATE TABLE IF NOT EXISTS `akses` (
  `idakses` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namaakses` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`idakses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akses`
--

INSERT INTO `akses` (`idakses`, `namaakses`, `created_at`, `updated_at`) VALUES
('55345bf0-7105-4a1f-b270-69cab578b95e', 'ADMINISTRATOR', '2026-04-23 08:09:46', '2026-04-23 08:09:46');

-- --------------------------------------------------------

--
-- Table structure for table `bidang_spm`
--

DROP TABLE IF EXISTS `bidang_spm`;
CREATE TABLE IF NOT EXISTS `bidang_spm` (
  `id_bidang_spm` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_bidang_spm` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_bidang_spm`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bidang_spm`
--

INSERT INTO `bidang_spm` (`id_bidang_spm`, `nama_bidang_spm`, `status`, `id_pt`, `created_at`, `updated_at`) VALUES
('036a5991-bf7a-4063-ab81-c899e11ecb63', 'Pendukung', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-09-14 07:41:55', '2026-09-14 13:08:58'),
('94031d97-a371-4741-b956-e8aedf8df804', 'Akademik', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-24 08:15:00', '2026-08-24 08:15:00'),
('d4857390-6ea1-43e6-aed1-8d467157af6c', 'Non Akademik', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-24 08:15:06', '2026-08-27 11:07:35');

-- --------------------------------------------------------

--
-- Table structure for table `dokumen_terkait`
--

DROP TABLE IF EXISTS `dokumen_terkait`;
CREATE TABLE IF NOT EXISTS `dokumen_terkait` (
  `id_dok_terkait` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pt` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_dokumen` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_dok_terkait`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokumen_terkait`
--

INSERT INTO `dokumen_terkait` (`id_dok_terkait`, `id_pt`, `nama_dokumen`, `status`, `created_at`, `updated_at`) VALUES
('04921291-1162-4974-8489-b0e0f668bd13', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-04-PerBAN-PT-3-2019-Panduan-Penyusunan-LKPT-IAPT-3_0', 1, '2026-09-08 10:25:57', '2026-09-08 10:25:57'),
('13f649be-8249-4147-a1ea-a52bf848767f', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-6d-PerBAN-PT-3-2019-Matriks-Penilaian-IAPT-3_0-PTA-PTS', 1, '2026-09-08 10:25:40', '2026-09-08 10:25:40'),
('22bbe15b-14de-449d-b344-edac7e620bd0', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'DL - 9 Panduan Penilaian Akreditasi Unggul (updated 24 Feb 2025)', 1, '2026-09-08 10:26:57', '2026-09-08 10:26:57'),
('2324da3c-9df3-4e03-8257-8047b05ce27a', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-4-PerBAN-PT-5-2019-tentang-IAPS-Panduan-Penyusunan-LKPS', 1, '2026-09-08 10:26:25', '2026-09-08 10:26:25'),
('2952e396-cc7a-4e14-b35c-a7afa14652e7', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-6g-PerBAN-PT-3-2019-Matriks-Penilaian-IAPT-3_0-PTV-PTS ', 1, '2026-09-08 10:25:50', '2026-09-08 10:25:50'),
('6c411097-da3b-4c2b-81f9-55e279088904', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-6a-PerBAN-PT-5-2019-tentang-IAPS-Matriks-Penilaian-Program-Sarjana', 1, '2026-09-08 10:26:06', '2026-09-08 10:26:06'),
('96837226-2b40-4104-93ea-70e9449c9cef', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'DL - 4 Panduan Penyusunan Dokumen Kinerja Program Studi (updated 24 Feb 2025)', 1, '2026-09-08 10:26:50', '2026-09-08 10:26:50'),
('a22e6bce-572f-44a1-9e58-93ec51b976d5', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'DL - 1 Naskah Akademik (updated 24 Feb 2025)', 1, '2026-09-08 10:26:40', '2026-09-08 10:26:40'),
('ab4f7bd7-33c0-4412-85b5-bcdb40f946c7', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-6e-PerBAN-PT-5-2019-tentang-IAPS-Matriks-Penilaian-Program-Sarjana-Terapan-1', 1, '2026-09-08 10:26:15', '2026-09-08 10:26:15'),
('bb00bdff-a85c-4149-b223-c27b5b905840', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Lampiran-47-Matriks-Penilaian-Akreditasi-Unggul-Vokasi-Instrumen-Unggul-Skor-2', 1, '2026-09-08 10:26:31', '2026-09-08 10:26:31'),
('c641dc69-2142-4d65-a360-bcea9b9abcd9', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Formulir Kompetensi Lulusan', 1, '2026-09-08 10:27:19', '2026-09-08 10:27:19'),
('cbfdcc88-4de7-4be4-83b5-41ab7f9d658b', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Naskah Akademik Sarjana LAM INFOKOM 2.0 – 2025', 1, '2026-09-08 10:27:04', '2026-09-08 10:27:04'),
('f182aeb4-b8cc-4855-b9a4-1b20f80d26e3', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Panduan Penyusunan Laporan Kinerja Program Studi (LKPS) Sarjana LAM INFOKOM', 1, '2026-09-08 10:27:12', '2026-09-08 10:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `identitas`
--

DROP TABLE IF EXISTS `identitas`;
CREATE TABLE IF NOT EXISTS `identitas` (
  `kode` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `namaapp` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `organisasi` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `kdpos` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tlp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`kode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `identitas`
--

INSERT INTO `identitas` (`kode`, `namaapp`, `organisasi`, `alamat`, `kdpos`, `tlp`, `email`, `logo`) VALUES
('18796dd5-cf99-4264-9678-bf1324e4664e', 'SPMI', 'Universitas Dinamika', 'Jl. Raya Kedung Baruk No.98, Kedung Baruk, Kec. Rungkut, Surabaya, Jawa Timur', '60298', '085731803889', 'official@dinamika.ac.id', '1788255423_fe637725d60c334a5ec2.png');

-- --------------------------------------------------------

--
-- Table structure for table `istilah`
--

DROP TABLE IF EXISTS `istilah`;
CREATE TABLE IF NOT EXISTS `istilah` (
  `id_istilah` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pt` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_istilah` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` text COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_istilah`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `istilah`
--

INSERT INTO `istilah` (`id_istilah`, `id_pt`, `nama_istilah`, `keterangan`, `status`, `created_at`, `updated_at`) VALUES
('20543a82-4fbc-4630-85d0-993ad4ffaa7d', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Kompetensi', 'seperangkat sikap, pengetahuan, dan keterampilan yang harus dimiliki,  dihayati, dan dikuasai oleh Peserta Didik setelah mempelajari suatu muatan pembelajaran,  menamatkan suatu program, atau menyelesaikan satuan pendidikan tertentu', 1, '2026-09-10 14:27:04', '2026-09-10 16:33:53'),
('30c3eff6-8574-40fc-9ef8-7e34b379e9e5', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Keterampilan', 'kemampuan melakukan unjuk kerja dengan menggunakan konsep,  teori, metode, bahan, dan/atau instrumen, yang diperoleh melalui Pembelajaran, pengalaman  kerja mahasiswa, Penelitian dan/atau Pengabdian kepada Masyarakat yang terkait  Pembelajaran', 1, '2026-09-10 14:52:13', '2026-09-10 14:52:13'),
('3cf1ce34-d9ee-48c1-98cb-3477ca21a350', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Standar Kompetensi Kerja Nasional Indonesia (SKKNI)', ' rumusan kemampuan kerja yang  mencakup aspek pengetahuan, keterampilan, dan/atau keahlian serta sikap kerja yang relevan  dengan pelaksanaan tugas dan syarat jabatan yang ditetapkan', 1, '2026-09-10 14:49:00', '2026-09-10 14:49:00'),
('491c972e-90c3-427f-bbfa-db3e6386ce2c', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Sikap', 'perilaku benar dan berbudaya sebagai hasil dari internalisasi dan aktualisasi  nilai dan norma yang tercermin dalam kehidupan spiritual dan sosial melalui proses  Pembelajaran, pengalaman kerja mahasiswa, Penelitian dan/atau Pengabdian kepada  Masyarakat yang terkait Pembelajaran', 1, '2026-09-10 14:49:55', '2026-09-10 14:56:32'),
('5a3d799f-f2bb-4f88-b662-df6cbafe2fcf', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Prodi', 'kesatuan kegiatan pendidikan dan pembelajaran yang memiliki kurikulum dan  metode pembelajaran tertentu dalam satu jenis pendidikan akademik, pendidikan profesi,  dan/atau pendidikan vokasi', 1, '2026-09-10 14:53:49', '2026-09-10 14:53:49'),
('6f097081-c0c3-4170-a5de-a7a1bf7aa3e5', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Capaian pembelajaran atau Program Learning Outcomes (PLO)', 'kemampuan yang  diperoleh melalui internalisasi pengetahuan, sikap, keterampilan, kompetensi, dan akumulasi  pengalaman kerja', 1, '2026-09-10 14:49:35', '2026-09-10 14:49:35'),
('75554e1a-261e-474f-9103-b7959f29e2fd', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Tim Penyusun Kurikulum (TPK)', 'tim terdiri atas dosen-dosen pada suatu prodi yang  ditugaskan oleh Dekan melalui Surat Keputusan untuk melakukan penyusunan, peninjauan, dan perubahan kurikulum sesuai dengan hasil brainstorming, benchmarking, dan/atau ketentuan lain  yang berhubungan dengan kurikulum', 1, '2026-09-10 14:54:16', '2026-09-10 14:54:16'),
('a29b2cef-bc81-4629-9801-9b73ee5297ed', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Pengalaman kerja mahasiswa', 'pengalaman dalam kegiatan di bidang tertentu pada  jangka waktu tertentu, berbentuk pelatihan kerja, kerja praktik, praktik kerja lapangan atau bentuk  kegiatan lain yang sejenis', 1, '2026-09-10 14:51:58', '2026-09-10 14:51:58'),
('df427b6a-6099-442c-b1c1-54134aad068c', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Kerangka Kualifikasi Nasional Indonesia (KKNI)', ' merupakan kerangka penjenjangan kualifikasi  kompetensi yang dapat menyandingkan, menyetarakan, dan mengintegrasikan antara bidang  pendidikan dan bidang pelatihan kerja serta pengalaman kerja dalam rangka pemberian  pengakuan kompetensi kerja sesuai dengan struktur pekerjaan di berbagai sektor.', 1, '2026-09-10 14:48:36', '2026-09-10 14:48:36'),
('e998206f-c8d5-493c-bfda-0f804e349ed4', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Program Educational Objectives (PEO)', 'merupakan pernyataan yang secara luas  menggambarkan pencapaian karir dan professional serta pencapaian sikap sosial yang disiapkan  oleh Prodi untuk dicapai oleh lulusannya dalam beberapa tahun setelah lulus', 1, '2026-09-10 14:49:19', '2026-09-10 14:49:19'),
('efff56e0-a62f-41c8-be2f-31416b482048', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Kualifikasi', ' penguasaan capaian pembelajaran yang menyatakan kedudukannya dalam  KKNI', 1, '2026-09-10 14:53:12', '2026-09-10 14:53:12'),
('f3b031f2-187c-4c8b-ac97-e7fa91ef34e4', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Kompetensi lulusan', 'merupakan kualifikasi kemampuan lulusan yang mencakup sikap,  pengetahuan, dan keterampilan yang dinyatakan dalam rumusan capaian pembelajaran lulusan.', 1, '2026-09-10 14:48:20', '2026-09-10 14:48:20'),
('f961748f-503f-4e5f-8510-490cbc24bc94', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Pengetahuan', 'penguasaan konsep, teori, metode, dan/atau falsafah bidang ilmu  tertentu secara sistematis yang diperoleh melalui penalaran dalam proses Pembelajaran,  pengalaman kerja mahasiswa, Penelitian dan/atau Pengabdian kepada Masyarakat yang terkait  Pembelajaran', 1, '2026-09-10 14:50:13', '2026-09-10 14:50:13'),
('fa4af0f3-4143-4d14-9363-952651ac648d', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Kurikulum', 'seperangkat rencana dan pengaturan mengenai capaian pembelajaran  lulusan, bahan kajian, proses, dan penilaian yang digunakan sebagai pedoman penyelenggaraan  prodi', 1, '2026-09-10 14:53:28', '2026-09-10 14:53:28'),
('fb74f985-4cec-4dcb-bf97-fbeaee342863', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Penyetaraan', 'proses penyandingan dan pengintegrasian capaian pembelajaran yang  diperoleh melalui pendidikan, pelatihan kerja, dan pengalaman kerja', 1, '2026-09-10 14:52:55', '2026-09-10 14:52:55');

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

DROP TABLE IF EXISTS `jabatan`;
CREATE TABLE IF NOT EXISTS `jabatan` (
  `id_jabatan` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_jabatan` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_jabatan`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`id_jabatan`, `nama_jabatan`, `status`, `id_pt`, `created_at`, `updated_at`) VALUES
('125058a0-28f1-4bd9-a6e3-e3f1181e242f', 'Kepala Pusat Penelitian dan Pengabdian Kepada Masyarakat', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:40', '2026-08-19 08:23:40'),
('237ac773-d582-4d50-8227-f66e5e02197b', 'Ketua Program Studi S1 PendidikanTeknologi Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:14', '2026-08-19 08:22:14'),
('25728f31-c50c-4e3c-afb4-4a89fe842ab3', 'Staf Ahli Akademik dan Penjaminan Mutu', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:24', '2026-08-19 08:22:24'),
('27d603be-8290-44ba-801c-1df0294992ee', 'Ketua Program Studi S1 Teknik Komputer', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:39', '2026-08-19 08:21:39'),
('36842eaf-203d-44b4-bd4a-ac3c5932fd7f', 'Ketua Program Studi S1 Manajemen', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:00', '2026-08-19 08:22:00'),
('37650e7b-2208-47d8-bdd9-6ea89b89ce9c', 'Wakil Rektor Bidang Riset, Kewirausahaan,dan Kerja Sama', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:20:47', '2026-08-19 08:20:47'),
('3bf2bc97-5321-477f-8d14-061b3d19f9ff', 'Sekretaris Program Studi S1 Sistem Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:30', '2026-08-19 08:24:30'),
('4356258c-1938-42f6-a5e8-8182e87547cc', 'Kepala Sie Pengadaan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:26:34', '2026-08-19 08:26:34'),
('439dc825-2865-4d1b-9d3a-ade4e503a600', 'Dekan Fakultas Desain dan Industri Kreatif', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:22', '2026-08-19 08:21:22'),
('44d03e0d-0388-418f-9a08-6fe87293b56d', 'Koordinator Laboratorium Desain dan Industri Kreatif', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:25:10', '2026-08-19 08:25:10'),
('46ea0050-0770-4649-8a02-b79a9791ee72', 'Kepala Sie. Inovasi dan Hilirisasi Riset Pusat Penelitian dan Pengabdian kepada Masyarakat', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:25:29', '2026-08-19 08:26:13'),
('4ba323af-20a7-4791-bae4-c3521aae6a87', 'Kepala Sie Pengembangan Sistem Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:43', '2026-08-19 08:24:43'),
('557c35b3-8e1a-4d61-a140-5f48bf3b6f3b', 'Kepala Pusat Layanan Karier dan Alumni', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:24', '2026-08-19 08:24:24'),
('59c87efe-8bc6-4c27-97f7-cb52aa0a6fce', 'Wakil Rektor Bidang Akademik,Kemahasiswaan, dan Alumni', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:20:38', '2026-08-19 08:20:38'),
('5e545fef-abd0-49da-bfdf-bbd15f2f15d7', 'Kepala Bagian Perpustakaan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:50', '2026-08-19 08:23:50'),
('6939c47e-9e40-41fa-805b-798a57145644', 'Kepala Sie Solusi Sistem Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:52', '2026-08-19 08:24:52'),
('70da39cb-5cc4-4d85-81a5-adf5e9907e8d', 'Kepala Bagian Keuangan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:07', '2026-08-19 08:24:07'),
('727903c2-a023-4f3e-aa38-c65dd3418ca0', 'Kepala Sie Marketing', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:26:20', '2026-08-19 08:26:20'),
('72d19b23-1e66-49ce-a0fe-1eb92a6a5f0e', 'Prodi melakukan sosialisasi Standar Kompetensi Lulusan kepada semua pihak yang bertanggung  jawab untuk memenuhi isi standar.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-09-08 10:13:31', '2026-09-08 10:13:31'),
('72e46883-1712-4a8d-8325-b0d6c7e7907f', 'Dekan Fakultas Teknologi dan Informatika', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:20:52', '2026-08-19 08:20:52'),
('7bbf2e02-2db5-45af-8629-b54f99705142', 'Kepala Bagian Administrasi Umum', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:58', '2026-08-19 08:23:58'),
('7bcf72f7-6e98-44f1-9f3a-9cc35af12483', 'Kepala Pusat Pengembangan Pendidikan & Aktivitas Instruksional', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:37', '2026-08-19 08:22:45'),
('826c89ea-78aa-4626-bd63-f94bc6aec8c0', 'Kepala Pusat Pengembangan Bisnis', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:20', '2026-08-19 08:23:20'),
('8911f4c6-cf5c-48cb-ba9c-b93eda218c59', 'Dekan Fakultas Ekonomi dan Bisnis', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:30', '2026-08-19 08:21:30'),
('8ead70cd-f0ee-4ab1-88d1-768358eda162', 'Ketua Program Studi S1 Desain KomunikasiVisual', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:52', '2026-08-19 08:21:52'),
('921c4c5d-17f3-4581-af57-d980f85a307c', 'Kepala Pusat Kerjasama', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:29', '2026-08-19 08:23:29'),
('93d7e835-c0c8-4958-8ded-b9874a5aa3cd', 'Kepala Bagian Kemahasiswaan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:18', '2026-08-19 08:24:18'),
('a43a2105-c48f-4dc7-9c14-432e30fbe90c', 'Kepala Sie Rumah Tangga', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:26:30', '2026-08-19 08:26:30'),
('ab8eab3a-8e99-494e-b4ae-c6d71c346dd5', 'Kepala Bagian Public Relation dan Marketing', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:14', '2026-08-19 08:24:14'),
('ac50ccab-b0df-486f-b231-e831aaba9775', 'Kepala Sie Jaringan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:47', '2026-08-19 08:24:47'),
('b1c550bd-aa3d-4c16-b538-999373bc860a', 'Sekretaris Program Studi S1 Desain Komunikasi Visual', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:37', '2026-08-19 08:24:37'),
('b9707468-653e-4ba1-ae77-6351ebbb1f2c', 'Ketua Senat Universitas', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:20:31', '2026-08-19 08:20:31'),
('c306a926-2272-4f71-b79d-824f4b8e68e6', 'Kepala Bagian Pengembangan danPenerapan Teknologi Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:45', '2026-08-19 08:23:45'),
('c48b043c-8a99-44ee-90ed-26bfee8a6cc1', 'Kepala Bagian Kepegawaian', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:24:03', '2026-08-19 08:24:03'),
('ca663957-76d8-400c-9e70-9bcc70c8b67e', 'Kepala Bagian Administrasi Akademik danKemahasiswaan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:23:54', '2026-08-19 08:23:54'),
('ce133dc2-bb17-4472-b4ae-1a4d02629513', 'Kepala Sie Keamanan', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:26:39', '2026-08-19 08:26:39'),
('d4f0718a-8172-439f-b9b5-ef05e4d005e9', 'Wakil Rektor Bidang Sumber Daya (HRD, Finance, AU, PRM)', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:20:42', '2026-08-19 08:20:42'),
('dc088062-f6a2-4c7a-beaa-e7e8ecafce83', 'Ketua Program Studi S1 Sistem Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:34', '2026-08-19 08:21:34'),
('dde197f7-e602-46f0-9949-a2e153750a5d', 'Kepala Sie Public Relation', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:26:25', '2026-08-19 08:26:25'),
('e56d6870-997a-4b2f-b691-8ac3bc4369d6', 'Ketua Program Studi S1 Pendidikan Teknologi Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:43', '2026-08-19 08:21:43'),
('e6395992-d33c-4c99-89c5-5f424c5c7f28', 'Ketua Program Studi DIII Sistem Informasi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:47', '2026-08-19 08:21:47'),
('f03875c3-9987-424d-b5fd-8ba2cd73cee1', 'Koordinator Laboratorium Teknologi dan Informatika', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:25:00', '2026-08-19 08:25:00'),
('f17c409c-6998-4548-96a9-94c479549269', 'Ketua Program Studi S1 Akuntansi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:05', '2026-08-19 08:22:05'),
('f6fcafab-92ba-4476-93f9-58b12406a3f8', 'Kepala Pusat Pengawasan dan Penjaminan Mutu', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:31', '2026-08-19 08:22:31'),
('f7abf6a3-6c0a-4a4b-84bc-e39f13903bba', 'Ketua Program Studi DIV Produksi Film danTelevisi', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:21:56', '2026-08-19 08:21:56'),
('f94b9c49-c296-4ed8-8f3c-d00c003b3904', 'Ketua Program Studi S2 Bisnis digital', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:09', '2026-08-19 08:22:09'),
('ffd94077-fd46-4119-ba09-1dd8455174ff', 'Ketua Program Studi S2 Bisnis Digital', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-19 08:22:19', '2026-08-19 08:22:19');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE IF NOT EXISTS `karyawan` (
  `id_kar` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nik` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kar` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `ttd` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_kar`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_kar`, `nik`, `nama_kar`, `ttd`, `status`, `id_pt`, `created_at`, `updated_at`) VALUES
('5d51d51b-7dcb-4b80-9a75-cf4bcc006534', '170868', 'Rampa Praditya', '1790048935_e98b870d658cd6a73b27.png', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-09-22 10:11:53', '2026-09-22 10:48:55');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_std`
--

DROP TABLE IF EXISTS `kategori_std`;
CREATE TABLE IF NOT EXISTS `kategori_std` (
  `id_kat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_kat_std` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_permen` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_bidang_spm` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_kat_std`),
  KEY `id_permen` (`id_permen`),
  KEY `id_bidang_spm` (`id_bidang_spm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori_std`
--

INSERT INTO `kategori_std` (`id_kat_std`, `nama_kat_std`, `status`, `id_permen`, `id_bidang_spm`, `created_at`, `updated_at`) VALUES
('026aa42e-6241-47c5-8f2e-d111474d488b', 'SN Dikti Non akademik', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', '94031d97-a371-4741-b956-e8aedf8df804', '2026-08-27 11:18:41', '2026-09-17 09:58:18'),
('3e3f5c3d-fbb2-4eae-a1b8-d14633ad6c8f', 'Standart Ketenagaan', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', 'd4857390-6ea1-43e6-aed1-8d467157af6c', '2026-09-08 10:07:03', '2026-09-08 10:07:03'),
('6f2a9aa1-5220-4ad9-964f-0e84e086ccc0', 'Standart Pengelolaan Keuangan', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', 'd4857390-6ea1-43e6-aed1-8d467157af6c', '2026-09-08 10:07:29', '2026-09-08 10:07:29'),
('7baf8b22-f40f-43a8-b110-3345b17c147a', 'Standart Sarpras Non Akademik', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', 'd4857390-6ea1-43e6-aed1-8d467157af6c', '2026-09-08 10:07:45', '2026-09-08 10:07:45'),
('90a3f996-43ae-4926-a943-72f59320cef6', 'Standart Kemahasiswaan', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', 'd4857390-6ea1-43e6-aed1-8d467157af6c', '2026-09-08 09:43:50', '2026-09-08 09:43:50'),
('c27dd27b-81dd-409c-aa04-ee084ee3b29c', 'Standart Organisasi', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', 'd4857390-6ea1-43e6-aed1-8d467157af6c', '2026-09-08 10:07:14', '2026-09-08 10:07:14'),
('f7e831e4-9f97-11f1-9a1d-1c1b0d7f4f78', 'SN Dikti Akademik', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', '94031d97-a371-4741-b956-e8aedf8df804', '2026-08-24 08:43:54', '2026-09-17 09:58:10'),
('fdde8943-9f97-11f1-9a1d-1c1b0d7f4f78', 'Standar Perguruan Tinggi', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', '94031d97-a371-4741-b956-e8aedf8df804', '2026-08-24 08:44:09', '2026-09-17 09:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `misi`
--

DROP TABLE IF EXISTS `misi`;
CREATE TABLE IF NOT EXISTS `misi` (
  `id_misi` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_misi` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_misi`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `misi`
--

INSERT INTO `misi` (`id_misi`, `nama_misi`, `status`, `id_pt`, `created_at`, `updated_at`) VALUES
('204f7b67-7fb3-4278-a5a7-2df43ab95b20', 'Melaksanakan penelitian yang berfokus pada pengembangan inovasi untuk mewujudkan entrepreneurial university.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:52:38', '2026-08-18 15:52:38'),
('341cff1f-23c6-4c0f-b89e-cf089091f7a4', 'Melakukan pengabdian untuk menyebarluaskan ipteks dan hasil inovasi bagi kesejahteraan masyarakat.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:52:42', '2026-08-18 15:52:42'),
('94ec3a4e-893e-4fe3-98a9-38afd1a3f585', 'Mengembangkan bisnis dan kewirausahaan secara otonom yang akuntabel dan transparan.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:52:53', '2026-08-18 15:52:53'),
('aefe66f6-23d9-41b8-b1df-45fdd50b869f', 'Menyelenggarakan dan mengembangkan pendidikan berbasis teknologi informasi yang bermutu dan berdaya saing global.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:52:27', '2026-08-18 15:52:27'),
('dd76c890-58af-4e5b-a0a0-88a34e233929', 'Melaksanakan kemitraan berskala global.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:52:48', '2026-08-18 15:52:48');

-- --------------------------------------------------------

--
-- Table structure for table `permen`
--

DROP TABLE IF EXISTS `permen`;
CREATE TABLE IF NOT EXISTS `permen` (
  `id_permen` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_permen` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tentang_permen` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tgl_penetapan` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_permen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `permen`
--

INSERT INTO `permen` (`id_permen`, `nama_permen`, `tentang_permen`, `tgl_penetapan`, `status`, `created_at`, `updated_at`) VALUES
('24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', 'PERATURAN MENTERI PENDIDIKAN TINGGI, SAINS, DAN TEKNOLOGI REPUBLIK INDONESIA NOMOR 39 TAHUN 2025', 'PENJAMINAN MUTU PENDIDIKAN TINGGI', '2025-08-28', 1, '2026-08-19 09:21:56', '2026-08-19 09:25:38');

-- --------------------------------------------------------

--
-- Table structure for table `proses`
--

DROP TABLE IF EXISTS `proses`;
CREATE TABLE IF NOT EXISTS `proses` (
  `id_proses` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_proses` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_proses`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pt`
--

DROP TABLE IF EXISTS `pt`;
CREATE TABLE IF NOT EXISTS `pt` (
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kode_pt` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_pt` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `alamat_pt` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telepon_pt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo_pt` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pt`
--

INSERT INTO `pt` (`id_pt`, `kode_pt`, `nama_pt`, `alamat_pt`, `telepon_pt`, `logo_pt`, `status`, `created_at`, `updated_at`) VALUES
('3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '071099', 'Universitas Dinamika', 'Jalan Raya Kedung Baruk 98 Surabaya', '0318721731', '1787027244_3f3762287cd5e2f04a0a.png', 1, '2026-08-18 11:15:22', '2026-08-18 11:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `referensi`
--

DROP TABLE IF EXISTS `referensi`;
CREATE TABLE IF NOT EXISTS `referensi` (
  `id_referensi` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_referensi` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_referensi`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `referensi`
--

INSERT INTO `referensi` (`id_referensi`, `id_pt`, `nama_referensi`, `status`, `created_at`, `updated_at`) VALUES
('57ed079e-53d2-49ff-addc-0618f16832c9', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Peraturan Menteri Pendidikan, Kebudayaan, Riset, dan Teknologi Republik Indonesia Nomor 53  Tahun 2023 Tentang Penjaminan Mutu Pendidikan Tinggi.', 1, '2026-09-08 11:14:17', '2026-09-08 11:14:17'),
('8db57deb-b254-4f6b-8bdb-493d4e0699ae', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Kebijakan Sistem Penjaminan Mutu Internal Universitas Dinamika', 1, '2026-09-08 11:14:54', '2026-09-08 11:45:50'),
('99a0001c-e8d0-4c18-9fc5-924d9730d4c2', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Statuta Universitas Dinamika', 1, '2026-09-08 11:14:35', '2026-09-08 11:14:35'),
('a9e3508e-6d4f-45d0-a3ee-aa6c18680af1', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Peraturan Menteri Nomor 73 tahun 2013 tentang penerapan Kerangka Kualifikasi Nasional  Indonesia (KKNI).', 1, '2026-09-08 11:14:09', '2026-09-08 11:14:09'),
('c435fdcb-2c59-4a21-b6dc-d030c1d4db0a', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Rencana Strategis Universitas Dinamika', 1, '2026-09-08 11:14:43', '2026-09-08 11:14:43'),
('d50e7a04-a113-4230-9c01-a6cd791b9c42', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Manual Sistem Penjaminan Mutu Internal Universitas Dinamika', 1, '2026-09-08 11:15:03', '2026-09-08 11:15:03'),
('e5adc1bf-7aae-43a4-be87-7a7d4eff9e7b', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Peraturan Presiden RI No. 8 Tahun 2012 tentang Kerangka Kualifikasi Nasional Indonesia (KKNI).', 1, '2026-09-08 11:13:59', '2026-09-08 11:13:59'),
('fe056bfa-c03a-4048-be70-16fec5228ad6', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Undang-Undang RI No. 12 Tahun 2012 tentang Pendidikan Tinggi', 1, '2026-09-08 11:13:51', '2026-09-10 14:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `standart`
--

DROP TABLE IF EXISTS `standart`;
CREATE TABLE IF NOT EXISTS `standart` (
  `id_standar` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `kode_standar` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_standar` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `rasional` text COLLATE utf8mb4_general_ci,
  `status` tinyint(1) NOT NULL,
  `id_permen` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_bidang_spm` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_sub2kat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_subkat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_kat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_standar`),
  KEY `id_sub2kat_std` (`id_sub2kat_std`,`id_subkat_std`,`id_kat_std`),
  KEY `id_kat_std` (`id_kat_std`),
  KEY `id_subkat_std` (`id_subkat_std`),
  KEY `id_permen` (`id_permen`),
  KEY `id_bidang_spm` (`id_bidang_spm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `standart`
--

INSERT INTO `standart` (`id_standar`, `kode_standar`, `nama_standar`, `rasional`, `status`, `id_permen`, `id_bidang_spm`, `id_sub2kat_std`, `id_subkat_std`, `id_kat_std`, `created_at`, `updated_at`) VALUES
('2fc0eea4-121a-435b-8ed8-6fd395998413', '111', 'STANDAR KOMPETENSI LULUSAN', 'Berdasarkan Peraturan Menteri Pendidikan dan Kebudayaan Republik Indonesia Nomor 53 Tahun 2023 tentang Standar Nasional Pendidikan Tinggi (SN Dikti) Bagian Kedua Paragraf 2 Pasal 6 ayat 1, menyatakan bahwa Standar Kompetensi Lulusan merupakan kriteria minimal mengenai kesatuan kompetensi sikap, keterampilan, dan pengetahuan yang menunjukkan capaian mahasiswa dari hasil pembelajarannya pada akhir program pendidikan tinggi. Pasal 5 ayat 2, menyatakan bahwa Standar Kompetensi Lulusan yang dirumuskan digunakan untuk menyiapkan mahasiswa menjadi anggota masyarakat yang beriman, bertakwa, berakhlak mulia, berkarakter sesuai dengan nilai-nilai Pancasila, mampu dan mandiri untuk menerapkan, mengembangkan, menemukan ilmu pengetahuan dan teknologi yang bermanfaat bagi masyarakat, serta secara aktif mengembangkan potensinya. Standar kompetensi lulusan dirumuskan dalam bentuk capaian pembelajaran lulusan. \n\nOleh karena itu, sesuai dengan Peraturan Menteri Pendidikan dan Kebudayaan Riset dan Teknologi Republik Indonesia Nomor 53 Tahun 2023, Pasal 6, ayat 3, maka Universitas Dinamika wajib menyusun, menetapkan, dan mengembangkan Standar Kompetensi Lulusan, yang dinyatakan dalam bentuk Capaian Pembelajaran Lulusan, akan digunakan oleh setiap Program Studi (Prodi) sebagai acuan untuk menyusun isi pembelajaran. Selain itu, pengembangan Standar Kompetensi Lulusan untuk setiap Prodi juga merujuk pada Peraturan Presiden No. 8 tahun 2012 tentang Kerangka Kualifikasi Nasional Indonesia (KKNI) dan disesuaikan dengan masing-masing Lembaga Akreditasi Mandiri (LAM) yang diikuti oleh masing-masing prodi.', 1, '24c8aa0f-8f0b-4737-88dd-41d48ea7b1d1', '94031d97-a371-4741-b956-e8aedf8df804', '298a734f-a0f3-11f1-a5b0-1c1b0d7f4f78', 'd1bcc73c-9f9a-11f1-9a1d-1c1b0d7f4f78', 'f7e831e4-9f97-11f1-9a1d-1c1b0d7f4f78', '2026-09-17 08:48:06', '2026-09-24 16:17:41');

-- --------------------------------------------------------

--
-- Table structure for table `standart_header`
--

DROP TABLE IF EXISTS `standart_header`;
CREATE TABLE IF NOT EXISTS `standart_header` (
  `idlog_standart` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_standar` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `no` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `edisi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `revisi` varchar(2) COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`idlog_standart`),
  KEY `id_standar` (`id_standar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `strategi`
--

DROP TABLE IF EXISTS `strategi`;
CREATE TABLE IF NOT EXISTS `strategi` (
  `id_strategi` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_pt` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_strategi` varchar(250) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_strategi`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `strategi`
--

INSERT INTO `strategi` (`id_strategi`, `id_pt`, `nama_strategi`, `status`, `created_at`, `updated_at`) VALUES
('1158d9b4-f38b-4335-830d-61dde547c0d1', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'P3M memantau pelaksanaan Standar Kompetensi Lulusan.', 1, '2026-09-08 10:16:48', '2026-09-08 10:16:48'),
('3a05b036-b67a-4aa0-a126-6663ae4069bf', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'Prodi melakukan sosialisasi Standar Kompetensi Lulusan kepada semua pihak yang bertanggung  jawab untuk memenuhi isi standar.', 1, '2026-09-08 10:16:37', '2026-09-08 10:16:37'),
('c651afee-6cb2-4cee-a1ca-b2d3a8fc45e3', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', ' P3M bersama dengan prodi melakukan pengendalian pelaksanaan Standar Kompetensi Lulusan  berdasarkan hasil evaluasi.', 1, '2026-09-08 10:17:08', '2026-09-08 10:17:08'),
('cf9bfcc7-46c9-4b82-808f-5d17ca5c6511', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'P3M bersama dengan prodi melakukan peningkatan Standar Kompetensi Lulusan berdasarkan  hasil evaluasi.', 1, '2026-09-08 10:17:17', '2026-09-08 10:17:17'),
('d433aedb-897c-4ca5-92a9-8985413a0f96', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 'P3M melakukan evaluasi (Audit Mutu Internal = AMI) pelaksanaan Standar Kompetensi Lulusan.', 1, '2026-09-08 10:16:59', '2026-09-08 10:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `sub2kategori_std`
--

DROP TABLE IF EXISTS `sub2kategori_std`;
CREATE TABLE IF NOT EXISTS `sub2kategori_std` (
  `id_sub2kat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_sub2kat_std` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_subkat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_sub2kat_std`),
  KEY `id_subkat_std` (`id_subkat_std`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sub2kategori_std`
--

INSERT INTO `sub2kategori_std` (`id_sub2kat_std`, `nama_sub2kat_std`, `status`, `id_subkat_std`, `created_at`, `updated_at`) VALUES
('298a734f-a0f3-11f1-a5b0-1c1b0d7f4f78', 'Standar luaran', 1, 'd1bcc73c-9f9a-11f1-9a1d-1c1b0d7f4f78', '2026-08-26 02:08:54', '2026-08-28 11:35:27'),
('298a93e7-a0f3-11f1-a5b0-1c1b0d7f4f78', 'Standar proses', 1, 'd1bcc73c-9f9a-11f1-9a1d-1c1b0d7f4f78', '2026-08-26 02:08:54', '2026-08-26 02:08:54'),
('bd934113-4617-41bd-a410-f49605fb8e99', 'b', 1, 'd75e5e4a-3cb1-43c1-9bc5-3ec30e8730ef', '2026-09-17 09:39:31', '2026-09-17 09:39:31'),
('cb6ce9f8-6241-4296-a578-3fcb9eebfce0', 'c', 1, 'd75e5e4a-3cb1-43c1-9bc5-3ec30e8730ef', '2026-09-17 09:39:36', '2026-09-17 09:39:36'),
('d5fd8cc9-4f3e-4017-abbf-ea595f77e2c7', 'Standar dampak', 1, 'd1bcc73c-9f9a-11f1-9a1d-1c1b0d7f4f78', '2026-08-28 11:36:05', '2026-08-28 11:36:14'),
('f7b12515-07ec-4124-ac94-5cf6edfc1a6c', 'Standar masukan', 1, 'd1bcc73c-9f9a-11f1-9a1d-1c1b0d7f4f78', '2026-08-28 11:35:57', '2026-08-28 11:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `subkategori_std`
--

DROP TABLE IF EXISTS `subkategori_std`;
CREATE TABLE IF NOT EXISTS `subkategori_std` (
  `id_subkat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `nama_subkat_std` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_kat_std` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `id_bidang_spm` varchar(36) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_subkat_std`),
  KEY `id_kat_std` (`id_kat_std`,`id_bidang_spm`),
  KEY `id_bidang_spm` (`id_bidang_spm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subkategori_std`
--

INSERT INTO `subkategori_std` (`id_subkat_std`, `nama_subkat_std`, `status`, `id_kat_std`, `id_bidang_spm`, `created_at`, `updated_at`) VALUES
('8bf03e67-a126-11f1-a5b0-1c1b0d7f4f78', 'Standar Pengabdian kepada Masyarakat', 1, 'f7e831e4-9f97-11f1-9a1d-1c1b0d7f4f78', '94031d97-a371-4741-b956-e8aedf8df804', '2026-08-26 08:17:03', '2026-08-26 08:17:03'),
('d1bcc73c-9f9a-11f1-9a1d-1c1b0d7f4f78', 'Standar Nasional Pendidikan', 1, 'f7e831e4-9f97-11f1-9a1d-1c1b0d7f4f78', '94031d97-a371-4741-b956-e8aedf8df804', '2026-08-24 09:04:11', '2026-08-24 09:04:11'),
('d75e5e4a-3cb1-43c1-9bc5-3ec30e8730ef', 'a', 1, '7baf8b22-f40f-43a8-b110-3345b17c147a', 'd4857390-6ea1-43e6-aed1-8d467157af6c', '2026-09-17 09:39:27', '2026-09-17 09:39:27'),
('e4bf4ebc-9f9a-11f1-9a1d-1c1b0d7f4f78', 'Standar Penelitian', 1, 'f7e831e4-9f97-11f1-9a1d-1c1b0d7f4f78', '94031d97-a371-4741-b956-e8aedf8df804', '2026-08-24 09:04:38', '2026-08-24 09:04:38');

-- --------------------------------------------------------

--
-- Table structure for table `tujuan`
--

DROP TABLE IF EXISTS `tujuan`;
CREATE TABLE IF NOT EXISTS `tujuan` (
  `id_tujuan` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_tujuan` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_tujuan`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tujuan`
--

INSERT INTO `tujuan` (`id_tujuan`, `nama_tujuan`, `status`, `id_pt`, `created_at`, `updated_at`) VALUES
('4f704f30-92df-4169-80b2-073cf823ad17', 'Menyelenggarakan pendidikan yang berkualitas, inovatif, dan futuristik.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:27:25', '2026-08-18 16:27:25'),
('753f4247-3b09-4499-87ac-61721b180e1a', 'Menghasilkan inovasi yang bernilai jual dan bermanfaat bagi masyarakat.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:28:09', '2026-08-18 16:28:09'),
('7581ec50-f64c-412b-af84-f3418386d0a5', 'Mewujudkan kemitraan berskala global.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:28:20', '2026-08-18 16:28:20'),
('cd1e1980-3c4f-44d5-bee6-dfbd9057a9e0', 'Menjamin keberlanjutan Perguruan Tinggi.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:28:24', '2026-08-18 16:28:24'),
('d65a0c32-1366-42b0-9032-37ab6b9488c3', 'Menciptakan SDM berdaya saing global dan berjiwa entrepreneur.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:27:59', '2026-08-18 16:27:59'),
('f0bd9d28-e059-472d-ad66-c9d18c16b136', 'Melaksanakan diseminasi ipteks dan/atau hasil inovasi untuk meningkatkan kesejahteraan masyarakat.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:28:13', '2026-08-18 16:28:13'),
('f9b34c83-5231-4d9a-8746-3d02a41a0d89', 'Menghasilkan penelitian berkualitas dan berskala global.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 16:28:04', '2026-08-18 16:28:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `idusers` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `foto` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `idakses` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `suspend` float NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`idusers`),
  KEY `idakses` (`idakses`),
  KEY `idpt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`idusers`, `username`, `pass`, `nama`, `email`, `foto`, `idakses`, `id_pt`, `suspend`, `created_at`, `updated_at`) VALUES
('e87bfc07-bb7a-475d-ae75-3ede5f40c43f', 'admin', 'aGtq', 'ADMIN SPMI', 'rampapraditya@gmail.com', '1788246398_08335c68b4a2e01788bb.png', '55345bf0-7105-4a1f-b270-69cab578b95e', '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', 0, '2026-08-18 11:37:15', '2026-08-18 11:37:15');

-- --------------------------------------------------------

--
-- Table structure for table `visi`
--

DROP TABLE IF EXISTS `visi`;
CREATE TABLE IF NOT EXISTS `visi` (
  `id_visi` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama_visi` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `id_pt` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id_visi`),
  KEY `id_pt` (`id_pt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visi`
--

INSERT INTO `visi` (`id_visi`, `nama_visi`, `status`, `id_pt`, `created_at`, `updated_at`) VALUES
('1e8fe909-e46c-43cd-8223-2b2d322bfc22', 'Melaksanakan penelitian yang berfokus pada pengembangan inovasi untuk mewujudkan entrepreneurial university.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:39:14', '2026-08-18 15:39:14'),
('6710cd91-d133-47c9-b910-4eefd26712e4', 'Melakukan pengabdian untuk menyebarluaskan ipteks dan hasil inovasi bagi kesejahteraan masyarakat.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:39:20', '2026-08-18 15:39:20'),
('a6e0e2d6-0a53-4787-bc8e-10750d0ba725', 'Melaksanakan kemitraan berskala global.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:39:24', '2026-08-18 15:39:24'),
('bcfa7ae6-b001-41d6-9e49-dd5c32746e12', 'Menyelenggarakan dan mengembangkan pendidikan berbasis teknologi informasi yang bermutu dan berdaya saing global.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:38:35', '2026-08-18 15:46:05'),
('c6686dcc-7c78-426d-ba70-3c0e4bb9c73e', 'Mengembangkan bisnis dan kewirausahaan secara otonom yang akuntabel dan transparan.', 1, '3e754e4f-0d4e-4bb7-aa1e-b430cb56040b', '2026-08-18 15:39:32', '2026-08-18 15:39:32');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bidang_spm`
--
ALTER TABLE `bidang_spm`
  ADD CONSTRAINT `bidang_spm_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `dokumen_terkait`
--
ALTER TABLE `dokumen_terkait`
  ADD CONSTRAINT `dokumen_terkait_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `istilah`
--
ALTER TABLE `istilah`
  ADD CONSTRAINT `istilah_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD CONSTRAINT `jabatan_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `karyawan_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kategori_std`
--
ALTER TABLE `kategori_std`
  ADD CONSTRAINT `kategori_std_ibfk_1` FOREIGN KEY (`id_permen`) REFERENCES `permen` (`id_permen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kategori_std_ibfk_2` FOREIGN KEY (`id_bidang_spm`) REFERENCES `bidang_spm` (`id_bidang_spm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `misi`
--
ALTER TABLE `misi`
  ADD CONSTRAINT `misi_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `proses`
--
ALTER TABLE `proses`
  ADD CONSTRAINT `proses_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `referensi`
--
ALTER TABLE `referensi`
  ADD CONSTRAINT `referensi_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `standart`
--
ALTER TABLE `standart`
  ADD CONSTRAINT `standart_ibfk_1` FOREIGN KEY (`id_kat_std`) REFERENCES `kategori_std` (`id_kat_std`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `standart_ibfk_2` FOREIGN KEY (`id_subkat_std`) REFERENCES `subkategori_std` (`id_subkat_std`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `standart_ibfk_3` FOREIGN KEY (`id_sub2kat_std`) REFERENCES `sub2kategori_std` (`id_sub2kat_std`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `standart_ibfk_4` FOREIGN KEY (`id_permen`) REFERENCES `permen` (`id_permen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `standart_ibfk_5` FOREIGN KEY (`id_bidang_spm`) REFERENCES `bidang_spm` (`id_bidang_spm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `standart_header`
--
ALTER TABLE `standart_header`
  ADD CONSTRAINT `standart_header_ibfk_1` FOREIGN KEY (`id_standar`) REFERENCES `standart` (`id_standar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `strategi`
--
ALTER TABLE `strategi`
  ADD CONSTRAINT `strategi_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub2kategori_std`
--
ALTER TABLE `sub2kategori_std`
  ADD CONSTRAINT `sub2kategori_std_ibfk_1` FOREIGN KEY (`id_subkat_std`) REFERENCES `subkategori_std` (`id_subkat_std`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subkategori_std`
--
ALTER TABLE `subkategori_std`
  ADD CONSTRAINT `subkategori_std_ibfk_1` FOREIGN KEY (`id_kat_std`) REFERENCES `kategori_std` (`id_kat_std`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subkategori_std_ibfk_2` FOREIGN KEY (`id_bidang_spm`) REFERENCES `bidang_spm` (`id_bidang_spm`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tujuan`
--
ALTER TABLE `tujuan`
  ADD CONSTRAINT `tujuan_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`idakses`) REFERENCES `akses` (`idakses`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `visi`
--
ALTER TABLE `visi`
  ADD CONSTRAINT `visi_ibfk_1` FOREIGN KEY (`id_pt`) REFERENCES `pt` (`id_pt`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
