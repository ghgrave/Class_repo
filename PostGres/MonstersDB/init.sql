-- =========================================
-- MonstersDB
-- PostgreSQL database setup and seed file
-- =========================================
--
-- This script creates six tables and inserts:
--   10 monster categories
--   25 monsters
--   10 locations
--   6 investigators
--   30 sightings
--   25 encounters
--
-- Run this file while connected to the MonstersDB database.
-- =========================================

BEGIN;

-- =========================================
-- 1. Remove existing tables
-- Child tables are removed before parent tables.
-- =========================================

DROP TABLE IF EXISTS encounters;
DROP TABLE IF EXISTS sightings;
DROP TABLE IF EXISTS investigators;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS monsters;
DROP TABLE IF EXISTS monster_categories;


-- =========================================
-- 2. Create tables
-- =========================================

CREATE TABLE monster_categories (
                                    category_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                                    category_name VARCHAR(50) NOT NULL UNIQUE,
                                    description VARCHAR(200)
);

CREATE TABLE monsters (
                          monster_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                          monster_name VARCHAR(100) NOT NULL,
                          color VARCHAR(30),
                          danger_level INTEGER NOT NULL,
                          height_feet NUMERIC(5, 2),
                          category_id INTEGER NOT NULL,

                          CONSTRAINT danger_level_range
                              CHECK (danger_level BETWEEN 1 AND 5),

                          CONSTRAINT monster_height_positive
                              CHECK (height_feet > 0),

                          CONSTRAINT fk_monster_category
                              FOREIGN KEY (category_id)
                                  REFERENCES monster_categories(category_id)
);

CREATE TABLE locations (
                           location_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                           location_name VARCHAR(100) NOT NULL,
                           city VARCHAR(50) NOT NULL,
                           environment_type VARCHAR(50) NOT NULL
);

CREATE TABLE investigators (
                               investigator_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                               first_name VARCHAR(50) NOT NULL,
                               last_name VARCHAR(50) NOT NULL,
                               experience_level VARCHAR(20) NOT NULL
);

CREATE TABLE sightings (
                           sighting_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                           monster_id INTEGER NOT NULL,
                           location_id INTEGER NOT NULL,
                           sighting_date DATE NOT NULL,
                           witness_count INTEGER NOT NULL,
                           notes VARCHAR(200) NOT NULL,

                           CONSTRAINT witness_count_not_negative
                               CHECK (witness_count >= 0),

                           CONSTRAINT sighting_notes_length
                               CHECK (CHAR_LENGTH(notes) BETWEEN 10 AND 200),

                           CONSTRAINT fk_sighting_monster
                               FOREIGN KEY (monster_id)
                                   REFERENCES monsters(monster_id),

                           CONSTRAINT fk_sighting_location
                               FOREIGN KEY (location_id)
                                   REFERENCES locations(location_id)
);

CREATE TABLE encounters (
                            encounter_id INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
                            investigator_id INTEGER NOT NULL,
                            monster_id INTEGER NOT NULL,
                            location_id INTEGER NOT NULL,
                            encounter_date DATE NOT NULL,
                            outcome VARCHAR(100) NOT NULL,
                            damage_cost NUMERIC(10, 2) NOT NULL DEFAULT 0,

                            CONSTRAINT damage_cost_not_negative
                                CHECK (damage_cost >= 0),

                            CONSTRAINT fk_encounter_investigator
                                FOREIGN KEY (investigator_id)
                                    REFERENCES investigators(investigator_id),

                            CONSTRAINT fk_encounter_monster
                                FOREIGN KEY (monster_id)
                                    REFERENCES monsters(monster_id),

                            CONSTRAINT fk_encounter_location
                                FOREIGN KEY (location_id)
                                    REFERENCES locations(location_id)
);


-- =========================================
-- 3. Insert monster categories
-- =========================================

INSERT INTO monster_categories (category_name, description)
VALUES
    ('Vampire', 'Undead creatures that feed on blood and avoid sunlight.'),
    ('Ghost', 'Spirits that haunt locations, objects, or digital systems.'),
    ('Werewolf', 'Humans or creatures that transform into wolf-like monsters.'),
    ('Cryptid', 'Mysterious creatures reported but not scientifically confirmed.'),
    ('Alien', 'Visitors or life forms believed to come from beyond Earth.'),
    ('Sea Monster', 'Large or unusual creatures found in lakes, rivers, or oceans.'),
    ('Undead', 'Reanimated creatures that should no longer be alive.'),
    ('Demon', 'Supernatural beings known for chaos, fear, or destruction.'),
    ('Construct', 'Monsters built from machinery, magic, or other materials.'),
    ('Mutant', 'Creatures changed by experiments, radiation, or strange events.');


-- =========================================
-- 4. Insert monsters
-- =========================================

