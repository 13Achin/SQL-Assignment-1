-- 1. Create the table
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50),
    Department VARCHAR(30),
    City VARCHAR(30),
    Salary DECIMAL(10,2),
    HireDate DATE
);

-- 2. Insert the dummy data
INSERT INTO Employees (EmpID, EmpName, Department, City, Salary, HireDate) VALUES
(101, 'Rahul Mehta', 'Sales', 'Mumbai', 55000, '2019-09-25'),
(102, 'Priya Sharma', 'HR', 'Bengaluru', 62000, '2021-03-10'),
(103, 'Aman Singh', 'IT', 'Delhi', 72000, '2022-01-14'),
(104, 'Neha Patel', 'Sales', 'Pune', 48000, '2018-07-22'),
(105, 'Karan Joshi', 'Marketing', 'Chennai', 45000, '2019-12-11'),
(106, 'Divya Nair', 'IT', 'Delhi', 81000, '2020-05-28'),
(107, 'Raj Kumar', 'HR', 'Mumbai', 60000, '2021-08-03'),
(108, 'Simran Kaur', 'Finance', 'Hyderabad', 58000, '2022-02-18'),
(109, 'Arjun Reddy', 'IT', 'Kolkata', 70000, '2023-01-15'),
(110, 'Anjali Das', 'Sales', 'Delhi', 51000, '2020-04-12');

-- 3. Example CREATE FUNCTION (since you specifically asked for one)
-- This function returns the Annual Salary for a given EmpID
DELIMITER $$

CREATE FUNCTION GetAnnualSalary(emp_id INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE annual_sal DECIMAL(12,2);
    SELECT Salary * 12 INTO annual_sal
    FROM Employees
    WHERE EmpID = emp_id;
    RETURN annual_sal;
END$$

DELIMITER ;

-- Usage example:
SELECT EmpID, EmpName, Salary, GetAnnualSalary(EmpID) AS AnnualSalary
FROM Employees;

-- Q.1

SELECT *
FROM Employees
WHERE Department IN ('IT', 'HR');

-- Q.2

SELECT *
FROM Employees
WHERE Department IN ('Sales', 'IT', 'Finance');

-- Q.3

SELECT *
FROM Employees
WHERE Salary BETWEEN 50000 AND 70000;

-- Q.4

SELECT *
FROM Employees
WHERE EmpName LIKE 'A%';

-- Q.5

SELECT *
FROM Employees
WHERE EmpName LIKE '%an%';

-- Q.6

SELECT *
FROM Employees
WHERE City IN ('Delhi', 'Mumbai')
  AND Salary > 55000;
  
-- Q.7

SELECT *
FROM Employees
WHERE Department <> 'HR';

-- Q.8

SELECT *
FROM Employees
WHERE HireDate BETWEEN '2019-01-01' AND '2022-12-31'
ORDER BY HireDate ASC;