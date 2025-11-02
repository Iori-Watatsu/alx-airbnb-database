# Partition Performance Report

## Objective
The `bookings` table had grown significantly, causing slow query performance when filtering by `start_date`.
To improve this, we implemented **range partitioning** on the `start_date` column.

## Implementation
The table was partitioned quarterly for 2025:
- `bookings_2025_q1`
- `bookings_2025_q2`
- `bookings_2025_q3`
- `bookings_2025_q4`

Each partition includes its own index on `start_date`.

## Performance Testing
We compared query performance before and after partitioning using `EXPLAIN ANALYZE` on the following query:

```sql
SELECT * FROM bookings WHERE start_date BETWEEN '2025-01-01' AND '2025-01-31';
