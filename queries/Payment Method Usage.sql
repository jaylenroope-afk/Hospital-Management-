--This query will be used to create a pie chart showing the proportions of payment methods used
SELECT
  payment_method,
  COUNT(*) AS times_used
FROM
  hospital-management-470216.healthcare_data.billing
GROUP BY
  payment_method
ORDER BY
  times_used DESC