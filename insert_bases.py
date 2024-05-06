import pandas as pd
import pypyodbc as odbc
import os
from sqlalchemy import create_engine # pip install SQLAlchemy
from sqlalchemy.engine import URL

path = '..\Bases'

DRIVER_NAME = 'SQL Server'
SERVER_NAME = 'YOUR_IP' 
DATABASE_NAME = 'YOUR_DATABASE' 
USERNAME = 'YOUR_USERNAME' 
PASSWORD = 'YOUR_PASSWORD' 

connection_string = f"""
    DRIVER={{{DRIVER_NAME}}};
    SERVER={SERVER_NAME};
    DATABASE={DATABASE_NAME};
    Trusted_Connection=No;
    uid={USERNAME};
    pwd={PASSWORD};
"""

connection_url = URL.create('mssql+pyodbc', query={'odbc_connect': connection_string})
engine = create_engine(connection_url, module=odbc)

arr = os.listdir(path)

for file in arr:
    df = pd.read_excel(path + '\\' + file)
    table_name = file.replace('.xls', '')
    print(f'### INSERTING INTO TABLE: tb_{table_name}')
    df.to_sql(table_name, engine, if_exists='replace', index=False)

# Read the SQL file
with open('../main_insert.sql', 'r') as file:
    sql_script = file.read()

# Execute the SQL script using SQLAlchemy
with engine.connect() as connection:
    print('\nExecuting the insert script into SQL ...\n')
    connection.execute(sql_script)


print('Finished !')