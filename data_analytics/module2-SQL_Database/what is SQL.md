# what is SQL ?

1. SQL stands for **structured query language**
2. SQL used for create database | tables structured  
3. SQL is a case insenstive query language
**examples**
```
insert | INSERT | Insert
```
4. SQL is used to create structured of database and tables via its **query or command**
5. SQL is create logics and functional
6. SQL execute query 
7. SQL create views or index to fast load data 
8. SQL create a structured data 

**structured data formate column and rows**
**examples**

|   id      |   name       |     age     |    address     |
|-----------|--------------|-------------|----------------|
|  1        |    mansi     |     25      |    rjt         |
|  2        |    mansi     |     25      |    rjt         |
|  3        |    mansi     |     25      |    rjt         |
|  4        |    mansi     |     25      |    rjt         |
|  5        |    mansi     |     25      |    rjt         |  


# types of SQL query or commands 

1. **DDL (data definition language)**
2. **DML (data manipulation language)**
3. **DQL (data query language)**
4. **TCL (transactional control language)**



# DDL (data definition language)

1. stands for data definition language
2. create an structured of database and tables 
3. rename tables 
4. update | add | modify | drop data in tables or columns in tables 
5. truncate data from tables 

**DDL query are**

1. create 
2. alter 
3. rename 
4. drop 
5. truncate 
6. change 

# how to create database and table structured 

1. create a database 

**syntax**

```
create database databasename;
```

**examples**

```
create database data_analytics_11am
```

2. create a table  structured

**syntax**

```
create table tablename
(
id datatype (size) auto_increment primary key,
columnname datatype (size),
.
.
.
.
.
.
columnname datatype(size)
);

```

**examples**

```
create table tbl_employee(
empid int AUTO_INCREMENT primary key,
name varchar(255),
age int,    
address text, 
salary decimal(10,2),
city varchar(100),
department varchar(200)   
);

```

# what is datatypes and size of column name is tables 

| Column / Field | Data Type | Description |
|---|---|---|
| name | CHAR(0–255) | Stores fixed-length character/string data. Intended for characters/text only. |
| name | VARCHAR(0–255) | Stores variable-length character/string data. Can contain letters, numbers, spaces, and special characters. |
| id | INT | Stores whole numbers, commonly used for IDs and numeric values. |
| bigint_id | BIGINT | Stores very large whole numbers, commonly used for large IDs. |
| age | TINYINT | Stores small whole numbers, commonly used for values such as age. |
| amount | DECIMAL(p,s) | Stores exact decimal numbers, commonly used for money and financial values. |
| price | FLOAT | Stores approximate decimal/floating-point numbers. |
| percentage | DOUBLE | Stores approximate decimal numbers with higher precision than FLOAT. |
| is_active | BOOLEAN | Stores a true/false value. |
| status | ENUM | Stores one value from a predefined list of allowed values. |
| description | TEXT | Stores variable-length text without a small VARCHAR-style limit. |
| long_description | LONGTEXT | Stores very large amounts of text. |
| code | CHAR(n) | Stores fixed-length text. Useful for values with a known, consistent length, such as country codes. |
| email | VARCHAR(255) | Stores email addresses as variable-length text. |
| phone | VARCHAR(20) | Stores phone numbers. VARCHAR is preferred because phone numbers may contain `+`, spaces, `-`, etc. |
| url | VARCHAR(2048) | Stores website or URL strings. |
| date_of_birth | DATE | Stores a calendar date in `YYYY-MM-DD` format. |
| created_at | DATETIME | Stores date and time without timezone conversion. |
| updated_at | TIMESTAMP | Stores a date and time, commonly used for record creation/update timestamps. |
| time | TIME | Stores a time value such as `14:30:00`. |
| year | YEAR | Stores a year value. |
| json_data | JSON | Stores structured JSON data. |
| binary_data | BLOB | Stores binary data such as files or raw bytes. |
| uuid | CHAR(36) | Stores a UUID string such as `550e8400-e29b-41d4-a716-446655440000`. |


**create a 5 tables**

**tbl_reviews**

