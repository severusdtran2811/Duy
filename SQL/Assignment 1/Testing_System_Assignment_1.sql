DROP DATABASE IF EXISTS Testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;


CREATE TABLE Department(
	DepartmentID 					INT,				
	DepartmentName					VARCHAR(50)
	);

CREATE TABLE `Position`(
	PositionID  					INT,
	PositionName 					VARCHAR(50)
	);

CREATE TABLE `Account`(
	AccountID 					INT,
	Email 						VARCHAR(50),
	Username 					VARCHAR(50),
	FullName 					VARCHAR(50),
	DepartmentID 					INT,
	PositionID 					INT,
	CreateDate 					DATE
	);

CREATE TABLE `Group`(
	GroupID 					INT,
	GroupName 					VARCHAR(50),
	CreatorID 					INT,
	CreateDate 					DATE
	);

CREATE TABLE GroupAccount(
	GroupID 					INT,
	AccountID					INT,
	JoinDate 					DATE
	);

CREATE TABLE TypeQuestion(
	TypeID 						INT,
	TypeName   					VARCHAR(50)
	);

CREATE TABLE CategoryQuestion(
	CategoryID   					INT,
	CategoryName 					VARCHAR(50)
	);
    
CREATE TABLE Question(
	QuestionID 					INT,
	Content    					VARCHAR(50),
	CategoryID 					INT,
	TypeID     					INT,
	CreatorID  					INT,
	CreateDate 					DATE
	);
    
CREATE TABLE Answer(
	AnswerID   					INT,
	Content    					VARCHAR(50),
	QuestionID 					INT,
	isCorrect  					ENUM('TRUE','FALSE')
	);
    
CREATE TABLE Exam(
	ExamID     					INT,
	`Code` 	   					VARCHAR(50),
	Title  	   					VARCHAR(50),
	CategoryID 					INT,
	Duration   					INT,
	CreatorID  					INT,
	CreateDate 					DATE
	);
    
CREATE TABLE ExamQuestion(
	ExamID     					INT,
	QuestionID 					INT
	);
    
