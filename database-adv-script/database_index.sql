-- Create indexes to optimize queries on high-usage columns

-- Index on users.email (frequent lookups by email)
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings.user_id (for joining users and bookings)
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id (for joining properties and bookings)
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on bookings.created_at (for sorting or date filtering)
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Index on properties.city (for location-based search)
CREATE INDEX idx_properties_city ON properties(city);

-- Analyze query performance using an index on bookings.user_id
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 42;

-- Analyze query performance using an index on properties.city
EXPLAIN ANALYZE
SELECT *
FROM properties
WHERE city = 'New York';
