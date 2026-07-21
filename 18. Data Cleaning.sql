#----- Data Cleaning -----
	#--- 1. Creating staging/duplicate data to work on
	#--- 2. Remove duplicates
	#--- 3. Standardize the Data
	#--- 4. Null values or blank values (optional)
	#--- 5. Remove columns (optional)

CREATE TABLE layoffs_staging
like layoffs;

SELECT *
FROM layoffs_staging;

INSERT layoffs_staging
SELECT *
FROM layoffs;

#--- Let's remove duplicates ---
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num  #--- I had to create the row number because the data didnt have a row_num
FROM layoffs_staging;

#--- If any row-number is 2 or above, that means there is a duplicate
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
 `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

#--- to verify the duplicate
SELECT *
FROM layoffs_staging
WHERE company = 'Casper';

#--- Identify the exact row you want to remove, so you can leave one
WITH duplicate_cte AS
(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging
)
DELETE
FROM duplicate_cte
WHERE row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *
FROM layoffs_staging2
WHERE row_num >1;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off,
 `date`, stage, country, funds_raised_millions) AS row_num
FROM layoffs_staging;

#--- This is to delete the duplicate
DELETE
FROM layoffs_staging2
WHERE row_num > 1;

#--- this is to check that the duplicate has been deleted
SELECT *
FROM layoffs_staging2;



#--- DATE COLUMN
#--- Change date column from text to date

SELECT `date`,
str_to_date(`date`, '%m/%d/%Y')
FROM layoffs_staging2;

SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = str_to_date(`date`, '%m/%d/%Y');

#--- To modify it to a date column
ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;



#----- STANDARDIZING DATA -----

SELECT company, Trim(company)
FROM layoffs_staging2;

#--- This will update the "company column" in the table to the Trimmed one
UPDATE layoffs_staging2
SET company = TRIM(company);

#--- to standardize a particular word or text to all have thesame spelling like "crypto / cryto-currency"
SELECT *
FROM layoffs_staging2
WHERE industry LIKE 'crypto%';

UPDATE layoffs_staging2
#--- this will change all the words have "crypto--- and leave everything as Crypto
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto';

#-- I used DISTINCT to check for errors on each columns.
#-- you can say select DISTINCT "column_name"
SELECT DISTINCT country
FROM layoffs_staging2
order by 1;

#-- to fix a spelling on a word or an error in country column, where "united states" was written as "united states."
SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
from layoffs_staging2
WHERE country LIKE 'United States%'
ORDER BY 1;

#--- to update the new file 'layoffs_staging2'
UPDATE layoffs_staging2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%';

SELECT *
FROM layoffs_staging2;



#--- NULL / BLANK VALUES

#-- to look at the nulls column
SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
;

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off is NULL;

SELECT industry
FROM layoffs_staging2
;


#---- Removing Rows and Columns
SELECT DISTINCT industry
FROM layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE industry is NULL
OR industry = ''
;

SELECT *
FROM layoffs_staging2
WHERE company = 'Airbnb';

#--- lets see the nulls or blank in industry
SELECT *
FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE (t1.industry is NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = '';

SELECT *
FROM layoffs_staging2
WHERE industry is NULL 
OR industry = '';

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry is NULL
AND t2.industry IS NOT NULL;


SELECT *
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off is NULL;

DELETE
FROM layoffs_staging2
WHERE total_laid_off is NULL
AND percentage_laid_off is NULL;

SELECT *
FROM layoffs_staging2;

#--- To drop a column from a table

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

#--- This is the final cleaned data
SELECT *
FROM layoffs_staging2;