INSERT INTO monsters
(monster_name, color, danger_level, height_feet, category_id)
VALUES
    ('Count Byteula', 'Black', 4, 6.20, 1),
    ('Crimson Cache', 'Red', 3, 5.90, 1),
    ('The Database Phantom', 'White', 2, 6.50, 2),
    ('Null Specter', 'Gray', 3, 7.10, 2),
    ('Moonfang', 'Silver', 5, 7.40, 3),
    ('Patchwolf', 'Brown', 4, 6.80, 3),
    ('Bigfoot.exe', 'Brown', 3, 8.20, 4),
    ('Chupacabra Prime', 'Green', 4, 4.10, 4),
    ('Sky Scanner', 'Blue', 2, 5.50, 5),
    ('Nebula Visitor', 'Purple', 3, 6.00, 5),
    ('Austin Lake Serpent', 'Teal', 4, 22.00, 6),
    ('Deep Packet Kraken', 'Navy', 5, 35.00, 6),
    ('Firewall Zombie', 'Gray', 3, 6.10, 7),
    ('Rootkit Mummy', 'Tan', 4, 6.60, 7),
    ('The Red-Eyed Daemon', 'Red', 5, 7.30, 8),
    ('Whispering Imp', 'Orange', 2, 3.20, 8),
    ('Query Kong', 'Black', 4, 12.50, 9),
    ('Iron Golem 404', 'Silver', 5, 10.00, 9),
    ('Gamma Gremlin', 'Green', 3, 3.80, 10),
    ('Toxic Slime Beast', 'Lime', 2, 2.40, 10),
    ('Shadowfang', 'Black', 5, 7.00, 3),
    ('Mirror Ghost', 'Clear', 2, 5.80, 2),
    ('Desert Crawler', 'Sand', 4, 9.20, 4),
    ('Signal Eater', 'Violet', 3, 4.70, 5),
    ('Rust Monster', 'Orange', 3, 5.10, 9);


-- =========================================
-- 5. Insert locations
-- =========================================

INSERT INTO locations
(location_name, city, environment_type)
VALUES
    ('Abandoned Data Center', 'Austin', 'Industrial'),
    ('Moonlight Forest', 'Bastrop', 'Forest'),
    ('Downtown Austin Tunnels', 'Austin', 'Underground'),
    ('Lake Travis Shore', 'Austin', 'Lakeside'),
    ('Community College Basement', 'Austin', 'Campus'),
    ('Old Railway Warehouse', 'Round Rock', 'Warehouse'),
    ('Desert Research Station', 'Marfa', 'Desert'),
    ('Gulf Coast Pier', 'Galveston', 'Coastal'),
    ('Hill Country Cave', 'Dripping Springs', 'Cave'),
    ('Riverside Server Farm', 'San Marcos', 'Technology');


-- =========================================
-- 6. Insert investigators
-- =========================================

INSERT INTO investigators
(first_name, last_name, experience_level)
VALUES
    ('Maya', 'Torres', 'Expert'),
    ('Ethan', 'Cole', 'Intermediate'),
    ('Priya', 'Shah', 'Expert'),
    ('Noah', 'Brooks', 'Beginner'),
    ('Lena', 'Martinez', 'Intermediate'),
    ('Owen', 'Price', 'Beginner');


-- =========================================
-- 7. Insert sightings
-- Some monsters appear more than once on different dates.
-- Notes are between 10 and 200 characters.
-- =========================================

INSERT INTO sightings
(monster_id, location_id, sighting_date, witness_count, notes)
VALUES
    (1, 1, '2026-05-03', 2, 'A tall figure watched the loading dock before disappearing.'),
    (1, 3, '2026-05-18', 5, 'Witnesses saw Count Byteula enter a locked tunnel door.'),
    (1, 5, '2026-06-02', 1, 'A student reported a black cape moving near the elevators.'),
    (2, 6, '2026-05-11', 3, 'Red footprints ended suddenly beside an empty storage crate.'),
    (3, 1, '2026-05-07', 4, 'Computer screens flickered while a pale shape crossed the room.'),
    (3, 5, '2026-06-14', 2, 'The phantom appeared beside an unplugged laboratory monitor.'),
    (4, 10, '2026-05-22', 1, 'A gray shadow moved through the server racks without sound.'),
    (5, 2, '2026-05-16', 6, 'Campers heard howling and found silver fur near the trail.'),
    (5, 9, '2026-06-21', 2, 'Moonfang was seen leaving the cave just before sunrise.'),
    (5, 2, '2026-07-19', 3, 'Fresh claw marks appeared on trees after a full moon.'),
    (6, 6, '2026-06-01', 2, 'A brown wolf-like creature crossed the warehouse roof.'),
    (7, 2, '2026-05-28', 8, 'Several hikers photographed a huge figure near the creek.'),
    (7, 9, '2026-07-04', 3, 'Large footprints led into the cave but never came back out.'),
    (8, 7, '2026-06-09', 1, 'A green creature drained several animal water containers.'),
    (9, 7, '2026-06-17', 4, 'Blue lights hovered silently above the research station.'),
    (9, 10, '2026-07-12', 2, 'The Sky Scanner floated over antennas during a network outage.'),
    (10, 7, '2026-06-25', 5, 'A purple figure stood beside the station and raised one hand.'),
    (11, 4, '2026-05-30', 7, 'A long teal shape disturbed the water near the boat ramp.'),
    (11, 4, '2026-06-30', 4, 'The lake serpent surfaced twice near an empty fishing boat.'),
    (11, 8, '2026-07-28', 9, 'Tourists reported a large wake moving against the tide.'),
    (12, 8, '2026-06-05', 3, 'Tentacles wrapped around the pier supports before releasing them.'),
    (13, 5, '2026-06-12', 2, 'A slow figure wearing burned clothing entered the basement.'),
    (14, 3, '2026-06-20', 1, 'Dusty bandages were found moving through the tunnel alone.'),
    (15, 1, '2026-07-01', 4, 'Red eyes appeared behind a window during a power failure.'),
    (16, 5, '2026-07-08', 6, 'Small orange footprints circled the computer laboratory.'),
    (17, 6, '2026-07-15', 10, 'Query Kong damaged a loading door and climbed onto the roof.'),
    (18, 10, '2026-07-20', 3, 'A metal giant stood motionless beside the cooling system.'),
    (19, 7, '2026-07-23', 2, 'Green sparks followed a small creature across the desert floor.'),
    (20, 4, '2026-07-26', 5, 'A glowing slime trail appeared near the lakeside trash bins.'),
    (25, 6, '2026-08-01', 2, 'Rust-colored claws scraped fresh marks into a steel support beam.');


