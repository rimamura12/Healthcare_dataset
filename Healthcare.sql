select count(*) as row_total
from healthcare_dataset;

select*
from healthcare_dataset;

select count(name)
from healthcare_dataset;

select*,
row_number() over(
partition by `name`, `gender`, `Doctor`) as row_num
from healthcare_dataset;

with duplicate_cte as
(
select*,
row_number() over(
partition by `name`, `gender`, `Doctor`) as row_num
from healthcare_dataset
)
select*
from duplicate_cte
where row_num > 1;

CREATE TABLE `healthcare_dataset2` (
  `Name` text,
  `Age` int DEFAULT NULL,
  `Gender` text,
  `Blood Type` text,
  `Medical Condition` text,
  `Date of Admission` text,
  `Doctor` text,
  `Hospital` text,
  `Insurance Provider` text,
  `Billing Amount Rnd` int DEFAULT NULL,
  `Room Number` int DEFAULT NULL,
  `Admission Type` text,
  `Discharge Date` text,
  `Medication` text,
  `Test Results` text,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select*
from healthcare_dataset2;

insert into healthcare_dataset2
select*,
row_number() over(
partition by `name`, `gender`, `Doctor`) as row_num
from healthcare_dataset;

select*
from healthcare_dataset2;

with duplicate_cte as
(
select*,
row_number() over(
partition by `name`, `gender`, `Doctor`)
from healthcare_dataset2
)
select*
from duplicate_cte
where row_num > 1;

select*
from healthcare_dataset2
where row_num > 1;

delete 
from healthcare_dataset2
where row_num > 1;

select*
from healthcare_dataset2
where row_num > 1;

select*
from healthcare_dataset2;

update healthcare_dataset2
set `name` = concat(
upper(substring(`name`, 1,1)),
lower(substring(`name`, 2))
);

update healthcare_dataset2
set `name` = upper(`name`);

select*
from healthcare_dataset2;

select* 
from healthcare_dataset2
where `medical condition` = 'cancer' and
`gender` = 'Male';

select count(*) as row_total
from healthcare_dataset2;

select count(*) as row_total
from healthcare_dataset2
where `medical condition` = 'cancer' and
`gender` = 'Male';