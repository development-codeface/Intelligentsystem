-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 03, 2020 at 01:19 PM
-- Server version: 5.6.35
-- PHP Version: 7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hrms`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `bonus` bigint(20) DEFAULT NULL,
  `date_of_birth` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `hiring_date` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `salary` bigint(20) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `question` varchar(40) DEFAULT NULL,
  `job_postings_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `created_at`, `updated_at`, `bonus`, `date_of_birth`, `email`, `first_name`, `hiring_date`, `last_name`, `password`, `postal_code`, `province`, `salary`, `username`, `answer`, `result`, `question`, `job_postings_id`) VALUES
(1, '2020-04-17 13:35:14', '2020-04-17 13:35:14', NULL, '24-08-1994', 'MANAGER1@gmail.com', 'MANAGER1', '15-12-2016', 'MANAGER1', '$2a$10$Ei6IJ.hY34xX60nfmjO6.edn5E7myL9xyLM4q1V6vCNR0yoxA1dqu', 'H3H1P4', 'QUEBEC', NULL, 'MANAGER1', NULL, NULL, NULL, 0),
(2, '2020-04-17 13:39:22', '2020-04-17 13:39:22', NULL, '24-08-1994', 'HR1@gmail.com', 'HR1', '15-12-2016', 'HR1', '$2a$10$Ei6IJ.hY34xX60nfmjO6.edn5E7myL9xyLM4q1V6vCNR0yoxA1dqu', 'H3H1P4', 'QUEBEC', NULL, 'HR1', NULL, NULL, NULL, 0),
(3, '2020-04-17 13:40:39', '2020-04-17 13:40:39', NULL, '24-08-1994', 'HR2@gmail.com', 'HR2', '15-12-2016', 'HR2', '$2a$10$O0gVQ5hDvdkIVwDr4x5/1.EIXkzq.4wF959vcbtWPCCwuY5KSQvXS', 'H3H1P4', 'QUEBEC', NULL, 'HR2', NULL, NULL, NULL, 0),
(4, '2020-05-03 05:51:37', '2020-05-03 05:51:37', NULL, '03/05/2020', 'HR5@gmail.com', 'FirstHR5', '03/05/2020', 'LastHR5', '$2a$10$EB7OFMJ9mDpLzej5a7d0QuSlOybLsJckN64Yfk5vqJA9DfzaFrhNG', '888888888', 'Singapore', NULL, 'HR5', NULL, NULL, NULL, NULL),
(5, '2020-05-03 05:59:48', '2020-05-03 05:59:48', NULL, '03/05/2020', 'HR6@gmail.com', 'FRISTHR6', '03/05/2020', 'LASTHR6', '$2a$10$80kaeYqS.Cyylqm6ra1fwO3nIvk0enJQQWeKoe.rl4dhBh2gpqwRa', '888888888', 'Singapore', NULL, 'HR6', NULL, NULL, NULL, NULL),
(6, '2020-05-03 06:00:28', '2020-05-03 06:00:28', NULL, '03/05/2020', 'HR7@gmail.com', 'FRISTHR7', '03/05/2020', 'LASTHR7', '$2a$10$WdyC94nHhtZwZBvTY2.Lr.3F7Ac8i4UWOb55x3SjAFHllpFtqeL4i', '888888888', 'Singapore', NULL, 'HR7', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_job_postings`
--

CREATE TABLE `employee_job_postings` (
  `user_id` bigint(20) NOT NULL,
  `jobposting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_job_postings`
--

INSERT INTO `employee_job_postings` (`user_id`, `jobposting_id`) VALUES
(2, 30),
(2, 31),
(2, 48),
(2, 49),
(2, 50),
(2, 59),
(3, 62),
(3, 66);

-- --------------------------------------------------------

--
-- Table structure for table `employee_roles`
--

CREATE TABLE `employee_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee_roles`
--

INSERT INTO `employee_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(4, 1),
(5, 1),
(6, 1),
(2, 2),
(3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(69),
(69),
(69),
(69),
(69);

-- --------------------------------------------------------

--
-- Table structure for table `interview_questions`
--

CREATE TABLE `interview_questions` (
  `id` bigint(20) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `result` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `jobposting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `interview_questions`
--

INSERT INTO `interview_questions` (`id`, `answer`, `result`, `question`, `jobposting_id`) VALUES
(1, NULL, 'NO', 'Why did you decide to become a banker', 30),
(2, NULL, 'NO', 'Why do you think this bank is a good fit for your skills', 30),
(3, NULL, 'NO', 'Have you ever had to deal with an angry customer? How did you handle it', 30),
(4, NULL, 'NO', 'What do you feel are the most important qualities for a bank teller position', 30),
(5, NULL, 'NO', 'If a customer is not convinced about this bank, how would you change their mind', 30),
(6, NULL, 'NO', 'How would you handle a situation wherein a customer has been wrongly overcharged for a withdrawal fee', 30),
(7, NULL, 'NO', 'Ready to get started', 30),
(8, NULL, 'NO', '1) What is bank? What are the types of banks', 30),
(9, NULL, 'NO', '2) What is investment banking', 30),
(10, NULL, 'NO', '3) What is commercial bank', 30),
(11, NULL, 'NO', '4) What are the types of Commercial Banks', 30),
(12, NULL, 'NO', '5) What is consumer bank', 30),
(13, NULL, 'NO', '6) What are the types of accounts in banks', 30),
(14, NULL, 'NO', '7) What are the different ways you can operate your accounts', 30),
(15, NULL, 'NO', '8) What are the things that you have to keep in concern before opening the bank accounts', 30),
(16, NULL, 'NO', '9) What is ‘Crossed Cheque’ ', 30),
(17, NULL, 'NO', '10) What is overdraft protection', 30),
(18, NULL, 'NO', '11) Do bank charge for ‘overdraft protection’ service', 30),
(19, NULL, 'NO', '12) What is (APR) Annual Percentage Rate', 30),
(20, NULL, 'NO', '13) What is ‘prime rate’', 30),
(21, NULL, 'NO', 'Why did you decide to become a banker', 48),
(22, NULL, 'NO', 'Why do you think this bank is a good fit for your skills', 48),
(23, NULL, 'NO', 'Have you ever had to deal with an angry customer? How did you handle it', 48),
(24, NULL, 'NO', 'What do you feel are the most important qualities for a bank teller position', 48),
(25, NULL, 'NO', 'If a customer is not convinced about this bank, how would you change their mind', 48),
(26, NULL, 'NO', 'How would you handle a situation wherein a customer has been wrongly overcharged for a withdrawal fee', 48),
(27, NULL, 'NO', 'Ready to get started', 48),
(28, NULL, 'NO', '1) What is bank? What are the types of banks', 48),
(29, NULL, 'NO', '2) What is investment banking', 48),
(30, NULL, 'NO', '3) What is commercial bank', 48),
(31, NULL, 'NO', '4) What are the types of Commercial Banks', 48),
(32, NULL, 'NO', '5) What is consumer bank', 48),
(33, NULL, 'NO', '6) What are the types of accounts in banks', 48),
(34, NULL, 'NO', '7) What are the different ways you can operate your accounts', 48),
(35, NULL, 'NO', '8) What are the things that you have to keep in concern before opening the bank accounts', 48),
(36, NULL, 'NO', '9) What is ‘Crossed Cheque’ ', 48),
(37, NULL, 'NO', '10) What is overdraft protection', 48),
(38, NULL, 'NO', '11) Do bank charge for ‘overdraft protection’ service', 48),
(39, NULL, 'NO', '12) What is (APR) Annual Percentage Rate', 48),
(40, NULL, 'NO', '13) What is ‘prime rate’', 48),
(41, NULL, 'NO', 'Why did you decide to become a banker', 50),
(42, NULL, 'NO', 'Why do you think this bank is a good fit for your skills', 50),
(43, NULL, 'NO', 'Have you ever had to deal with an angry customer? How did you handle it', 50),
(44, NULL, 'NO', 'What do you feel are the most important qualities for a bank teller position', 50),
(45, NULL, 'NO', 'If a customer is not convinced about this bank, how would you change their mind', 50),
(46, NULL, 'NO', 'How would you handle a situation wherein a customer has been wrongly overcharged for a withdrawal fee', 50),
(47, NULL, 'NO', 'Ready to get started', 50),
(48, NULL, 'NO', '1) What is bank? What are the types of banks', 50),
(49, NULL, 'NO', '2) What is investment banking', 50),
(50, NULL, 'NO', '3) What is commercial bank', 50),
(51, NULL, 'NO', '4) What are the types of Commercial Banks', 50),
(52, NULL, 'NO', '5) What is consumer bank', 50),
(53, NULL, 'NO', '6) What are the types of accounts in banks', 50),
(54, NULL, 'NO', '7) What are the different ways you can operate your accounts', 50),
(55, NULL, 'NO', '8) What are the things that you have to keep in concern before opening the bank accounts', 50),
(56, NULL, 'NO', '9) What is ‘Crossed Cheque’ ', 50),
(57, NULL, 'NO', '10) What is overdraft protection', 50),
(58, NULL, 'NO', '11) Do bank charge for ‘overdraft protection’ service', 50),
(59, NULL, 'NO', '12) What is (APR) Annual Percentage Rate', 50),
(60, NULL, 'NO', '13) What is ‘prime rate’', 50),
(61, NULL, 'NO', 'Why did you decide to become a banker', 49),
(62, NULL, 'NO', 'Why do you think this bank is a good fit for your skills', 49),
(63, NULL, 'NO', 'Have you ever had to deal with an angry customer? How did you handle it', 49),
(64, NULL, 'NO', 'What do you feel are the most important qualities for a bank teller position', 49),
(65, NULL, 'NO', 'If a customer is not convinced about this bank, how would you change their mind', 49),
(66, NULL, 'NO', 'How would you handle a situation wherein a customer has been wrongly overcharged for a withdrawal fee', 49),
(67, NULL, 'NO', 'Ready to get started', 49),
(68, NULL, 'NO', '1) What is bank? What are the types of banks', 49),
(69, NULL, 'NO', '2) What is investment banking', 49),
(70, NULL, 'NO', '3) What is commercial bank', 49),
(71, NULL, 'NO', '4) What are the types of Commercial Banks', 49),
(72, NULL, 'NO', '5) What is consumer bank', 49),
(73, NULL, 'NO', '6) What are the types of accounts in banks', 49),
(74, NULL, 'NO', '7) What are the different ways you can operate your accounts', 49),
(75, NULL, 'NO', '8) What are the things that you have to keep in concern before opening the bank accounts', 49),
(76, NULL, 'NO', '9) What is ‘Crossed Cheque’ ', 49),
(77, NULL, 'NO', '10) What is overdraft protection', 49),
(78, NULL, 'NO', '11) Do bank charge for ‘overdraft protection’ service', 49),
(79, NULL, 'NO', '12) What is (APR) Annual Percentage Rate', 49),
(80, NULL, 'NO', '13) What is ‘prime rate’', 49),
(81, NULL, 'NO', 'QUESTIONS', 62),
(82, NULL, 'NO', 'Looking for freelance Android jobs', 62),
(83, NULL, 'NO', 'What is a ContentProvider and what is it typically used for', 62),
(84, NULL, 'NO', 'Under what condition could the code sample below crash your application? How would you modify the code to avoid this potential problem', 62),
(85, NULL, 'NO', 'Which of the code snippets below is the correct way to check if a Compass sensor is present on the system', 62),
(86, NULL, 'NO', 'If the Activity is showing an animation that indicates some kind of progress, what issue might you encounter and how could you address it', 62),
(87, NULL, 'NO', 'In an app you’re working on, you notice that a view’s value is not being restored after screen reorientation. What could be a likely cause of the problem that you should verify, at a minimum, about that particular view', 62),
(88, NULL, 'NO', 'What is DDMS', 62),
(89, NULL, 'NO', 'What is the relationship between the life cycle of an AsyncTask and an Activity? What problems can this result in? How can these problems be avoided', 62),
(90, NULL, 'NO', 'What is an Intent? Can it be used to provide data to a ContentProvider? Why or why not', 62),
(91, NULL, 'NO', 'What is the difference between a fragment and an activity', 62),
(92, NULL, 'NO', 'What is difference between Serializable and Parcelable ? Which is best approach in Android ', 62),
(93, NULL, 'NO', 'What are “launch modes”? What are the two mechanisms by which they can be defined? What specific types of launch modes are supported', 62),
(94, NULL, 'NO', 'What is the difference between Service and IntentService? How is each used', 62),
(95, NULL, 'NO', 'How do you supply construction arguments into a Fragment', 62),
(96, NULL, 'NO', 'What is ANR, and why does it happen', 62),
(97, NULL, 'NO', 'Which method is called only once in a fragment life cycle', 62),
(98, NULL, 'NO', 'Is it possible to create an activity in Android without a user interface ', 62),
(99, NULL, 'NO', 'What is a broadcast receiver', 62),
(100, NULL, 'NO', 'Are you ready to ace your upcoming job interview', 62),
(101, NULL, 'NO', '“What steps would you take to communicate a solution to a customer who doesn’t agree with, or who may not understand, your assessment', 66),
(102, NULL, 'NO', 'Again, this all boils down to the candidate’s soft skills: can you listen effectively', 66),
(103, NULL, 'NO', '“What are some arguments for and against PaaS-oriented development', 66),
(104, NULL, 'NO', 'In other words, should a customer build or buy a solution', 66),
(105, NULL, 'NO', '“What are the differences between RDBMS and NoSQL, and why would you choose one over the other', 66),
(106, NULL, 'NO', 'Will Uber Lay Off 20 Percent of Its Workforce Due to COVID-19', 66),
(107, NULL, 'NO', 'What goals would you set for yourself as a professional solutions architect', 66),
(108, NULL, 'NO', 'What projects will you start within three months of starting this job as a solutions architect', 66),
(109, NULL, 'NO', 'If we asked your coworkers to describe you in one word, what would they say', 66),
(110, NULL, 'NO', 'How comfortable are you speaking to people about technical topics', 66),
(111, NULL, 'NO', 'What would a day at your ideal job look like', 66),
(112, NULL, 'NO', 'What is your desired salary range', 66),
(113, NULL, 'NO', 'What qualities make you a good fit for the job', 66),
(114, NULL, 'NO', 'What skills are required of a solutions architect', 66),
(115, NULL, 'NO', 'Why are you choosing to exit your current role', 66),
(116, NULL, 'NO', 'What\'s your favorite thing about being a solutions architect', 66),
(117, NULL, 'NO', 'How long have you been working as a solutions architect', 66),
(118, NULL, 'NO', 'What are your strengths as a solutions architect', 66),
(119, NULL, 'NO', 'What are your weaknesses when it comes to performing the duties of a solutions architect', 66),
(120, NULL, 'NO', 'Tell me about a recent successful project as a solutions architect', 66);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `salary_after_tax` bigint(20) DEFAULT NULL,
  `employee_id` bigint(20) NOT NULL,
  `tax_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `job_applicants`
--

CREATE TABLE `job_applicants` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `resume` varchar(255) DEFAULT NULL,
  `score` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_applicants`
--

INSERT INTO `job_applicants` (`id`, `created_at`, `updated_at`, `email`, `first_name`, `last_name`, `status`, `resume`, `score`) VALUES
(44, '2020-05-01 22:47:58', '2020-05-01 22:47:58', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(45, '2020-05-01 22:47:58', '2020-05-01 22:47:58', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(46, '2020-05-02 00:14:08', '2020-05-02 00:14:08', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(47, '2020-05-02 00:14:08', '2020-05-02 00:14:08', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(51, '2020-05-03 04:09:46', '2020-05-03 04:09:46', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(52, '2020-05-03 04:09:46', '2020-05-03 04:09:46', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(53, '2020-05-03 04:10:05', '2020-05-03 04:10:05', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(54, '2020-05-03 04:10:05', '2020-05-03 04:10:05', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(55, '2020-05-03 04:17:16', '2020-05-03 04:17:16', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(56, '2020-05-03 04:17:16', '2020-05-03 04:17:16', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(57, '2020-05-03 04:23:58', '2020-05-03 04:23:58', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(58, '2020-05-03 04:23:58', '2020-05-03 04:23:58', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(60, '2020-05-03 06:12:41', '2020-05-03 06:12:41', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(61, '2020-05-03 06:12:41', '2020-05-03 06:12:41', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(63, '2020-05-03 12:47:45', '2020-05-03 12:47:45', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(64, '2020-05-03 12:47:45', '2020-05-03 12:47:45', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026'),
(67, '2020-05-03 13:17:31', '2020-05-03 13:17:31', 'help@enhancv.com', 'help@enhancv.com', 'help@enhancv.com', 'OPEN', 'Architect_sample', '0.0438924944'),
(68, '2020-05-03 13:17:31', '2020-05-03 13:17:31', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'soorejmg@yahoo.co.uk', 'OPEN', 'soorej_perfEnginee', '0.092032026');

-- --------------------------------------------------------

--
-- Table structure for table `job_applicants_postings`
--

CREATE TABLE `job_applicants_postings` (
  `applicant_id` int(11) NOT NULL,
  `jobposting_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_applicants_postings`
--

INSERT INTO `job_applicants_postings` (`applicant_id`, `jobposting_id`) VALUES
(44, 30),
(45, 30),
(46, 31),
(47, 31),
(51, 48),
(52, 48),
(53, 48),
(54, 48),
(57, 49),
(58, 49),
(55, 50),
(56, 50),
(60, 59),
(61, 59),
(63, 62),
(64, 62),
(67, 66),
(68, 66);

-- --------------------------------------------------------

--
-- Table structure for table `job_postings`
--

CREATE TABLE `job_postings` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `application_status` varchar(255) DEFAULT NULL,
  `contract_period` int(11) DEFAULT NULL,
  `contract_type` varchar(255) DEFAULT NULL,
  `job_description` varchar(3000) DEFAULT NULL,
  `max_salary` tinyblob,
  `min_salary` tinyblob,
  `no_of_openings` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `body` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_postings`
--

INSERT INTO `job_postings` (`id`, `created_at`, `updated_at`, `application_status`, `contract_period`, `contract_type`, `job_description`, `max_salary`, `min_salary`, `no_of_openings`, `job_title`, `body`) VALUES
(30, '2020-04-22 17:05:53', '2020-05-02 13:32:42', 'OPEN', 10, 'Permanent', 'Computer Networking', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001770, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001388, '13', 'Senior Salesforce Engineer', 'Are you looking for an inspiring and positive company? Are you wanting to work with smart, creative and collaborative colleagues? At Cisco Meraki, we’re on track to be the most successful acquisition in Cisco’s history (and certainly the most fun). Our office makes working here pretty special too – located in the heights of central London with an outstanding view of the city skyline, we’re a short walk away from bustling areas like Shoreditch and Liverpool street.\n\nWe offer privately catered lunches every single day plus you can help yourself free of charge to our fully stocked kitchen at all times – from freshly squeezed orange juice and a huge array of fruit, to salads, salamis and cheese. If you’re looking for a company that really commits, how about our complimentary weekly yoga classes, sports societies, games room, or organised family days so you can bring your children into work? But what truly makes Meraki special is the people – people who keep the culture strong and make working here exciting, meaningful, and rewarding.\n\nMeraki is making IT easier, faster, and smarter with technology that simply works. The Business Systems group is a rapidly growing engineering organisation that focuses on building internal business systems to make Meraki employees more efficient.\n\nAs an Engineer within Business Systems, you provide delightful experiences to our business users by providing front-end and back-end applications. You are comfortable jumping to and from different programming languages and building APIs in between. You help design features for what\'s best for the business.\n\nGet in early as we start to extend our team into London'),
(31, '2020-04-23 17:55:33', '2020-04-23 17:55:33', 'OPEN', 10, 'Permanent', 'Computer Networking', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001770, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001388, '4', 'Senior Salesforce Engineer', 'Are you looking for an inspiring and positive company? Are you wanting to work with smart, creative and collaborative colleagues? At Cisco Meraki, we’re on track to be the most successful acquisition in Cisco’s history (and certainly the most fun). Our office makes working here pretty special too – located in the heights of central London with an outstanding view of the city skyline, we’re a short walk away from bustling areas like Shoreditch and Liverpool street.\n\nWe offer privately catered lunches every single day plus you can help yourself free of charge to our fully stocked kitchen at all times – from freshly squeezed orange juice and a huge array of fruit, to salads, salamis and cheese. If you’re looking for a company that really commits, how about our complimentary weekly yoga classes, sports societies, games room, or organised family days so you can bring your children into work? But what truly makes Meraki special is the people – people who keep the culture strong and make working here exciting, meaningful, and rewarding.\n\nMeraki is making IT easier, faster, and smarter with technology that simply works. The Business Systems group is a rapidly growing engineering organisation that focuses on building internal business systems to make Meraki employees more efficient.\n\nAs an Engineer within Business Systems, you provide delightful experiences to our business users by providing front-end and back-end applications. You are comfortable jumping to and from different programming languages and building APIs in between. You help design features for what\'s best for the business.\n\nGet in early as we start to extend our team into London'),
(48, '2020-05-02 05:44:48', '2020-05-02 05:44:48', 'OPEN', 10, 'Permanent', 'Testing banking', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001b58, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001388, '18', 'Jobtitle', 'Facebook\'s mission is to give people the power to build community and bring the world closer together. Through our family of apps and services, we\'re building a different kind of company that connects billions of people around the world, gives them ways to share what matters most to them, and helps bring people closer together. Whether we\'re creating new products or helping a small business expand its reach, people at Facebook are builders at heart. Our global teams are constantly iterating, solving problems, and working together to empower people around the world to build community and connect in meaningful ways. Together, we can help people build stronger communities - we\'re just getting started.\n\nFacebook is seeking Software Engineers to join one of our many teams who create products used by billions people around the world. Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more? Want to solve unique, large scale, highly complex technical problems? You can help build the next-generation of products, systems and services that help people connect with each other around the globe. Join us!\n\nCompetitive salary including: Medical Benefits, Dental Benefits, Vision Benefits, Pension Benefits, Life Assurance, Ride2Work, Childcare Benefits, Gym Benefits, Transport benefits, Laundry Benefit\n\nResponsibilities\nBuild web services and/or software components using C/C++, Java, PHP and/or Hack\nCreate web interfaces using Javascript, XHTML and CSS\nBuild report interfaces and data feeds\nInterface with other teams to incorporate ideas and features\nConduct design and code reviews\nAnalyse and improve efficiency, scalability and stability of products and systems'),
(49, '2020-05-02 12:15:19', '2020-05-02 12:15:19', 'OPEN', 1, 'Permanent', 'Role data', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001f40, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001770, '10', 'jobpost2', 'Facebook\'s mission is to give people the power to build community and bring the world closer together. Through our family of apps and services, we\'re building a different kind of company that connects billions of people around the world, gives them ways to share what matters most to them, and helps bring people closer together. Whether we\'re creating new products or helping a small business expand its reach, people at Facebook are builders at heart. Our global teams are constantly iterating, solving problems, and working together to empower people around the world to build community and connect in meaningful ways. Together, we can help people build stronger communities - we\'re just getting started.\n\nFacebook is seeking Software Engineers to join one of our many teams who create products used by billions people around the world. Want to build new features and improve existing products like Messenger, Video, Groups, News Feed, Search and more? Want to solve unique, large scale, highly complex technical problems? You can help build the next-generation of products, systems and services that help people connect with each other around the globe. Join us!\n\nCompetitive salary including: Medical Benefits, Dental Benefits, Vision Benefits, Pension Benefits, Life Assurance, Ride2Work, Childcare Benefits, Gym Benefits, Transport benefits, Laundry Benefit\n\nResponsibilities\nBuild web services and/or software components using C/C++, Java, PHP and/or Hack\nCreate web interfaces using Javascript, XHTML and CSS\nBuild report interfaces and data feeds\nInterface with other teams to incorporate ideas and features\nConduct design and code reviews\nAnalyse and improve efficiency, scalability and stability of products and systems'),
(50, '2020-05-02 12:26:06', '2020-05-02 12:26:06', 'OPEN', 2, 'Permanent', 'Manager, teasting', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001770, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001388, '3', 'posttitle4', 'The goal of Bloomberg Connectivity & Integration Solutions (CIS) group is to provide a platform for customers to integrate Bloomberg products with their own highly complex software systems. We are building our Integration Platform on a combination of open source, third party, and in-house technologies to meet our clients\' ever increasing demands for more capabilities in data transformation and monitoring.\n\n\nThe CIS Engineering team is split across London and New York, and our London team is growing! We own some critical parts of the overall product, including integration workflows, offering tools for clients to build, execute and monitor customised data workflows; connectivity to the SWIFT financial transaction network, handling many tens of thousands of messages daily; and a client privileging system, which controls access to confidential client data.'),
(59, '2020-05-03 06:10:42', '2020-05-03 06:10:42', 'OPEN', 0, 'Permanent', 'Banking', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001f40, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001770, '2', 'Android Development Lead', 'Responsibilities\nComplete development assignments on time with an appropriate level of quality to support project efforts.\nParticipate in a digital technology project from concept to implementation, and through all phases of the software development lifecycle\nCreate work estimates based on technology concepts and requirements documentation.\nSupport project releases.\nRequirements\nSignificant experience designing and implementing web applications\nExcellent written and oral communication skills\nDegree in Computer Science or related degree from an accredited university or four years equivalent development experience.\nQualifications\nSignificant software/application development experience in Java/Kotlin android development.\nReact/React Native\nUnderstanding of distributed systems and cloud technologies (AWS, GCP, Azure, etc.)\nExperience with containers (Docker, Kubernetes, etc.)\nCreated application available for Google Play/Amazon App store(s).\nFamiliar with build tooling (gradle, Jenkins, Fastlane, HockeyApp / AppCenter)\nExperience in developing, deploying, and/or supporting an enterprise size solution\nExperience with all phases of the development life cycle\nExperience with the following is desired:\nFamiliarity with Agile development including daily scrum and weekly iteration reviews and planning\nEnthusiasm for automated testing\nExperience with unit testing frameworks\nExperience with source control management\nSeniority Level\nAssociate\n\nIndustry\nInformation Technology & Services  Financial Services\nEmployment Type\nFull-time\n\nJob Functions\n'),
(62, '2020-05-03 12:42:33', '2020-05-03 12:42:33', 'OPEN', 0, 'Permanent', 'Banking', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000002710, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000001f40, '2', 'Android Lead bank', 'The role responsibilities also include:\n\nDesign, build, test, support and deliver web, API/service, mobile and cloud products, including environment build and integration through automated build pipelines that deliver business value to our customers.\nDesigning, building, testing and delivering customer products or services that follow standard engineering patterns, agreed designs & best practices.\nInstrumenting, protecting, supporting & monitoring customer products and services Tesco Bank offers.\nPerforming all change to the customer service I work on including patching, certificate updates, upgrades, project feature work incident analysis/resolutions and service enhancement.\nEnsuring I have the correct skill sets to increase my throughput and give my team more autonomy & purpose\nAutomating build pipelines, test execution & instrumentation of customer products/services to iteratively deploy code through test, pre-production and production in small delivery cycles.\nWriting application code, infrastructure code, test automation that follow standard engineering patterns & practices.\nContributing, participating and supporting a wider community of engineers as part of my personal development to keep abreast of advancing technology shifts.\n\n\nSpecific skills & experience required:\n\nAndroid Studio, Gradle\nJava, XML\nGit, Bitbucket\nAgile methodology / Scrum\nLinux / Mac OS (not mandatory, but would be useful)\nIntegration with third part APIs\nSecurity and code obfuscation\nRobolectric and Espresso'),
(66, '2020-05-03 13:16:36', '2020-05-03 13:16:36', 'OPEN', 0, 'Permanent', 'Banking', 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000002ee0, 0xaced0005737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000002710, '2', 'Solution architect', 'Responsibility:\n·	Delivering New Application\n·	Solution and Design\n·	Business engagement – requirements analysis, acts as a product owner and prioritize backlog\n·	Hands on Development on frameworks\n·	Subject matter expert in any one of these domains – E/M-Commerce, Customer / Partner relationship management, Card & Wallet Payment Landscape(initiation to settlement), Gaming Distribution and Gamer Community, Small & Medium Enterprises\n·	Define system-level application architecture that includes high-level design, architectural policies and principles, design and programming guidelines, implementation risks and mitigation measures, software development and integration strategies, software configuration controls, etc\n·	Maintain control over the solution throughout the entire software development lifecycle by continuously making critical adjustments to the solution to ensure desired results are achieved \n·	Involve in requirement analysis phase to ensure the implementation feasibility of functional specifications. Highlight requirement gaps, disproportional construction efforts, technical challenges and any other issues to business analyst teams\n·	Provide technical leadership in the development through established design and development methodologies, to ensure system meets functional and system requirements \n·	Engage customers to explain the rationale of architecture’s selection, or other technical issues\n·	Ensure best practices, frameworks and re-useable components are employed in the development project\n·	Understand Information Security standards, methodologies and practices.\n·	Design and deliver complex security solutions that integrate an effective and efficient network infrastructure design.\n·	Trouble-shoot technical problems faced by the team.\n \nRequirement:\n·	Degree in Information Technology, Computer Science, or its equivalent.\n·	At least 10 years’ experience with substantial project work in software design & development\n·	Experience in designing solutions using appropriate platforms and system technologies such as enterprise database design, web and application server and network technologies \n·	Experience in payment or telco billing related system is good to have.\n·	Ability to lead, develop and maintain respectful and trusting relationship;\n·	Ability to setup the product backlogs for iterative development\n·	Proficient in written and spoken English\n·	Android development\n·	banking\n·	Able to travel as required\n·	Good working knowledge of Amazon Cloud Services such as EC2, EBS, S3, ELB, ElasticCache, CloudFront, Route53, RDS, Kinesis, DynamoDB, etc\n·	Data Modeling Experience, designing LDM/PDM using RDBMS or NoSQL\n·	Database migration experience (e.g. upgrading RDBMS versions, moving from RDBMS to NoSQL)\n·	Practical knowledge in Agile and DevOps environments, open source technologies and related tools.\n·	Knowledge/Experience in Continuous Integration and Automated Testing\n·	Knowledge/Experience in Agile Development and Management tools, e.g. Jira, Nexus, Bamboo, Jenkins, Sonar, Selenium, Bitbucket');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `department_name` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `employee_id` bigint(20) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(2, 'ROLE_ADMIN'),
(1, 'ROLE_EMPLOYEE'),
(3, 'ROLE_MANAGER');

-- --------------------------------------------------------

--
-- Table structure for table `tax`
--

CREATE TABLE `tax` (
  `id` bigint(20) NOT NULL,
  `federal_tax` bigint(20) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `province_tax` bigint(20) DEFAULT NULL,
  `tax_bracket_max` bigint(20) DEFAULT NULL,
  `tax_bracket_min` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tax`
--

INSERT INTO `tax` (`id`, `federal_tax`, `province`, `province_tax`, `tax_bracket_max`, `tax_bracket_min`) VALUES
(1, 10, 'QUEBEC', 10, 50000, 0),
(2, 12, 'QUEBEC', 12, 100000, 50001),
(3, 15, 'QUEBEC', 15, 200000, 100001),
(4, 20, 'QUEBEC', 20, 300000, 200001),
(5, 25, 'QUEBEC', 25, 999999, 300001),
(6, 10, 'ONTARIO', 10, 50000, 0),
(7, 12, 'ONTARIO', 12, 100000, 50001),
(8, 15, 'ONTARIO', 15, 200000, 100001),
(9, 20, 'ONTARIO', 20, 300000, 200001),
(10, 25, 'ONTARIO', 25, 999999, 300001),
(11, 10, 'BRITISH_COLUMBIA', 10, 50000, 0),
(12, 12, 'BRITISH_COLUMBIA', 12, 100000, 50001),
(13, 15, 'BRITISH_COLUMBIA', 15, 200000, 100001),
(14, 20, 'BRITISH_COLUMBIA', 20, 300000, 200001),
(15, 25, 'BRITISH_COLUMBIA', 25, 999999, 300001),
(16, 10, 'ALBERTA', 10, 50000, 0),
(17, 12, 'ALBERTA', 12, 100000, 50001),
(18, 15, 'ALBERTA', 15, 200000, 100001),
(19, 20, 'ALBERTA', 20, 300000, 200001),
(20, 25, 'ALBERTA', 25, 999999, 300001),
(21, 10, 'NOVA_SCOTIA', 10, 50000, 0),
(22, 12, 'NOVA_SCOTIA', 12, 100000, 50001),
(23, 15, 'NOVA_SCOTIA', 15, 200000, 100001),
(24, 20, 'NOVA_SCOTIA', 20, 300000, 200001),
(25, 25, 'NOVA_SCOTIA', 25, 999999, 300001),
(26, 10, 'SASKATCHEWAN', 10, 50000, 0),
(27, 12, 'SASKATCHEWAN', 12, 100000, 50001),
(28, 15, 'SASKATCHEWAN', 15, 200000, 100001),
(29, 20, 'SASKATCHEWAN', 20, 300000, 200001),
(30, 25, 'SASKATCHEWAN', 25, 999999, 300001),
(31, 10, 'MANITOBA', 10, 50000, 0),
(32, 12, 'MANITOBA', 12, 100000, 50001),
(33, 15, 'MANITOBA', 15, 200000, 100001),
(34, 20, 'MANITOBA', 20, 300000, 200001),
(35, 25, 'MANITOBA', 25, 999999, 300001);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee_job_postings`
--
ALTER TABLE `employee_job_postings`
  ADD KEY `FKacgfy8mgg50bsvr0sknrc2yvy` (`jobposting_id`),
  ADD KEY `FKc0cjirbvikbwevwh99jyu43gq` (`user_id`);

--
-- Indexes for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `FK398vvu81xw154mvy3g2eytscn` (`role_id`);

--
-- Indexes for table `interview_questions`
--
ALTER TABLE `interview_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4c50epmikemxbq0sqv548kmvx` (`jobposting_id`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKau92vqwrrlsflir3v65262ucw` (`employee_id`),
  ADD KEY `FKb4ebyr2a18dw99dr2nufqt264` (`tax_id`);

--
-- Indexes for table `job_applicants`
--
ALTER TABLE `job_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_applicants_postings`
--
ALTER TABLE `job_applicants_postings`
  ADD PRIMARY KEY (`applicant_id`,`jobposting_id`),
  ADD KEY `FK4mtiq85joiloif89s3h7kncwy` (`jobposting_id`);

--
-- Indexes for table `job_postings`
--
ALTER TABLE `job_postings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`);

--
-- Indexes for table `tax`
--
ALTER TABLE `tax`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `interview_questions`
--
ALTER TABLE `interview_questions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee_job_postings`
--
ALTER TABLE `employee_job_postings`
  ADD CONSTRAINT `FKacgfy8mgg50bsvr0sknrc2yvy` FOREIGN KEY (`jobposting_id`) REFERENCES `job_postings` (`id`),
  ADD CONSTRAINT `FKc0cjirbvikbwevwh99jyu43gq` FOREIGN KEY (`user_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `employee_roles`
--
ALTER TABLE `employee_roles`
  ADD CONSTRAINT `FK398vvu81xw154mvy3g2eytscn` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `FKpdub285htr42r4u9u7jx6kr8n` FOREIGN KEY (`user_id`) REFERENCES `employee` (`id`);

--
-- Constraints for table `interview_questions`
--
ALTER TABLE `interview_questions`
  ADD CONSTRAINT `FK4c50epmikemxbq0sqv548kmvx` FOREIGN KEY (`jobposting_id`) REFERENCES `job_postings` (`id`);

--
-- Constraints for table `invoice`
--
ALTER TABLE `invoice`
  ADD CONSTRAINT `FKau92vqwrrlsflir3v65262ucw` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `FKb4ebyr2a18dw99dr2nufqt264` FOREIGN KEY (`tax_id`) REFERENCES `tax` (`id`);

--
-- Constraints for table `job_applicants_postings`
--
ALTER TABLE `job_applicants_postings`
  ADD CONSTRAINT `FK4mtiq85joiloif89s3h7kncwy` FOREIGN KEY (`jobposting_id`) REFERENCES `job_postings` (`id`),
  ADD CONSTRAINT `FKet0vwve4p00wg921dwuse7g0w` FOREIGN KEY (`applicant_id`) REFERENCES `job_applicants` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
