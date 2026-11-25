# Layoffs Data Cleaning Using MySQL

## Project Overview

This project focuses on cleaning and preparing a layoffs dataset using MySQL. The main objective is to improve data quality by identifying and removing duplicate records, standardizing inconsistent values, handling missing data, and removing unnecessary records and columns.

The project demonstrates practical SQL skills and the importance of data cleaning as a fundamental step in the data analysis process.

## Dataset Description

The original dataset contains information about company layoffs, including:

- Company
- Location
- Industry
- Total Laid Off
- Percentage Laid Off
- Date
- Company Stage
- Country
- Funds Raised (Millions)

**Original dataset size:** 2,361 records and 9 columns.

## Tools & Technologies

- MySQL 8.0+
- SQL

## Data Cleaning Process

### 1. Creating Staging Tables
- Created staging tables to preserve the original dataset.
- Worked on copies of the original data to avoid modifying the raw data.

### 2. Removing Duplicates
- Used `ROW_NUMBER()` window functions to identify duplicate records.
- Used a CTE to detect duplicate rows.
- Removed duplicate records while retaining one occurrence.

### 3. Standardizing Data
- Used `TRIM()` to remove unnecessary spaces from company names.
- Standardized inconsistent industry values, including Crypto.
- Corrected inconsistent location names.
- Removed unnecessary punctuation from country names.

### 4. Handling Date Formats
- Used `STR_TO_DATE()` to convert text values into proper date values.
- Changed the date column data type from TEXT to DATE.

### 5. Handling NULL and Missing Values
- Identified blank and NULL industry values.
- Converted blank industry values into NULL.
- Used a self-join to populate missing industry values using matching company records.

### 6. Removing Unnecessary Data
- Removed records where both total layoffs and percentage laid off were NULL.
- Dropped the temporary Row_Num column used during duplicate identification.

## SQL Concepts Demonstrated

- SELECT statements
- CREATE TABLE
- INSERT INTO
- Common Table Expressions (CTEs)
- Window Functions (`ROW_NUMBER()`)
- UPDATE statements
- DELETE statements
- JOIN operations
- TRIM()
- STR_TO_DATE()
- ALTER TABLE
- DROP COLUMN
- NULL handling

## Project Files

| File | Description |
|---|---|
| `layoffs.csv` | Original raw dataset |
| `Layoff_Project.sql` | SQL script containing the data cleaning process |

## How to Run the Project

1. Download or clone this repository.
2. Open MySQL Workbench.
3. Create a database for the project.
4. Import `layoffs.csv` into a table named `layoffs`, using the appropriate column names and data types.
5. Open `Layoff_Project.sql`.
6. Execute the SQL statements in order.
7. Review the cleaned data in the final staging table.

**Note:** The script uses MySQL syntax and requires MySQL 8.0 or later. Run it in a fresh project database because the script creates staging tables.

## Conclusion

This project provided practical experience in using SQL to clean and transform raw data into a more consistent and structured dataset, preparing it for further analysis and reporting.
