-- Global Layoffs Data Cleaning & Transformation
-- Tool: MySQL
-- Portfolio Project
--
-- This script documents the data-cleaning workflow performed on the
-- layoffs dataset. The original SQL statements are preserved below.

# Data Cleaning


select*
from layoffs;


# Remove Duplicates
# Standardize Data
# Nulls values or Blank values
# Remove any Columns


Create TABLE Layoffs_staging
LIKE Layoffs; # this is telling the system to copy the columns from layoffs and pasting it to the new table Layoffs_staging

SELECT*
FROM Layoffs_staging;

INSERT INTO Layoffs_staging 
SELECT*
FROM Layoffs; # ITS TELLING US TO COPPY ALL THE VALUES FROM LAYOFFS AND PASTING IT INTO LAYOFFS_STAGING


SELECT*,
ROW_NUMBER () 
OVER( partition by company, location, industry, total_laid_off, percentage_laid_off, stage, `date`, country, funds_raised_millions) row_num
FROM Layoffs_staging;



with cte_duplicate as
( 
SELECT*,
ROW_NUMBER () 
OVER( partition by company, location, industry, total_laid_off, percentage_laid_off, stage, `date`, stage, country, funds_raised_millions) row_num
FROM Layoffs_staging
)

select*
from cte_duplicate
where row_num > 1;


select*
from Layoffs_staging
where company = 'casper';



show create table layoffs_staging;
CREATE TABLE `layoffs_staging3` (
   `company` text,
   `location` text,
   `industry` text,
   `total_laid_off` int DEFAULT NULL,
   `percentage_laid_off` text,
   `date` text,
   `stage` text,
   `country` text,
   `funds_raised_millions` int DEFAULT NULL,
   `row_num` int 
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

select*
from Layoffs_staging3
where row_num > 1;


insert into Layoffs_staging3
SELECT*,
ROW_NUMBER () 
OVER( partition by company, location, industry, total_laid_off, percentage_laid_off, stage, `date`, country, funds_raised_millions) row_num
FROM Layoffs_staging;



delete 
from Layoffs_staging3
where row_num > 1;

select*
from Layoffs_staging3
where row_num > 1;



select*
from Layoffs_staging3;

 # STANDARDIZING DATA IS FINDING ISSUES IN YOUR DATA AND FIXING IT

SELECT company, (trim(company)) # trim takes the white spaces off where they aren'nt needed
from Layoffs_staging3;


update Layoffs_staging3
set company = trim(company);

select company
from  Layoffs_staging3;

select distinct industry
from  Layoffs_staging3
order by  industry;

select *
from  Layoffs_staging3
where industry like 'crypto%'; # this helped in makinfg all the industry to be only crypto not crypto currency since theyre all the same

update Layoffs_staging3
set industry = 'crypto'
where industry like 'crypto%';

select distinct country
from  Layoffs_staging3
order by 1;

select *
from  Layoffs_staging3
where country like 'United States%'
order by 1;

update  Layoffs_staging3
set country = trim(TRAILING '.'from country) # THIS REMOVES THEDOT IS UNITED STATES
where country like 'United States%';

SELECT `date`,
str_to_date(`date`, '%m/%d/%Y') #always use lower case letters for dates
FROM Layoffs_staging3;  

ALTER TABLE Layoffs_staging3
MODIFY COLUMN `date` DATE; 


select*
from Layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

select industry
from Layoffs_staging3
where industry is null
or industry = '';

select*
from layoffs_staging3
where company = 'Airbnb';

select *
from Layoffs_staging3  t1
join  Layoffs_staging3 t2 
on  t1.company = t2.company
where t1.industry  is null 
and  t2.industry is not null;

# since the update statement didnt work because the first t1 industry is blank therefore we need to change it to null

update Layoffs_staging3 
set industry = null
where industry= '';



UPDATE Layoffs_staging3 t1
join  Layoffs_staging3 t2 
on  t1.company = t2.company
SET t1.industry = t2.industry
where t1.industry  is null 
and  t2.industry is not null;
# since the update statement didnt work because the first t1 industry is blank therefore we need to change it to null

update Layoffs_staging3
set industry = null
where industry= ''; # all these codes writteh after the airbnb is to make industry to not be null


# this is to delete the nulls that arent needed and cant be populated
delete 
from Layoffs_staging3
where total_laid_off is null
and percentage_laid_off is null;

# we dont need row_num anymore therefor we are going to drop the column
ALTER table Layoffs_staging3
drop COLUMN row_num;


select*
from Layoffs_staging3;# it works perfectly cleaning all the nulls in industry, removing columns, deleting data, populating data










