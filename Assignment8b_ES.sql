-- --------------------------------------------------------------------------------
-- Name: Eric
-- Class: IT 111
-- Assignment: Assignment8b
-- --------------------------------------------------------------------------------

-- --------------------------------------------------------------------------------
-- Options
-- --------------------------------------------------------------------------------
USE dbGetemtoBuyit;     -- Get out of the master database
SET NOCOUNT ON;		   -- Report only errors

-- --------------------------------------------------------------------------------
--						Problem #8b
-- --------------------------------------------------------------------------------

-- Drop Table Statements

IF OBJECT_ID ('TCustomers')			IS NOT NULL DROP TABLE TCustomers
IF OBJECT_ID ('TOrders')			IS NOT NULL DROP TABLE TOrders
IF OBJECT_ID ('TProducts')		    IS NOT NULL DROP TABLE TProducts
IF OBJECT_ID ('TVendors')           IS NOT NULL DROP TABLE TVendors


-- --------------------------------------------------------------------------------
--	Step #1 : Create table 
-- --------------------------------------------------------------------------------

CREATE TABLE TCustomers
(
	 intCustomerID		INTEGER			NOT NULL
	,strFirstName		VARCHAR(255)	NOT NULL
	,strLastName		VARCHAR(255)	NOT NULL
	,strAddress			VARCHAR(255)	NOT NULL
	,strCity			VARCHAR(255)	NOT NULL
	,strState			VARCHAR(255)	NOT NULL
	,strZip				VARCHAR(255)	NOT NULL
	,strGender			VARCHAR(255)	NOT NULL
	,strRace			VARCHAR(255)	NOT NULL
	,dtmDateOfBirth		DATETIME		NOT NULL
	,CONSTRAINT TCustomers_PK PRIMARY KEY ( intCustomerID )
)

CREATE TABLE TOrders
(
	 intOrderID 		INTEGER			NOT NULL
	,strOrderNumber		VARCHAR(255)	NOT NULL
	,dtmOrderDate	    DATETIME		NOT NULL
	,strStatus		    VARCHAR(255)	NOT NULL
	,CONSTRAINT TOrders_PK PRIMARY KEY ( intOrderID )
)

CREATE TABLE TProducts
(
	 intProductID	    INTEGER			NOT NULL
	,strProductName		VARCHAR(255)	NOT NULL
	,decProductPrice	DECIMAL		    NOT NULL
	,decRetailCost		DECIMAL		    NOT NULL
	,strProductCategory	VARCHAR(255)	NOT NULL
	,intInventory		INTEGER		    NOT NULL	
	,CONSTRAINT TProducts_PK PRIMARY KEY ( intProductID )
)

CREATE TABLE TVendors
(
	 intVendorID		INTEGER			NOT NULL
	,strVendorName		VARCHAR(255)	NOT NULL
	,strAddress			VARCHAR(255)	NOT NULL
	,strCity			VARCHAR(255)	NOT NULL
	,strState			VARCHAR(255)	NOT NULL
	,strZip				VARCHAR(255)	NOT NULL
	,strCFirstName		VARCHAR(255)	NOT NULL
	,strCLastName		VARCHAR(255)	NOT NULL
	,strCPhoneNumber    VARCHAR(255)    NOT NULL
	,strCEmail          VARCHAR(255)    NOT NULL
	,CONSTRAINT TVendors_PK PRIMARY KEY ( intVendorID )
)
-- --------------------------------------------------------------------------------
--	Step #2 : Add Sample Data - INSERTS
-- --------------------------------------------------------------------------------

INSERT INTO TCustomers (intCustomerID, strFirstName, strLastName, strAddress, strCity, strState, strZip, strGender, strRace, dtmDateOfBirth)
VALUES				   (1, 'James', 'Jones', '321 Elm St.', 'Cincinnati', 'Oh', '45201', 'Male', 'Caucasion', '04/23/1978')
					  ,(2, 'Sally', 'Smith', '987 Main St.', 'Norwood', 'Oh', '45218', 'Female', 'African-American', '11/30/1980')
					  ,(3, 'Jose', 'Hernandez', '1569 Windisch Rd.', 'West Chester', 'Oh', '45069', 'Male', 'Hispanic', '02/18/1990')					 

INSERT INTO TOrders    ( intOrderID, strOrderNumber, dtmOrderDate, strStatus)
VALUES				   ( 1, '1', '07/11/2006', 'En-Route')
					  ,( 2, '2', '02/27/2006', 'Delayed')
					  ,( 3, '3', '03/18/2006', 'Processing')				

INSERT INTO TProducts  ( intProductID, strProductName, decProductPrice, decRetailCost, strProductCategory, intInventory)
VALUES				   (1, 'Light Bulb', 10.30 , 9.40 , 'Home Wares', 346)
				      ,(2, 'Ashtrash', 7.23, 6.11, 'Nick Knacks', 741)
				      ,(3, 'Broom', 8.62, 7.37, 'Tools', 368)

INSERT INTO TVendors   ( intVendorID, strVendorName, strAddress, strCity, strState, strZip, strCFirstName, strCLastName, strCPhoneNumber, strCEmail)
VALUES				   (1, 'Smalls Hardware', '4538 Helman st', 'Covington', 'Ky', '44034','Matthew', 'Errol', '476-432-8345', 'Smallstools@email.com')
				      ,(2, 'Tims Trinkets', '721 Easel way', 'Maineville', 'Oh', '45040','Tim', 'Everette', '398-287-1987', 'Timetools@email.com')
				      ,(3, 'Jolies Tools', '9154 Hammer dr', 'Florence', 'Ky', '44122','Jolie', 'Washburn', '458-287-1823', 'Jolietools@email.com')

-- --------------------------------------------------------------------------------
--	Step #3 : SELECT from Sample Data 
-- --------------------------------------------------------------------------------

SELECT * FROM TVendors

SELECT * FROM TCustomers
WHERE strLastName = 'Jones'

SELECT * FROM TProducts
WHERE decRetailCost < 9.00

-- --------------------------------------------------------------------------------
--	Step #4 : UPDATE Sample Data 
-- --------------------------------------------------------------------------------

UPDATE TCustomers
SET strCity = 'Lebanon'
WHERE intCustomerID = 1

UPDATE TVendors
SET strVendorName = 'Tims Tools', strAddress = '326 Apple Alley', strCity = 'Dreamland', strState = 'In', strZip = '83291'
WHERE intVendorID = 2

SELECT * FROM TVendors

SELECT * FROM TCustomers
WHERE strLastName = 'Jones'

-- --------------------------------------------------------------------------------
--	Step #5 : DELETE Sample Data 
-- --------------------------------------------------------------------------------

DELETE FROM TCustomers
WHERE intCustomerID = 1

DELETE FROM TVendors
WHERE intVendorID = 2

SELECT * FROM TVendors

SELECT * FROM TCustomers
WHERE strLastName = 'Jones'