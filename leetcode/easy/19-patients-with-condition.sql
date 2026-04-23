-- https://leetcode.com/problems/patients-with-a-condition/description/?envType=study-plan-v2&envId=top-sql-50

-- Write a solution to find the patient_id, patient_name, and conditions of the patients who have Type I Diabetes. 
-- Type I Diabetes always starts with DIAB1 prefix.
-- Return the result table in any order.

DROP TABLE IF EXISTS Patients;

-- Schema
CREATE TABLE Patients (
    patient_id int,
    patient_name varchar,
    conditions varchar
);

INSERT INTO Patients (patient_id, patient_name, conditions) VALUES
(1, 'Daniel', 'YFEV COUGH'),
(2, 'Alice', null),
(3, 'Bob', 'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100'),
(5, 'Alain', 'DIAB201');

-- Solution
SELECT patient_id, patient_name, conditions
FROM Patients
WHERE conditions LIKE '% DIAB1%' OR conditions LIKE 'DIAB1%';