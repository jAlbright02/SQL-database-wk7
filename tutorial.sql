CREATE DATABASE mydatabase;

USE mydatabase;

CREATE TABLE person (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL,
	age INT NOT NULL,
	email VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE address(
	id INT NOT NULL AUTO_INCREMENT,
	person_id INT NOT NULL,
	street VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL,
	county VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (person_id) REFERENCES person(id)
);

INSERT INTO person (name, age, email) VALUES
	('James', 20, 'james@atu.ie'),
	('Bob', 19, 'bob@atu.ie'),
	('Kevin', 23, 'kevin@atu.ie');
	
INSERT INTO address (person_id, street, city, county) VALUES
	(1, '45 Dyke Road', 'Balla', 'Roscommon'),
	(2, '31 Forster Place', 'Boyle', 'Mayo'),
	(3, '22 Glasan', 'Strokestown', 'Roscommon');
	
UPDATE person SET name='Jim', age=21, email='jim@atu.ie' WHERE email='james@atu.ie';

UPDATE address
		SET street = '1 Tara Grove', city = 'Galway', county = 'Galway'
		WHERE person_id = (SELECT id FROM person WHERE email = 'jim@atu.ie');
	
	
START TRANSACTION;

INSERT INTO person (name, age, email) VALUES ('Dean', 24,'dean@atu.ie');

SET @person_id = LAST_INSERT_ID();

INSERT INTO address (person_id, street, city, county) VALUES (4, 'Meadow View', 'Dernacartha', 'Mayo');

COMMIT;