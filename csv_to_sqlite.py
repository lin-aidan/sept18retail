import pandas as pd
import sqlite3

# Load the CSV file into a DataFrame
csv_file = 'Online_Retail.csv'
df = pd.read_csv(csv_file, encoding='ISO-8859-1')

# Connect to SQLite database (creates file if it doesn't exist)
conn = sqlite3.connect('retail.db')

# Write the DataFrame to a table named 'retail'
df.to_sql('retail', conn, if_exists='replace', index=False)

# Close the connection
conn.close()

print('Database retail.db created with table retail.')
