USE DayCaredb
GO
--INSERT DATA INTO THE BRANCHES TABLE--
INSERT INTO Branches VALUES	
(10001, 'Dhaka', 'Notun Bazar, Badda'),
(10002, 'Gazipur', 'Rajabari, Jaydebpur'),
(10003, 'Chittagong', 'Sadar, Chittagong '),
(10004, 'Brahmanbaria', 'Sadar, Brahmanbaria'),
(10005, 'Chandpur', 'Kocua, Chandpur'),
(10006, 'Joypurhat', 'Sadar, Joypurhat'),
(10007, 'Barisal', 'Vola, Barisal'),
(10008, 'Dhaka', 'Najim Uddin Road, Old Dhaka')
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Branches
GO
--INSERT DATA INTO THE EMPLOYEES TABLE--
INSERT INTO Employees VALUES	
(1101, 'Jui sharmin','0197343450', 10001),
(1102, 'Tanjina Akter', '01998456059', 10001),
(1103, 'Rahima Khatun', '01905674525',10001),
(1104, 'Kulsuma Yesmin', '01670934784',10002),
(1105, 'Tarana sultana','01504656893',10002),
(1106, 'Subarna Begum', '01834982065',10003),
(1107, 'Rima Akter ','01518788114',10007),
(1108, 'Jesmin Akter','01715674882',10008)
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Employees
GO
--INSERT DATA INTO THE GURDIANS TABLE--
INSERT INTO Gurdians
VALUES	(1201, 'Abdul Sakib', 'Notun Bazar, Badda', '01754432133'),
		(1202, 'Aysha Khan', 'Salna, Jaydebpur', '01303216097'),
		(1203, 'Sohanur Rahman', 'Sadar, Chittagong', '01712315410'),
		(1204, 'Sadia Ahmed', 'Sadar, Brahmanbaria', '01684937787'),
		(1205, 'Arif Hassan', 'Sadar, Chandpur', '01716290121'),
		(1206, 'Habibul Haque', 'Sadar, Joypurhat', '01811695986'),
		(1207, 'Jobaida Rahman', 'Mirersorai, Chittagong', '01773028060'),
		(1208, 'Mohammad Shuvo', 'Najim Uddin Road, Old Dhaka',  '01858732484')
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Gurdians
GO
--INSERT DATA INTO THE CHILDRENS TABLE--
INSERT INTO Childrens VALUES
(12001, 'Sakib Rahman', 10001, 1201),
(12002, 'Rahima Rahman', 10002, 1201 ),
(12003, 'Shamim Apon',  10003, 1201),
(12004, 'Ibrahi Khalil', 10004, 1202),
(12005, 'Amran Hossain',  10005, 1202),
(12006, 'Asraful Islam', 10006, 1202 ),
(12007, 'Ariful Islam',  10007, 1207),
(12008, 'Israt Eva',  10008, 1205),
(12009, 'Nusrat Nadira',  10008, 1205),
(12010, 'Sohan Mia',  10008, 1208),
(12011, 'Mahmudul Hassan',  10008, 1208)
GO
--CHECK THE INSERTED DATA --
SELECT *
FROM Childrens
GO
--JOIN ALL THE TABLE --
SELECT *
FROM Employees e
INNER JOIN  Branches b  ON e.branchId = b.branchId
INNER JOIN Childrens c ON b.branchId = c.branchLd
INNER JOIN Gurdians g ON g.gurdianId = c.gurdianId
GO
--INSERT DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spInsertbranch 'Dhaka', 'Lalmatia, Mohammadpur'
EXEC spInsertbranch 'Jassor', 'Salna, Jassor'
EXEC spInsertbranch 'Chittagong', 'Sadar, Chittagong'
EXEC spInsertbranch 'PotuaKhali', 'Sadar, Brahmanbaria'
EXEC spInsertbranch 'Chandpur', 'Sadar, Chandpur'
EXEC spInsertbranch 'Joypurhat', 'Sadar, Joypurhat'
GO
--UPDATE DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spUpdatebranch 10012, 'Chittagong', 'Mirersorai, Chittagong'
EXEC spUpdatebranch 10013, 'Joypurhat', 'Sadar, Joypurhat'
EXEC spUpdatebranch 10014, 'Brahmanbaria', 'Sadar, Brahmanbaria'
GO
SELECT * FROM Branches
GO
--DELETE DATA TO THE BRANCHES TABLE USING PROCEDURE--
EXEC spDeletebranch 10009
EXEC spDeletebranch 10010
EXEC spDeletebranch 10011
GO

