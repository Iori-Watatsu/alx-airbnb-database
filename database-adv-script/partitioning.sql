-- Create a new partitioned table based on start_date
CREATE TABLE bookings_partitioned (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    amount NUMERIC(10, 2),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
)
PARTITION BY RANGE (start_date);

-- Create partitions for each quarter of 2025
CREATE TABLE bookings_2025_q1 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

CREATE TABLE bookings_2025_q2 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

CREATE TABLE bookings_2025_q3 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-07-01') TO ('2025-10-01');

CREATE TABLE bookings_2025_q4 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-10-01') TO ('2026-01-01');

-- Create indexes on partitions for better performance
CREATE INDEX idx_bookings_q1_start_date ON bookings_2025_q1 (start_date);
CREATE INDEX idx_bookings_q2_start_date ON bookings_2025_q2 (start_date);
CREATE INDEX idx_bookings_q3_start_date ON bookings_2025_q3 (start_date);
CREATE INDEX idx_bookings_q4_start_date ON bookings_2025_q4 (start_date);

-- Test query performance: fetch bookings by date range (before optimization)
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';

-- Test query performance: fetch bookings by date range (after partitioning)
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
