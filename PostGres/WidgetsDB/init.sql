-- =========================================
-- Widget World Database
-- PostgreSQL
-- Complete setup and seed file
-- =========================================

BEGIN;

-- =========================================
-- 1. Remove existing tables
-- Child tables must be removed first.
-- =========================================

DROP TABLE IF EXISTS purchases;
DROP TABLE IF EXISTS widgets;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS categories;


-- =========================================
-- 2. Create tables
-- =========================================

CREATE TABLE categories (
                            category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                            category_name VARCHAR(50) NOT NULL,
                            description VARCHAR(200)
);

CREATE TABLE widgets (
                         widget_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                         widget_name VARCHAR(100) NOT NULL,
                         color VARCHAR(30),
                         price NUMERIC(8, 2) NOT NULL,
                         stock_quantity INTEGER NOT NULL DEFAULT 0,
                         category_id INTEGER NOT NULL,

                         CONSTRAINT price_must_be_positive
                             CHECK (price >= 0),

                         CONSTRAINT fk_widget_category
                             FOREIGN KEY (category_id)
                                 REFERENCES categories(category_id)
);

CREATE TABLE customers (
                           customer_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                           first_name VARCHAR(50) NOT NULL,
                           last_name VARCHAR(50) NOT NULL,
                           city VARCHAR(50),
                           email VARCHAR(100) UNIQUE
);

CREATE TABLE purchases (
                           purchase_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                           customer_id INTEGER NOT NULL,
                           widget_id INTEGER NOT NULL,
                           quantity INTEGER NOT NULL DEFAULT 1,
                           purchase_date DATE NOT NULL DEFAULT CURRENT_DATE,

                           CONSTRAINT quantity_must_be_positive
                               CHECK (quantity > 0),

                           CONSTRAINT fk_purchase_customer
                               FOREIGN KEY (customer_id)
                                   REFERENCES customers(customer_id),

                           CONSTRAINT fk_purchase_widget
                               FOREIGN KEY (widget_id)
                                   REFERENCES widgets(widget_id)
);


-- =========================================
-- 3. Insert categories
-- =========================================

INSERT INTO categories (category_name, description)
VALUES
    ('Mechanical', 'Widgets with gears, springs, and moving parts'),
    ('Electronic', 'Widgets powered by batteries or electricity'),
    ('Decorative', 'Colorful widgets designed for display'),
    ('Experimental', 'Unusual widgets still being tested'),
    ('Emergency', 'Widgets designed for unexpected situations');


-- =========================================
-- 4. Insert widgets
-- Some inventory quantities are negative
-- for query and data-cleaning practice.
-- =========================================

INSERT INTO widgets
(widget_name, color, price, stock_quantity, category_id)
VALUES
    ('Turbo Widget',       'Red',    29.99,  40, 1),
    ('Pocket Widget',      'Blue',   12.50,  85, 1),
    ('Glow Widget',        'Green',  24.99,  -4, 2),
    ('Smart Widget',       'Black',  49.95,  25, 2),
    ('Rainbow Widget',     'Multi',  18.75,  70, 3),
    ('Golden Widget',      'Gold',   39.99,  -2, 3),
    ('Invisible Widget',   'Clear',  99.99,  10, 4),
    ('Screaming Widget',   'Purple', 34.50,  35, 4),
    ('Emergency Widget',   'Orange', 27.25,  -8, 5),
    ('Backup Widget',      'Silver', 21.00,  55, 5);


-- =========================================
-- 5. Insert customers
-- =========================================

INSERT INTO customers
(first_name, last_name, city, email)
VALUES
    ('Alex',    'Rivera',    'Austin',       'alex.rivera@example.com'),
    ('Jordan',  'Lee',       'Round Rock',   'jordan.lee@example.com'),
    ('Taylor',  'Morgan',    'Austin',       'taylor.morgan@example.com'),
    ('Casey',   'Nguyen',    'Pflugerville', 'casey.nguyen@example.com'),
    ('Morgan',  'Patel',     'Cedar Park',   'morgan.patel@example.com'),
    ('Jamie',   'Brooks',    'Austin',       'jamie.brooks@example.com'),
    ('Riley',   'Garcia',    'Kyle',         'riley.garcia@example.com'),
    ('Cameron', 'Smith',     'Buda',         'cameron.smith@example.com'),
    ('Avery',   'Johnson',   'Austin',       'avery.johnson@example.com'),
    ('Parker',  'Davis',     'Manor',        'parker.davis@example.com'),
    ('Drew',    'Wilson',    'Round Rock',   'drew.wilson@example.com'),
    ('Skyler',  'Martinez',  'Austin',       'skyler.martinez@example.com'),
    ('Quinn',   'Brown',     'Georgetown',   'quinn.brown@example.com'),
    ('Reese',   'Miller',    'Cedar Park',   'reese.miller@example.com'),
    ('Hayden',  'Anderson',  'Austin',       'hayden.anderson@example.com'),
    ('Rowan',   'Thomas',    'Leander',      'rowan.thomas@example.com'),
    ('Emerson', 'Jackson',   'Austin',       'emerson.jackson@example.com'),
    ('Finley',  'White',     'Pflugerville', 'finley.white@example.com'),
    ('Dakota',  'Harris',    'Kyle',         'dakota.harris@example.com'),
    ('Sawyer',  'Clark',     'Austin',       'sawyer.clark@example.com'),
    ('Blake',   'Lewis',     'Buda',         'blake.lewis@example.com'),
    ('Kendall', 'Walker',    'Austin',       'kendall.walker@example.com'),
    ('Logan',   'Hall',      'Round Rock',   'logan.hall@example.com'),
    ('Sydney',  'Allen',     'Cedar Park',   'sydney.allen@example.com'),
    ('Charlie', 'Young',     'Austin',       'charlie.young@example.com');


