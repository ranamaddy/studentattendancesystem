-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2023 at 11:49 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `studentattendancesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendancerecords`
--

CREATE TABLE `attendancerecords` (
  `attendance_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `attendance_date` date NOT NULL,
  `status` varchar(255) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendancerecords`
--

INSERT INTO `attendancerecords` (`attendance_id`, `student_id`, `class_id`, `attendance_date`, `status`, `remarks`) VALUES
(1, 1, 2, '2023-10-20', 'Present', ''),
(2, 4, 2, '2023-10-20', 'Present', ''),
(3, 5, 2, '2023-10-20', 'Present', ''),
(4, 1, 2, '2023-10-20', 'Present', ''),
(5, 4, 2, '2023-10-20', 'Present', ''),
(6, 1, 2, '0000-00-00', 'Present', ''),
(7, 4, 2, '0000-00-00', 'Present', ''),
(9, 1, 2, '2023-10-27', 'Absent', 'madd'),
(10, 4, 2, '2023-10-27', 'Present', 'good'),
(11, 5, 2, '2023-10-27', 'Absent', '');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_subjects`
--

CREATE TABLE `attendance_subjects` (
  `attendance_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(255) NOT NULL,
  `section` varchar(255) NOT NULL,
  `class_teacher` varchar(255) NOT NULL,
  `class_schedule` varchar(255) NOT NULL,
  `other_details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`class_id`, `class_name`, `section`, `class_teacher`, `class_schedule`, `other_details`) VALUES
(2, 'bscs', '2nd', 'rana mudassar', '123', ''),
(3, 'bscs', '1st', 'rana mudassar', '123', 'aa');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `student_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `roll_number` varchar(255) NOT NULL,
  `class_id` int(11) NOT NULL,
  `section` varchar(255) NOT NULL,
  `admission_number` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`student_id`, `name`, `roll_number`, `class_id`, `section`, `admission_number`) VALUES
(1, 'rana mudassar rasool', '12345', 2, '3rd', '321'),
(4, 'nazim', '333', 2, '1st', '333'),
(5, 'usman', '444', 2, '1st', '444');

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE `subjects` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `department` varchar(255) NOT NULL,
  `other_details` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `teacher_name`, `designation`, `department`, `other_details`) VALUES
(2, 'rana', 'visiting leacturer', 'bscs', 'lodhran');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_subjects`
--

CREATE TABLE `teacher_subjects` (
  `teacher_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendancerecords`
--
ALTER TABLE `attendancerecords`
  ADD PRIMARY KEY (`attendance_id`),
  ADD KEY `student_id` (`student_id`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `attendance_subjects`
--
ALTER TABLE `attendance_subjects`
  ADD PRIMARY KEY (`attendance_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `roll_number` (`roll_number`),
  ADD UNIQUE KEY `admission_number` (`admission_number`),
  ADD KEY `class_id` (`class_id`);

--
-- Indexes for table `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indexes for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD PRIMARY KEY (`teacher_id`,`subject_id`),
  ADD KEY `subject_id` (`subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendancerecords`
--
ALTER TABLE `attendancerecords`
  MODIFY `attendance_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `subjects`
--
ALTER TABLE `subjects`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendancerecords`
--
ALTER TABLE `attendancerecords`
  ADD CONSTRAINT `attendancerecords_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  ADD CONSTRAINT `attendancerecords_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

--
-- Constraints for table `attendance_subjects`
--
ALTER TABLE `attendance_subjects`
  ADD CONSTRAINT `attendance_subjects_ibfk_1` FOREIGN KEY (`attendance_id`) REFERENCES `attendancerecords` (`attendance_id`),
  ADD CONSTRAINT `attendance_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);

--
-- Constraints for table `teacher_subjects`
--
ALTER TABLE `teacher_subjects`
  ADD CONSTRAINT `teacher_subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`),
  ADD CONSTRAINT `teacher_subjects_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
