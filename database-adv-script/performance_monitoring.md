1. Monitoring Query Performance
1. Using EXPLAIN ANALYZE (PostgreSQL)

EXPLAIN ANALYZE
SELECT b.booking_id, u.email, p.name
FROM Booking b
JOIN User u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date > '2024-01-01'
ORDER BY b.created_at DESC
LIMIT 100;
2. Using SHOW PROFILE (MySQL/MariaDB)

SET profiling = 1;

SELECT * FROM Booking WHERE status = 'confirmed' AND start_date > '2024-01-01';

SHOW PROFILE;
2. Identifying Bottlenecks
Common Issues Found:
1. Full Table Scans (Seq Scan)

    Queries scanning entire tables instead of using indexes
    Example: Seq Scan on Booking (cost=0.00..1250.50 rows=5000)

2. Missing Join Indexes

    Slow JOIN operations due to unindexed foreign keys

3. Inefficient Sorting (ORDER BY)

    Sort (cost=450.00..500.00 rows=10000) indicates expensive sorting

4. Unoptimized WHERE Clauses

    Filters on unindexed columns (e.g., status, start_date)

3. Implementing Optimizations
Optimization 1: Add Missing Indexes

CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_status ON Booking(status);
CREATE INDEX idx_booking_user ON Booking(user_id);
CREATE INDEX idx_booking_property ON Booking(property_id);

CREATE INDEX idx_property_name ON Property(name);

CREATE INDEX idx_booking_created_at ON Booking(created_at DESC);
Optimization 2: Refactor Queries

SELECT * FROM Booking WHERE status = 'confirmed';

SELECT booking_id, start_date, end_date
FROM Booking
WHERE status = 'confirmed'
AND start_date > '2024-01-01'
LIMIT 1000;
Optimization 3: Partition Large Tables

CREATE TABLE Booking_Partitioned (

) PARTITION BY RANGE (EXTRACT(YEAR FROM start_date));

CREATE TABLE booking_2024 PARTITION OF Booking_Partitioned
FOR VALUES FROM (2024) TO (2025);