-- =========================================
-- 6. Insert purchases
-- Every customer has at least one purchase.
-- Some customers have two or three purchases.
-- =========================================

INSERT INTO purchases
(customer_id, widget_id, quantity, purchase_date)
VALUES
    -- Customer 1: Alex Rivera
    (1,  1, 1, '2026-07-01'),
    (1,  3, 2, '2026-07-12'),
    (1, 10, 1, '2026-07-28'),

    -- Customer 2: Jordan Lee
    (2,  2, 3, '2026-07-03'),
    (2,  5, 1, '2026-07-22'),

    -- Customer 3: Taylor Morgan
    (3,  4, 1, '2026-06-29'),
    (3,  7, 1, '2026-07-15'),
    (3,  9, 2, '2026-07-30'),

    -- Customer 4: Casey Nguyen
    (4,  3, 1, '2026-07-04'),
    (4,  8, 2, '2026-07-19'),

    -- Customer 5: Morgan Patel
    (5,  1, 2, '2026-07-02'),
    (5,  6, 1, '2026-07-16'),
    (5, 10, 2, '2026-07-31'),

    -- Customer 6: Jamie Brooks
    (6,  2, 1, '2026-07-05'),
    (6,  4, 1, '2026-07-26'),

    -- Customer 7: Riley Garcia
    (7,  5, 2, '2026-07-07'),

    -- Customer 8: Cameron Smith
    (8,  3, 1, '2026-07-01'),
    (8,  6, 2, '2026-07-13'),
    (8,  8, 1, '2026-07-27'),

    -- Customer 9: Avery Johnson
    (9,  9, 1, '2026-07-08'),
    (9, 10, 3, '2026-07-29'),

    -- Customer 10: Parker Davis
    (10, 1, 1, '2026-07-09'),

    -- Customer 11: Drew Wilson
    (11, 2, 2, '2026-07-06'),
    (11, 7, 1, '2026-07-24'),

    -- Customer 12: Skyler Martinez
    (12, 4, 1, '2026-07-03'),
    (12, 5, 3, '2026-07-18'),
    (12, 9, 1, '2026-08-01'),

    -- Customer 13: Quinn Brown
    (13, 6, 1, '2026-07-10'),

    -- Customer 14: Reese Miller
    (14, 3, 2, '2026-07-11'),
    (14, 8, 1, '2026-07-25'),

    -- Customer 15: Hayden Anderson
    (15, 10, 2, '2026-07-14'),

    -- Customer 16: Rowan Thomas
    (16, 2, 1, '2026-07-17'),

    -- Customer 17: Emerson Jackson
    (17, 1, 1, '2026-07-02'),
    (17, 4, 2, '2026-07-20'),
    (17, 6, 1, '2026-08-02'),

    -- Customer 18: Finley White
    (18, 5, 1, '2026-07-05'),
    (18, 9, 2, '2026-07-21'),

    -- Customer 19: Dakota Harris
    (19, 7, 1, '2026-07-23'),

    -- Customer 20: Sawyer Clark
    (20, 3, 3, '2026-07-08'),
    (20, 10, 1, '2026-07-30'),

    -- Customer 21: Blake Lewis
    (21, 2, 2, '2026-07-04'),
    (21, 5, 1, '2026-07-16'),
    (21, 8, 2, '2026-08-01'),

    -- Customer 22: Kendall Walker
    (22, 6, 1, '2026-07-12'),

    -- Customer 23: Logan Hall
    (23, 1, 1, '2026-07-09'),
    (23, 9, 3, '2026-07-28'),

    -- Customer 24: Sydney Allen
    (24, 4, 1, '2026-07-06'),
    (24, 7, 2, '2026-07-19'),
    (24, 10, 1, '2026-08-02'),

    -- Customer 25: Charlie Young
    (25, 3, 1, '2026-07-13'),
    (25, 5, 2, '2026-07-31');


COMMIT;


-- =========================================
-- 7. Verification queries
-- =========================================

SELECT COUNT(*) AS category_count
FROM categories;

SELECT COUNT(*) AS widget_count
FROM widgets;

SELECT COUNT(*) AS customer_count
FROM customers;

SELECT COUNT(*) AS purchase_count
FROM purchases;


-- Show widgets with negative inventory
SELECT
    widget_id,
    widget_name,
    stock_quantity
FROM widgets
WHERE stock_quantity < 0
ORDER BY stock_quantity;


-- Show each customer and number of purchases
SELECT
    customers.customer_id,
    customers.first_name,
    customers.last_name,
    COUNT(purchases.purchase_id) AS number_of_purchases
FROM customers
         LEFT JOIN purchases
                   ON customers.customer_id = purchases.customer_id
GROUP BY
    customers.customer_id,
    customers.first_name,
    customers.last_name
ORDER BY customers.customer_id;
