-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 25, 2015 at 06:34 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cdcol`
--

-- --------------------------------------------------------

--
-- Table structure for table `cds`
--

CREATE TABLE IF NOT EXISTS `cds` (
  `titel` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `interpret` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `jahr` int(11) DEFAULT NULL,
`id` bigint(20) unsigned NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `cds`
--

INSERT INTO `cds` (`titel`, `interpret`, `jahr`, `id`) VALUES
('Beauty', 'Ryuichi Sakamoto', 1990, 1),
('Goodbye Country (Hello Nightclub)', 'Groove Armada', 2001, 4),
('Glee', 'Bran Van 3000', 1997, 5);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cds`
--
ALTER TABLE `cds`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cds`
--
ALTER TABLE `cds`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;--
-- Database: `phpmyadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `pma_bookmark`
--

CREATE TABLE IF NOT EXISTS `pma_bookmark` (
`id` int(11) NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma_column_info`
--

CREATE TABLE IF NOT EXISTS `pma_column_info` (
`id` int(5) unsigned NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM AUTO_INCREMENT=115 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

--
-- Dumping data for table `pma_column_info`
--

INSERT INTO `pma_column_info` (`id`, `db_name`, `table_name`, `column_name`, `comment`, `mimetype`, `transformation`, `transformation_options`) VALUES
(1, 'zhengyuan', 'woshii', 'id', '', '', '_', ''),
(2, 'zhengyuan', 'woshii', 'name', '', '', '_', ''),
(3, 'zhengyuan', 'woshii', 'name_other', '', '', '_', ''),
(4, 'zhengyuan', 'woshii', 'dob', '', '', '_', ''),
(5, 'zhengyuan', 'woshii', 'dot', '', '', '_', ''),
(6, 'zhengyuan', 'woshii', 'image', '', 'image_png', 'image_png__inline.inc.php', ''),
(7, 'zhengyuan', 'woshii', 'note', '', '', '_', ''),
(8, 'zhengyuan', 'woshii', 'login', '', '', '_', ''),
(9, 'zhengyuan', 'woshii', 'updated', '', '', '_', ''),
(10, 'zhengyuan', 'woshii', 'created', '', '', '_', ''),
(11, 'zhengyuan', 'profile', 'id', '', '', '_', ''),
(12, 'zhengyuan', 'profile', 'woisi_id', '', '', '_', ''),
(13, 'zhengyuan', 'profile', 'statement', '', '', '_', ''),
(14, 'zhengyuan', 'profile', 'gender', '', '', '_', ''),
(15, 'zhengyuan', 'profile', 'occupation', '', '', '_', ''),
(16, 'zhengyuan', 'profile', 'ethnic_id', '', '', '_', ''),
(17, 'zhengyuan', 'profile', 'religion_id', '', '', '_', ''),
(18, 'zhengyuan', 'profile', 'education', '', '', '_', ''),
(19, 'zhengyuan', 'profile', 'created', '', '', '_', ''),
(20, 'zhengyuan', 'profile', 'updated', '', '', '_', ''),
(21, 'zhengyuan', 'woshii', 'created_by', '', '', '_', ''),
(22, 'zhengyuan', 'profile', 'created_by', '', '', '_', ''),
(23, 'zhengyuan', 'profile', 'updated_by', '', '', '_', ''),
(24, 'zhengyuan', 'parents', 'parent_id', '', '', '_', ''),
(25, 'zhengyuan', 'parents', 'woshii_id', '', '', '_', ''),
(26, 'zhengyuan', 'parents', 'relation_id', '', '', '_', ''),
(27, 'zhengyuan', 'parents', 'relation_name', '', '', '_', ''),
(28, 'zhengyuan', 'woshii', 'rest_date', '', '', '_', ''),
(29, 'zhengyuan', 'woshii', 'rest_time', '', '', '_', ''),
(30, 'zhengyuan', 'siblings', 'sib_id', '', '', '_', ''),
(31, 'zhengyuan', 'siblings', 'woshii_id', '', '', '_', ''),
(32, 'zhengyuan', 'siblings', 'sib_type', '', '', '_', ''),
(33, 'zhengyuan', 'siblings', 'created', '', '', '_', ''),
(34, 'zhengyuan', 'siblings', 'created_by', '', '', '_', ''),
(35, 'zhengyuan', 'siblings', 'updated', '', '', '_', ''),
(36, 'zhengyuan', 'siblings', 'updated_by', '', '', '_', ''),
(37, 'zhengyuan', 'children', 'child_id', '', '', '_', ''),
(38, 'zhengyuan', 'children', 'woshii_id', '', '', '_', ''),
(39, 'zhengyuan', 'children', 'child_type', '', '', '_', ''),
(40, 'zhengyuan', 'children', 'created', '', '', '_', ''),
(41, 'zhengyuan', 'children', 'created_by', '', '', '_', ''),
(42, 'zhengyuan', 'children', 'updated', '', '', '_', ''),
(43, 'zhengyuan', 'children', 'updated_by', '', '', '_', ''),
(44, 'zhengyuan', 'friends', 'friend_id', '', '', '_', ''),
(45, 'zhengyuan', 'friends', 'woshii_id', '', '', '_', ''),
(46, 'zhengyuan', 'friends', 'created', '', '', '_', ''),
(47, 'zhengyuan', 'friends', 'created_by', '', '', '_', ''),
(48, 'zhengyuan', 'friends', 'updated', '', '', '_', ''),
(49, 'zhengyuan', 'friends', 'updated_by', '', '', '_', ''),
(50, 'zhengyuan', 'colleagues', 'coll_id', '', '', '_', ''),
(51, 'zhengyuan', 'colleagues', 'woshii_id', '', '', '_', ''),
(52, 'zhengyuan', 'colleagues', 'created', '', '', '_', ''),
(53, 'zhengyuan', 'colleagues', 'created_by', '', '', '_', ''),
(54, 'zhengyuan', 'colleagues', 'updated', '', '', '_', ''),
(55, 'zhengyuan', 'colleagues', 'updated_by', '', '', '_', ''),
(56, 'zhengyuan', 'neighbors', 'nb_id', '', '', '_', ''),
(57, 'zhengyuan', 'neighbors', 'woshii_id', '', '', '_', ''),
(58, 'zhengyuan', 'neighbors', 'created', '', '', '_', ''),
(59, 'zhengyuan', 'neighbors', 'created_by', '', '', '_', ''),
(60, 'zhengyuan', 'neighbors', 'updated', '', '', '_', ''),
(61, 'zhengyuan', 'neighbors', 'updated_by', '', '', '_', ''),
(62, 'zhengyuan', 'classmates', 'cm_id', '', '', '_', ''),
(63, 'zhengyuan', 'classmates', 'woshii_id', '', '', '_', ''),
(64, 'zhengyuan', 'classmates', 'created', '', '', '_', ''),
(65, 'zhengyuan', 'classmates', 'updated', '', '', '_', ''),
(66, 'zhengyuan', 'classmates', 'created_by', '', '', '_', ''),
(67, 'zhengyuan', 'classmates', 'updated_by', '', '', '_', ''),
(68, 'zhengyuan', 'contacts', 'id', '', '', '_', ''),
(69, 'zhengyuan', 'contacts', 'woshii_id', '', '', '_', ''),
(70, 'zhengyuan', 'contacts', 'phone_prim', '', '', '_', ''),
(71, 'zhengyuan', 'contacts', 'phone_home', '', '', '_', ''),
(72, 'zhengyuan', 'contacts', 'phone_mb', '', '', '_', ''),
(73, 'zhengyuan', 'contacts', 'email', '', '', '_', ''),
(74, 'zhengyuan', 'contacts', 'qq', '', '', '_', ''),
(75, 'zhengyuan', 'contacts', 'wechat', '', '', '_', ''),
(76, 'zhengyuan', 'contacts', 'web', '', '', '_', ''),
(77, 'zhengyuan', 'contacts', 'created', '', '', '_', ''),
(78, 'zhengyuan', 'contacts', 'created_by', '', '', '_', ''),
(79, 'zhengyuan', 'contacts', 'updated', '', '', '_', ''),
(80, 'zhengyuan', 'contacts', 'updated_by', '', '', '_', ''),
(81, 'zhengyuan', 'addresses', 'id', '', '', '_', ''),
(82, 'zhengyuan', 'addresses', 'woshii_id', '', '', '_', ''),
(83, 'zhengyuan', 'addresses', 'address1', '', '', '_', ''),
(84, 'zhengyuan', 'addresses', 'address2', '', '', '_', ''),
(85, 'zhengyuan', 'addresses', 'address3', '', '', '_', ''),
(86, 'zhengyuan', 'addresses', 'city', '', '', '_', ''),
(87, 'zhengyuan', 'addresses', 'state_province', '', '', '_', ''),
(88, 'zhengyuan', 'addresses', 'country_code', '', '', '_', ''),
(89, 'zhengyuan', 'addresses', 'country_name', '', '', '_', ''),
(90, 'zhengyuan', 'addresses', 'post_code_zip', '', '', '_', ''),
(91, 'zhengyuan', 'addresses', 'GIS', '', '', '_', ''),
(92, 'zhengyuan', 'addresses', 'created', '', '', '_', ''),
(93, 'zhengyuan', 'addresses', 'created_by', '', '', '_', ''),
(94, 'zhengyuan', 'addresses', 'updated', '', '', '_', ''),
(95, 'zhengyuan', 'addresses', 'updated_by', '', '', '_', ''),
(96, 'zhengyuan', 'auth', 'id', '', '', '_', ''),
(97, 'zhengyuan', 'auth', 'woshii_id', '', '', '_', ''),
(98, 'zhengyuan', 'auth', 'auth_id', '', '', '_', ''),
(99, 'zhengyuan', 'auth', 'auth_type', '', '', '_', ''),
(100, 'zhengyuan', 'images', 'img_id', '', '', '_', ''),
(101, 'zhengyuan', 'images', 'woshii_id', '', '', '_', ''),
(102, 'zhengyuan', 'images', 'img_mime', '', '', '_', ''),
(103, 'zhengyuan', 'images', 'img_name', '', '', '_', ''),
(104, 'zhengyuan', 'images', 'img_path', '', '', '_', ''),
(105, 'zhengyuan', 'images', 'img_bin', '', '', '_', ''),
(106, 'zhengyuan', 'images', 'created', '', '', '_', ''),
(107, 'zhengyuan', 'images', 'created_by', '', '', '_', ''),
(108, 'zhengyuan', 'images', 'updated', '', '', '_', ''),
(109, 'zhengyuan', 'images', 'updated_by', '', '', '_', ''),
(110, 'zhengyuan', 'life_trajectory', 'id', '', '', '_', ''),
(111, 'zhengyuan', 'life_trajectory', 'woshii_id', '', '', '_', ''),
(112, 'zhengyuan', 'life_trajectory', 'value', '', '', '_', ''),
(113, 'zhengyuan', 'life_trajectory', 'created', '', '', '_', ''),
(114, 'zhengyuan', 'life_trajectory', 'created_by', '', '', '_', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma_designer_coords`
--

CREATE TABLE IF NOT EXISTS `pma_designer_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `v` tinyint(4) DEFAULT NULL,
  `h` tinyint(4) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma_history`
--

CREATE TABLE IF NOT EXISTS `pma_history` (
`id` bigint(20) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_navigationhiding`
--

CREATE TABLE IF NOT EXISTS `pma_navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma_pdf_pages`
--

CREATE TABLE IF NOT EXISTS `pma_pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
`page_nr` int(10) unsigned NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_recent`
--

CREATE TABLE IF NOT EXISTS `pma_recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma_recent`
--

INSERT INTO `pma_recent` (`username`, `tables`) VALUES
('root', '[{"db":"zhengyuan","table":"life_trajectory"},{"db":"zhengyuan","table":"images"},{"db":"zhengyuan","table":"auth"},{"db":"zhengyuan","table":"addresses"},{"db":"zhengyuan","table":"contacts"},{"db":"zhengyuan","table":"classmates"},{"db":"zhengyuan","table":"neighbors"},{"db":"zhengyuan","table":"colleagues"},{"db":"zhengyuan","table":"friends"},{"db":"zhengyuan","table":"children"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma_relation`
--

CREATE TABLE IF NOT EXISTS `pma_relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma_savedsearches`
--

CREATE TABLE IF NOT EXISTS `pma_savedsearches` (
`id` int(5) unsigned NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_coords`
--

CREATE TABLE IF NOT EXISTS `pma_table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT '0',
  `x` float unsigned NOT NULL DEFAULT '0',
  `y` float unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_info`
--

CREATE TABLE IF NOT EXISTS `pma_table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_table_uiprefs`
--

CREATE TABLE IF NOT EXISTS `pma_table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma_tracking`
--

CREATE TABLE IF NOT EXISTS `pma_tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin,
  `data_sql` longtext COLLATE utf8_bin,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) unsigned NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=COMPACT COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma_userconfig`
--

CREATE TABLE IF NOT EXISTS `pma_userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma_userconfig`
--

INSERT INTO `pma_userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2015-02-13 19:27:29', '{"collation_connection":"utf8mb4_general_ci"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma_usergroups`
--

CREATE TABLE IF NOT EXISTS `pma_usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma_users`
--

CREATE TABLE IF NOT EXISTS `pma_users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma_column_info`
--
ALTER TABLE `pma_column_info`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma_designer_coords`
--
ALTER TABLE `pma_designer_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma_history`
--
ALTER TABLE `pma_history`
 ADD PRIMARY KEY (`id`), ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma_navigationhiding`
--
ALTER TABLE `pma_navigationhiding`
 ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
 ADD PRIMARY KEY (`page_nr`), ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma_recent`
--
ALTER TABLE `pma_recent`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma_relation`
--
ALTER TABLE `pma_relation`
 ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`), ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma_table_coords`
--
ALTER TABLE `pma_table_coords`
 ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma_table_info`
--
ALTER TABLE `pma_table_info`
 ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma_table_uiprefs`
--
ALTER TABLE `pma_table_uiprefs`
 ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma_tracking`
--
ALTER TABLE `pma_tracking`
 ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma_userconfig`
--
ALTER TABLE `pma_userconfig`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma_usergroups`
--
ALTER TABLE `pma_usergroups`
 ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma_users`
--
ALTER TABLE `pma_users`
 ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma_bookmark`
--
ALTER TABLE `pma_bookmark`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_column_info`
--
ALTER TABLE `pma_column_info`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=115;
--
-- AUTO_INCREMENT for table `pma_history`
--
ALTER TABLE `pma_history`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_pdf_pages`
--
ALTER TABLE `pma_pdf_pages`
MODIFY `page_nr` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pma_savedsearches`
--
ALTER TABLE `pma_savedsearches`
MODIFY `id` int(5) unsigned NOT NULL AUTO_INCREMENT;--
-- Database: `rentaflat`
--

-- --------------------------------------------------------

--
-- Table structure for table `disposition`
--

CREATE TABLE IF NOT EXISTS `disposition` (
`id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `disposition`
--

INSERT INTO `disposition` (`id`, `text`) VALUES
(1, '1+0'),
(2, '1+kk'),
(3, '1+1'),
(4, '2+kk'),
(5, '2+1'),
(6, '3+kk'),
(7, '3+1'),
(8, '4+1'),
(9, '4+kk'),
(10, '5+1'),
(11, '5+kk'),
(12, '6+1'),
(13, '6+kk'),
(14, 'Apartment house');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
`id` int(11) NOT NULL,
  `city_part` text,
  `city` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `city_part`, `city`) VALUES
(1, 'Chodov', 'Prague'),
(2, 'Vinohrady', 'Prague');

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE IF NOT EXISTS `property` (
`id` int(11) NOT NULL,
  `reference_no` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `text` text NOT NULL,
  `disposition_id` int(11) NOT NULL,
  `area` float(10,2) NOT NULL,
  `floor` int(11) NOT NULL,
  `lift` tinyint(1) NOT NULL,
  `cellar` float(10,2) DEFAULT NULL,
  `balcony` float(10,2) DEFAULT NULL,
  `location_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `street` text NOT NULL,
  `property_build_id` int(11) NOT NULL,
  `terace` float(10,2) DEFAULT NULL,
  `loggia` float(10,2) DEFAULT NULL,
  `garden` float(10,2) DEFAULT NULL,
  `garage` float(10,2) DEFAULT NULL,
  `parking_place` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`id`, `reference_no`, `title`, `text`, `disposition_id`, `area`, `floor`, `lift`, `cellar`, `balcony`, `location_id`, `price`, `created_on`, `street`, `property_build_id`, `terace`, `loggia`, `garden`, `garage`, `parking_place`) VALUES
(1, 'NetBeans001', 'Great flat for PHP Development', 'This fabulous three bedroomed penthouse apartment is arranged over the sixth and seventh floors (with lift and concierge) of Orechovka, a smart residential development on the banks of the River Vltava.  The property offers chic and spacious accommodation and comprises vast reception room with door to the roof terrace, contemporary kitchen with ample space for dining, master bedroom with en suite shower room, two additional bedrooms, bathroom, good storage space, balcony, roof terrace, and secure underground parking.', 11, 110.00, 2, 1, 0.00, 40.00, 1, 1000, '2010-11-03 11:15:44', 'V parku 2308/8', 1, 0.00, 0.00, 0.00, 0.00, 1),
(2, 'NetBeans002', 'Great flat for J2EE Development', 'Benefiting from well proportioned living space and high-quality interiors throughout, this recently refurbished two bedroomed flat is attractively arranged over the ground and lower ground floors of a beautiful period block in the heart of historic Marylebone.  The property comprises reception room with well equipped contemporary kitchen, master bedroom with en suite shower room, second bedroom/study, bathroom and guest cloakroom. ', 7, 99.20, 3, 0, 0.00, 0.00, 1, 1500, '2010-11-08 15:32:51', 'V parku 2308/8', 1, 0.00, 0.00, 0.00, 0.00, 0),
(3, 'NetBeans003', 'Great flat for Java Web Development', 'A simply stunning two bedroomed third floor flat offering generous accommodation, with stylish and neutral décor, fantastic roof terrace and gorgeous wood floors.  The property comprises spacious reception room with lovely gas fireplace, amazing adjoining kitchen, contemporary master bedroom with chic en suite bathroom, second bedroom with fitted wardrobes, en suite shower room and guest cloakroom.', 6, 98.60, 4, 1, 0.00, 5.50, 1, 2000, '2010-11-01 08:40:08', 'V parku 2308/8', 1, 0.00, 0.00, 0.00, 0.00, 0),
(4, 'NetBeans004', 'Great flat for Javascript Development', 'With a sought-after location in the heart of Belsize Park, this stunning three bedroomed maisonette offers abundant living space with modern fixtures and fittings, wood floors and en suite master bedroom.  Situated on the first and second floors of a grand period conversion the property comprises a light and spacious reception room with open-plan kitchen, dining room, utility room, excellent master bedroom with en suite bathroom, two further good-sized bedrooms and shower room.', 7, 76.00, 5, 1, 0.00, 0.00, 2, 800, '2010-11-08 12:34:09', 'V parku 2308/8', 2, 0.00, 0.00, 0.00, 0.00, 0),
(5, 'NetBeans005', 'Apartment for you and entire family', 'This light and airy, three bedroomed, first floor flat (with lift and porterage) is exceptionally proportioned throughout benefiting from a secure gated mews with security guard, sunny terrace and sought-after location.  The property comprises spacious reception room with access to balcony, fully fitted kitchen, master bedroom with en suite bathroom, second bedroom with fitted wardrobe, one additional bedroom and shower room.', 14, 324.00, 6, 0, 0.00, 34.00, 1, 950, '2010-12-29 01:28:24', 'V parku 2308/8', 1, 4.00, 2.00, 0.00, 32.00, 0),
(6, 'NetBeans006', 'Flat suitable for students', 'Benefiting from well proportioned living space and high-quality interiors throughout, this recently refurbished two bedroomed flat is attractively arranged over the ground and lower ground floors of a beautiful period block close to Czech Technical University complex.  The property comprises reception room with well equipped contemporary kitchen, master bedroom with en suite shower room, second bedroom/study, bathroom and guest cloakroom.', 6, 800.00, 1, 0, 0.00, 0.00, 1, 2210, '2011-01-02 00:45:21', 'V parku 2308/8', 1, 0.00, 0.00, 0.00, 0.00, 0),
(7, 'NetBeans007', '2 double bedroom apartment', 'We are pleased to offer for rental this executive apartment situated within the Cathedral complex in city center. There is an open plan living area two double bedrooms and allocated parking space. A viewing is highly recommended.', 3, 51.00, 19, 0, 0.00, 0.00, 1, 1209, '2011-01-02 22:23:06', 'V parku 2308/8', 1, 0.00, 0.00, 0.00, 0.00, 0),
(8, 'NetBeans008', 'Renovated apartment + parking place', 'Completely re-decorated ground floor apartment in the popular ''Mezzo'' complex in Prague. This lovely apartment offers 1 double and 1 generous single bedroom, family bathroom with over bath shower and a large open plan living / dining / kitchen with high specification integrated appliances and contemporary fixtures and fittings. With a security entrance system, allocated parking and a rarely available private low maintenance rear garden with decking, this is a lovely property in a great location with easy access to the city centre,', 7, 51.00, 0, 1, 23.00, 34.00, 1, 1400, '2011-01-03 16:40:16', 'V parku 2308/8', 1, 4.00, 2.00, 23.00, 32.00, 1),
(9, 'NetBeans009', '4 bed flat to rent', 'A gorgeous four bedroomed flat offering an extremely high standard of interior styling and design, African wood flooring, professional soundproofing, modern fittings and fixtures, gorgeous bathroom facilities and plenty of living and entertaining space.\r\n\r\nThe property further benefits from original period features and recent refurbishment to a very high standard.\r\n\r\nThe flat comprises spacious 30\\\\\\'' double reception room with dining area and access to the balcony, modern fitted kitchen with dining area, bay-fronted master bedroom, two further good-sized bedrooms, study/fourth bedroom, bathroom, shower room, guest cloakroom and a balcony.', 10, 150.00, 3, 1, 0.00, 30.00, 2, 3000, '2011-01-04 21:53:22', 'V parku 2308/8', 1, 0.00, 0.00, 0.00, 0.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `property_build`
--

CREATE TABLE IF NOT EXISTS `property_build` (
`id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `property_build`
--

INSERT INTO `property_build` (`id`, `text`) VALUES
(1, 'brick'),
(2, 'concrete'),
(3, 'skeletal structure');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disposition`
--
ALTER TABLE `disposition`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
 ADD PRIMARY KEY (`id`), ADD KEY `disposition_id_idx` (`disposition_id`), ADD KEY `location_id_idx` (`location_id`), ADD KEY `property_build_id_idx` (`property_build_id`);

--
-- Indexes for table `property_build`
--
ALTER TABLE `property_build`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `disposition`
--
ALTER TABLE `disposition`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `property_build`
--
ALTER TABLE `property_build`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `property`
--
ALTER TABLE `property`
ADD CONSTRAINT `property_disposition_id_disposition_id` FOREIGN KEY (`disposition_id`) REFERENCES `disposition` (`id`),
ADD CONSTRAINT `property_location_id_location_id` FOREIGN KEY (`location_id`) REFERENCES `location` (`id`),
ADD CONSTRAINT `property_property_build_id_property_build_id` FOREIGN KEY (`property_build_id`) REFERENCES `property_build` (`id`);
--
-- Database: `test`
--
--
-- Database: `todolist`
--

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE IF NOT EXISTS `todo` (
`id` int(10) unsigned NOT NULL,
  `priority` int(1) NOT NULL DEFAULT '2',
  `created_on` datetime NOT NULL,
  `due_on` datetime NOT NULL,
  `last_modified_on` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `comment` text,
  `status` enum('PENDING','DONE','VOIDED') NOT NULL DEFAULT 'PENDING',
  `deleted` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `priority`, `created_on`, `due_on`, `last_modified_on`, `title`, `description`, `comment`, `status`, `deleted`) VALUES
(1, 2, '2011-10-20 11:00:00', '2011-10-20 11:00:00', '2015-10-20 00:00:00', 'Clean the house', 'Clean the whole house, ideally including garden.', NULL, 'PENDING', 0),
(2, 2, '2011-09-02 18:24:00', '2011-10-07 08:26:49', '2011-10-05 15:00:00', 'Cut the lawn', 'Cut the lawn around the house.', NULL, 'PENDING', 0),
(3, 3, '2011-09-15 09:30:00', '2011-10-19 10:25:00', '2012-01-01 00:00:00', 'Buy a car', 'Choose the best car to buy and simply buy it.', 'New BMW bought.', 'DONE', 0),
(4, 3, '2011-09-27 17:33:00', '2011-10-11 13:48:00', '2011-11-01 00:00:00', 'Open a new bank account', NULL, 'Not needed.', 'VOIDED', 0),
(5, 1, '2010-08-12 08:17:00', '2011-10-07 08:06:40', '2010-09-01 00:00:00', 'Finish all the exams', NULL, NULL, 'DONE', 0),
(6, 2, '2011-10-02 10:38:36', '2011-10-03 13:26:48', '2011-10-04 12:00:00', 'Send a letter to my sister', 'Send a letter to my sister with important information about what needs to be done.', 'Letter not needed, I called her.', 'VOIDED', 0),
(7, 1, '2010-04-07 17:28:52', '2010-05-12 11:47:00', '2010-07-01 00:00:00', 'Book air tickets', 'Book air tickets to Canary Islands, for 3 people.\r\n', '', 'PENDING', 0),
(8, 2, '2011-10-07 10:44:47', '2011-10-24 10:46:14', '2011-11-01 00:00:00', 'Pay electricity bills', 'Pay electricity bills for the house.', 'Paid.', 'DONE', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
 ADD PRIMARY KEY (`id`), ADD KEY `priority` (`priority`), ADD KEY `due_on` (`due_on`), ADD KEY `status` (`status`), ADD KEY `deleted` (`deleted`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;--
-- Database: `webauth`
--

-- --------------------------------------------------------

--
-- Table structure for table `user_pwd`
--

CREATE TABLE IF NOT EXISTS `user_pwd` (
  `name` char(30) COLLATE latin1_general_ci NOT NULL DEFAULT '',
  `pass` char(32) COLLATE latin1_general_ci NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `user_pwd`
--

INSERT INTO `user_pwd` (`name`, `pass`) VALUES
('xampp', 'wampp');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `user_pwd`
--
ALTER TABLE `user_pwd`
 ADD PRIMARY KEY (`name`);
--
-- Database: `zhengyuan`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE IF NOT EXISTS `addresses` (
  `id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `address1` varchar(120) DEFAULT NULL,
  `address2` varchar(120) DEFAULT NULL,
  `address3` varchar(120) DEFAULT NULL,
  `city` varchar(120) NOT NULL,
  `state_province` varchar(120) NOT NULL,
  `country_code` char(5) DEFAULT NULL,
  `country_name` year(4) DEFAULT NULL,
  `post_code_zip` char(20) DEFAULT NULL,
  `GIS` varchar(20) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth`
--

CREATE TABLE IF NOT EXISTS `auth` (
  `id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) NOT NULL,
  `auth_id` int(12) NOT NULL,
  `auth_type` enum('all','add','update','view','limitted','blocked') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `children`
--

CREATE TABLE IF NOT EXISTS `children` (
  `child_id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `child_type` enum('son','daughter','?','?','??','??') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `classmates`
--

CREATE TABLE IF NOT EXISTS `classmates` (
  `cm_id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(12) unsigned NOT NULL,
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `colleagues`
--

CREATE TABLE IF NOT EXISTS `colleagues` (
  `coll_id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `phone_prim` varchar(20) DEFAULT NULL,
  `phone_home` varchar(20) DEFAULT NULL,
  `phone_mb` varchar(20) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `wechat` varchar(20) DEFAULT NULL,
  `web` varchar(120) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `friends`
--

CREATE TABLE IF NOT EXISTS `friends` (
  `friend_id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE IF NOT EXISTS `images` (
  `img_id` int(12) NOT NULL,
  `woshii_id` int(12) NOT NULL,
  `img_mime` varchar(50) NOT NULL,
  `img_name` varchar(50) DEFAULT NULL,
  `img_path` varchar(255) DEFAULT NULL,
  `img_bin` longblob COMMENT '2MB limit',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `life_trajectory`
--

CREATE TABLE IF NOT EXISTS `life_trajectory` (
  `id` int(10) unsigned NOT NULL,
  `woshii_id` int(10) unsigned NOT NULL,
  `value` varchar(2048) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `neighbors`
--

CREATE TABLE IF NOT EXISTS `neighbors` (
  `nb_id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
  `parent_id` int(11) NOT NULL,
  `woshii_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `relation_name` enum('?','?','??','??','Father','Mother') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(12) unsigned NOT NULL,
  `woisi_id` int(12) unsigned NOT NULL COMMENT 'forien_key',
  `statement` varchar(1024) DEFAULT NULL COMMENT 'Self statement',
  `gender` char(1) DEFAULT NULL,
  `occupation` varchar(50) DEFAULT NULL,
  `ethnic_id` int(12) DEFAULT NULL,
  `religion_id` int(12) DEFAULT NULL,
  `education` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL,
  `created_by` int(12) NOT NULL,
  `updated_by` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siblings`
--

CREATE TABLE IF NOT EXISTS `siblings` (
  `sib_id` int(12) unsigned NOT NULL,
  `woshii_id` int(12) unsigned NOT NULL,
  `sib_type` enum('?','?','?','?','brother','sister') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(12) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  `updated_by` int(12) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `woshii`
--

CREATE TABLE IF NOT EXISTS `woshii` (
  `id` int(12) unsigned NOT NULL,
  `name` varchar(32) NOT NULL COMMENT 'Full Name',
  `name_other` varchar(64) NOT NULL COMMENT 'Other Name',
  `dob` date NOT NULL COMMENT 'Date of Birth',
  `dot` time NOT NULL COMMENT 'Time of Birth',
  `image` mediumblob NOT NULL COMMENT 'Primary Image 256KB limit',
  `note` varchar(256) NOT NULL,
  `login` varchar(16) NOT NULL COMMENT 'login id',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(12) DEFAULT NULL,
  `created_by` int(12) NOT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `rest_date` date NOT NULL,
  `rest_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='primary table of the people list';

--
-- Dumping data for table `woshii`
--

INSERT INTO `woshii` (`id`, `name`, `name_other`, `dob`, `dot`, `image`, `note`, `login`, `updated`, `updated_by`, `created_by`, `created`, `rest_date`, `rest_time`) VALUES
(0, '', '', '0000-00-00', '00:00:00', '', '', '', '2015-02-25 15:42:57', NULL, 0, '0000-00-00 00:00:00', '0000-00-00', '00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `children`
--
ALTER TABLE `children`
 ADD PRIMARY KEY (`child_id`,`woshii_id`);

--
-- Indexes for table `classmates`
--
ALTER TABLE `classmates`
 ADD PRIMARY KEY (`cm_id`,`woshii_id`);

--
-- Indexes for table `colleagues`
--
ALTER TABLE `colleagues`
 ADD PRIMARY KEY (`coll_id`,`woshii_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`,`woshii_id`);

--
-- Indexes for table `friends`
--
ALTER TABLE `friends`
 ADD PRIMARY KEY (`friend_id`,`woshii_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
 ADD PRIMARY KEY (`img_id`,`woshii_id`);

--
-- Indexes for table `life_trajectory`
--
ALTER TABLE `life_trajectory`
 ADD PRIMARY KEY (`id`,`woshii_id`);

--
-- Indexes for table `neighbors`
--
ALTER TABLE `neighbors`
 ADD PRIMARY KEY (`nb_id`,`woshii_id`);

--
-- Indexes for table `profile`
--
ALTER TABLE `profile`
 ADD PRIMARY KEY (`id`,`woisi_id`);

--
-- Indexes for table `siblings`
--
ALTER TABLE `siblings`
 ADD PRIMARY KEY (`sib_id`,`woshii_id`);

--
-- Indexes for table `woshii`
--
ALTER TABLE `woshii`
 ADD PRIMARY KEY (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
