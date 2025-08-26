--Finding the cancellation rates by doctor. This query will be used to create a bar chart that lists the cancellation rates in descending order. 
WITH doc_cancl_rate AS 
(
SELECT 
  d.doctor_id,
  d.first_name,
  d.last_name,
  d.specialization,
  d.years_experience,
  COUNT(a.appointment_id) AS total_appointments,
  COUNTIF(a.status = "Cancelled") AS canceled_appointments
FROM hospital-management-470216.healthcare_data.doctors AS d
JOIN hospital-management-470216.healthcare_data.appointments AS a
  ON d.doctor_id = a.doctor_id
GROUP BY 
  d.doctor_id,
  d.first_name,
  d.last_name,
  d.specialization,
  d.years_experience
)

SELECT
  doctor_id,
  first_name,
  last_name,
  specialization,
  years_experience,
  canceled_appointments,
  total_appointments,
  ROUND((canceled_appointments/total_appointments)*100,2) AS cancellation_rate
FROM doc_cancl_rate
ORDER BY
  cancellation_rate DESC