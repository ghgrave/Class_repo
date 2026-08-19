-- ============================================================
-- RESTAURANT DATABASE - PRACTICE QUERIES
-- ============================================================
-- These examples start simple and progressively introduce:
--
-- ORDER BY
-- CONCAT_WS()
-- SUBSTRING()
-- COALESCE()
-- JOIN
-- multiple JOINs
-- CASE
-- LEFT JOIN
-- COUNT()
-- SUM()
-- AVG()
-- MIN()
-- MAX()
-- GROUP BY
-- FILTER
-- HAVING
-- STRING_AGG()
--
-- ============================================================



-- ============================================================
-- QUESTION 1
-- What reservations are scheduled first?
-- ============================================================
-- NOTES:
-- ORDER BY can sort using more than one column.
--
-- First:
--   Sort by reservation date.
--
-- Then:
--   Sort reservations on the same date by time.
-- ============================================================

SELECT
    reservation_id,
    date_of_reservation,
    time_of_reservation,
    party_size
FROM reservations
ORDER BY
    date_of_reservation,
    time_of_reservation;



-- ============================================================
-- QUESTION 2
-- Can we combine each user's first and last name into
-- one customer name column?
-- ============================================================
-- NOTES:
-- CONCAT_WS() combines multiple columns into one displayed value.
--
-- WS means "with separator."
--
-- Here the separator is a space:
--
-- Ava + Stone
--
-- becomes:
--
-- Ava Stone
--
-- CONCAT_WS() also handles NULL values nicely.
-- If the last name is NULL, it will not add the NULL value.
-- ============================================================

SELECT
    user_id,
    CONCAT_WS(
            ' ',
            user_first_name,
            user_last_name
    ) AS customer_name
FROM users
ORDER BY customer_name;



-- ============================================================
-- QUESTION 3
-- Can we display each user's phone number in the format:
--
-- (512) 555-0101
-- ============================================================
-- NOTES:
-- The database stores the phone number as:
--
-- 5125550101
--
-- SUBSTRING() lets us pull pieces out of a string.
--
-- We are changing how the data LOOKS.
-- We are not changing how the data is stored.
--
-- || is PostgreSQL's string concatenation operator.
-- ============================================================

SELECT
    CONCAT_WS(
            ' ',
            user_first_name,
            user_last_name
    ) AS customer_name,

    '(' ||
    SUBSTRING(user_phone, 1, 3) ||
    ') ' ||
    SUBSTRING(user_phone, 4, 3) ||
    '-' ||
    SUBSTRING(user_phone, 7, 4)
      AS formatted_phone

FROM users
ORDER BY customer_name;



-- ============================================================
-- QUESTION 4
-- Which reservations have special instructions, and how can
-- we display "No special requests" when the notes are NULL?
-- ============================================================
-- NOTES:
-- COALESCE() returns the first value that is NOT NULL.
--
-- If special_notes contains something:
--   show special_notes
--
-- If special_notes is NULL:
--   show 'No special requests'
-- ============================================================

SELECT
    reservation_id,
    party_size,
    COALESCE(
            special_notes,
            'No special requests'
    ) AS reservation_notes
FROM reservations
ORDER BY reservation_id;



-- ============================================================
-- QUESTION 5
-- Who made each reservation?
-- ============================================================
-- NOTES:
-- reservations contains user_id.
--
-- users contains the customer's actual name.
--
-- JOIN connects the two tables using:
--
-- reservations.user_id
-- users.user_id
--
-- Table aliases make queries shorter:
--
-- r = reservations
-- u = users
-- ============================================================

SELECT
    r.reservation_id,

    CONCAT_WS(
            ' ',
            u.user_first_name,
            u.user_last_name
    ) AS customer,

    r.date_of_reservation,
    r.time_of_reservation,
    r.party_size

FROM reservations r

         JOIN users u
              ON r.user_id = u.user_id

ORDER BY
    r.date_of_reservation,
    r.time_of_reservation;



-- ============================================================
-- QUESTION 6
-- Can we create a complete reservation list showing the
-- customer, restaurant, seating preference, party size,
-- date, time, and special notes?
-- ============================================================
-- NOTES:
-- This query joins ALL FOUR tables.
--
-- reservations connects to:
--
-- users
-- restaurant_locations
-- seating_preferences
--
-- PostgreSQL also allows us to add:
--
-- DATE + TIME
--
-- Example:
--
-- 2026-09-01 + 18:30
--
-- becomes:
--
-- 2026-09-01 18:30:00
--
-- We also use COALESCE() for NULL notes.
-- ============================================================

