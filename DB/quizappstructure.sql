SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `quizapp`
--
-- Table structure for table `proctoring_log`
--
CREATE TABLE `proctoring_log` (
  `pid` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `test_id` varchar(100) NOT NULL,
  `voice_db` int(100) DEFAULT '0',
  `img_log` longtext NOT NULL,
  `user_movements_updown` tinyint(2) NOT NULL,
  `user_movements_lr` tinyint(2) NOT NULL,
  `user_movements_eyes` tinyint(2) NOT NULL,
  `phone_detection` tinyint(2) NOT NULL,
  `person_status` tinyint(2) NOT NULL,
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `questions_uid` bigint(20) NOT NULL,
  `test_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qid` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `q` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ans` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `marks` int(25) NOT NULL,
  `uid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `sid` bigint(20) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `qid` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ans` longtext COLLATE utf8mb4_unicode_ci,
  `uid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `studenttestinfo`
--

CREATE TABLE `studenttestinfo` (
  `stiid` bigint(20) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time_left` time NOT NULL,
  `completed` tinyint(1) DEFAULT '0',
  `uid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `tid` bigint(20) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_type` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `duration` int(25) NOT NULL,
  `show_ans` int(25) NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `neg_marks` int(50) NOT NULL,
  `calc` tinyint(2) NOT NULL,
  `proctoring_type` tinyint(2) NOT NULL DEFAULT '0',
  `uid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `uid` bigint(20) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `register_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_image` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_login` tinyint(2) NOT NULL,
  `examcredits` int(11) NOT NULL DEFAULT '7'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `window_estimation_log`
--

CREATE TABLE `window_estimation_log` (
  `wid` bigint(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `test_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `window_event` tinyint(2) NOT NULL,
  `transaction_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for table `proctoring_log`
--
ALTER TABLE `proctoring_log`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `proctor_email_index` (`email`),
  ADD KEY `proctor_email_test_id_index` (`email`,`test_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`questions_uid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `studenttestinfo`
--
ALTER TABLE `studenttestinfo`
  ADD PRIMARY KEY (`stiid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`tid`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uid`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `window_estimation_log`
--
ALTER TABLE `window_estimation_log`
  ADD PRIMARY KEY (`wid`),
  ADD KEY `uid` (`uid`);

-- AUTO_INCREMENT for table `proctoring_log`
--
ALTER TABLE `proctoring_log`
  MODIFY `pid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `questions_uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `sid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studenttestinfo`
--
ALTER TABLE `studenttestinfo`
  MODIFY `stiid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `tid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `uid` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `window_estimation_log`
--
ALTER TABLE `window_estimation_log`
  MODIFY `wid` bigint(20) NOT NULL AUTO_INCREMENT;


--
-- Constraints for table `proctoring_log`
--
ALTER TABLE `proctoring_log`
  ADD CONSTRAINT `proctoring_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `studenttestinfo`
--
ALTER TABLE `studenttestinfo`
  ADD CONSTRAINT `studenttestinfo_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);

--
-- Constraints for table `window_estimation_log`
--
ALTER TABLE `window_estimation_log`
  ADD CONSTRAINT `window_estimation_log_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`);
COMMIT;