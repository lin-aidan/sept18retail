SELECT
  Country,
  COUNT(DISTINCT InvoiceNo) AS NumberOfSales
FROM retail
GROUP BY Country
ORDER BY NumberOfSales DESC;