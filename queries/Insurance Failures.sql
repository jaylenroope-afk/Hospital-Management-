--First counting the number of payment failures for each insurance_provider
SELECT 
  p.insurance_provider,
  COUNTIF(b.payment_status = "Failed") AS number_of_failures
FROM hospital-management-470216.healthcare_data.billing b
JOIN hospital-management-470216.healthcare_data.patients p
  ON b.patient_id = p.id
WHERE b.payment_method = "Insurance" 
GROUP BY
  p.insurance_provider
ORDER BY 
  number_of_failures DESC

--How much were each of the treatments that led to a failure in payment when insurance was used
SELECT 
  b.treatment_id,
  p.insurance_provider,
  b.amount
FROM hospital-management-470216.healthcare_data.billing b
JOIN hospital-management-470216.healthcare_data.patients p
  ON b.patient_id = p.id
WHERE b.payment_method = "Insurance"
GROUP BY 
  p.insurance_provider,
  b.treatment_id,
  b.amount
ORDER BY
  p.insurance_provider 

--Financial losses due to insurance failures
--The three columns I need are: insurance_provider, number_of_failures, and financial_loss
SELECT 
  p.insurance_provider,
  COUNTIF(b.payment_status = "Failed") AS number_of_failures,
  --The amount column has a String data type and must be converted to float so that we can sum the total financial losses. I will use CAST function to convert amount to a float. Furthermore it has $ signs and "," so we need to clean it up using REPLACE function.
  SUM(
    CASE WHEN b.payment_status = "Failed" 
    THEN (CAST(REPLACE(REPLACE(b.amount, '$',''), ',','') as FLOAT64)
    ELSE 0 
  END
  ) AS financial_loss
FROM hospital-management-470216.healthcare_data.billing b
JOIN hospital-management-470216.healthcare_data.patients p
  ON b.patient_id = p.id
WHERE b.payment_method = "Insurance"
GROUP BY
  p.insurance_provider
ORDER BY
  financial_loss DESC


--Lastly, calculating failure rate is important because some insurance providers are used more than others. Since the total number of times the insurance provider was used and the number of failures are needed, a CTE is used. These two variables will be divided by each other to find the failure_rate (number_of_failures/total_number_used_by_insurance).
WITH fail_rate_ins AS 
(
SELECT
  p.insurance_provider,
  COUNTIF(b.payment_status = "Failed") AS number_of_failures,
  COUNT(b.id) AS total_times_used_by_insurance
FROM hospital-management-470216.healthcare_data.billing b
JOIN hospital-management-470216.healthcare_data.patients p
  ON b.patient_id = p.id
WHERE b.payment_method = "Insurance"
GROUP BY
  p.insurance_provider
)

SELECT
  insurance_provider,
  number_of_failures,
  total_times_used_by_insurance,
  ROUND((number_of_failures/total_times_used_by_insurance)*100,2) AS failure_rate
FROM fail_rate_ins
ORDER BY
  failure_rate DESC
