# HOSPITAL_NEURALBITS_ASSIGNMENT
# Project Overview
This project is based on creating a hospital management dataset using Python and storing it in SQL Server. The main goal was to generate large, realistic healthcare data that can be used for learning, practicing data analysis, writing SQL queries, and understanding how databases work. Instead of using real patient information, I used Python’s `Faker` library to generate fake but realistic data.
I created five main tables:
1. Hospitals – Contains details like hospital ID and name.
2. Patients – 1,00,000 fake patient records with admission and discharge dates.
3. Diagnoses – Each patient has 2 disease records such as cancer, Diabetes, TB, Malaria, covid_19.
4. Treatments – Each patient has 5 medicine records including  Paracetamol, Doxorubici , Cyclophosphamide, 5-Fluorouracil, Metformin.
5. Payments – Includes payment mode (cash/credit) and amount paid.
After creating the data in Python, I used `pyodbc` to connect with SQL Server and insert all the tables into a database. The dataset is useful for testing SQL queries, creating dashboards, or even building ML models in the healthcare domain.

# Technologies Used
Python – Data creation using Faker, Random, Datetime
Pandas & NumPy – DataFrame operations and structuring
SQL Server – Database storage and querying
Jupyter Notebook – Code execution and visualization
pyodb – To connect Python with SQL Server

# Your Role and Contributions
Created the full database design and logic from scratch
Generated large-scale synthetic data using Python
Inserted all data into SQL Server while maintaining relationships
Ensured each table is linked using IDs (foreign keys)
Tested and verified the data using sample queries

# Key Challenges and How You Solved Them
1.Handling Large Data (100,000+ records): I used efficient loops and DataFrame creation techniques to reduce memory usage and processing time.
2. Data Accuracy and Linking: Maintained proper IDs and used mapping logic so that patient records match with their diagnoses, treatments, and payments.
3. Connecting to SQL Server: Faced issues with connection setup, which I solved by using the correct ODBC driver and testing with smaller data batches first.




