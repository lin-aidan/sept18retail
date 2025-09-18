SELECT
  SaleDate,
  DailySales,
  SUM(DailySales) OVER (ORDER BY SaleDate) AS RunningTotalSales
FROM (
  SELECT DATE(InvoiceDate) AS SaleDate, COUNT(DISTINCT InvoiceNo) AS DailySales
  FROM retail
  GROUP BY DATE(InvoiceDate)
)
ORDER BY SaleDate;