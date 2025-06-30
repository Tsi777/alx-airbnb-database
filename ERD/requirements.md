![ERD](https://github.com/user-attachments/assets/51322ca2-28df-48c1-bdb7-dcab6f4dcee2)

Here’s a detailed outline for creating an Entity-Relationship (ER) diagram based on the provided AirBnB database specification. Below, I've identified the entities, their attributes, and the relationships between them.

Entities and Attributes
User

Attributes:
user_id (PK, UUID, Indexed)
first_name (VARCHAR, NOT NULL)
last_name (VARCHAR, NOT NULL)
email (VARCHAR, UNIQUE, NOT NULL)
password_hash (VARCHAR, NOT NULL)
phone_number (VARCHAR, NULL)
role (ENUM: guest, host, admin, NOT NULL)
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
Property

Attributes:
property_id (PK, UUID, Indexed)
host_id (FK, references User(user_id))
name (VARCHAR, NOT NULL)
description (TEXT, NOT NULL)
location (VARCHAR, NOT NULL)
pricepernight (DECIMAL, NOT NULL)
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
updated_at (TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP)
Booking

Attributes:
booking_id (PK, UUID, Indexed)
property_id (FK, references Property(property_id))
user_id (FK, references User(user_id))
start_date (DATE, NOT NULL)
end_date (DATE, NOT NULL)
total_price (DECIMAL, NOT NULL)
status (ENUM: pending, confirmed, canceled, NOT NULL)
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
Payment

Attributes:
payment_id (PK, UUID, Indexed)
booking_id (FK, references Booking(booking_id))
amount (DECIMAL, NOT NULL)
payment_date (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
payment_method (ENUM: credit_card, paypal, stripe, NOT NULL)
Review

Attributes:
review_id (PK, UUID, Indexed)
property_id (FK, references Property(property_id))
user_id (FK, references User(user_id))
rating (INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL)
comment (TEXT, NOT NULL)
created_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
Message

Attributes:
message_id (PK, UUID, Indexed)
sender_id (FK, references User(user_id))
recipient_id (FK, references User(user_id))
message_body (TEXT, NOT NULL)
sent_at (TIMESTAMP, DEFAULT CURRENT_TIMESTAMP)
Relationships
User to Property:

One-to-Many (One user can host multiple properties)
User to Booking:

One-to-Many (One user can make multiple bookings)
Property to Booking:

One-to-Many (One property can have multiple bookings)
Booking to Payment:

One-to-One (Each booking can have one payment)
User to Review:

One-to-Many (One user can leave multiple reviews)
Property to Review:

One-to-Many (One property can receive multiple reviews)
User to Message:

One-to-Many (One user can send and receive multiple messages)
