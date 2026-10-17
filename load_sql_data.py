import pandas as pd
import sqlite3

# Load the original financial dataset
df = pd.read_csv("data/financial_data.csv")

# Create a SQLite database and load the data into a table
conn = sqlite3.connect("financial_analysis.db")
df.to_sql("financials", conn, if_exists="replace", index=False)

conn.close()

print("Data loaded successfully into the financials table!")