SELECT * FROM branches
GO
--INSERT DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spInsertemployee 'Tanjina Tasmin','01998023454', 10001
EXEC spInsertemployee 'Poly Akter','01965764059', 10001
EXEC spInsertemployee  'Rubina Akter','01999390525',10001
EXEC spInsertemployee 'Aysha Islam','01673993374',10002
EXEC spInsertemployee 'Rokeya sultana','01580956893',10002
EXEC spInsertemployee 'Shamima Rahman', '01773028060',10003
EXEC spInsertemployee 'Jannatul Suborna ','01518788114',10007
EXEC spInsertemployee 'Sumi Sultana','01719809882',10008
GO

SELECT * FROM Employees
GO
--UPDATE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spUpdateemployee 1105,  'Maksuda Yesmin', '01673993374',10002
EXEC spUpdateemployee 1109, 'Taniya sultana','01580956893',10002
EXEC spUpdateemployee 1110, 'Jobaida Tasmin','01998023454', 10001
GO
SELECT * FROM Employees
GO
--DELETE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spDeleteemployee 1104
EXEC spDeleteemployee 1105
EXEC spDeleteemployee 1115
GO

SELECT * FROM Employees
GO
--INSERT DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spInsertgurdian 'Mohammad Shafiq','Lalmatia, Mohammadpur', '01842432133'
EXEC spInsertgurdian 'Tarana Khan', 'Salna, Jaydebpur', '01703216097'
EXEC spInsertgurdian 'Sohanur Rahman', 'Sadar, Chittagong', '01712315410'
EXEC spInsertgurdian 'Romana Rohman', 'Sadar, Brahmanbaria', '01684937787'
EXEC spInsertgurdian 'Ariful Hassan', 'Motlob, Chandpur', '01916290121'
EXEC spInsertgurdian 'Habibul Haque', 'Sadar, Joypurhat', '01311695986'
EXEC spInsertgurdian 'Jobaida Rahman ', 'Mirersorai, Chittagong',  '01973028060'
EXEC spInsertgurdian 'Mohammad Santo', 'Najim Uddin Road, Old Dhaka', '01958342484'
GO

SELECT * FROM gurdians
GO
EXEC spUpdategurdian 1205, 'Mahbub Sultan', 'Faridgong, Chandpur', '01968363446'
EXEC spUpdategurdian 1211, 'Tipu Sultan', 'Ahmed Nagar, Fatullah', '01620151533'
EXEC spUpdategurdian 1214, 'Mannan Bhuiyan', 'Badda', '01521487370'
GO

SELECT * FROM gurdians
GO
--DELETE DATA TO THE GURDIAN TABLE USING PROCEDURE--
EXEC spDeletegurdian 1214
EXEC spDeletegurdian 1215
EXEC spDeletegurdian 1216
GO

SELECT * FROM gurdians
GO
--INSERT DATA TO THE CHILDREN TABLE USING PROCEDURE--
EXEC spInsertchildren 'Muhammod Shuvo', 10001, 1201
EXEC spInsertchildren 'Shamim Rahman', 10002, 1201
EXEC spInsertchildren  'Md.Habib',  10003, 1201
EXEC spInsertchildren 'Md Saju Ahmed', 10004, 1202
EXEC spInsertchildren 'Mitali Rahman',  10005, 1202
EXEC spInsertchildren 'Abir Hasan', 10006, 1202
EXEC spInsertchildren 'Junayed khan',  10007, 1207
EXEC spInsertchildren 'Anamika Hasan',  10008, 1205
GO

