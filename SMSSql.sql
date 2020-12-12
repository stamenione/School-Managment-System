CREATE TABLE `administrator` (
  `idAdministrator` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idAdministrator`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `idUserA` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `classroom` (
  `idClassroom` int NOT NULL,
  `classroomNumber` int NOT NULL,
  `numberOfSeats` int NOT NULL,
  `description` varchar(45) NOT NULL,
  PRIMARY KEY (`idClassroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `exam` (
  `idExam` int NOT NULL,
  `dateOfStart` date NOT NULL,
  `duration` int NOT NULL,
  `idExaminationPeriod` int NOT NULL,
  `idSubject` int NOT NULL,
  PRIMARY KEY (`idExam`),
  KEY `idExaminationPeriodE_idx` (`idExaminationPeriod`),
  KEY `idSubjectE_idx` (`idSubject`),
  CONSTRAINT `idExaminationPeriodE` FOREIGN KEY (`idExaminationPeriod`) REFERENCES `examinationperiod` (`idExaminationPeriod`),
  CONSTRAINT `idSubjectE` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examclassroom` (
  `idExamClassroom` int NOT NULL,
  `idExam` int NOT NULL,
  `idClassroom` int NOT NULL,
  PRIMARY KEY (`idExamClassroom`),
  KEY `idExamEC_idx` (`idExam`),
  KEY `idClassroomEC_idx` (`idClassroom`),
  CONSTRAINT `idClassroomEC` FOREIGN KEY (`idClassroom`) REFERENCES `classroom` (`idClassroom`),
  CONSTRAINT `idExamEC` FOREIGN KEY (`idExam`) REFERENCES `exam` (`idExam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examinationperiod` (
  `idExaminationPeriod` int NOT NULL,
  `dateOfStart` date NOT NULL,
  `dateOfEnd` date NOT NULL,
  `semester` int NOT NULL,
  PRIMARY KEY (`idExaminationPeriod`),
  KEY `idExaminationPeriod` (`idExaminationPeriod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `examobligation` (
  `isAppeard` int NOT NULL,
  `classroomNumber` int NOT NULL,
  `idExam` int NOT NULL,
  `idObligation` int NOT NULL,
  PRIMARY KEY (`idObligation`),
  KEY `idExamEO_idx` (`idExam`) /*!80000 INVISIBLE */,
  CONSTRAINT `idExamEO` FOREIGN KEY (`idExam`) REFERENCES `exam` (`idExam`),
  CONSTRAINT `idObligationEO` FOREIGN KEY (`idObligation`) REFERENCES `obligation` (`idObligation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `labobligation` (
  `idLabObligation` int NOT NULL,
  `idObligation` int NOT NULL,
  PRIMARY KEY (`idLabObligation`),
  KEY `idObligationLO_idx` (`idObligation`),
  CONSTRAINT `idObligationLO` FOREIGN KEY (`idObligation`) REFERENCES `obligation` (`idObligation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `learningmaterials` (
  `idLearningMaterials` int NOT NULL,
  `file` blob NOT NULL,
  `name` varchar(45) NOT NULL,
  `idSubject` int NOT NULL,
  PRIMARY KEY (`idLearningMaterials`),
  KEY `idSubjectLM_idx` (`idSubject`),
  CONSTRAINT `idSubjectLM` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `notification` (
  `idNotification` int NOT NULL,
  `message` varchar(10000) NOT NULL,
  `idSubject` int NOT NULL,
  PRIMARY KEY (`idNotification`),
  KEY `idSubjectN_idx` (`idSubject`),
  CONSTRAINT `idSubjectN` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `professor` (
  `idProfessor` int NOT NULL,
  `department` varchar(50) NOT NULL,
  `qualification` varchar(45) NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`idProfessor`),
  KEY `idUser_idx` (`idUser`),
  CONSTRAINT `idUserP` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `obligation` (
  `idObligation` int NOT NULL,
  `points` double NOT NULL,
  `status` tinyint NOT NULL,
  `idSubjectGrade` int NOT NULL,
  PRIMARY KEY (`idObligation`),
  KEY `idSubjectGradeO_idx` (`idSubjectGrade`),
  CONSTRAINT `idSubjectGradeO` FOREIGN KEY (`idSubjectGrade`) REFERENCES `subjectgrade` (`idSubjectGrade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `projectobligation` (
  `idObligation` int NOT NULL,
  PRIMARY KEY (`idObligation`),
  CONSTRAINT `idObligationPO` FOREIGN KEY (`idObligation`) REFERENCES `obligation` (`idObligation`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `relationshipps` (
  `idRelationshipPS` int NOT NULL,
  `idProfessor` int NOT NULL,
  `idSubject` int NOT NULL,
  PRIMARY KEY (`idRelationshipPS`),
  KEY `idSubject_idx` (`idSubject`),
  KEY `idProfessor_idx` (`idProfessor`),
  CONSTRAINT `idProfessor` FOREIGN KEY (`idProfessor`) REFERENCES `professor` (`idProfessor`),
  CONSTRAINT `idSubjectPS` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `proposition` (
  `idProposition` int NOT NULL,
  `k` int NOT NULL,
  `l` int NOT NULL,
  `i` int NOT NULL,
  `idSubject` int NOT NULL,
  PRIMARY KEY (`idProposition`),
  KEY `idSubjectPP_idx` (`idSubject`),
  CONSTRAINT `idSubjectPP` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `reservation` (
  `idReservation` int NOT NULL,
  `dateOfStart` date NOT NULL,
  `duration` int NOT NULL,
  `idClassroom` int NOT NULL,
  PRIMARY KEY (`idReservation`),
  KEY `idClassroomR_idx` (`idClassroom`),
  CONSTRAINT `idClassroomR` FOREIGN KEY (`idClassroom`) REFERENCES `classroom` (`idClassroom`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `student` (
  `idStudent` int NOT NULL,
  `index` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  `espb` int NOT NULL,
  `yearEnrolled` int NOT NULL,
  `idUserS` int NOT NULL,
  PRIMARY KEY (`idStudent`),
  KEY `idUserS_idx` (`idUserS`),
  CONSTRAINT `idUserS` FOREIGN KEY (`idUserS`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subject` (
  `idSubject` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `espbPoints` int NOT NULL,
  `semester` int NOT NULL,
  `idStudent` int NOT NULL,
  PRIMARY KEY (`idSubject`),
  KEY `idStudent_idx` (`idStudent`),
  CONSTRAINT `idStudentS` FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `subjectgrade` (
  `idSubjectGrade` int NOT NULL,
  `FinalGrade` int NOT NULL,
  `yearOfEnrollment` date NOT NULL,
  `idSubject` int NOT NULL,
  `idStudent` int NOT NULL,
  PRIMARY KEY (`idSubjectGrade`),
  KEY `idSubject_idx` (`idSubject`),
  KEY `idStudent_idx` (`idStudent`),
  CONSTRAINT `idStudent` FOREIGN KEY (`idStudent`) REFERENCES `student` (`idStudent`),
  CONSTRAINT `idSubject` FOREIGN KEY (`idSubject`) REFERENCES `subject` (`idSubject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `user` (
  `idUser` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `surrname` varchar(45) NOT NULL,
  `image` blob NOT NULL,
  `dayOfBirth` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
