-- Map of Sales by Country
-- Countries with > 10000 sales: red
-- Countries with 1-10000 sales: white
-- Countries with 0 sales: grey
-- This is a conceptual SQL for visualization; actual rendering requires a BI tool or Python.

-- Query to get sales by country
SELECT Country, COUNT(DISTINCT InvoiceNo) AS NumberOfSales
FROM retail
GROUP BY Country;

-- Visualization (to be implemented in Python or BI tool):
-- Map countries, color by NumberOfSales:
--   > 10000: red
--   1-10000: white
--   0: grey

-- Line Chart: Running Total of Sales Each Day
-- Query to get running total of sales per day
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

-- Visualization (to be implemented in Python or BI tool):
-- X-axis: SaleDate
-- Y-axis: RunningTotalSales
-- Line chart with proper labels
