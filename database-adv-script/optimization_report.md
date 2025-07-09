# Optimization Report

## Initial Query Analysis

### EXPLAIN Output
+----+-------------+-------+--------+---------------+---------+---------+----------------+------+-------------+
| id | select_type | table | type   | possible_keys | key     | key_len | ref            | rows | Extra       |
+----+-------------+-------+--------+---------------+---------+---------+----------------+------+-------------+
|  1 | SIMPLE      | b     | ALL    | NULL          | NULL    | NULL    | NULL           | 1000 |             |
|  1 | SIMPLE      | u     | ref    | idx_user_id   | idx_user_id | 4     | b.user_id     |  100 | Using index |
|  1 | SIMPLE      | p     | ref    | idx_property_id| idx_property_id | 4     | b.property_id |  200 | Using index |
|  1 | SIMPLE      | pay   | ref    | idx_booking_id | idx_booking_id | 4     | b.booking_id  |  150 | Using index |
+----+-------------+-------+--------+---------------+---------+---------+----------------+------+-------------+

### Inefficiencies Identified
- High number of rows scanned.
- Inefficient join types detected.
- Some columns were unnecessary for the final output.

## Refactored Query

```sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    pay.amount
FROM 
    Booking b
JOIN 
    User u ON b.user_id = u.user_id
JOIN 
    Property p ON b.property_id = p.property_id
JOIN 
    Payment pay ON b.booking_id = pay.booking_id
WHERE 
    b.start_date >= CURRENT_DATE;  -- Only retrieve future bookings
