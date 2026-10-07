# Global Layoffs Data Cleaning & Transformation Using SQL

## Project Overview

This project demonstrates a SQL data-cleaning workflow performed on a global layoffs dataset.

The goal was to prepare the raw data for reliable analysis by identifying duplicate records, standardizing inconsistent values, handling missing information, converting date values into a usable date format, and removing unnecessary data.

## Tool Used

- MySQL

## SQL Skills Demonstrated

- Common Table Expressions (CTEs)
- `ROW_NUMBER()`
- `PARTITION BY`
- Joins
- `UPDATE`
- `DELETE`
- `ALTER TABLE`
- `TRIM()`
- `STR_TO_DATE()`
- Data standardization
- Missing-value handling
- Duplicate identification and removal

## Data Cleaning Process

### 1. Duplicate Identification and Removal

The project uses `ROW_NUMBER()` together with `PARTITION BY` to identify duplicate records and remove duplicate entries while retaining the required record.

### 2. Data Standardization

Inconsistent values were cleaned and standardized. This includes trimming unwanted characters and spaces and standardizing values within relevant columns.

### 3. Industry Data Cleaning

Industry values were reviewed for inconsistencies and missing values. Where appropriate, missing industry information was populated using related records through a self-join.

### 4. Country Data Cleaning

Country values were standardized to improve consistency across the dataset.

### 5. Date Conversion

Date values were converted from their original text representation into the SQL `DATE` data type using `STR_TO_DATE()`.

### 6. Missing-Value Handling

Blank and `NULL` values were investigated. Records that could not be appropriately populated were removed where required by the cleaning process.

### 7. Final Cleanup

Unnecessary columns were removed after the cleaning process was completed.

## Result

The final dataset was prepared in a cleaner and more consistent form, making it more suitable for subsequent analysis.

## Project Files

- `global_layoffs_data_cleaning.sql` — SQL script containing the data-cleaning workflow.
- `README.md` — Project documentation.

## What I Learned

This project strengthened my practical SQL skills, particularly in using window functions, CTEs, joins, data-standardization techniques, date conversion, and missing-data handling as part of a structured data-cleaning workflow.

## Scope Note

This project focuses on **data cleaning and transformation**. It does not claim to be a full exploratory or statistical analysis of the layoffs dataset.