```
create table tbl_reviews(

    rid int AUTO_INCREMENT primary key,
    name varchar(250),
    email varchar(255),
    phone bigint,
    rating enum('*','**','***','****','*****'),
    COMMENT text
    
);

```
**tbl_product**
```
CREATE TABLE tbl_product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(200),
    category VARCHAR(100),
    price DECIMAL(10, 2),
    quantity INT
);

```
**tbl_student**
```
CREATE TABLE tbl_student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    course VARCHAR(100),
    fees DECIMAL(10, 2)
);

```
**tbl_orders**
```
CREATE TABLE tbl_orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(200),
    quantity INT,
    total_price DECIMAL(10, 2),
    order_date DATE
);

```
**tbl_employee**
```
CREATE TABLE tbl_employee (
    empid INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    password VARCHAR(255),
    age TINYINT,
    salary DECIMAL(10, 2),
    department VARCHAR(255),
    address TEXT
);

```

# create the thinks in workbench database 
# work bench view

![alt text](<Screenshot 2026-09-23 215743.png>)

```
CREATE TABLE `data_analytics_db_11am`.`tbl_employee` (
empid int auto_increment primary key,
name varchar(255),
password varchar(255),
age tinyint,
salary decimal(10,2),
department varchar(255),
address text

);


```

# SQL Data Types, Sizes and Column Naming Guide
## 1. Column and Table Name Limits
| Database | Max Table Name | Max Column Name | Quotes Used | Case Rule |
| --- | --- | --- | --- | --- |
| MySQL | 64 characters | 64 characters | `name` | Case-insensitive |
| PostgreSQL | 63 bytes | 63 bytes | "name" | Lowercase default |
| SQL Server | 128 characters | 128 characters | [name] | Case-insensitive |
| Oracle | 128 bytes | 128 bytes | "NAME" | UPPERCASE default |
| SQLite | Unlimited | Unlimited | "name" | Case-insensitive 


## 2. Integer Data Types
| Data Type | Storage Size | Signed Range | Common Use |
| --- | --- | --- | --- |
| TINYINT | 1 Byte | -128 to 127 | Status codes, Age |
| SMALLINT | 2 Bytes | -32,768 to 32,767 | Small IDs, Year |
| MEDIUMINT | 3 Bytes | -8,388,608 to 8,388,607 | Medium range IDs |
| INT / INTEGER | 4 Bytes | -2,147,483,648 to 2,147,483,647 | Standard Primary Keys |
| BIGINT | 8 Bytes | -9 Quintillion to +9 Quintillion | Large scale Primary Keys |

## 3. Decimal and Floating-Point Types
| Data Type | Syntax | Size | Best For |
| --- | --- | --- | --- |
| DECIMAL(p,s) | Precision (p), Scale (s) | 5 to 17 Bytes | Currency, Money, Prices (Exact) |
| NUMERIC(p,s) | Precision (p), Scale (s) | 5 to 17 Bytes | Exact financial values |
| FLOAT | Single/Double float | 4 or 8 Bytes | Scientific calculations |
| REAL | Single precision | 4 Bytes | Approximate float values |
| DOUBLE | Double precision | 8 Bytes | High precision math |

## 4. String and Text Data Types
| Data Type | Max Length | Storage Type | Best For |
| --- | --- | --- | --- |
| CHAR(n) | 1 to 255 chars | Fixed Length | Country codes (US, IN), Gender |
| VARCHAR(n) | 1 to 65,535 chars | Variable Length | Names, Emails, Passwords, URLs |
| NVARCHAR(n) | 1 to 4,000 chars | Variable Unicode | Multi-language / UTF-16 text |
| TEXT | 64 KB to 1 GB | Large Text | Long descriptions, blog posts |
| LONGTEXT | Up to 4 GB | Large Text | Full articles, big data logs |
| CLOB | Up to 4 GB | Large Text | Oracle large text |

