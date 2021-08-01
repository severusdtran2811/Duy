DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

-- create table 1: Department
CREATE TABLE Department(
	DepartmentID 				TINYINT UNSIGNED PRIMARY KEY,				
    DepartmentName				VARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 2: Position
CREATE TABLE `Position`(
	PositionID  				TINYINT UNSIGNED PRIMARY KEY,
    PositionName 				ENUM ('Dev', 'Test', 'Scrum Master', 'PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
CREATE TABLE `Account`(
	AccountID 					TINYINT UNSIGNED PRIMARY KEY,
    Email 						VARCHAR(50) NOT NULL UNIQUE KEY,
    Username 					VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName 					VARCHAR(50) NOT NULL,
    DepartmentID 				TINYINT UNSIGNED NOT NULL,
    PositionID 					TINYINT UNSIGNED NOT NULL,
    CreateDate 					DATETIME,
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
CREATE TABLE `Group`(
	GroupID 					TINYINT UNSIGNED PRIMARY KEY,
	GroupName 					VARCHAR(50) NOT NULL UNIQUE KEY,
	CreaterID 					TINYINT UNSIGNED NOT NULL,
	CreateDate 					DATETIME,
    FOREIGN KEY(CreaterID) REFERENCES `Account`(AccountID)
);

-- create table 5: GroupAccount
CREATE TABLE GroupAccount(
	GroupID 					TINYINT UNSIGNED NOT NULL,
    AccountID					TINYINT UNSIGNED NOT NULL,
    JoinDate 					DATETIME,
    PRIMARY KEY (GroupID, AccountID)
    );
    
-- create table 6: TypeQuestion
CREATE TABLE TypeQuestion(
	TypeID 						TINYINT UNSIGNED PRIMARY KEY,
    TypeName   					ENUM ('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
    );

-- create table 7: CategoryQuestion    
CREATE TABLE CategoryQuestion(
	CategoryID   				TINYINT UNSIGNED PRIMARY KEY,
    CategoryName 				VARCHAR(50) NOT NULL UNIQUE KEY
    );

-- create table 8: Question    
CREATE TABLE Question(
	QuestionID 					TINYINT UNSIGNED PRIMARY KEY,
    Content    					VARCHAR(100) NOT NULL,
    CategoryID 					TINYINT UNSIGNED NOT NULL,
    TypeID     					TINYINT UNSIGNED NOT NULL,
    CreatorID  					TINYINT UNSIGNED NOT NULL,
    CreateDate 					DATETIME,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
    );

-- create table 9: Answer    
CREATE TABLE Answer(
	AnswerID   					TINYINT UNSIGNED PRIMARY KEY,
    Content    					VARCHAR(100) NOT NULL,
    QuestionID 					TINYINT UNSIGNED NOT NULL,
    isCorrect  					ENUM('TRUE','FALSE'),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
    );

-- create table 10: Exam    
CREATE TABLE Exam(
	ExamID     					TINYINT UNSIGNED PRIMARY KEY,
    `Code` 	   					CHAR(10) NOT NULL,
    Title  	   					VARCHAR(50) NOT NULL,
    CategoryID 					TINYINT UNSIGNED NOT NULL ,
    Duration   					TIME NOT NULL,
    CreatorID  					TINYINT UNSIGNED NOT NULL,
    CreateDate 					DATETIME,
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID)
    );

-- create table 11: ExamQuestion    
CREATE TABLE ExamQuestion(
	ExamID     					TINYINT UNSIGNED,
    QuestionID 					TINYINT UNSIGNED,
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    PRIMARY KEY(ExamID,QuestionID)
    );
    
