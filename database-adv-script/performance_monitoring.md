# Database Performance Monitoring and Refinement Report

## Objective
To continuously monitor and refine the performance of the Airbnb database by analyzing query execution plans and applying schema adjustments for improved efficiency.

---

## 1. Monitoring Query Performance

We used `EXPLAIN ANALYZE` and `SHOW PROFILE` to evaluate the performance of frequently executed queries such as fetching bookings, joining related tables, and filtering by date range.

### Example Query 1: Fetch Bookings by City and Status
```sql
EXPLAIN ANALYZE
SELECT
    b.id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE p.city = 'New York'
AND pay.status = 'completed';
