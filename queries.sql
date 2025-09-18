select * 
from retail
limit 10;

SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity) AS ItemsSold
FROM retail
GROUP BY DATE(InvoiceDate)
ORDER BY SaleDate;

SELECT
  SaleDate,
  ItemsSold,
  SUM(ItemsSold) OVER (ORDER BY SaleDate) AS RunningTotal
FROM (
  SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity) AS ItemsSold
  FROM retail
  GROUP BY DATE(InvoiceDate)
)
ORDER BY SaleDate;

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

SELECT
  Country,
  COUNT(DISTINCT InvoiceNo) AS NumberOfSales
FROM retail
GROUP BY Country
ORDER BY NumberOfSales DESC;