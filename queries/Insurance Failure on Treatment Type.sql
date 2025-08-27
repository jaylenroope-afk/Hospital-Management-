--Using the treatment and billing tables to see which treatment types lead to more failures 
WITH fail_rate_treatment AS 
(
SELECT
  t.treatment_type,
  COUNTIF(b.payment_status = "Failed") AS number_of_failures,
  COUNT(b.treatment_id) AS total_treatments_by_type
FROM hospital-management-470216.healthcare_data.treatments t
JOIN hospital-management-470216.healthcare_data.billing b
  ON t.id = b.treatment_id
WHERE b.payment_method = "Insurance"
GROUP BY
  t.treatment_type
)

SELECT
  treatment_type,
  number_of_failures,
  total_treatments_by_type,
  ROUND((number_of_failures/total_treatments_by_type)*100,2) AS failure_rate
FROM fail_rate_treatment
ORDER BY
  failure_rate DESC