## 5. Date and Time Data Types
| Data Type | Format | Storage Size | Notes |
| --- | --- | --- | --- |
| DATE | YYYY-MM-DD | 3 to 4 Bytes | Date only without time |
| TIME | HH:MM:SS | 3 to 5 Bytes | Time of day |
| DATETIME | YYYY-MM-DD HH:MM:SS | 8 Bytes | Fixed date and time |
| TIMESTAMP | YYYY-MM-DD HH:MM:SS | 4 to 8 Bytes | Timezone-aware UTC timestamp |

## 6. Boolean and Binary Types
| Data Type | Storage Size | Values | Supported Databases |
| --- | --- | --- | --- |
| BOOLEAN | 1 Byte | TRUE, FALSE, NULL | PostgreSQL, MySQL |
| BIT | 1 Bit / 1 Byte | 0, 1 | SQL Server, MySQL |
| BYTEA | Variable | Binary bytes | PostgreSQL |
| BLOB / VARBINARY | Up to 4 GB | Binary files/images | MySQL, SQLite, SQL Server |

## 7. Cross-Database CREATE TABLE Cheat Sheet
### PostgreSQL
```sql
CREATE TABLE users (
    id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    balance NUMERIC(10, 2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP
);
```
### MySQL
```sql
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    balance DECIMAL(10, 2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```
### SQL Server (T-SQL)
```sql
CREATE TABLE users (
    id BIGINT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    email NVARCHAR(255) NOT NULL UNIQUE,
    balance DECIMAL(10, 2) DEFAULT 0.00,
    is_active BIT DEFAULT 1,
    created_at DATETIMEOFFSET DEFAULT SYSDATETIMEOFFSET()
);
```

# alter : 

1. alter is used to add new column after create a table 
2. alter is used to modify | rename | or delete a column name is table 
3. alter is used to add unique key of any column name 

**examples**

1. alter table tbl_employee add country varchar(255);
2. alter table tbl_employee add state varchar(255);
3. alter table tbl_employee add city varchar(255);
4. alter table tbl_employee add photo blob after name;
5. ALTER TABLE tbl_users
ADD COLUMN country VARCHAR(255) AFTER pincode,
ADD COLUMN state VARCHAR(255) AFTER country,
ADD COLUMN city VARCHAR(255) AFTER state;
6. alter table tbl_users change photo  upload_photo blob;
7. alter table tbl_users drop created_at;
8. alter table tbl_users add UNIQUE(`email`);

# rename table:
1. after create table via SQL we can changed a table name via **rename**
  **examples**
  ```
   rename table tbl_country to country
   or
   rename table tbl_users to users

  ```

# rename database name :

  ```  
 CREATE DATABASE IF NOT EXISTS data_analytics_db_11am_tts;
 DROP DATABASE IF EXISTS data_analytics_db_11am;

  ```
# change :

1. change is a **keyword** that can be changed the column name of table

**examples**

```
alter table employee change photo upload_photo blob;
```
  

# drop : 

1. drop is used to drop database after drop we can not rollback 
2. drop is also used to drop table after drop we never rollback data or its structures 
3. drop is also delete a column name 

# note : after drop we never rollback

**examples**

```
drop database data_analytics_db_11am_tts;
or
drop table users;
or 
drop table users
or
alter table users drop upload_photo;
or 
ALTER TABLE users
DROP COLUMN `state`,
DROP COLUMN `city`;

```

# truncate :

1. truncate is used to empty all data from tables 
2. after truncate we never rollback data from tables

**examples**

```
truncate table users;
or 
truncate table review
```
# after truncate we never rollback data

# **DML (data manipulation language)**

1. DMl is used to insert single data or multiple data in tables 
2. DMl is used to delete all data or particular one data or alternate data or range of data from tables
3. DMl is used to update single data or multiple data in tables 

**examples**

1. **insert a single data or row**
**examples**

```
insert into country (cname,created_at) values('india','29/09/2026')
```

2. **insert a multiple data or row**
**examples**

