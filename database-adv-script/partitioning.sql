-- 1. Create the partitioned table structure
CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property(property_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);

-- 2. Create partitions (e.g., yearly)
CREATE TABLE Booking_2023 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- 3. Copy data from original Booking table
INSERT INTO Booking_Partitioned
SELECT * FROM Booking;

-- 4. (Optional) Replace the old table
-- DROP TABLE Booking;
-- ALTER TABLE Booking_Partitioned RENAME TO Booking;
