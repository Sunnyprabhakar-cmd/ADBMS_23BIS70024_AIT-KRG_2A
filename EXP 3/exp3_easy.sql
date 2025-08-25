CREATE DATABASE EXP3;
USE EXP3;

CREATE TABLE EMPLOYEE (
    EMP_ID INT
);

INSERT INTO EMPLOYEE (EMP_ID) VALUES
(2),
(4),
(4),
(6),
(6),
(7),
(8),
(8),
(8);

-- Select the maximum employee ID which is not duplicated.
SELECT
    MAX(EMP_ID)
FROM
    EMPLOYEE
WHERE
    EMP_ID
IN (
    SELECT
        EMP_ID
    FROM
        EMPLOYEE
    GROUP BY
        EMP_ID
    HAVING
        COUNT(EMP_ID) = 1
   );
