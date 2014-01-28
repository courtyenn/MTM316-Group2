-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2014 at 11:55 PM
-- Server version: 5.5.32
-- PHP Version: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flashflix`
--
CREATE DATABASE IF NOT EXISTS `flashflix` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `flashflix`;

-- --------------------------------------------------------

--
-- Table structure for table `actor`
--

CREATE TABLE IF NOT EXISTS `actor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(60) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `director` varchar(40) DEFAULT NULL,
  `year` date DEFAULT NULL,
  `mpaa_rating` varchar(10) DEFAULT NULL,
  `profile_pic` varchar(50) DEFAULT NULL,
  `detail_pic` varchar(50) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `revenue` int(11) DEFAULT NULL,
  `tagline` varchar(256) DEFAULT NULL,
  `overview` text,
  `status` enum('Released','Box Office','Coming Soon') DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `genres` enum('Comedy','Action','Thriller','Romance','Foreign','Horror') DEFAULT NULL,
  `vote_average` double DEFAULT NULL,
  `vote_count` int(11) DEFAULT NULL,
  `imdb_rating` int(10) DEFAULT NULL,
  `rottentomato_rating` int(10) DEFAULT NULL,
  `moviedb_rating` int(10) DEFAULT NULL,
  `audience_rating` int(10) DEFAULT NULL,
  `trailer_url` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `movie_cast`
--

CREATE TABLE IF NOT EXISTS `movie_cast` (
  `MovieID` int(11) NOT NULL,
  `ActorID` int(11) NOT NULL,
  PRIMARY KEY (`MovieID`,`ActorID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `fname` varchar(20) NOT NULL,
  `lname` varchar(20) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `username`, `fname`, `lname`, `password`) VALUES
(5, 'Solstice', 'Courtney', 'Nguyen', 'password'),
(6, 'thawkins', 'Trevor', 'Hawkins', '12345');

-- --------------------------------------------------------

--
-- Table structure for table `user_movies`
--

CREATE TABLE IF NOT EXISTS `user_movies` (
  `UserID` int(11) NOT NULL,
  `MovieID` int(11) NOT NULL,
  `Note` text,
  `Rating` double DEFAULT NULL,
  `isFavorite` tinyint(1) NOT NULL DEFAULT '0',
  `hasWatched` tinyint(1) NOT NULL DEFAULT '0',
  `wantToWatch` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UserID`,`MovieID`),
  KEY `UserID` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