```
insert into country (cname,created_at) values('usa','29/09/2026'),('australia','29/09/2026'),('uk','29/09/2026'),('iran','29/09/2026')

or
insert into country (cname,created_at) values('usa','29/09/2026'),('australia','29/09/2026'),('uk','29/09/2026'),('iran','29/09/2026')
or

insert into country values(null,'canada','29/09/2026'),(null,'thailand','29/09/2026'),(null,'china','29/09/2026'),(null,'japan','29/09/2026')

or

INSERT into employee values(null, 'smith','smith.jpg','s254545',21,14500,'IT','150 rajkot','india','gujrat','rajkot'),(null, 'rushikesh','rushi.jpg','r254545',22,15500,'IT','150 rajkot','india','gujrat','rajkot'),(null, 'priyanshu','p.jpg','p254545',24,16500,'CSE','150 rajkot','india','gujrat','junagad'),(null, 'ashtha','astha.jpg','a254545',25,16500,'CSE','150 rajkot','india','gujrat','jamanagar'),(null, 'mansi','mansi.jpg','m254545',24,18500,'IT','150 feet ring road lucknow','india','uttar pradesh','lucknow')

```
   
**update data or row**

1. update a single data 
   **examples**
   ```
   update country set cname='america' where cid=9;
   or
   update country set cname='bharat', created_at='27/09/2026' where cid=1;

   ```

**delete data or rows**

1. delete all data 
   **examples**
   ```
   delete from country;
   ```
2. delete one  data from table 
   **examples**
   ```
   delete from country where cid=2;
   ```

3. delete one  data from table via its name 
   **examples**
   ```
   delete from country where cname='america';
   ```

4. delete alternate  data from table 
   **examples**
   ```
   delete from country where cid in (2,4,6);
   ```

5. delete range of   data from table 
   **examples**
   ```
   delete from country where cid between 100 and 255;
   ```


# DQL (data query language)
**DQL only used **select** keyword to fetch or retrieve data from tables


1. DQL is used to fetch or retrieve data from tables
2. DQL is used to fetch data from single table or multiple tables via join query
3. DQL is used to select data from tables using **select** keyword
4. DQL is also used to filter data from tables using **where** keyword
5. select is also used to fetch or filter data in order by ascending or descending order using **order by** keyword
6. select is also used to fetch or filter data in group by using **group by**
7. select is also used to select range of from tables using **between** keyword
8. select alternative data from tables using **in** keyword
9. select data from tables using **like** keyword it is also used to search data from tables using **%** and **_** keyword or wildcard
10. select data from tables using **distinct** keyword it is also used to fetch unique data from tables
11. select data from tables using **limit** keyword it is also used to fetch limited data from tables.
12. select data from tables using **join** keyword it is also used to fetch data from multiple tables via join query
13. select data from tables using **union** keyword it is also used to fetch data from multiple tables via union query
14. select data from tables using **subquery** keyword it is also used to fetch data from multiple tables via subquery

  **examples**
  ```
  subquery means query inside query
  
  ```
 15. select data from tables using **alias** keyword it is also used to fetch data from multiple tables via alias query

 **examples**
  ```
  alias means rename a column name or table name via select query
  alias used keyword **as** to rename a column name or table name

  ``` 

  16. select data from tables using **aggregate functions** keyword it is also used to fetch data from multiple tables via aggregate functions query

  **examples of aggrigate functions**
  ```
  1) max() - it is used to fetch maximum value from tables
  2) min() - it is used to fetch minimum value from tables
  3) sum() - it is used to fetch sum of values from tables
  4) avg() - it is used to fetch average of values from tables
  5) count() - it is used to fetch count of values from tables

  ```

  17. select used in scalar functions to fetch data from tables using **scalar functions** keyword it is also used to fetch data from multiple tables via scalar functions query

  **examples of scalar functions**
  ```
   1) upper() - it is used to convert data in uppercase from tables
   2) lower() - it is used to convert data in lowercase from tables
   3) length() - it is used to fetch length of data from tables
   4) round() - it is used to round the decimal values from tables
   5) now() - it is used to fetch current date and time from tables
   6) curdate() - it is used to fetch current date from tables
   7) curtime() - it is used to fetch current time from tables

   ```

