# Index Performance Optimization

## Objective
To identify high-usage columns and create indexes that improve query performance in the ALX Airbnb database.

## Identified Columns
| Table | Column | Reason for Index |
|--------|---------|----------------|
| users | email | Frequently used for user lookups |
| bookings | user_id | Used in JOINs with users |
| bookings | property_id | Used in JOINs with properties |
| bookings | created_at | Used for sorting and filtering by date |
| properties | city | Used for filtering properties by location |

## Index Creation (database_index.sql)
```sql
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);
CREATE INDEX idx_properties_city ON properties(city);
