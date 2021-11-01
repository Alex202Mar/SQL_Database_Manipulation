/*
Assessment 2 for CMP2806M Scalable Database Systems 
*/

/* Deleting any instances of the database so there can't be duplicates */
DROP DATABASE IF EXISTS CMP2806M;

/* Creating and saying that we are going to use the database CMP2806M */
CREATE DATABASE CMP2806M; 
USE CMP2806M;

/* In this section we are creating tables for the database */
CREATE TABLE `Customers` (
  `CustomerEmail` varchar(50) NOT NULL,
  `CustomerFirstname` varchar(50),
  `CustomerLastname` varchar(50) NOT NULL,
  `CustomerHouseNoName` varchar(50) NOT NULL,
  `CustomerCity` varchar(50) NOT NULL,
  `CustomerPostCode` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`CustomerEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Services` (
  `ServiceName` varchar(70) NOT NULL,
  `ServiceDescription` varchar(4000) DEFAULT NULL,
  `ServicePrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ServiceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Staff` (
  `StaffEmail` varchar(100) NOT NULL,
  `StaffFirstname` varchar(50) NOT NULL,
  `StaffLastname` varchar(50) NOT NULL,
  PRIMARY KEY (`StaffEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


CREATE TABLE `Order` (
  `CustomerEmail` varchar(100) NOT NULL,
  `DateTime` DATE NOT NULL,
  `StaffEmail` varchar(100) NOT NULL,
  PRIMARY KEY (`CustomerEmail`, `DateTime`),
  FOREIGN KEY (`CustomerEmail`) REFERENCES `Customers` (`CustomerEmail`),
  FOREIGN KEY (`StaffEmail`) REFERENCES `Staff` (`StaffEmail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `Details` (
  `CustomerEmail` varchar(100) NOT NULL,
  `OrderDateTime` DATE NOT NULL,
  `ServiceName` varchar(70) NOT NULL,
  `ServiceOrderedPrice` decimal(10,2) NOT NULL,
  `Discount` int(11),
  `Quantity` int(11) NOT NULL,
  PRIMARY KEY (`CustomerEmail`, `OrderDateTime`, `ServiceName`),
  FOREIGN KEY (`CustomerEmail`) REFERENCES `Customers` (`CustomerEmail`),
  FOREIGN KEY (`ServiceName`) REFERENCES `Services` (`ServiceName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


/*
Now we have all the necessary tables we are going to populate the tables with data
*/

insert  into `Customers`(`CustomerEmail`,`CustomerFirstname`,`CustomerLastname`,`CustomerHouseNoName`,`CustomerCity`,`CustomerPostCode`) values
 
('mord@gmail.com','Mord','Phillips','20 Spooner Street','Springfield','SS5 23T'),
('ceddimino-1440@yopmail.com','Derek','Johnson','19 Hull Road','Hull','H20 P50'),
('balchen@msn.com','Jack','Smith','Smithsonian House','New York','NY5 69D'),
('nighthawk@verizon.net','Barbra','Jackson','A5 F6','Stevenage','SG7 5RA'),
('grdschl@gmail.com','Harriet','Tallop','13','Donville','DV1 1B'),
('ardagna@live.com','Xiao','Foster','23 West','Chumpsville','USA 506A'),
('mosses@att.net','Mosses','Bibleson','24 Northlane','XXX-New City','X0 X0'),
('dhrakar@outlook.com','Lex','Luther','Luther Tower','Metropolis','MP7 QR8'),
('doormat@yahoo.ca','Bruce','Wayne','Wayne Manor','Gotham','GM1 5FF'),
('sinkou@comcast.net','Richard','Tether','Apartment 5','Birmingham','BD3 20F'),
('shouluou@comcast.net','','George','Flat 5','Taloola','TTS 501') ;

insert  into `Services`(`ServiceName`,`ServiceDescription`,`ServicePrice`) values

('Data Loss & Retrieval', 'Lost Data will be attemptedly recovered', '200'),
('Hardware faults & Upgrades', 'Will fix/Upgrade the customers PC', '65'),
('Virus or Spyware Removal', 'Will Remove any Virus or Spyware that is hidden on customers device', '45'),
('Phone & Tablet Repairs', 'Will Repair Customers Phone or Tablet', '20'),
('Network Setup or Repairs', 'Will Setup a LAN OR WAN for the customer or repair an existing one', '400'),
('OS Support', 'Will provide a complete system reinstall for customer', '130'),
('Computer Training', 'Train the Customer in fundamentals of using a computer, word, browsing, etc.', '500'),
('PC Crashing and freezing', 'Attempt to fix any crashing or freezing problems a PC might have', '50'),
('Software Errors', 'Attempt to fix any Software errors', '10'),
('Internet & Wi-Fi Connections', 'Will connect devices to the internet/Wi-Fi and sort out router settings', '65');

insert into `Staff` (`StaffEmail`, `StaffFirstname`, `StaffLastname`) values 
('AB123@LCS.net', 'Andrew', 'Witner'), 
('CD456@LCS.net', 'Charlie', 'Day'), 
('EF789@LCS.net', 'Edward', 'Flemming'), 
('GH101@LCS.net', 'Garreth', 'Hefner'), 
('IJ112@LCS.net', 'Ian', 'Jackson'), 
('KL131@LCS.net', 'Kelly', 'Litner'), 
('MN415@LCS.net', 'Michelle', 'Nocturn'), 
('OP161@LCS.net', 'Oliver', 'Pettigue'), 
('QR171@LCS.net', 'Quill', 'Richardson'), 
('ST819@LCS.net', 'Stewart', 'Tillbert'), 
('UV202@LCS.net', 'Ubert', 'Vennet');

insert into `Order` (`CustomerEmail`, `DateTime`, `StaffEmail`) values 
('balchen@msn.com', '2019-12-10', 'AB123@LCS.net'), 
('ardagna@live.com', '2019-12-10', 'EF789@LCS.net'), 
('ceddimino-1440@yopmail.com', '2019-12-05', 'CD456@LCS.net'), 
('dhrakar@outlook.com', '2019-12-06', 'CD456@LCS.net'), 
('doormat@yahoo.ca', '2019-12-01', 'GH101@LCS.net'), 
('grdschl@gmail.com', '2019-12-07', 'KL131@LCS.net'), 
('mord@gmail.com', '2019-12-03', 'MN415@LCS.net'), 
('mosses@att.net', '2019-12-09', 'OP161@LCS.net'), 
('nighthawk@verizon.net', '2019-12-05', 'ST819@LCS.net'), 
('sinkou@comcast.net', '2019-12-08', 'UV202@LCS.net'),
('shouluou@comcast.net', '2019-12-01', 'UV202@LCS.net'),
('shouluou@comcast.net', '2019-12-02', 'MN415@LCS.net');

insert into `Details` (`CustomerEmail`, `OrderDateTime`, `ServiceName`, `ServiceOrderedPrice`, `Discount`, `Quantity`) values 
('balchen@msn.com', '2019-12-10', 'Software Errors', '10.00', NULL, '1'), 
('ardagna@live.com', '2019-12-10', 'Computer Training', '500.00', '10', '5'), 
('ceddimino-1440@yopmail.com', '2019-12-05', 'Network Setup or Repairs', '400.00', '25', '2'), 
('dhrakar@outlook.com', '2019-12-06', 'OS Support', '130.00', NULL, '1'), 
('doormat@yahoo.ca', '2019-12-01', 'Phone & Tablet Repairs', '20', '50', '1'), 
('grdschl@gmail.com', '2019-12-07', 'Data Loss & Retrieval', '200', NULL, '1'), 
('mord@gmail.com', '2019-12-03', 'Virus or Spyware Removal', '45', NULL, '1'), 
('mosses@att.net', '2019-12-09', 'Internet & Wi-Fi Connections', '65', NULL, '10'), 
('nighthawk@verizon.net', '2019-12-05', 'OS Support', '130', NULL, '1'), 
('sinkou@comcast.net', '2019-12-08', 'Network Setup or Repairs', '400', NULL, '1'),
('shouluou@comcast.net', '2019-12-01', 'Network Setup or Repairs', '400', NULL, '1'),
('shouluou@comcast.net', '2019-12-02', 'Data Loss & Retrieval', '200', NULL, '1');

/*
In this section we are gonna demonstrate some uses for SQL ALTER
*/

ALTER TABLE `Customers`
DROP COLUMN `CustomerCity`;
/* We use ALTER to drop a specific column in Customers as we already have a postcode so a city isn't necessary */

ALTER TABLE `Services`
MODIFY COLUMN `ServiceDescription` varchar(1000);
/* Before the datatype was varchar(4000) but none of the descriptions are long enough to warrant it being that large of a number */

ALTER TABLE `Customers`
MODIFY COLUMN `CustomerFirstname` varchar(50) AFTER `CustomerLastname`;
/* Here we reposition the Firstname to be after the last name as it is better to Identify customers by their Lastname */

/* QUERY 1 */
CREATE VIEW Query1 AS
SELECT `Details`.`ServiceName`, `Customers`.`CustomerEmail`, `Customers`.`CustomerFirstname`, `Customers`.`CustomerLastname`, `Customers`.`CustomerHouseNoName`, `Customers`.`CustomerPostCode`
FROM `Details`
LEFT JOIN `Customers` 
ON `Details`.`CustomerEmail` = `Customers`.`CustomerEmail`
ORDER BY `Details`.`ServiceName`; 
SELECT * FROM Query1;
/* This makes it so that you can view the details  of  customers  who  have  placed  an order outside of looking at the Customers and Details Tables (view by clicking on the database) */
/* Not all customers have given a first name, so it is LEFT JOIN */

/* QUERY 2 */
CREATE VIEW Query2 AS
SELECT `Staff`.`StaffEmail`, `Staff`.`StaffFirstname`, `Staff`.`StaffLastname`, `Order`.`CustomerEmail`, `Order`.`DateTime`
FROM `Order`
RIGHT JOIN `Staff` 
ON  `Order`.`StaffEmail` = `Staff`.`StaffEmail`
ORDER BY `Staff`.`StaffEmail`; 
SELECT * FROM Query2;
/* This displays all the Employees and will show next to their name the customer-email and date/time, this shows whether or not they have a current order as if it returns NULL then they don't (view by clicking on the database) */
/* Not all Staff have a current Order, so it is RIGHT JOIN */

/* QUERY 3 */
CREATE VIEW Query3 AS
SELECT `Customers`.`CustomerEmail`, `Customers`.`CustomerFirstname`, `Customers`.`CustomerLastname`, `Details`.`OrderDateTime`, `Details`.`ServiceName`, `Details`.`ServiceOrderedPrice`, `Details`.`Discount`, `Details`.`Quantity`
FROM `Details`
RIGHT JOIN `Customers` 
ON  `Details`.`CustomerEmail` = `Customers`.`CustomerEmail`
ORDER BY `Customers`.`CustomerEmail`; 
SELECT * FROM Query3;
/* This Displays the Customers names and email and shows their Order(s) Details (view by clicking on the database) */
/* This is RIGHT JOIN because customers can have multiple orders */


/* This section is to create copies of the tables */
CREATE TABLE `copy_of_Customers` LIKE `Customers`; 
INSERT INTO `copy_of_Customers` SELECT * FROM `Customers`;


CREATE TABLE `copy_of_Services` LIKE `Services`; 
INSERT INTO `copy_of_Services` SELECT * FROM `Services`;


CREATE TABLE `copy_of_Staff` LIKE `Staff`; 
INSERT INTO `copy_of_Staff` SELECT * FROM `Staff`;


CREATE TABLE `copy_of_Order` LIKE `Order`; 
INSERT INTO `copy_of_Order` SELECT * FROM `Order`;


CREATE TABLE `copy_of_Details` LIKE `Details`; 
INSERT INTO `copy_of_Details` SELECT * FROM `Details`;


/* 
Procedure 
This procedure simply checks to see if num equals 11 and if it does then it will display that customer exists
*/

DELIMITER $$

CREATE PROCEDURE p1(IN num INT, OUT message VARCHAR(255))
BEGIN
	IF (num = 11) THEN
		SET message = "Table Customers Exists";
	ELSE
		SET message = "Table Customers doesn't exist";
	END IF;
END$$
 
DELIMITER ;

call p1(11, @message);
SELECT @message;

