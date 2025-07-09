 High Usage Columns:
1. User Table

    email (for logins and lookups)
   
    user_id (for joins with other tables)
   
    role (for filtering users by type)

3. Property Table

    property_id (for joins)
   
    host_id (to find properties by owner)
   
    location (for search filters)
   
    pricepernight (for sorting/filtering)

5. Booking Table

    booking_id (primary key)
   
    user_id (to find user's bookings)
   
    property_id (to find property's bookings)
   
    status (to filter by booking state)
   
    start_date/end_date (for date range queries)