SELECT
    r.reservation_id,

    CONCAT_WS(
            ' ',
            u.user_first_name,
            u.user_last_name
    ) AS customer,

    rl.restaurant_name,

    sp.seating_location,

    r.party_size,

    r.date_of_reservation + r.time_of_reservation
      AS reservation_datetime,

    COALESCE(
            r.special_notes,
            'No special requests'
    ) AS notes

FROM reservations r

         JOIN users u
              ON r.user_id = u.user_id

         JOIN restaurant_locations rl
              ON r.restaurant_id = rl.restaurant_location_id

         JOIN seating_preferences sp
              ON r.seat_preference = sp.seating_preferences_id

ORDER BY reservation_datetime;



-- ============================================================
-- QUESTION 7
-- Can we create a reservation status that displays:
--
-- Confirmed
-- Cancelled
-- Waiting
-- ============================================================
-- NOTES:
-- CASE lets us create a calculated column.
--
-- The database stores:
--
-- is_confirmed
-- cancelled
--
-- CASE transforms those BOOLEAN values into a more
-- user-friendly status.
--
-- Order matters.
--
-- We check cancelled FIRST because a reservation could have
-- previously been confirmed and later cancelled.
-- ============================================================

SELECT
    reservation_id,
    date_of_reservation,
    time_of_reservation,

    CASE
        WHEN cancelled = TRUE
            THEN 'Cancelled'

        WHEN is_confirmed = TRUE
            THEN 'Confirmed'

        ELSE 'Waiting'
        END AS reservation_status

FROM reservations

ORDER BY
    date_of_reservation,
    time_of_reservation;



-- ============================================================
-- QUESTION 8
-- How many reservations has each user made, including users
-- who have made NO reservations?
-- ============================================================
-- NOTES:
-- This introduces LEFT JOIN.
--
-- INNER JOIN would only show users who have reservations.
--
-- LEFT JOIN starts with ALL users and then matches
-- reservations when possible.
--
-- A user with no reservations still appears.
--
-- COUNT(r.reservation_id) is important.
--
-- We count reservation IDs rather than COUNT(*).
-- This allows a user with no reservations to correctly
-- display 0.
--
-- GROUP BY creates one result row per user.
-- ============================================================

SELECT
    u.user_id,

    CONCAT_WS(
            ' ',
            u.user_first_name,
            u.user_last_name
    ) AS customer,

    COUNT(r.reservation_id)
      AS total_reservations

FROM users u

         LEFT JOIN reservations r
                   ON u.user_id = r.user_id

GROUP BY
    u.user_id,
    u.user_first_name,
    u.user_last_name

ORDER BY
    total_reservations DESC,
    customer;



-- ============================================================
-- QUESTION 9
-- Which restaurant location has received the most
-- reservations?
-- ============================================================
-- NOTES:
-- COUNT() counts reservations.
--
-- GROUP BY creates one result row per restaurant.
--
-- ORDER BY DESC puts the restaurant with the largest count
-- at the top.
--
-- LEFT JOIN means a restaurant could still appear even
-- if it currently has zero reservations.
-- ============================================================

SELECT
    rl.restaurant_name,

    COUNT(r.reservation_id)
        AS total_reservations

FROM restaurant_locations rl

         LEFT JOIN reservations r
                   ON rl.restaurant_location_id = r.restaurant_id

GROUP BY
    rl.restaurant_location_id,
    rl.restaurant_name

ORDER BY
    total_reservations DESC,
    rl.restaurant_name;



-- ============================================================
-- QUESTION 10
-- For each restaurant, what are the:
--
-- total reservations
-- total guests
-- average party size
-- smallest party
-- largest party
-- ============================================================
-- NOTES:
-- This demonstrates several aggregate functions together.
--
-- COUNT() = number of reservations
-- SUM()   = total guests
-- AVG()   = average party size
-- MIN()   = smallest party
-- MAX()   = largest party
--
-- WHERE removes cancelled reservations BEFORE the grouping
-- and calculations happen.
--
-- ROUND() makes the average easier to read.
-- ============================================================

SELECT
    rl.restaurant_name,

    COUNT(r.reservation_id)
        AS total_reservations,

    SUM(r.party_size)
        AS total_guests,

    ROUND(
            AVG(r.party_size),
            2
    ) AS average_party_size,

    MIN(r.party_size)
        AS smallest_party,

    MAX(r.party_size)
        AS largest_party

