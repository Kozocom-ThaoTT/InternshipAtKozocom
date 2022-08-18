--Câu 1: Write the SQL statement to create the tables
DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Region_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Manager_ID` int(11) NOT NULL,
  `Location_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `employees`;
CREATE TABLE `employees` (
  `ID` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `hire_date` date NOT NULL,
  `job_id` varchar(10) NOT NULL,
  `salary` int(11) NOT NULL,
  `commission_pct` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` varchar(100) NOT NULL,
  `title` varchar(255) NOT NULL,
  `min_salary` int(11) NOT NULL,
  `max_salary` int(11) NOT NULL,
   PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE `job_grades` (
  `level` int(11) NOT NULL,
  `lowest_sal` int(11) NOT NULL,
  `highest_sal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


DROP TABLE IF EXISTS `job_history`;
CREATE TABLE `job_history` (
  `ID` int(11) NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date NOT NULL,
  `Job_ID` varchar(10) NOT NULL,
  `Department_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `localtion`;
CREATE TABLE `localtion` (
  `ID` int(11) NOT NULL,
  `address` text NOT NULL,
  `postal_code` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_id` int(11) NOT NULL,
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
   PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--Câu 2: Write a SQL statement to update 'id' for 'job_grades' table and set it is the primary key
ALTER TABLE `job_grades` ADD `ID` int(11) NOT NULL PRIMARY KEY;

--Câu 3: Write a Sql statement to update the name of table job -> jobs
ALTER TABLE `job` RENAME TO `jobs`;

--Câu 4, 5: Write a SQL statement to insert data into the tables
--Write a SQL statement to insert 3 rows by a single insert statement
INSERT INTO `regions`(`ID`, `Name`) VALUES 
('1','Đông Nam Á'), 
('2','Châu Á'),
('3','Châu Âu');


INSERT INTO `countries` (`ID`, `Name`, `Region_ID`) VALUES
(1, 'Việt Nam', 1),
(2, 'Lào', 1),
(3, 'Trung Quốc', 2),
(4, 'Nhật Bản', 2),
(5, 'Mỹ', 3);

INSERT INTO `location` (`ID`, `address`, `postal_code`, `city`, `country_id`) VALUES 
('1', '8 Hà Văn Tính, Hòa Khánh Nam, Liên Chiểu', '550000', 'Đà Nẵng', '1'), 
('2', 'Số 1 Phan Bội Châu, Thành phố Huế', '530000', 'Huế', '1'), 
('3', 'Viêng Chăn', '23000', 'Viêng Chăn', '2'), 
('4', 'Florida', '66000', 'Florida', '5'), 
('5', 'Tô Châu', '76000', 'Tô Châu', '3');

INSERT INTO `departments`(`ID`, `Name`, `Manager_ID`, `Location_ID`) VALUES 
('1','Sale','3','1'),
('2','Marketing','2','2'),
('3','IT','4','5'),
('4','Human Resource','5','3'),
('5','R&D','3','3')

INSERT INTO `jobs`(`id`, `title`, `min_salary`, `max_salary`) VALUES 
('AD_PRES','title AD_PRES','3000000','8000000'),
('IT_PROG','title IT Program','7000000','100000000'),
('ST_MAN','title ST_MAN','7000000','15000000'),
('ST_CLERK','title ST_CLERK','3000000','9000000'),
('SH_CLERK','title SH_CLERK','60000000','90000000')

INSERT INTO `employees` (`ID`, `first_name`, `last_name`, `email`, `phone`, `hire_date`, `job_id`, `salary`, `commission_pct`, `department_id`) VALUES 
('1', 'Trần Thị', 'Thảo', 'tthao3333@gmail.com', '0987764294', '2022-08-16', 'AD_PRES', '5000000', '300000', '5'), 
('2', 'Nguyễn Cao Kỳ', 'Duyên', 'duyencaonk@yahoo.com', '0987878787', '2021-04-21', 'ST_MAN', '7000000', '200000', '3'),
('3', 'Nguyễn An', 'Hòa', 'nah2gmail.com', '0986565780', '2021-06-18', 'AD_PRES', '50000000', '7800000', '4'), 
('4', 'Tôn Nữ', 'Hiếu', 'tnhieu@gmail.com', '0787878906', '2019-12-19', 'SH_CLERK', '9000000', '700000', '3'), 
('5', 'Phan ', 'Anh', 'anhphan777@gmail.com', '7654389024', '2019-08-23', 'IT_PROG', '9000000', '3000000', '3');

INSERT INTO `job_grades` (`level`, `lowest_sal`, `highest_sal`, `ID`) VALUES 
('1', '2000000', '10000000', '1'), 
('2', '40000000', '80000000', '2'), 
('3', '3000000', '10000000', '3'), 
('3', '7000000', '20000000', '4'), 
('4', '50000000', '80000000', '5');

INSERT INTO `job_history` (`ID`, `Start_date`, `End_date`, `Job_ID`, `Department_ID`) VALUES 
('1', '2021-07-08', '2021-08-11', 'IT_PROG', '1'), 
('2', '2019-08-13', '2020-03-17', 'SH_CLERK', '2'), 
('3', '2020-08-12', '2020-10-15', 'SH_CLERK', '3'), 
('4', '2020-05-13', '2022-05-26', 'ST_MAN', '3'), 
('5', '2018-11-15', '2022-07-03', 'AD_PRES', '3');

--Câu 6: Write a SQL statement to change the email to 'hr@gmail.com' of employees table for those employees who belongs to the 'HR' department.
UPDATE `employees` SET `email`='hr@gmail.com'WHERE `department_id` IN (SELECT DE.ID FROM `departments` DE WHERE DE.Name = 'Human Resource');

--7: Write a SQL statement to change job ID of employee which ID is 2, to SH_CLERK if the employee belongs to department, 
--which ID is 30 and the existing job ID does not start with SH.
UPDATE `employees` E SET E.job_id = 'SH_CLERK' WHERE E.ID = 2 AND E.department_id = 30 AND E.job_id NOT LIKE 'SH%';

--8: Write a SQL statement to increase the salary of employees under the department 40, 90 and 110 
--according to the company rules that, salary will be increased by 25% for the department 40, 15% for department 90 and 10% for the department 110 and the rest of the departments will remain same.
UPDATE `employees` E SET E.salary = CASE E.department_id 
WHEN 40 THEN E.salary*1.25
WHEN 90 THEN E.salary*1.15
WHEN 110 THEN E.salary*1.1
ELSE E.salary
END

--9:  9. Write a SQL statement to increase the minimum and maximum salary of PU_CLERK by 2000 as well as 
--the salary for those employees by 20% and commission percent by .10.
UPDATE `jobs` J,`employees` E SET 
J.min_salary = J.min_salary+2000,
J.max_salary = J.max_salary+2000,
E.salary = E.salary*1.20,
E.commission_pct = E.commission_pct*1.10
WHERE J.id = 'PU_CLERK' AND E.job_id = 'PU_CLERK'

--10: Write a SQL statement to change name table localtion to locations.
ALTER TABLE `localtion` RENAME TO `locations`;

--11: Write a SQL statement to add a column 'region_id' after 'city' to the table locations.
ALTER TABLE `locations` ADD `region_ID` INT AFTER `city`;

--12: Write a SQL statement to drop the column city from the table locations.
ALTER TABLE `locations` DROP `city`;

--13: Write a SQL statement to add a primary key for a combination of columns location_id and country_id
ALTER TABLE `locations` ADD PRIMARY KEY(id,country_id);

--14: Write a SQL statement to drop the existing primary from the table locations on a combination of columns location_id and country_id
ALTER TABLE `locations` DROP PRIMARY KEY;

--15: Write a SQL statement to add a foreign key on job_id column of job_history table referencing to the primary key job_id of jobs table
ALTER TABLE `job_history` ADD FOREIGN KEY(job_id) REFERENCES jobs(ID);

--16: Write a SQL statement to add an index named indx_job_id on job_id column in the table job_history
ALTER TABLE `job_history` ADD INDEX indx_job_id(`Job_ID`);

--17, 26: Write a query to get first name from employees table after removing white spaces from both side
SELECT TRIM(E.first_name) FROM `employees` E;

--18: Write a query to get unique department ID from employee table
SELECT DISTINCT E.department_id FROM `employees` E

--19: Write a query to get all employee details from the employee table order by first name, descending
SELECT * FROM `employees` E ORDER BY E.first_name DESC;

--20: Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT E.ID, CONCAT(E.first_name, " ",E.last_name) AS Names, E.salary FROM `employees` E ORDER BY E.salary ASC;

--21: WWrite a query to get the average salary and number of employees in the employees table
SELECT COUNT(E.ID) AS SL, AVG(E.salary) AS SA_AVG FROM `employees` E;

--22: Write a query to get the number of employees working with the company.
SELECT COUNT(*) FROM `employees`;

--23: Write a query to get the number of jobs available in the employees table
SELECT COUNT(DISTINCT E.job_id) AS jobs_available FROM `employees` E;

--24: Write a query get all first name from employees table in upper case
SELECT UPPER(E.first_name) FROM `employees` E;

--25: Write a query to get the first 3 characters of first name from employees table.
SELECT SUBSTRING(E.first_name, 1, 3) FROM `employees` E;

--27: Write a query to get the length of the employee names (first_name, last_name) from employees table
SELECT LENGTH(E.first_name)+LENGTH(E.last_name) AS Length_Names FROM `employees` E;

--28: Write a query to check if the first_name fields of the employees table contains numbers
SELECT * FROM `employees` E WHERE E.first_name REGEXP '[0-9]';

--29: Write a query to select first 10 records from a table.
SELECT * FROM `employees` LIMIT 10;

--30: Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 30 or 100
SELECT CONCAT(E.first_name,' ', E.last_name) AS Names FROM `employees` E WHERE E.salary NOT BETWEEN 10000 AND 15000 AND (E.department_id = 30 OR E.department_id = 100);

--31: Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 2020
SELECT CONCAT(E.first_name,' ', E.last_name) AS Names FROM `employees` E WHERE YEAR(E.hire_date) = 2020

--32: Write a query to display the first_name of all employees who have both "b" and "c" in their first name
SELECT E.first_name FROM `employees` E WHERE E.first_name LIKE '%b%' AND E.first_name LIKE '%c%';

--33: Write a query to display the last name of employees whose names have exactly 6 characters.
SELECT E.last_name FROM `employees` E WHERE E.last_name LIKE '______';

--34: Write a query to display the last name of employees having 'e' as the third character.
SELECT E.last_name FROM `employees` E WHERE E.last_name LIKE '__e%';

--35: Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.
SELECT * FROM `employees` E WHERE E.last_name IN('BLAKE', 'SCOTT', 'KING', 'FORD');

--36: Write a query to get the maximum salary of an employee working as a Programmer.(IT_PROG)
SELECT * FROM `employees` E WHERE E.job_id ='IT_PROG' ORDER BY E.salary DESC LIMIT 1;

--37: Write a query to get the average salary and number of employees working the department 3
SELECT COUNT(E.ID) AS SL, AVG(E.salary) AS SA_AVG FROM `employees` E WHERE E.department_id = 3;

--38: Write a query to get the highest, lowest, sum, and average salary of all employees
SELECT MAX(E.salary) AS highest, MIN(E.salary) AS lowest, SUM(E.salary) AS sum, AVG(E.salary) AS Avarage FROM `employees` E;

--39: Write a query to get the difference between the highest and lowest salaries
SELECT MAX(E.salary) - MIN(E.salary) AS SA_Different FROM `employees` E;

--40: Write a query to get the department ID and the total salary payable in each department.
SELECT E.department_id, SUM(E.salary) AS Total FROM `employees` E GROUP BY E.department_id;

--41: Write a query to get the average salary for all departments employing more than 10 employees.
SELECT E.department_id, AVG(E.salary) AS SA_AVG, COUNT(*) FROM `employees` E GROUP BY E.department_id HAVING COUNT(*) > 10;

--42: Write a query to find the name (first_name, last_name) and the salary of the employees who have a higher salary than the employee whose last_name='Bull'.
SELECT CONCAT(E.first_name,' ', E.last_name) AS 'Name', E.salary FROM `employees` E WHERE E.salary > (SELECT E.salary FROM `employees` E WHERE E.last_name = 'Bull');

--43 Write a query to find the name (first_name, last_name) of all employees who works in the IT department.
SELECT CONCAT(E.first_name,' ', E.last_name) AS 'Name'FROM `employees` E WHERE E.department_id = (SELECT D.ID FROM `departments` D WHERE D.Name = 'IT');

--44: Write a query to find the name (first_name, last_name), and salary of the employees whose salary is greater than the average salary
SELECT CONCAT(E.first_name,' ', E.last_name) AS 'Name' FROM `employees` E WHERE E.salary > (SELECT AVG(E.salary) FROM `employees` E);

--45: Write a query to find the name (first_name, last_name), and salary of the employees who earn the same salary as the minimum salary for all departments.
SELECT CONCAT(E.first_name,' ', E.last_name) AS 'Name' FROM `employees` E WHERE E.salary = (SELECT MIN(E.salary) FROM `employees` e);

--46: Write a query to display the employee ID, first name, last name, and department names of all employees.
SELECT E.ID, E.first_name, E.last_name, (SELECT D.Name FROM `departments` D WHERE E.ID = D.ID) department FROM `employees` E ORDER BY department;

--47: Write a query to find the 5th maximum salary in the employees table.
SELECT DISTINCT E1.salary FROM `employees` E1 WHERE 5 = (SELECT COUNT(DISTINCT E2.salary) FROM `employees` E2 WHERE E2.salary >= E1.salary);

--48: Write a query to get 3 maximum salaries.
SELECT E.salary FROM `employees` E ORDER BY E.salary DESC LIMIT 3;

--49: Write a query to find the name (first_name, last name), department ID and name of all the employees.
SELECT E.first_name, E.last_name, E.department_id, D.Name AS department_name FROM `employees` E JOIN `departments` D ON E.department_id = D.ID;

--50: Write a query to find the name (first_name, last_name), job, department ID and name of the employees who works in "Da Nang".
SELECT E.first_name, E.last_name, E.job_id, E.department_id, D.Name FROM 
`employees` E JOIN `departments` D ON (E.department_id = D.ID) 
JOIN `locations` L ON (D.Location_ID = L.ID) 
WHERE L.city = 'Da Nang';

--51: Write a query to get the department name and number of employees in the department.
SELECT D.Name AS 'Department Name', COUNT(*) AS 'Number of Employees' FROM 
`departments` D INNER JOIN `employees` E ON E.department_id = D.ID 
GROUP BY D.ID, D.Name 
ORDER BY D.Name;

--52: Write a query to get the first name and hire date from employees table where hire date between '2020-01-01' and '1987-06-30'
SELECT E.first_name, E.hire_date FROM `employees` E WHERE E.hire_date BETWEEN '2020-01-01' AND '1987-06-30';

--53: Write a query to get the years in which more than 10 employees joined.
SELECT YEAR(E.hire_date) FROM `employees` E GROUP BY E.hire_date HAVING COUNT(E.ID) > 10;

--54: Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'.
UPDATE `employees` E SET E.phone = REPLACE(E.phone, '124', '999') WHERE E.phone LIKE '%124%';

--55: Write a query to append '@example.com' to email field
UPDATE `employees` E SET E.email = CONCAT(E.email, '@example.com');

















