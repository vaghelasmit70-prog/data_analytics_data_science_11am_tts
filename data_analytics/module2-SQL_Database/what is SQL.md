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