

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- Database: `students`

-- Table structure for table `attendence`

CREATE TABLE `attendence` (
  `aid` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `attendance` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `attendence`

INSERT INTO `attendence` (`aid`, `rollno`, `attendance`) VALUES
(7, '38', 90),
(8, '31', 43),
(9, '50', 69),
(10, '51', 88);

-- --------------------------------------------------------------------------------------
-- Table structure for table `department`

CREATE TABLE `department` (
  `cid` int(11) NOT NULL,
  `branch` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `department`

INSERT INTO `department` (`cid`, `branch`) VALUES
(2, 'Information Science'),
(3, 'Electronic and Communication'),
(4, 'Electrical & Electronic'),
(5, 'Civil '),
(7, 'computer science'),
(8, 'IOT'),
(9, 'Instrumentation and Control');

-- ----------------------------------------------------------------------------------------

-- Table structure for table `student`

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `rollno` varchar(20) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `sem` int(20) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `branch` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `student`

INSERT INTO `student` (`id`, `rollno`, `sname`, `sem`, `gender`, `branch`, `email`, `number`, `address`) VALUES
(7, '38', 'Pavankumar Khot', 6, 'male', 'Instrumentation and Control', 'pavankumar.khot19@vit.edu', '9307268996', 'Pune'),
(8, '31', 'Varun Kelkar', 6, 'male', 'Instrumentation and Control', 'varun.kelkar19@vit.edu', '2345678174', 'Ratnagiri'),
(9, '50', 'Pranav kushare', 6, 'male', 'Instrumentation and Control', 'pranav.kushare19@vit.edu', '1234739868', 'Nashik'),
(10, '51', 'Pratik Lagad', 6, 'male', 'Instrumentation and Control', 'pratik.lagad19@vit.edu', '5678236496', 'Pandharpur');

-- Triggers `student`

DELIMITER $$
CREATE TRIGGER `DELETE` BEFORE DELETE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,OLD.rollno,'STUDENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `Insert` AFTER INSERT ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT INSERTED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE` AFTER UPDATE ON `student` FOR EACH ROW INSERT INTO trig VALUES(null,NEW.rollno,'STUDENT UPDATED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

-- Table structure for table `test`

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(52) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

-- Table structure for table `trig`

CREATE TABLE `trig` (
  `tid` int(11) NOT NULL,
  `rollno` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table `trig`

INSERT INTO `trig` (`tid`, `rollno`, `action`, `timestamp`) VALUES
(10, '38', 'STUDENT INSERTED', '2022-06-04 10:26:41'),
(11, '31', 'STUDENT INSERTED', '2022-06-04 10:29:44'),
(12, '50', 'STUDENT INSERTED', '2022-06-04 10:30:39'),
(13, '51', 'STUDENT INSERTED', '2022-06-04 10:31:21');

-- ----------------------------------------------------------------------

-- Table structure for table `user`

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(5, 'Pavan', 'pavankumar.khot19@vit.edu', 'pbkdf2:sha256:260000$UW9HDy4618YaY7uY$267edf193b997e22602764429b91156db22b338c46711ee7c1ae2d0298adde7e'),
(6, 'Varun', 'varun.kelkar19@vit.edu', 'pbkdf2:sha256:260000$sHVMM9MO6YPjs8MS$f3e20986d1341c02bc28edaf8ca884cb21162668dab210e2108b31522006aedb'),
(7, 'Pranav', 'pranav.kushare19@vit.edu', 'pbkdf2:sha256:260000$hgmWxX2DxBXQFdPw$62c285f4e495649f93c5daac5171f1d1429505205bb07ad21d9a638efd192adc'),
(8, 'Pratik', 'pratik.lagad19@vit.edu', 'pbkdf2:sha256:260000$Thia3vy8RmNa57Fw$7c6d4782a837150dbd67a19be7bfab7390f417de6e1d167989bfd53eca3a44b2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendence`
--
ALTER TABLE `attendence`
  ADD PRIMARY KEY (`aid`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trig`
--
ALTER TABLE `trig`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendence`
--
ALTER TABLE `attendence`
  MODIFY `aid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `cid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `trig`
--
ALTER TABLE `trig`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;
