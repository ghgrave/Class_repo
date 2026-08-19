--------------------------------------------
-- QUESTIONS
-- 1) What reservations are scheduled first?
-- 2) Can we combine each user’s first and last name into one customer name column?
-- 3) Can we display each user’s phone number in the format (512) 555-0101?
-- 4) Which reservations have special instructions, and how can we display No special requests when the notes are NULL?
-- 5) Who made each reservation?
-- 6) Can we create a complete reservation list showing the customer, restaurant, seating preference, party size, date, time, and special notes?
-- 7) Can we create a reservation status that displays Confirmed, Cancelled, or Waiting?
-- 8) How many reservations has each user made, including users who have made no reservations?
-- 9) Which restaurant location has received the most reservations?
-- 10) For each restaurant, what are the total reservations, total guests, average party size, smallest party, and largest party?
-- 11) For each restaurant, how many reservations are confirmed, cancelled, or waiting?
-- 12) Which repeat customers have made at least two non-cancelled reservations, how many guests have they reserved for, when was their latest reservation, and which restaurants have they visited?
---------------------------------------------




-- OPTIONAL: useful when resetting the classroom database
TRUNCATE TABLE reservations,
               seating_preferences,
               restaurant_locations,
               users
RESTART IDENTITY CASCADE;

-- =========================================
-- SEATING PREFERENCES
-- =========================================

INSERT INTO seating_preferences (seating_location)
VALUES
    ('indoor'),
    ('outdoor'),
    ('first');


-- =========================================
-- RESTAURANT LOCATIONS
-- =========================================

INSERT INTO restaurant_locations
(restaurant_name, restaurant_address, restaurant_city)
VALUES
    ('NeonDiner', '101 Main', 'Austin'),
    ('ByteCafe',  '22 Lake',  'RoundRock'),
    ('GridGrill', '9 Grid Rd', 'Buda'),
    ('ArcBistro', '77 Arc Ave', 'Kyle');


-- =========================================
-- USERS
-- Maya and Owen intentionally have NULL
-- last names.
--
-- Luna intentionally has no reservations.
-- =========================================

INSERT INTO users
(user_first_name, user_last_name, user_email, user_phone)
VALUES
    ('Ava',  'Stone',  'ava@neon.io',  '5125550101'),
    ('Liam', 'Chen',   'liam@neon.io', '5125550102'),
    ('Maya', NULL,     'maya@neon.io', '5125550103'),
    ('Noah', 'Rivera', 'noah@neon.io', '5125550104'),
    ('Zoe',  'Patel',  'zoe@neon.io',  '5125550105'),
    ('Eli',  'Brooks', 'eli@neon.io',  '5125550106'),
    ('Nia',  'King',   'nia@neon.io',  '5125550107'),
    ('Owen', NULL,     'owen@neon.io', '5125550108'),
    ('Ivy',  'Lopez',  'ivy@neon.io',  '5125550109'),
    ('Kai',  'Moore',  'kai@neon.io',  '5125550110'),
    ('Mila', 'Reed',   'mila@neon.io', '5125550111'),
    ('Jace', 'Young',  'jace@neon.io', '5125550112'),
    ('Luna', 'Gray',   'luna@neon.io', '5125550113');


-- =========================================
-- RESERVATIONS
-- =========================================

INSERT INTO reservations
(
    party_size,
    date_of_reservation,
    time_of_reservation,
    is_confirmed,
    cancelled,
    seat_preference,
    special_notes,
    receive_newsletter,
    restaurant_id,
    user_id
)
VALUES

-- September 1
(2, '2026-09-01', '18:00', TRUE, FALSE, 1, NULL,          TRUE,  1, 1),
(4, '2026-09-01', '18:30', TRUE, FALSE, 2, 'Birthday',    FALSE, 1, 2),
(1, '2026-09-01', '19:00', FALSE,FALSE, 1, NULL,          TRUE,  2, 3),

-- September 2
(6, '2026-09-02', '17:45', TRUE, FALSE, 3, 'Anniversary', TRUE,  3, 4),
(3, '2026-09-02', '18:15', TRUE, FALSE, 2, NULL,          TRUE,  2, 5),
(2, '2026-09-02', '19:30', TRUE, TRUE,  1, 'Nut allergy', FALSE, 1, 6),

-- September 3
(5, '2026-09-03', '18:00', FALSE,FALSE, 2, NULL,          TRUE,  4, 7),
(2, '2026-09-03', '18:45', TRUE, FALSE, 1, 'Quiet table', TRUE,  3, 8),
(8, '2026-09-03', '20:00', TRUE, FALSE, 3, 'Team dinner', FALSE, 1, 9),

-- September 4
(4, '2026-09-04', '17:30', TRUE, FALSE, 1, NULL,          TRUE,  2, 10),
(2, '2026-09-04', '18:00', FALSE,TRUE,  2, NULL,          TRUE,  4, 11),
(3, '2026-09-04', '19:15', TRUE, FALSE, 1, 'Gluten free', FALSE, 1, 12),

-- September 5
(2, '2026-09-05', '17:00', TRUE, FALSE, 2, NULL,          TRUE,  1, 1),
(5, '2026-09-05', '18:15', TRUE, FALSE, 3, 'Birthday',    TRUE,  2, 2),
(4, '2026-09-05', '19:45', TRUE, FALSE, 1, NULL,          TRUE,  3, 4),

-- September 6
(2, '2026-09-06', '17:30', FALSE,FALSE, 2, 'Patio shade', FALSE, 4, 5),
(6, '2026-09-06', '18:30', TRUE, FALSE, 1, NULL,          TRUE,  1, 6),
(3, '2026-09-06', '20:15', TRUE, FALSE, 2, 'Vegan',       TRUE,  2, 7),

-- September 7
(1, '2026-09-07', '17:15', TRUE, FALSE, 1, NULL,          FALSE, 3, 8),
(4, '2026-09-07', '18:00', TRUE, TRUE,  3, 'Proposal',    TRUE,  4, 9),
(7, '2026-09-07', '19:30', TRUE, FALSE, 1, NULL,          TRUE,  1, 10),

-- September 8
(2, '2026-09-08', '17:45', FALSE,FALSE, 2, NULL,          TRUE,  2, 11),
(3, '2026-09-08', '18:15', TRUE, FALSE, 1, 'Window',      FALSE, 3, 12),
(4, '2026-09-08', '19:00', TRUE, FALSE, 3, NULL,          TRUE,  1, 1),

-- September 9
(2, '2026-09-09', '17:30', TRUE, FALSE, 1, NULL,          TRUE,  4, 2),
(5, '2026-09-09', '18:45', TRUE, FALSE, 2, 'Birthday',    FALSE, 2, 3),
(3, '2026-09-09', '20:00', FALSE,FALSE, 1, NULL,          TRUE,  3, 4),

-- September 10
(6, '2026-09-10', '17:15', TRUE, FALSE, 2, 'Work dinner', TRUE,  1, 5),
(2, '2026-09-10', '18:00', TRUE, FALSE, 1, NULL,          TRUE,  2, 6),
(4, '2026-09-10', '18:30', TRUE, FALSE, 3, 'Anniversary', FALSE, 4, 7),
(3, '2026-09-10', '19:15', TRUE, FALSE, 2, NULL,          TRUE,  1, 8),
(2, '2026-09-10', '20:30', FALSE,FALSE, 1, 'Late arrival',TRUE,  3, 9);
