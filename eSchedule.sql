CREATE DATABASE eSchedule;
USE eSchedule;

CREATE TABLE Announcements(
	Id INT NOT NULL AUTO_INCREMENT,
	DateAndTime DATETIME NOT NULL,
	Announcement TEXT NOT NULL,
	Professor VARCHAR(30) NOT NULL,
	PRIMARY KEY(Id)
);

CREATE TABLE Users(
	Id INT NOT NULL AUTO_INCREMENT,
	Username VARCHAR(30) NOT NULL,
	Userpass VARCHAR(30) NOT NULL,
	Usertype VARCHAR(30) NOT NULL,
	PRIMARY KEY(Id)
);

INSERT INTO Users(Username,Userpass,Usertype) VALUES('adminX','passwordY','admin');