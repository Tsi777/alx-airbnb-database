1-User Table
user_id: Primary key, often used in joins and queries.
email: If frequently queried for user authentication or lookups.
2-Booking Table
booking_id: Primary key, used in joins.
user_id: Foreign key to join with the User table.
property_id: Foreign key to join with the Property table.
start_date or end_date: If queries often filter bookings by date.
3-Property Table
property_id: Primary key, used in joins.
name: If frequently used in searches or displayed in results.
SQL CREATE INDEX Commands
-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);

-- Booking Table Indexes
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Property Table Indexes
CREATE INDEX idx_property_name ON Property(name);
EXPLAIN SELECT * FROM Booking WHERE user_id = ?;
EXPLAIN SELECT * FROM Booking WHERE user_id = ?;
