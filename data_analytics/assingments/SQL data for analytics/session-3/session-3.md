# Task

1. Write an SQL query to select all restaurants from a table named 'restaurants' where the rating is greater than or equal to 4.5.

2. In a table called 'movies', filter and display only the movies released after 2020 and with genre 'Action' using the WHERE clause and AND operator.

3. Given a table 'products' with columns (id, name, price, category), write a query to find all products not in the 'Electronics' category or with a price less than 500.

4. Write an SQL query for a table 'users' to show all users who are NOT from 'Ahmedabad' and have more than 1000 followers.<br><br><em><strong>Hint:</strong> Use the NOT operator combined with AND.</em>

**soultion**

## 1. Select Restaurants with Rating >= 4.5

```sql
SELECT * FROM restaurants WHERE rating >= 4.5;
```
![alt text](image.png)

---

## 2. Movies Released After 2020 with Genre 'Action

```sql
SELECT * FROM movies WHERE release_year > 2020   AND genre = 'Action';
```
![alt text](image-1.png)

---

## 3. Products Not in 'Electronics' or Price < 500

```sql
SELECT * FROM products WHERE category != 'Electronics' OR price < 500;
```

![alt text](image-2.png)

---

## 4. Users NOT from 'Ahmedabad' and Followers > 1000

```sql
SELECT * FROM users WHERE NOT city = 'Ahmedabad' AND followers > 1000;
```
![alt text](image-3.png)

---