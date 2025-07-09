-- Indexes for User table
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_role ON User(role);

-- Indexes for Property table
CREATE INDEX idx_property_host ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Indexes for Booking table
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_dates ON Booking(start_date, end_date);


EXPLAIN ANALYZE
SELECT p.name, p.location, p.pricepernight
FROM Property p
JOIN User u ON p.host_id = u.user_id
WHERE p.location LIKE 'New York%'
AND p.pricepernight BETWEEN 50 AND 200
ORDER BY p.pricepernight; 
