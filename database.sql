-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2014 at 11:51 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `splint`
--
CREATE DATABASE IF NOT EXISTS `splint` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `splint`;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_bans`
--

CREATE TABLE IF NOT EXISTS `bbs_bans` (
  `bans_id` int(11) NOT NULL AUTO_INCREMENT,
  `bans_ip` text COLLATE utf8_unicode_ci NOT NULL,
  `bans_reason` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`bans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT= 1;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_boards`
--

CREATE TABLE IF NOT EXISTS `bbs_boards` (
  `board_id` int(11) NOT NULL AUTO_INCREMENT,
  `board_addr` text NOT NULL,
  `board_name` text NOT NULL,
  `board_sub` text NOT NULL,
  `board_posts` int(11) NOT NULL,
  `board_retired` int(11) NOT NULL,
  `board_rdate` text NOT NULL,
  `board_rules` text NOT NULL,
  PRIMARY KEY (`board_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_cats`
--

CREATE TABLE IF NOT EXISTS `bbs_cats` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` text COLLATE utf8_unicode_ci NOT NULL,
  `cat_order` int(11) NOT NULL,
  `cat_boards` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_config`
--

CREATE TABLE IF NOT EXISTS `bbs_config` (
  `conf` int(1) NOT NULL AUTO_INCREMENT,
  `conf_sitename` text COLLATE utf8_unicode_ci NOT NULL,
  `conf_offline` int(1) NOT NULL,
  `conf_admincolor` text COLLATE utf8_unicode_ci NOT NULL,
  `conf_modcolor` text COLLATE utf8_unicode_ci NOT NULL,
  `conf_anoncolor` text COLLATE utf8_unicode_ci NOT NULL,
  `conf_alert` text COLLATE utf8_unicode_ci NOT NULL,
  `conf_reportcap` int(11) NOT NULL,
  `conf_bumplimit` int(11) NOT NULL,
  `conf_threadlimit` int(11) NOT NULL,
  `conf_rules` text COLLATE utf8_unicode_ci NOT NULL,
  `conf_faq` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`conf`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_disc`
--

CREATE TABLE IF NOT EXISTS `bbs_disc` (
  `disc_id` int(11) NOT NULL AUTO_INCREMENT,
  `disc_user` text COLLATE utf8_unicode_ci NOT NULL,
  `disc_date` text COLLATE utf8_unicode_ci NOT NULL,
  `disc_content` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`disc_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_log`
--

CREATE TABLE IF NOT EXISTS `bbs_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_user` text COLLATE utf8_unicode_ci NOT NULL,
  `log_board` text COLLATE utf8_unicode_ci NOT NULL,
  `log_action` text COLLATE utf8_unicode_ci NOT NULL,
  `log_date` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_news`
--

CREATE TABLE IF NOT EXISTS `bbs_news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT,
  `news_title` text COLLATE utf8_unicode_ci NOT NULL,
  `news_author` text COLLATE utf8_unicode_ci NOT NULL,
  `news_date` text COLLATE utf8_unicode_ci NOT NULL,
  `news_content` text COLLATE utf8_unicode_ci NOT NULL,
  `news_image` text COLLATE utf8_unicode_ci NOT NULL,
  `news_comments` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_posts`
--

CREATE TABLE IF NOT EXISTS `bbs_posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `post_uid` int(11) NOT NULL,
  `post_board` text COLLATE utf8_unicode_ci NOT NULL,
  `post_thread` text COLLATE utf8_unicode_ci NOT NULL,
  `post_author` text COLLATE utf8_unicode_ci NOT NULL,
  `post_trip` text COLLATE utf8_unicode_ci NOT NULL,
  `post_email` text COLLATE utf8_unicode_ci NOT NULL,
  `post_subject` text COLLATE utf8_unicode_ci NOT NULL,
  `post_date` text COLLATE utf8_unicode_ci NOT NULL,
  `post_content` text COLLATE utf8_unicode_ci NOT NULL,
  `post_image` text COLLATE utf8_unicode_ci NOT NULL,
  `post_spoiler` int(11) NOT NULL,
  `post_reports` int(11) NOT NULL,
  `post_isop` int(1) NOT NULL,
  `post_isexempt` int(11) NOT NULL,
  `post_ip` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_reports`
--

CREATE TABLE IF NOT EXISTS `bbs_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_board` text COLLATE utf8_unicode_ci NOT NULL,
  `report_thread` text COLLATE utf8_unicode_ci NOT NULL,
  `report_post` text COLLATE utf8_unicode_ci NOT NULL,
  `report_ip` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_staff`
--

CREATE TABLE IF NOT EXISTS `bbs_staff` (
  `staff_id` int(11) NOT NULL AUTO_INCREMENT,
  `staff_username` text COLLATE utf8_unicode_ci NOT NULL,
  `staff_password` text COLLATE utf8_unicode_ci NOT NULL,
  `staff_level` int(1) NOT NULL,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bbs_threads`
--

CREATE TABLE IF NOT EXISTS `bbs_threads` (
  `threads_id` int(11) NOT NULL AUTO_INCREMENT,
  `threads_uid` int(11) NOT NULL,
  `threads_board` text COLLATE utf8_unicode_ci NOT NULL,
  `threads_replies` int(11) NOT NULL,
  `threads_bump` text COLLATE utf8_unicode_ci NOT NULL,
  `threads_sticky` int(1) NOT NULL,
  `threads_locked` int(1) NOT NULL,
  PRIMARY KEY (`threads_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
