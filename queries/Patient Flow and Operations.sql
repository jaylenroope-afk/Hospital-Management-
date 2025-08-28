--This query will be used to create .csv files that are going to be used for the Patient Flow & Operations Dashboard
--What I will be visualizing: total appointments with a bar chart showing total appointments by doctor, cancellation rates by doctor, cancellation trends by month and day of the week, total revenue by doctor, total revenue by specialization, distribution of ages served

--Finding total appointments and total appointments by doctor
SELECT 
  d.id,
  d.first_name,
  d.last_name,
  COUNT(*) AS total_appointments 
FROM hospital-management-470216.healthcare_data.doctors d
JOIN hospital-management-470216.healthcare_data.appointments a
  ON d.id = a.doctor_id
GROUP BY
  d.id,
  d.first_name,
  d.last_name
ORDER BY
  total_appointments DESC

--Total appointments bv specialization
SELECT
  d.specialization,
  COUNT(*) AS total_appointments
FROM hospital-management-470216.healthcare_data.doctors d
JOIN hospital-management-470216.healthcare_data.appointments a
  ON d.id = a.doctor_id
GROUP BY 
  d.specialization
ORDER BY
  total_appointments DESC

--Total revenue by doctor and specialization. Need to create a new table so I can associate the doctor with the appointment which is then associated with the treatment id.
CREATE TABLE `hospital-management-470216.healthcare_data.doctors_appointments` AS
SELECT
  d.id AS doctor_id,
  d.first_name,
  d.last_name,
  d.specialization,
  a.id AS appointment_id
FROM
  hospital-management-470216.healthcare_data.doctors AS d
JOIN
  hospital-management-470216.healthcare_data.appointments AS a 
    ON d.id = a.doctor_id

--Total Revenue by Doctor
SELECT 
  da.doctor_id,
  da.first_name,
  da.last_name,
  SUM(CAST(REPLACE(REPLACE(t.cost, '$',''), ',','') as FLOAT64)) AS total_revenue
FROM hospital-management-470216.healthcare_data.doctors_appointments AS da
JOIN hospital-management-470216.healthcare_data.treatments AS t
  ON da.appointment_id = t.appointment_id
GROUP BY 
  da.doctor_id,
  da.first_name,
  da.last_name
ORDER BY
  total_revenue DESC

--Total Revenue by Specialization
SELECT 
  da.specialization,
  SUM(CAST(REPLACE(REPLACE(t.cost, '$',''), ',','') as FLOAT64)) AS total_revenue
FROM hospital-management-470216.healthcare_data.doctors_appointments AS da
JOIN hospital-management-470216.healthcare_data.treatments AS t
  ON da.appointment_id = t.appointment_id
GROUP BY 
  da.specialization
ORDER BY
  total_revenue DESC


--Distribution of ages served 
--There is no attribute for age, so need to calculating the difference between birth date and appointment date  
WITH agedistribution AS 
(
SELECT 
  p.date_of_birth,
  a.appointment_date,
  DATE_DIFF(a.appointment_date,p.date_of_birth, YEAR) AS age
FROM hospital-management-470216.healthcare_data.patients_v2 p
JOIN hospital-management-470216.healthcare_data.appointments_v2 a
  ON p.id = a.patient_id
)

SELECT 
    SUM(CASE WHEN age BETWEEN 0 AND 18 THEN 1 ELSE 0 END) AS age_0_18,
    SUM(CASE WHEN age BETWEEN 19 AND 25 THEN 1 ELSE 0 END) AS age_19_25,
    SUM(CASE WHEN age BETWEEN 26 AND 34 THEN 1 ELSE 0 END) AS age_26_34,
    SUM(CASE WHEN age BETWEEN 35 AND 44 THEN 1 ELSE 0 END) AS age_35_44,
    SUM(CASE WHEN age BETWEEN 45 AND 54 THEN 1 ELSE 0 END) AS age_45_54,
    SUM(CASE WHEN age BETWEEN 55 AND 64 THEN 1 ELSE 0 END) AS age_55_64,
    SUM(CASE WHEN age >= 65 THEN 1 ELSE 0 END) AS age_65_plus
FROM agedistribution;