-- =========================================
-- 8. Insert encounters
-- =========================================

INSERT INTO encounters
(investigator_id, monster_id, location_id, encounter_date, outcome, damage_cost)
VALUES
    (1, 1, 1, '2026-05-04', 'Monster escaped', 1250.00),
    (2, 3, 1, '2026-05-08', 'Equipment damaged', 875.50),
    (3, 5, 2, '2026-05-17', 'Investigator fled', 0.00),
    (4, 7, 2, '2026-05-29', 'False alarm', 0.00),
    (5, 11, 4, '2026-05-31', 'Monster disappeared', 3200.00),
    (6, 2, 6, '2026-06-03', 'Minor injury', 450.75),
    (1, 12, 8, '2026-06-06', 'Pier damaged', 11850.00),
    (2, 8, 7, '2026-06-10', 'Monster escaped', 725.25),
    (3, 13, 5, '2026-06-13', 'Area secured', 150.00),
    (4, 3, 5, '2026-06-15', 'Friendly contact', 0.00),
    (5, 9, 7, '2026-06-18', 'Evidence collected', 980.00),
    (6, 14, 3, '2026-06-21', 'Tunnel damaged', 2100.40),
    (1, 5, 9, '2026-06-22', 'Monster escaped', 675.00),
    (2, 10, 7, '2026-06-26', 'Communication attempt', 300.00),
    (3, 11, 4, '2026-07-01', 'Boat damaged', 6400.00),
    (4, 15, 1, '2026-07-02', 'Investigator fled', 525.90),
    (5, 7, 9, '2026-07-05', 'Tracks collected', 85.00),
    (6, 16, 5, '2026-07-09', 'Lab equipment damaged', 1340.65),
    (1, 9, 10, '2026-07-13', 'Monster disappeared', 240.00),
    (2, 17, 6, '2026-07-16', 'Warehouse damaged', 9750.00),
    (3, 18, 10, '2026-07-21', 'Cooling system damaged', 15800.00),
    (4, 19, 7, '2026-07-24', 'Sample collected', 375.25),
    (5, 20, 4, '2026-07-27', 'Cleanup required', 860.80),
    (6, 11, 8, '2026-07-29', 'Monster escaped', 4250.00),
    (1, 25, 6, '2026-08-02', 'Support beam damaged', 2875.35);


COMMIT;


-- =========================================
-- 9. Verification queries
-- =========================================

SELECT COUNT(*) AS category_count
FROM monster_categories;

SELECT COUNT(*) AS monster_count
FROM monsters;

SELECT COUNT(*) AS location_count
FROM locations;

SELECT COUNT(*) AS investigator_count
FROM investigators;

SELECT COUNT(*) AS sighting_count
FROM sightings;

SELECT COUNT(*) AS encounter_count
FROM encounters;


-- Show monsters with more than one sighting
SELECT
    monsters.monster_id,
    monsters.monster_name,
    COUNT(sightings.sighting_id) AS number_of_sightings
FROM monsters
         JOIN sightings
              ON monsters.monster_id = sightings.monster_id
GROUP BY
    monsters.monster_id,
    monsters.monster_name
HAVING COUNT(sightings.sighting_id) > 1
ORDER BY number_of_sightings DESC, monsters.monster_name;


-- Show sighting notes and their character lengths
SELECT
    sighting_id,
    notes,
    CHAR_LENGTH(notes) AS note_length
FROM sightings
ORDER BY sighting_id;


-- Show encounter damage from highest to lowest
SELECT
    encounter_id,
    outcome,
    damage_cost
FROM encounters
ORDER BY damage_cost DESC;