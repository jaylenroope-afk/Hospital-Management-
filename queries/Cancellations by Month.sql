--This query will allow me to make a line chart to analyze cancellations vs appointments by month 

SELECT 
  FORMAT_DATE("%Y-%m", DATE(appointment_date)) AS month,
  COUNT(appointment_id) AS total_appointments,
  COUNTIF(status = "Cancelled") AS canceled_appointments
FROM
  hospital-management-470216.healthcare_data.appointments
GROUP BY month
ORDER BY month


