# SQL Practice Questions — DDL | DML | DQL | TCL

 ## Intermediate Level — 1–50

 ### DDL

 1. What is the difference between `CREATE`, `ALTER`, `DROP`, and `TRUNCATE` in SQL?
2. How do you create a table named `employees` with columns `employee_id`, `name`, `salary`, and `department_id`?
3. How do you add a new column `email` to an existing `employees` table?
4. How do you modify the data type of the `salary` column?
5. How do you rename a column in an existing table?
6. How do you rename the `employees` table to `staff`?
7. How do you remove the `email` column from the `employees` table?
8. How do you create a table with a primary key?
9. How do you create a table with a `NOT NULL` constraint?
10. How do you create a table with a `UNIQUE` constraint?
11. How do you create a table with a `DEFAULT` constraint?
12. How do you create a table with a `CHECK` constraint ensuring salary is greater than `0`?
13. How do you create a foreign key between `employees` and `departments`?
14. What happens to the table structure and data when `TRUNCATE` is executed?
15. What is the difference between `DROP TABLE` and `TRUNCATE TABLE`?

 ### DML

 16. How do you insert a single employee record into the `employees` table?
17. How do you insert multiple employee records using a single `INSERT` statement?
18. How do you update the salary of a specific employee?
19. How do you increase the salary of all employees by 10%?
20. How do you update employees belonging to a specific department?
21. How do you delete a specific employee using `DELETE`?
22. How do you delete all employees belonging to a specific department?
23. What is the difference between `DELETE` and `TRUNCATE`?
24. How can you copy data from one table into another using `INSERT INTO ... SELECT`?
25. How do you update multiple columns of a record in a single `UPDATE` statement?
26. How do you delete employees whose salary is below a specific amount?
27. How do you insert a record while explicitly specifying only selected columns?
28. How do you insert records from a `SELECT` query into another table?
29. What happens if an `UPDATE` statement is executed without a `WHERE` clause?
30. What happens if a `DELETE` statement is executed without a `WHERE` clause?

 ### DQL

 31. How do you retrieve all records from the `employees` table?
32. How do you retrieve only the `name` and `salary` columns from `employees`?
33. How do you retrieve employees whose salary is greater than `50,000`?
34. How do you retrieve employees belonging to either the IT or HR department?
35. How do you sort employees by salary in descending order?
36. How do you retrieve unique department IDs from the `employees` table?
37. How do you find employees whose names start with the letter `A`?
38. How do you find employees whose names contain the word `an`?
39. How do you retrieve employees whose salary falls between `40,000` and `80,000`?
40. How do you retrieve employees whose department ID is `NULL`?
41. How do you calculate the average salary of all employees?
42. How do you find the maximum and minimum salary from the `employees` table?
43. How do you count the total number of employees?
44. How do you count employees in each department?
45. How do you find departments having more than five employees?
46. How do you retrieve the top five highest-paid employees?
47. How do you join `employees` with `departments` to display employee names and department names?
48. What is the difference between `WHERE` and `HAVING`?
49. How do you find employees who do not have a matching department?
50. How do you retrieve employees sorted first by department and then by salary?

 ### TCL

 51. What is the purpose of `COMMIT` in SQL?
52. What is the purpose of `ROLLBACK` in SQL?
53. What is a `SAVEPOINT`?
54. How do you create a savepoint named `sp1`?
55. How do you rollback a transaction to a specific savepoint?
56. What happens to uncommitted changes when a `ROLLBACK` is executed?
57. What happens to savepoints after a `COMMIT`?
58. How does transaction control differ from data manipulation?
59. Can a transaction contain multiple `INSERT`, `UPDATE`, and `DELETE` statements?
60. Why is transaction control important when modifying critical business data?

---

 # Advanced Level — 61–100

 ### DDL

 61. How would you design a normalized database schema for `customers`, `orders`, `products`, and `order_items`?
62. How would you create a composite primary key for an `order_items` table?
63. How would you create multiple foreign keys in a single table?
64. How would you define a foreign key with `ON DELETE CASCADE`?
65. How would you define a foreign key with `ON DELETE SET NULL`?
66. What problems can occur when altering a table that contains millions of rows?
67. How would you add a `NOT NULL` constraint to an existing column that already contains `NULL` values?
68. How would you add a `UNIQUE` constraint to an existing column containing duplicate values?
69. What is the difference between a primary key, unique key, and foreign key?
70. How would you design constraints to prevent duplicate order records?
71. How would you create a table containing generated or identity columns?
72. What is the difference between a clustered and non-clustered index?
73. How would you create an index on multiple columns?
74. When would you create a composite index instead of multiple single-column indexes?
75. How can database schema changes affect existing applications and queries?

 ### DML

 76. How would you update employee salaries based on the average salary of their department?
77. How would you update records in one table using data from another table?
78. How would you delete duplicate records while keeping only one record from each duplicate group?
79. How would you delete customers who have never placed an order?
80. How would you insert only new customers from a staging table into the main customer table?
81. How would you synchronize records between a source table and a target table?
82. How would you perform an upsert operation when a record already exists?
83. How would you update multiple rows with different values in a single statement?
84. How would you increase salaries by different percentages based on employee departments?
85. How would you move data from an active table to an archive table and then remove it from the active table?
86. How would you safely delete millions of records without causing a long-running transaction?
87. What issues can occur when multiple users update the same row simultaneously?
88. How can foreign key constraints affect `DELETE` and `UPDATE` operations?
89. How would you use a staging table to validate data before inserting it into a production table?
90. How would you handle an `INSERT` operation when some source records violate a unique constraint?

 ### DQL

 91. How would you find the second-highest salary without using `LIMIT` or `TOP`?
92. How would you find the third-highest salary using a window function?
93. How would you find the highest-paid employee in each department?
94. How would you find employees whose salary is greater than their department's average salary?
95. How would you find duplicate records based on multiple columns?
96. How would you find customers who placed orders in every month of a given year?
97. How would you find the top three highest-selling products in each category?
98. How would you calculate a running total of sales ordered by transaction date?
99. How would you find consecutive days on which a customer placed orders?
100. How would you write a query to identify employees whose salary increased compared with their previous salary record?

**Ans**

1. Create - create is used to creatre specific database and tables,
alter - alter uesd to modify, update, add specfic data and dalete a data,
truncate - truncate used to delete rows from data and no rollback data,
drop - drop used to delete all database and tables and no rollback the database and tables.

2. ```sql
    create table employees(
    employee_id int primary key auto_increment,
    name varchar(100),
    salary decimal(10,2),
    department_id varchar(100)
);

3. ```sql
    alter table employees
    add column eamil varchar(100);   
    ```

4. ```sql
    alter table employees
    modify column salary decimal (10,2);
    ```

5. ```sql
    alter table employees
    rename column salary to salary_amout;
    ```

6. ```sql
    rename table employees to staff;
    ```

7. ```sql
    alter table staff
    drop column name;
    ```

8. ```sql
    create table if not exists products (
	product_id int primary key auto_increment,							
    product_name varchar(100),
    product_price decimal(10,2),
    product_date_of_expary date
    );
    ```

9. ```sql
    CREATE TABLE employees (
    id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2)
);
    ```

10. ```sql
    create table unique_values(
    id int, 
    email varchar(100) unique
);
    ```