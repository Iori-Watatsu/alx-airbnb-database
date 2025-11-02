# Optimization Report

## Initial Query
The initial query joined three tables: `users`, `properties`, and `payments` to retrieve complete booking information.
It selected all user, property, and payment details.

## Performance Analysis
Using `EXPLAIN ANALYZE`, the query showed sequential scans on large tables (`bookings`, `users`, `properties`) and high execution time.
This happened because:
- Too many unnecessary columns were selected.
- Joins were not fully optimized for indexes.
- Missing indexes on foreign keys slowed lookups.

## Optimizations Applied
- Added indexes on join columns:
  - `bookings.user_id`
  - `bookings.property_id`
  - `payments.booking_id`
- Selected only the required columns.
- Avoided redundant joins and filtered data early.

## Result
After optimization:
- The query plan used `Index Scans` instead of `Seq Scans`.
- Execution time decreased significantly.
- The output remained correct but with fewer columns.

**Conclusion:**
Proper indexing and reduced data retrieval significantly improved performance without altering results.
