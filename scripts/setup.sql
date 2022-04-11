DROP TABLE IF EXISTS cats CASCADE;
CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    name VARCHAR ( 20 ),
    age INT,
    breed_id INT
);
COPY cats
FROM $str$/code/data/cats.csv$str$
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS breeds;
CREATE TABLE breeds (
    id SERIAL PRIMARY KEY,
    name VARCHAR ( 20 )
);
COPY breeds
FROM $str$/code/data/breeds.csv$str$
DELIMITER ',' CSV HEADER;


DROP TABLE IF EXISTS owners CASCADE;
CREATE TABLE owners (
    id serial PRIMARY KEY,
    name VARCHAR ( 50 ) NOT NULL,
    location VARCHAR ( 20 )
);
COPY owners
FROM $str$/code/data/owners.csv$str$
DELIMITER ',' CSV HEADER;


CREATE TABLE adoptions (
	id serial PRIMARY KEY,
    cat_id INT REFERENCES cats (id) NOT NULL,
    owner_id INT REFERENCES owners (id) NOT NULL,
    adoption_date TIMESTAMP DEFAULT NOW()
);

INSERT INTO adoptions (cat_id, owner_id) VALUES (1, 1), (3, 2);