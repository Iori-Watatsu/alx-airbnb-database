# Database Normalization to 3NF

## Objective
Ensure the Airbnb database schema is normalized to the Third Normal Form (3NF) to eliminate redundancy and maintain data integrity.

## Original Schema
- **User**: user_id (PK), name, email, phone_number, role, created_at, updated_at
- **Property**: property_id (PK), host_id (FK → User), title, description, address, city, state, country, price_per_night, created_at, updated_at
- **Booking**: booking_id (PK), user_id (FK → User), property_id (FK → Property), start_date, end_date, total_price, status, created_at, updated_at
- **Review**: review_id (PK), user_id (FK → User), property_id (FK → Property), rating, comment, created_at
- **Payment (optional)**: payment_id (PK), booking_id (FK → Booking), amount, payment_date, payment_method, status

## Normalization Steps

### 1NF
- All attributes are atomic.

### 2NF
- All tables have single-column primary keys. No partial dependencies.

### 3NF
- Removed transitive dependencies:
  - Created **Location** table to avoid repeating `city`, `state`, `country` in Property.
  - Optional: `total_price` in Booking can be calculated dynamically, reducing redundancy.

## Revised Schema (3NF)
- **User**: unchanged
- **Location**: location_id (PK), city, state, country
- **Property**: property_id (PK), host_id (FK → User), title, description, address, price_per_night, location_id (FK → Location), created_at, updated_at
- **Booking**: unchanged
- **Review**: unchanged
- **Payment**: unchanged
