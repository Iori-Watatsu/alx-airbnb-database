# Airbnb Database Schema (DDL)

## Overview
This directory contains the SQL scripts to create the Airbnb-Clone database schema, fully normalized to 3NF with the following tables:

- User
- Location
- Property
- Booking
- Review
- Payment

## Files
- `schema.sql` — SQL CREATE TABLE statements, constraints, and indexes
- `README.md` — This file

## How to Use
1. Open a MySQL client (or compatible database).
2. Create a database, e.g.:
```sql
CREATE DATABASE airbnb;
USE airbnb;
