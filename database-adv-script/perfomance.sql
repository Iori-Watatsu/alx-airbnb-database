-- Initial query: retrieve all bookings with user, property, and payment details
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.city AS property_city,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.created_at AS booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Analyze performance of the initial query
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    u.email AS user_email,
    p.name AS property_name,
    p.city AS property_city,
    pay.amount AS payment_amount,
    pay.status AS payment_status,
    b.created_at AS booking_date
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id;

-- Optimized query: filter by specific conditions to reduce result set
EXPLAIN ANALYZE
SELECT
    b.id AS booking_id,
    u.name AS user_name,
    p.name AS property_name,
    pay.amount AS payment_amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.id = pay.booking_id
WHERE p.city = 'New York'
AND pay.status = 'completed';
