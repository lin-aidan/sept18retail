import pandas as pd
import sqlite3
import json

# Connect to the SQLite database
conn = sqlite3.connect('retail.db')

# Query for sales by country
country_query = '''
SELECT Country, COUNT(DISTINCT InvoiceNo) AS NumberOfSales
FROM retail
GROUP BY Country
'''
df_country = pd.read_sql_query(country_query, conn)

# Query for running total of sales per day (disregard time)
daily_sales_query = '''
SELECT DATE(InvoiceDate) AS SaleDate, COUNT(DISTINCT InvoiceNo) AS DailySales
FROM retail
GROUP BY DATE(InvoiceDate)
ORDER BY SaleDate
'''
df_daily = pd.read_sql_query(daily_sales_query, conn)
df_daily['RunningTotalSales'] = df_daily['DailySales'].cumsum()

# Save to JSON for use in the web app
with open('country_sales.json', 'w') as f:
    json.dump(df_country.to_dict(orient='records'), f)

with open('running_total_sales.json', 'w') as f:
    json.dump({
        'dates': df_daily['SaleDate'].tolist(),
        'running_totals': df_daily['RunningTotalSales'].tolist()
    }, f)

conn.close()
print('Exported country_sales.json and running_total_sales.json')
