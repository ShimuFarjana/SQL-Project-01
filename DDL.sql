
--CREATEING DATABASE--
IF DB_ID('daycaredb') IS NULL
	CREATE DATABASE  daycaredb
GO
USE daycaredb
GO
--CREATE  BRANCHES TABLE--
 CREATE TABLE Branches
 (
   branchId INT PRIMARY KEY,
   branchName NVARCHAR(30) NOT NULL,
   branchAddress NVARCHAR(100) NOT NULL
 )
GO
--CREATE  EMPLOYEES TABLE--
CREATE TABLE Employees
 (
   employeeId INT PRIMARY KEY,
   employeeName NVARCHAR(40) NOT NULL,
   employeePhone NVARCHAR(20) NOT NULL,
   branchId INT NOT NULL REFERENCES Branches(branchId)
 )
GO
--CREATE  GURDIANS TABLE--
CREATE TABLE Gurdians
 (
   gurdianId INT PRIMARY KEY,
   gurdianName NVARCHAR(40) NOT NULL,
   gurdianAddress NVARCHAR(100) NOT NULL,
   gurdianPhone NVARCHAR(20) NOT NULL   
 )
GO
--CREATE  CHILDREN TABLE--
CREATE TABLE Childrens
 (
   childrenId INT PRIMARY KEY,
   childrenName NVARCHAR(40) NOT NULL,
   branchLd INT NOT NULL REFERENCES Branches(branchId),
   gurdianId INT NOT NULL REFERENCES Gurdians(gurdianId)  
 )
GO
--CREATE INDEX--
CREATE INDEX ixEmpName
ON Employees(employeeName)
GO
--CREATE PROCEDURE DATA INSERT TO BRANCHS TABLE--
CREATE PROC spInsertbranch @bName NVARCHAR(40),
                            @bAddress NVARCHAR(100)
						
AS
DECLARE @bId INT
SELECT @bId=ISNULL(MAX (branchId),0)+1 FROM Branches
BEGIN TRY
       INSERT INTO Branches(branchId,branchName,branchAddress)
	   VALUES(@bId,@bName,@bAddress)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO BRANCHES TABLE--
CREATE PROC spUpdatebranch @bId INT,
                            @bName NVARCHAR(40),
                            @bAddress NVARCHAR(100)
							
AS
BEGIN TRY
       Update Branches
	   SET branchName= @bName,branchAddress=@bAddress
	   WHERE branchId=@bId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO BRANCHES TABLE--
CREATE PROC spDeletebranch @bId INT
                            
AS
BEGIN TRY
       DELETE branches
	   WHERE branchId=@bId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA INSERT TO EMPLOYEE TABLE--
CREATE PROC spInsertemployee @eName NVARCHAR(40),
                            @ePhn NVARCHAR(20),
							@bId INT
AS
DECLARE @eId INT
SELECT @eId=ISNULL(MAX (employeeId),0)+1 FROM employees
BEGIN TRY
       INSERT INTO employees(employeeId,employeeName,employeePhone,branchId)
	   VALUES(@eId,@eName,@ePhn,@bId)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO EMPLOYEE TABLE--
CREATE PROC spUpdateemployee @eId INT,
                            @eName NVARCHAR(40),
                            @ePhn NVARCHAR(20),
							@bId INT
AS
BEGIN TRY
       Update employees
	   SET employeeName= @eName,employeePhone=@ePhn, branchId=@bId
	   WHERE employeeId=@eId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO EMPLOYEE TABLE--
CREATE PROC spDeleteemployee @eId INT
                            
AS
BEGIN TRY
       DELETE employees
	   WHERE employeeId=@eId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA INSERT TO GURDIANS TABLE--
CREATE PROC spInsertgurdian @gName NVARCHAR(40),
                            @gAddress NVARCHAR(100),
							@gPhn NVARCHAR(20)
AS
DECLARE @gId INT
SELECT @gId=ISNULL(MAX (gurdianId),0)+1 FROM gurdians
BEGIN TRY
       INSERT INTO Gurdians(gurdianId,gurdianName,gurdianAddress,gurdianPhone)
	   VALUES(@gId,@gName,@gAddress,@gPhn)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO GURDIAN TABLE--
CREATE PROC spUpdategurdian @gId INT,
                            @gName NVARCHAR(40),
                            @gAddress NVARCHAR(100),
							@gPhn NVARCHAR(20)
AS
BEGIN TRY
       Update Gurdians
	   SET gurdianName= @gName,gurdianAddress=@gAddress,gurdianPhone=@gPhn
	   WHERE gurdianId=@gId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO GURDIAN TABLE--
CREATE PROC spDeletegurdian @gId INT
                            
AS
BEGIN TRY
       DELETE Gurdians
	   WHERE gurdianId=@gId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA INSERT TO CHILDREN TABLE--
CREATE PROC spInsertchildren @cName NVARCHAR(40),
                            @bNd INT,
							@gId INT
AS
DECLARE @cId INT
SELECT @cId=ISNULL(MAX (childrenId),0)+1 FROM Childrens
BEGIN TRY
       INSERT INTO Childrens(childrenId,childrenName,branchId,gurdianId)
	   VALUES(@cId,@cName,@bId,@gId)
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA UPDATE TO CHILDREN TABLE--
CREATE PROC spUpdatechildren @cId INT,
                            @cName NVARCHAR(40),
                            @bId INT,
							@gId INT
AS
BEGIN TRY
       Update Childrens
	   SET childrenName= @cName,branchId=@bId,gurdianId=@gId
	   WHERE childrenId=@cId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE PROCEDURE DATA DELETE TO CHILDREN TABLE--
CREATE PROC spDeletechildren @cId INT                           
AS
BEGIN TRY
       DELETE Childrens
	   WHERE childrenId=@cId
END TRY
BEGIN CATCH
           ;
		   THROW 50001,'Error encountered',1
		   RETURN 0
END CATCH
GO
--CREATE SCALAR FUNCTION--
CREATE FUNCTION fnScalar(@gurdianId INT)RETURNS INT
AS
BEGIN
    DECLARE @n INT
	SELECT @n=COUNT(*)FROM Childrens
	WHERE gurdianId=@gurdianId
	RETURN @n
END
GO
--CREATE TABLE VALUED FUNCTION--
CREATE FUNCTION  fnTable(@gurdianId INT)RETURNS TABLE
AS
RETURN
(
   SELECT b.branchName,e.employeeId,e.employeeName,g.gurdianName,c.childrenId,c.childrenName
FROM Branches b
INNER JOIN Employees e ON b.branchId=e.branchId
INNER JOIN Childrens c ON e.branchId=c.branchId
INNER JOIN Gurdians g ON c.gurdianId=g.gurdianId
)
GO
--CRAETE VIEW--
CREATE VIEW vInfo
AS
SELECT b.branchName,e.employeeId,e.employeeName,g.gurdianName,c.childrenId,c.childrenName
FROM Branches b
INNER JOIN Employees e ON b.branchId=e.branchId
INNER JOIN Childrens c ON e.branchId=c.branchId
INNER JOIN Gurdians g ON c.gurdianId=g.gurdianId
GO
--CREATE TRIGGER--
CREATE TRIGGER trEmpInsert
ON Employees FOR INSERT 
AS
BEGIN
	DECLARE @bid INT, @c INT
	SELECT @bid = branchId from inserted
	SELECT @c = COUNT(employeeId) FROM Employees
	WHERE branchId = @bid
	IF @c > 3 
	BEGIN
		ROLLBACK TRANSACTION
		;
		THROW 50001, 'There cannot be more than 3 employees', 1
	END
END
GO


