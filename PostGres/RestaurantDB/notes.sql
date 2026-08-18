--  CREATE TABLE users (
--      user_id SERIAL NOT NULL PRIMARY KEY,
--      user_first_name VARCHAR(10) NOT NULL,
--      user_last_name VARCHAR(10) ,
--      user_email VARCHAR(20) NOT NULL,
--      user_phone CHAR(10) NOT NULL  -- 10 int US formatting 1234567890
--  )

-- CREATE TABLE restaurant_locations (
--     restaurant_location_id SERIAL PRIMARY KEY,
--     restaurant_name VARCHAR(10) NOT NULL,
--     restaurant_address VARCHAR(10) NOT NULL,
--     restaurant_city VARCHAR(10) NOT NULL
-- )

-- CREATE TABLE  seating_preferences (
--     seating_preferences_id SMALLSERIAL PRIMARY KEY,
--     seating_location VARCHAR(15) NOT NULL
--                                   CHECK(seating_location IN ('indoor', 'outdoor', 'first'))
-- );

CREATE TABLE reservations (
                              reservation_id SERIAL PRIMARY KEY,
                              party_size INT NOT NULL
                                  CHECK(party_size > 0 AND party_size < 9),
                              date_of_reservation DATE NOT NULL,
                              time_of_reservation TIME NOT NULL
                                  CHECK(
                                      EXTRACT(MINUTE FROM time_of_reservation)::INT %15 = 0
                                  AND EXTRACT(SECOND FROM time_of_reservation) = 0
),
    is_confirmed BOOLEAN NOT NULL DEFAULT FALSE,
    cancelled BOOLEAN DEFAULT FALSE,
    seat_preference INT NOT NULL
                          REFERENCES seating_preferences(seating_preferences_id) ,
    special_notes TEXT,
    receive_newsletter BOOLEAN NOT NULL DEFAULT TRUE,
    restaurant_id INT NOT NULL
                          REFERENCES  restaurant_locations(restaurant_location_id),
    user_id INT NOT NULL
                          REFERENCES users(user_id)
)