SELECT * FROM Childrens
GO
--UPDATE DATA TO THE CHILDREN TABLE USING PROCEDURE--
EXEC spUpdatechildren 12002, 'Sohan Hasan', 10002, 1201
EXEC spUpdatechildren 12007, 'Mominen khan',  10007, 1207
EXEC spUpdatechildren 12010, 'Anamika Hasan',  10008, 1208
GO

SELECT * FROM Childrens
GO
--DELETE DATA TO THE EMPLOYEES TABLE USING PROCEDURE--
EXEC spDeletechildren 12015
EXEC spDeletechildren 12016
EXEC spDeletechildren 12017
GO

SELECT * FROM Childrens
GO
--AGAIN INSERT USING PROCEDURE--
EXEC spInsertgurdian 'Mohammad Shafiq','Lalmatia, Mohammadpur', '01942432133'
EXEC spInsertgurdian 'Tamanna Khan', 'Salna, Jaydebpur',  '01303216097'
EXEC spInsertgurdian'Sohanur Rahman', 'Sadar, Chittagong', '01712315410'
EXEC spInsertgurdian 'Sadia Ahmed', 'Sadar, Brahmanbaria', '01684937787'
GO
SELECT * FROM gurdians
GO

--CALING THE SCALAR FUNCTION--
SELECT dbo.fnScalar (1201) AS 'Children'
GO
--CALING THE TABLE VALUED FUNCTION--
SELECT * 
FROM fnTable(1201)
GO
--EXTRACT THE VIEW--
SELECT *
FROM vInfo
GO
--CHECK THE TRIGGER--
SELECT *
FROM employees
GO
--THERE IS A ERROR ON INSERTING DATA BY TRIGGER--
--ERROR--
INSERT INTO employees VALUES	
(1114,'Jobaida Tasmin','01895433454', 10004),
(1115, 'Parul Akter', '01965634959', 10004),
(1116,  'Zulekha Akter', '01969396725',10004),
(1117, 'Maksuda Yesmin', '01345893374',10004)
GO
--INSERTED--
INSERT INTO employees VALUES	
(1114, 'Jobaida Tasmin','01998023454', 70004),
(1115, 'Parul Akter', '01965764059', 70004),
(1116, 'Zulekha Akter', '01999390525',70004)
GO
--CRETE A SUB QUERY--
SELECT C.*
FROM ( SELECT g.gurdianId, gurdianName,  childrenId, childrenName, COUNT(childrenId) 'Children'
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
GROUP BY g.gurdianId, gurdianName,  childrenId, childrenName
) AS C
WHERE gurdianId = 1201
GO
--ANOTHER SUB QUERY FOR BRANCH TABLE--
SELECT B.*
FROM ( SELECT employeeId,employeeName, employeePhone,b.branchId, COUNT(e.branchId) 'Employee'
FROM branches b 
INNER JOIN employees e ON b.branchId = e.branchId
GROUP BY employeeId,employeeName, employeePhone,b.branchId
) AS B
WHERE branchId = 10001
GO
--CREATE A CTE--
--CTE WITH GURDIAN TABLE--
WITH CTE AS
(
	SELECT gurdianId, gurdianName,gurdianAddress,gurdianPhone
	FROM Gurdians
)
SELECT g.gurdianId, gurdianName, childrenId, childrenName, gurdianAddress
FROM childrens c
INNER JOIN gurdians g ON c.gurdianId = g.gurdianId
GO
--CTE WITH EMPLOYEE TABLE--
WITH CTE AS
(
	SELECT employeeId, employeeName, employeePhone, branchId
	FROM Employees
)
SELECT b.branchId, branchName, branchAddress, employeeId, employeeName, employeePhone
FROM branches b
INNER JOIN employees e ON e.branchId = b.branchId
GO
/*
 * Queries added
 * 
 * */
 --1 Inner join
 ------------------------------
