-- Find the total number of bookings made by each user
SELECT
    u.id AS user_id,
    u.name AS user_name,
    COUNT(b.id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.id = b.user_id
GROUP BY u.id, u.name;

-- Rank properties based on the total number of bookings they have received
SELECT
    p.id AS property_id,
    p.name AS property_name,
    COUNT(b.id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.id) DESC) AS property_rank
FROM properties p
LEFT JOIN bookings b ON p.id = b.property_id
GROUP BY p.id, p.name;

-- Assign a row number to each booking per user, ordered by booking date
SELECT
    b.id AS booking_id,
    b.user_id,
    ROW_NUMBER() OVER (PARTITION BY b.user_id ORDER BY b.booking_date) AS booking_number
FROM bookings b;
