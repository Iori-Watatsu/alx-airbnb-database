# Complex SQL Joins — Airbnb Database


## Objective
Demonstrate understanding of SQL joins by writing queries that combine data from multiple related tables in the Airbnb database schema.

---

## Queries Overview

### INNER JOIN — Users and Bookings
Retrieves all bookings **that have a matching user**.

SELECT
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email AS user_email
FROM bookings
INNER JOIN users ON bookings.user_id = users.id;

### LEFT JOIN — Properties and Reviews

Retrieves all properties, and includes their reviews if they exist.
If a property has no reviews, it still appears in the results with NULL review fields.

SELECT
    properties.id AS property_id,
    properties.name AS property_name,
    reviews.id AS review_id,
    reviews.rating,
    reviews.comment
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;

### FULL OUTER JOIN — Users and Bookings

Retrieves all users and all bookings, even if:

- a user has no bookings, or

- a booking is not linked to a user.

SELECT
    users.id AS user_id,
    users.name AS user_name,
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date
FROM users
FULL OUTER JOIN bookings ON users.id = bookings.user_id;

## Notes

- Use INNER JOIN when both sides must have matching records.

- Use LEFT JOIN to keep all records from the left table, even without matches.

- Use FULL OUTER JOIN to include all records from both sides.

1. Practice Subqueries
mandatory

Objective: Write both correlated and non-correlated subqueries.

Instructions:

    Write a query to find all properties where the average rating is greater than 4.0 using a subquery.

    Write a correlated subquery to find users who have made more than 3 bookings.

Repo:

    GitHub repository: alx-airbnb-database
    Directory: database-adv-script
    File: subqueries.sql, README.md

# Subqueries

This directory contains SQL scripts that demonstrate the use of subqueries in the ALX Airbnb Database project.

## Files

- **subqueries.sql**: Contains SQL statements that use both non-correlated and correlated subqueries.

## Tasks

1. **Non-Correlated Subquery**
   Retrieve all properties where the average rating is greater than 4.0.

2. **Correlated Subquery**
   Retrieve all users who have made more than 3 bookings.

# Aggregations and Window Functions

This directory contains SQL scripts that demonstrate the use of aggregation and window functions in the ALX Airbnb Database project.

## Files

- **aggregations_and_window_functions.sql**: SQL script that performs aggregation and ranking analysis.

## Tasks

1. **Aggregation Query**
   - Find the total number of bookings made by each user using `COUNT` and `GROUP BY`.

2. **Window Function Query**
   - Rank all properties based on the total number of bookings using `RANK()` and `OVER (ORDER BY ...)`.


