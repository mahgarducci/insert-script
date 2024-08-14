import pandas as pd
import pypyodbc as odbc
import os
from sqlalchemy import create_engine # pip install SQLAlchemy
from sqlalchemy.engine import URL

path = '..\..\Bases'
errors=0

DRIVER_NAME = 'SQL Server'
SERVER_NAME = '*****' 
DATABASE_NAME = '****' 
USERNAME = '****' 
PASSWORD = '*****' 

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
    try:
        df = pd.read_excel(path + '\\' + file)
        print(f'READING FILE: {file}')
        table_name = file.replace('.xls', '')
        
        df.to_sql(table_name, engine, if_exists='replace', index=False)
        print(f'INSERTED INTO TABLE: tb_{table_name}\n')
    
    except odbc.ProgrammingError as e:
        print(f'###### ERROR ON FILE: {file}\n')
        errors=+1

        raise e


# Read the SQL file
with open('./main_insert.sql', 'r', encoding='utf-8') as file:
    sql_script = file.read()

# Execute the SQL script using SQLAlchemy
with engine.connect() as connection:
    print('\nExecuting the insert script into SQL ...\n')
    connection.execute(sql_script)


print(f'Finished with {errors} errors')