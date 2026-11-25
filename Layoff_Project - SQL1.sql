select * from layoffs;
#creat a copy from the row data 
create table Layoffs_Statging  
like layoffs;
select * from Layoffs_Statging;
insert Layoffs_Statging 
select * from layoffs;

# Check and remove dupplicats 

select * ,
row_number() over( partition by company, location,industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as 
Row_Num from Layoffs_Statging;

with duplicate_cte as 
(select * ,
row_number() over( partition by company, location,industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as 
Row_Num from Layoffs_Statging)
select * from duplicate_cte where row_num > 1;

CREATE TABLE `layoffs_statging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `Row_Num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert into layoffs_statging2
select * ,
row_number() over( partition by company, location,industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as 
Row_Num from Layoffs_Statging;
select * from layoffs_statging2 where Row_Num > 1;
delete from layoffs_statging2 where Row_Num > 1;

# Standerdize data

select distinct company
from layoffs_statging2 order by 1;

update layoffs_statging2
set company = trim(company);

select distinct industry 
from layoffs_statging2 order by 1; 

select * from  layoffs_statging2 
where industry like 'Crypto%';

update layoffs_statging2 
set industry = 'Crypto'
where industry like 'Crypto%';

select distinct industry from layoffs_statging2;

select distinct location from layoffs_statging2 order by 1;

update layoffs_statging2 
set location = 'Dusseldorf'
where location like '%sseldorf';

update layoffs_statging2 
set location = 'Malmo'
where location like 'Malm%';

update layoffs_statging2 
set location = 'Florianópolis'
where location like 'Florian%';

select distinct country from layoffs_statging2 order by 1;

update layoffs_statging2 
set country = trim(trailing '.' from country)
where country like 'United States.';
 
select * from layoffs_statging2;

# to change date type from text to date 

select `date` ,
str_to_date(`date`,'%m/%d/%Y')
from layoffs_statging2;

update layoffs_statging2
set `date`= str_to_date(`date`,'%m/%d/%Y');

alter table layoffs_statging2
modify column `date` date;

# to check blank or nulls rows 

select * from layoffs_statging2 
where industry is null 
or industry = '' ;

update layoffs_statging2 
set industry = null
where industry = '';

update layoffs_statging2 t1 
join layoffs_statging2 t2
	on t1.company = t2.company
set t1.industry = t2.industry
where t1.industry is null
and t2.industry is not null;

# deleting unnecessary colums or rows 
select * from layoffs_statging2
where total_laid_off is null
and percentage_laid_off is null;

delete from layoffs_statging2 
where total_laid_off is null
and percentage_laid_off is null;

alter table layoffs_statging2
drop column Row_Num;

select * from layoffs_statging2;