-- Insert Sample Data into User Table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(UUID(), 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password1', '123-456-7890', 'guest', NOW()),
(UUID(), 'Bob', 'Smith', 'bob.smith@example.com', 'hashed_password2', '234-567-8901', 'host', NOW()),
(UUID(), 'Charlie', 'Brown', 'charlie.brown@example.com', 'hashed_password3', '345-678-9012', 'guest', NOW()),
(UUID(), 'Diana', 'Prince', 'diana.prince@example.com', 'hashed_password4', '456-789-0123', 'host', NOW());

-- Insert Sample Data into Property Table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), 'Cozy Cottage', 'A cozy cottage in the woods.', '123 Forest Lane, Springfield', 100.00, NOW(), NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'diana.prince@example.com'), 'Luxury Apartment', 'A luxury apartment with a city view.', '456 City St, Metropolis', 250.00, NOW(), NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), 'Beach House', 'A beautiful beach house.', '789 Ocean Drive, Seaside', 300.00, NOW(), NOW());

-- Insert Sample Data into Booking Table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
(UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), '2023-08-01', '2023-08-07', 700.00, 'confirmed', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Luxury Apartment'), (SELECT user_id FROM User WHERE email = 'charlie.brown@example.com'), '2023-09-01', '2023-09-05', 1000.00, 'pending', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), '2023-07-15', '2023-07-20', 1500.00, 'confirmed', NOW());

-- Insert Sample Data into Payment Table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 700.00), 700.00, NOW(), 'credit_card'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 1000.00), 1000.00, NOW(), 'paypal'),
(UUID(), (SELECT booking_id FROM Booking WHERE total_price = 1500.00), 1500.00, NOW(), 'stripe');

-- Insert Sample Data into Review Table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
(UUID(), (SELECT property_id FROM Property WHERE name = 'Cozy Cottage'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), 5, 'Had a wonderful stay!', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Luxury Apartment'), (SELECT user_id FROM User WHERE email = 'charlie.brown@example.com'), 4, 'Great location, but a bit noisy.', NOW()),
(UUID(), (SELECT property_id FROM Property WHERE name = 'Beach House'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), 5, 'Amazing experience by the beach!', NOW());

-- Insert Sample Data into Message Table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
(UUID(), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), 'Is the Cozy Cottage available for the weekend?', NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'bob.smith@example.com'), (SELECT user_id FROM User WHERE email = 'alice.johnson@example.com'), 'Yes, it is available!', NOW()),
(UUID(), (SELECT user_id FROM User WHERE email = 'charlie.brown@example.com'), (SELECT user_id FROM User WHERE email = 'diana.prince@example.com'), 'What are the check-in times for the Luxury Apartment?', NOW());