FROM restaurant_locations rl

         JOIN reservations r
              ON rl.restaurant_location_id = r.restaurant_id

WHERE r.cancelled = FALSE

GROUP BY
    rl.restaurant_location_id,
    rl.restaurant_name

ORDER BY
    total_guests DESC;



-- ============================================================
-- QUESTION 11
-- For each restaurant, how many reservations are:
--
-- confirmed
-- cancelled
-- waiting
-- ============================================================
-- NOTES:
-- FILTER lets an aggregate function count only rows
-- matching a specific condition.
--
-- We can therefore perform several different counts
-- inside ONE query.
--
-- Confirmed:
--   is_confirmed = TRUE
--   cancelled = FALSE
--
-- Cancelled:
--   cancelled = TRUE
--
-- Waiting:
--   is_confirmed = FALSE
--   cancelled = FALSE
-- ============================================================

SELECT
    rl.restaurant_name,

    COUNT(r.reservation_id)
        AS total_reservations,

    COUNT(r.reservation_id)
           FILTER (
            WHERE r.is_confirmed = TRUE
            AND r.cancelled = FALSE
        ) AS confirmed,

    COUNT(r.reservation_id)
        FILTER (
            WHERE r.cancelled = TRUE
        ) AS cancelled,

    COUNT(r.reservation_id)
        FILTER (
            WHERE r.is_confirmed = FALSE
            AND r.cancelled = FALSE
        ) AS waiting

FROM restaurant_locations rl

         JOIN reservations r
              ON rl.restaurant_location_id = r.restaurant_id

GROUP BY
    rl.restaurant_location_id,
    rl.restaurant_name

ORDER BY
    total_reservations DESC;



-- ============================================================
-- QUESTION 12
-- Which repeat customers have made at least two
-- non-cancelled reservations?
--
-- For each customer, show:
--
-- customer name
-- number of reservations
-- total guests reserved for
-- latest reservation date
-- restaurants visited
-- ============================================================
-- NOTES:
-- This combines many concepts:
--
-- LEFT JOIN
-- CONCAT_WS()
-- COUNT()
-- SUM()
-- MAX()
-- COALESCE()
-- FILTER
-- STRING_AGG()
-- DISTINCT
-- GROUP BY
-- HAVING
-- ORDER BY
--
--
-- FILTER removes cancelled reservations from individual
-- calculations.
--
-- COALESCE() changes a NULL SUM into 0.
--
-- MAX(date_of_reservation) finds the most recent date.
--
-- STRING_AGG() combines multiple rows into one string.
--
-- Example restaurant rows:
--
-- NeonDiner
-- ByteCafe
-- NeonDiner
--
-- can become:
--
-- ByteCafe, NeonDiner
--
-- DISTINCT removes repeated restaurant names.
--
-- HAVING filters AFTER GROUP BY.
--
-- WHERE filters individual rows.
-- HAVING filters groups.
--
-- Here we only want customers with at least
-- TWO non-cancelled reservations.
-- ============================================================

SELECT
    u.user_id,

    CONCAT_WS(
            ' ',
            u.user_first_name,
            u.user_last_name
    ) AS customer,

    COUNT(r.reservation_id)
         FILTER (
            WHERE r.cancelled = FALSE
        ) AS reservations,

    COALESCE(
            SUM(r.party_size)
            FILTER (
                WHERE r.cancelled = FALSE
            ),
            0
    ) AS total_guests,

    MAX(r.date_of_reservation)
         FILTER (
            WHERE r.cancelled = FALSE
        ) AS latest_reservation,

    COALESCE(
            STRING_AGG(
                DISTINCT rl.restaurant_name,
                    ', '
                        ORDER BY rl.restaurant_name
            )
            FILTER (
                WHERE r.cancelled = FALSE
        ),
            'No restaurants'
    ) AS restaurants_visited

FROM users u

         LEFT JOIN reservations r
                   ON u.user_id = r.user_id

         LEFT JOIN restaurant_locations rl
                   ON r.restaurant_id = rl.restaurant_location_id

GROUP BY
    u.user_id,
    u.user_first_name,
    u.user_last_name

HAVING
    COUNT(r.reservation_id)
    FILTER (
            WHERE r.cancelled = FALSE
        ) >= 2

ORDER BY
    reservations DESC,
    total_guests DESC,
    customer;