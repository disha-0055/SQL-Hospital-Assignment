CREATE DATABASE HospitalAssignment;

CREATE TABLE hospital(
	hospital_name VARCHAR(100),
	location VARCHAR(100),
	department VARCHAR(100),
	doctors_count INT,
	patients_count INT,
	admission_date DATE,
	discharge_date DATE,
	medical_expenses NUMERIC(10,2)
);

SELECT * FROM hospital;

--1) Find the total number of patients across all hospitals.
SELECT SUM(patients_count) AS total_patients FROM hospital;

--2) Retrieve the average count of doctors available in each hospital
SELECT ROUND(AVG(doctors_count),2) AS average_count FROM hospital;

--3) Find the top 3 hospital departments that have the highest number of patients
SELECT department,patients_count FROM hospital 
ORDER BY patients_count DESC 
LIMIT 3;

--4) Identify the hospital that recorded the highest medical expenses.
SELECT hospital_name, medical_expenses FROM hospital
ORDER BY medical_expenses DESC
LIMIT 1;

--5) Calculate the average medical expenses per day for each hospital.
SELECT hospital_name, ROUND(AVG(medical_expenses/(discharge_date-admission_date)),2) 
FROM hospital
GROUP BY hospital_name;

--6) Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date
SELECT hospital_name, (discharge_date - admission_date) AS total_days
FROM hospital
ORDER BY total_days DESC
LIMIT 1;

--7) Count the total number of patients treated in each city.
SELECT location, SUM(patients_count) AS total_patients
FROM hospital
GROUP BY location;

--8) Calculate the average number of days patients spend in each department.
SELECT department, ROUND(AVG(discharge_date - admission_date),2) AS avg_days
FROM hospital
GROUP BY department;

--9) Find the department with the least number of patients.
SELECT DISTINCT department, SUM(patients_count) AS total_patients
FROM hospital
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;

--10) Group the data by month and calculate the total medical expenses for each month.
SELECT EXTRACT(MONTH FROM admission_date) AS admission_month,
SUM(medical_expenses) AS total_expenses
FROM hospital
GROUP BY admission_month;