18. select used in date functions to fetch data from tables using **date functions** keyword it is also used to fetch data from multiple tables via date functions query

  **examples of date functions**
  ```
   1) date() - it is used to fetch date from datetime values from tables
   2) time() - it is used to fetch time from datetime values from tables
   3) year() - it is used to fetch year from datetime values from tables
   4) month() - it is used to fetch month from datetime values from tables
   5) day() - it is used to fetch day from datetime values from tables
   6) datediff() - it is used to fetch difference between two dates from tables
   7) date_add() - it is used to add days, months, years to a date value in tables
   8) date_sub() - it is used to subtract days, months, years from a date value in tables

   ```
19. select used in string functions to fetch data from tables using **string functions** keyword it is also used to fetch data from multiple tables via string functions query

  **examples of string functions**
  ```
   1) concat() - it is used to concatenate two or more strings from tables
   2) substring() - it is used to fetch a substring from a string value in tables
   3) replace() - it is used to replace a substring with another substring in a string value in tables

   4) trim() - it is used to remove leading and trailing spaces from a string value in tables
   
   5) instr() - it is used to find the position of a substring in a string value in tables

   ```

20. select used in mathematical functions to fetch data from tables using **mathematical functions** keyword it is also used to fetch data from multiple tables via mathematical functions query

  **examples of mathematical functions**
  ```
   1) abs() - it is used to fetch absolute value of a number from tables

   2) ceil() - it is used to fetch the smallest integer greater than or equal to a number from tables
   
   3) floor() - it is used to fetch the largest integer less than or equal to a number from tables
   
   4) power() - it is used to fetch the power of a number from tables
   
   5) sqrt() - it is used to fetch the square root of a number from tables

   ```

   **examples of DQL query**

   1. select all data from table
   
   ```
   select * from tablename;
   or
   select * from employee;
   ```
   2. select particular column name from table
   
   ```
   select columnname from tablename;
   or
   select empid,name,age,salary from employee;

   ```

  3. select data of 1 rows 

    **where** keyword is used to filter data from tables

   ```
   select * from tablename where columnname=value;
   or
   select * from employee where name='mansi';
   or
   select * from employee where empid=1;
   or
   select * from employee where empid=1 and name='smith';
   or
   select * from employee where empid=1 or name='mansi';
   ```

# select range of data from tables using **between** keyword

   ```
   select * from employee where empid between 1 and 4;

   ```
# select alternative data from tables using **in** keyword

   ```
   select * from employee where empid in (2,3,5);
   or
   select * from employee where name in ('smith','mansi');
   or
   select * from employee where empid not in (2,3,5);
   or
   select * from employee where name not in ('smith','mansi');
   or
   select * from employee where age in (25,30,35);
   ```
# select data using limit keyword to fetch limited data from tables

   ```
   select * from employee limit 3;
   or
   select * from employee limit 4;
   or
   select * from employee limit 6;
   or
   select * from employee limit 1,4;
   or
   select * from employee limit 0,4;
   or
   select * from employee limit 7,8;
   ```
# select data using like keyword to fetch data from tables
  
  **like** keyword is used to search data from tables using **%** and **_** keyword or wildcard

   ```
   select * from employee where name like 'a%';
   or
   select * from employee where name like '%h';
   or
   select * from employee where name like '%h';
   or
   select * from employee where name like '%m%';
   or
   select * from employee where name like '%a%';
   or
   select * from employee where name like '_m%';
   or
   select * from employee where name like '____h';
   or
   select * from employee where name like '____%h';

   ```

**list out all types of keywords used in SQL query**

1. select
2. from
3. where
4. order by
5. group by
6. having
7. limit
8. distinct
9. in
10. between
11. like
12. join
13. union
14. subquery
15. alias
16. aggregate functions
17. scalar functions
18. date functions
19. string functions
20. mathematical functions
21. insert
22. update
13. delete
14. alter
15. rename
16. drop
17. truncate
18. create
19. change
20. add

# how to rename a column name in table using **alias** keyword

1. alias is used to rename a column name in table using **as** keyword

```
select name as employee_name from employee;
or
select empid, name as employee_name from employee;
or
select empid, name as employee_name, address as employee_address from employee;
```