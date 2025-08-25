CREATE DATABASE EXP3;
USE EXP3;

-- Create two source legacy tables as per input.
CREATE TABLE TableA (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

CREATE TABLE TableB (
    EmpID INT,
    Ename VARCHAR(50),
    Salary INT
);

-- Input data provided.
INSERT INTO TableA (EmpID, Ename, Salary) VALUES
(1, 'AA', 1000),
(2, 'BB', 300);

INSERT INTO TableB (EmpID, Ename, Salary) VALUES
(2, 'BB', 400),
(3, 'CC', 100);

-- Combine both tables A and B.
WITH AllEmployees AS (
    SELECT * FROM TableA
    UNION ALL
    SELECT * FROM TableB
)

-- Select All from table, where minimum salary is output in duplicated records.
SELECT
    A.EmpID, A.Ename, A.Salary
FROM
    AllEmployees AS A
JOIN (
    SELECT EmpID, MIN(SALARY) AS MinSalary
    FROM AllEmployees
    GROUP BY EmpID
) AS B
ON
    A.EmpID = B.EmpID
    AND
    A.Salary = B.MinSalary
ORDER BY A.EmpID;
