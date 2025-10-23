-- Airbnb Sample Data Seed

-- Users
INSERT INTO User (name, email, phone_number, role)
VALUES
('Alice Johnson', 'alice@example.com', '0712345678', 'guest'),
('Bob Smith', 'bob@example.com', '0723456789', 'host'),
('Charlie Brown', 'charlie@example.com', '0734567890', 'guest'),
('Diana Prince', 'diana@example.com', '0745678901', 'host'),
('Eve Adams', 'eve@example.com', '0756789012', 'admin');

-- Locations
INSERT INTO Location (city, state, country)
VALUES
('Cape Town', 'Western Cape', 'South Africa'),
('Johannesburg', 'Gauteng', 'South Africa'),
('Durban', 'KwaZulu-Natal', 'South Africa');

-- Properties
INSERT INTO Property (host_id, title, description, address, price_per_night, location_id)
VALUES
(2, 'Seaside Villa', 'Beautiful villa with ocean view', '12 Beach Rd', 1200.00, 1),
(4, 'City Apartment', 'Modern apartment in city center', '45 Main St', 900.00, 2),
(2, 'Mountain Cabin', 'Cozy cabin in the mountains', '78 Hill Rd', 600.00, 1),
(4, 'Downtown Loft', 'Stylish loft near shops', '33 Market St', 800.00, 2);

-- Bookings
INSERT INTO Booking (user_id, property_id, start_date, end_date, total_price, status)
VALUES
(1, 1, '2025-11-01', '2025-11-05', 4800.00, 'confirmed'),
(3, 2, '2025-11-10', '2025-11-12', 1800.00, 'pending'),
(1, 3, '2025-12-01', '2025-12-03', 1200.00, 'canceled');

-- Reviews
INSERT INTO Review (user_id, property_id, rating, comment)
VALUES
(1, 1, 5, 'Amazing villa! Highly recommend.'),
(3, 2, 4, 'Great location, very clean.'),
(1, 3, 3, 'Cabin was nice but small.');

-- Payments
INSERT INTO Payment (booking_id, amount, payment_method, status)
VALUES
(1, 4800.00, 'credit_card', 'completed'),
(2, 1800.00, 'paypal', 'pending'),
(3, 1200.00, 'bank_transfer', 'failed');
