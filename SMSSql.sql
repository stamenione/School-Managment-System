CREATE TABLE `classroom` (
  `idclassroom` int NOT NULL AUTO_INCREMENT,
  `classroomNumber` int DEFAULT NULL,
  `numberOfSeats` int DEFAULT NULL,
  PRIMARY KEY (`idclassroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exam` (
  `idexam` int NOT NULL AUTO_INCREMENT,
  `dateStart` date DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `idExaminationPeriod` int DEFAULT NULL,
  `idSubject` int DEFAULT NULL,
  PRIMARY KEY (`idexam`),
  KEY `idExaminationPeriod_idx` (`idExaminationPeriod`),
  KEY `idSubjectE_idx` (`idSubject`),
  CONSTRAINT `idExaminationPeriodE` FOREIGN KEY (`idExaminationPeriod`) REFERENCES `examinationperiod` (`idexaminationperiod`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idSubjectE` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idsubject`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examclassroom` (
  `idexamclassroom` int NOT NULL AUTO_INCREMENT,
  `idExam` int DEFAULT NULL,
  `idClassroom` int DEFAULT NULL,
  PRIMARY KEY (`idexamclassroom`),
  KEY `idExamEC_idx` (`idExam`),
  KEY `idClassroomEC_idx` (`idClassroom`),
  CONSTRAINT `idClassroomEC` FOREIGN KEY (`idClassroom`) REFERENCES `classroom` (`idclassroom`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idExamEC` FOREIGN KEY (`idExam`) REFERENCES `exam` (`idexam`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examinationperiod` (
  `idexaminationperiod` int NOT NULL AUTO_INCREMENT,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`idexaminationperiod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `learningmaterials` (
  `idlearningmaterials` int NOT NULL AUTO_INCREMENT,
  `file` blob,
  `name` varchar(45) DEFAULT NULL,
  `idSubject` int DEFAULT NULL,
  PRIMARY KEY (`idlearningmaterials`),
  KEY `idSubjectLM_idx` (`idSubject`),
  CONSTRAINT `idSubjectLM` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idsubject`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `notification` (
  `idnotification` int NOT NULL AUTO_INCREMENT,
  `message` varchar(10000) DEFAULT NULL,
  `idSubject` int DEFAULT NULL,
  PRIMARY KEY (`idnotification`),
  KEY `idSubject_idx` (`idSubject`),
  CONSTRAINT `idSubject` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idsubject`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `obligation` (
  `idobligation` int NOT NULL AUTO_INCREMENT,
  `points` double DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `isAppeared` tinyint DEFAULT NULL,
  `classroomNumber` int DEFAULT NULL,
  `obligationType` varchar(20) DEFAULT NULL,
  `idExam` int DEFAULT NULL,
  `idSubjectGrade` int DEFAULT NULL,
  PRIMARY KEY (`idobligation`),
  KEY `idExamO_idx` (`idExam`),
  KEY `idSubjectGradeO_idx` (`idSubjectGrade`),
  CONSTRAINT `idExamO` FOREIGN KEY (`idExam`) REFERENCES `exam` (`idexam`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idSubjectGradeO` FOREIGN KEY (`idSubjectGrade`) REFERENCES `subjectgrade` (`idsubjectgrade`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `proposition` (
  `idproposition` int NOT NULL AUTO_INCREMENT,
  `k` int DEFAULT NULL,
  `l` int DEFAULT NULL,
  `i` int DEFAULT NULL,
  `idSubject` int DEFAULT NULL,
  PRIMARY KEY (`idproposition`),
  KEY `idSubjectPP_idx` (`idSubject`),
  CONSTRAINT `idSubjectPP` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idsubject`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reservation` (
  `idReservation` int NOT NULL AUTO_INCREMENT,
  `dateStart` date DEFAULT NULL,
  `dateEnd` date DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `idClassroom` int DEFAULT NULL,
  PRIMARY KEY (`idReservation`),
  KEY `idClassroomR_idx` (`idClassroom`),
  CONSTRAINT `idClassroomR` FOREIGN KEY (`idClassroom`) REFERENCES `classroom` (`idclassroom`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subject` (
  `idsubject` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `espbPoints` int DEFAULT NULL,
  `semester` int DEFAULT NULL,
  PRIMARY KEY (`idsubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subjectgrade` (
  `idsubjectgrade` int NOT NULL AUTO_INCREMENT,
  `finalGrade` double DEFAULT NULL,
  `yearOfEnrollment` date DEFAULT NULL,
  `idUser` int DEFAULT NULL,
  `idSubject` int DEFAULT NULL,
  PRIMARY KEY (`idsubjectgrade`),
  KEY `idUserSG_idx` (`idUser`),
  KEY `idSubjectSG_idx` (`idSubject`),
  CONSTRAINT `idSubjectSG` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idsubject`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idUserSG` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `image` blob,
  `dayOfBirth` date DEFAULT NULL,
  `index` varchar(10) DEFAULT NULL,
  `espb` int DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `yearEnrolled` date DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `userType` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

