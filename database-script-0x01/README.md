# AirBnB Database Schema

## Overview
This document outlines the database schema for the AirBnB system, designed to manage users, properties, bookings, payments, reviews, and messages. The schema is structured to ensure data integrity, optimize performance, and facilitate easy management of relationships between entities.

## Key Features of the Schema

- **User Management:** Supports multiple user roles (guest, host, admin) and includes essential user details.
- **Property Listings:** Allows hosts to manage their properties, including descriptions, locations, and pricing.
- **Booking System:** Enables users to make and manage bookings, with clear status indicators (pending, confirmed, canceled).
- **Payment Processing:** Handles payment information linked to bookings, supporting various payment methods.
- **Review System:** Allows users to leave ratings and comments for properties, enhancing user feedback.
- **Messaging Functionality:** Facilitates communication between users, enabling both sending and receiving messages.

## Schema Highlights

### Tables

1. **User**
   - **Primary Key:** `user_id`
   - **Attributes:** `first_name`, `last_name`, `email`, `password_hash`, `phone_number`, `role`, `created_at`

2. **Property**
   - **Primary Key:** `property_id`
   - **Foreign Key:** `host_id` (references `User(user_id)`)
   - **Attributes:** `name`, `description`, `location`, `pricepernight`, `created_at`, `updated_at`

3. **Booking**
   - **Primary Key:** `booking_id`
   - **Foreign Keys:** `property_id`, `user_id` (references `Property(property_id)` and `User(user_id)`)
   - **Attributes:** `start_date`, `end_date`, `total_price`, `status`, `created_at`

4. **Payment**
   - **Primary Key:** `payment_id`
   - **Foreign Key:** `booking_id` (references `Booking(booking_id)`)
   - **Attributes:** `amount`, `payment_date`, `payment_method`

5. **Review**
   - **Primary Key:** `review_id`
   - **Foreign Keys:** `property_id`, `user_id` (references `Property(property_id)` and `User(user_id)`)
   - **Attributes:** `rating`, `comment`, `created_at`

6. **Message**
   - **Primary Key:** `message_id`
   - **Foreign Keys:** `sender_id`, `recipient_id` (references `User(user_id)`)
   - **Attributes:** `message_body`, `sent_at`


This schema is provided for educational purposes. Feel free to modify and use it in your projects.
