-- Find all properties where the average rating is greater than 4.0 using subquery
SELECT id, name
FROM propertiesWHERE id IN (_
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Find users who have made more than 3 booings using a correlated subquery
SELECT  id, name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user _id = u.id
) > 3;