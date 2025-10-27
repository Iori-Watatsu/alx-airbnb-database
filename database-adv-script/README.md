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