SELECT b.branchId, b.branchAddress, e.employeeName, e.employeePhone,g.gurdianName, c.childrenName
FROM Gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
INNER JOIN branches b ON c.branchLd= b.branchId 
INNER JOIN employees e ON b.branchId = e.branchId
GO
---2 Inner join filter
------------------------------------
SELECT b.branchName, b.branchAddress, e.employeeName, e.employeePhone,g.gurdianName, c.childrenName
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
INNER JOIN branches b ON c.branchLd = b.branchId
INNER JOIN employees e ON b.branchId= e.branchId
WHERE b.branchName = 'Dhaka'
GO
---3 Inner join filter
------------------------------------
SELECT b.branchName, b.branchAddress, e.employeeName, e.employeePhone,g.gurdianName, c.childrenName
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
INNER JOIN branches b ON c.branchLd = b.branchId
INNER JOIN employees e ON b.branchId = e.branchId
WHERE b.branchAddress LIKE  'Lalmatia%'
GO
--4 left, right outer
----------------------------------------------------------
SELECT b.branchName, b.branchAddress, e.employeeName, e.employeePhone, g.gurdianName, c.childrenName
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
RIGHT OUTER JOIN branches b ON c.branchLd = b.branchId
LEFT OUTER JOIN employees e ON b.branchId = e.branchId
GO
--5 Change 4 to CTE
----------------------------------------------------------
WITH gcb AS
(
SELECT b.branchId, b.branchName, b.branchAddress, g.gurdianName, c.childrenName
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
RIGHT OUTER JOIN branches b ON c.branchLd = b.branchId 
)
SELECT gcb.branchName, gcb.branchAddress, gcb.branchName, gcb.childrenName, e.employeeName, e.employeePhone
FROM employees e
RIGHT OUTER JOIN gcb ON e.branchId = gcb.branchId
GO
--6 non-matching
----------------------------------------------------------
SELECT b.branchName, b.branchAddress, e.employeeName, e.employeePhone,g.gurdianName, c.childrenName
FROM Gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId 
RIGHT OUTER JOIN branches b ON c.branchLd = b.branchId 
LEFT OUTER JOIN employees e ON b.branchId = e.branchId
WHERE e.branchId IS NULL 
GO
--7 non-matching sub-query
----------------------------------------------------------
SELECT b.branchName, b.branchAddress, e.employeeName, e.employeePhone,g.gurdianName, c.childrenName
FROM Gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId
RIGHT OUTER JOIN branches b ON c.branchLd = b.branchId
LEFT OUTER JOIN employees e ON b.branchId = e.branchId
WHERE NOT( e.branchId IS NOT NULL AND  e.branchId  IN (SELECT branchId FROM Branches))
GO
--8 aggregate
----------------------------------------------------------
SELECT b.branchName, COUNT(c.childrenId)
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId 
INNER JOIN branches b ON c.branchLd = b.branchId 
INNER JOIN employees e ON b.branchId = e.branchId
GROUP BY b.branchName
GO
--9 aggregate + having
----------------------------------------------------------
SELECT b.branchName, COUNT(c.childrenId)
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId 
INNER JOIN branches b ON c.branchLd = b.branchId 
INNER JOIN employees e ON b.branchId = e.branchId
GROUP BY b.branchName
HAVING b.branchName = 'Dhaka'
GO
--10 windowing
----------------------------------------------------------
SELECT b.branchName, 
COUNT(c.childrenId) OVER (ORDER BY b.branch_id) 'children count',
ROW_NUMBER() OVER (ORDER BY b.branch_id) 'rnum',
RANK() OVER (ORDER BY b.branch_id) 'rank',
DENSE_RANK() OVER (ORDER BY b.branch_id) 'drank',
NTILE(2) OVER (ORDER BY b.branch_id) 'tile(3)'
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId 
INNER JOIN branches b ON c.branchLd = b.branchId 
INNER JOIN employees e ON b.branchId = e.branchId
GO
--11 CASE
----------------------------------------------------------
SELECT b.branchName, b.branchAddress, 
CASE
	WHEN e.employeeName IS NULL THEN 'branch not open'
	ELSE e.employeeName
END 'employee_name'
FROM gurdians g
INNER JOIN childrens c ON g.gurdianId = c.gurdianId 
RIGHT OUTER JOIN branches b ON c.branchLd = b.branchId 
LEFT OUTER JOIN employees e ON b.branchId = e.branchId
GO
