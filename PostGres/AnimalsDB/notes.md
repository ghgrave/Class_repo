First table should be about animals?


animals
=======
animal_id  - PK the DB to do it => SERIAL
species - required (NOT NULL) varying characters (100)
animal_name - VARCHAR(100) NULL is ok, BUT if not supplied default species+animal_id
age INTEGER NULL is ok


CREATE TABLE animals (
    animal_id SERIAL PRIMARY KEY,
    animal_name VARCHAR(100) DEFAULT 'UNKNOWN',
    species VARCHAR(100) NOT NULL,
    age SMALLINT DEFAULT NULL
);

habitats
========
climate - VARCHAR(10) and default ok -> future habitats?
habitat_id - primary key? database set it up
habitat_name - varchar(10) required default

relationship many animals to one habitat

notes
========
caretakers -BUT not today!!!
note_comments => string lots of words not null?
note_date => timestamp let the database do it!
note_id => primary key database can do it.
animal_id => relate to our animals table aka FK


