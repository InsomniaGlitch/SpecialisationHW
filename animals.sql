USE human_friends;
CREATE TABLE animals
(
    id INT PRIMARY KEY, 
	class_name VARCHAR(20)
);

INSERT INTO animals (class_name)
VALUES ('pack'),
('domestic');  

CREATE TABLE pack_animals
(
	id INT PRIMARY KEY,
    specie_name VARCHAR (20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO pack_animals (specie_name, class_id)
VALUES ('Лошади', 1),
('Ослы', 1),  
('Верблюды', 1); 
    
CREATE TABLE domestic_animals
(
	id INT PRIMARY KEY,
    specie_name VARCHAR (20),
    class_id INT,
    FOREIGN KEY (class_id) REFERENCES animals (Id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO domestic_animals (specie_name, class_id)
VALUES ('Кошки', 2),
('Собаки', 2),  
('Хомяки', 2); 

CREATE TABLE cats 
(       
    id INT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    specie_id int,
    Foreign KEY (specie_id) REFERENCES domestic_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE dogs 
(       
    id INT  PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    specie_id int,
    Foreign KEY (specie_id) REFERENCES domestic_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE hamsters 
(       
    id INT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    specie_id int,
    Foreign KEY (specie_id) REFERENCES domestic_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE horses 
(       
    id INT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    specie_id int,
    Foreign KEY (specie_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE donkeys 
(       
    Id INT  PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    specie_id int,
    Foreign KEY (specie_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE camels 
(       
    id INT PRIMARY KEY, 
    name VARCHAR(20), 
    birthday DATE,
    commands VARCHAR(50),
    specie_id int,
    Foreign KEY (specie_id) REFERENCES pack_animals (id) ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO cats (name, birthday, commands, specie_id)
VALUES ('Cat1', '2021-01-01', 'meow', 1),
('Cat2', '2022-01-01', 'aA', 1),  
('Cat3', '2023-01-01', 'AAA!', 1); 

INSERT INTO dogs (name, birthday, commands, specie_id)
VALUES ('Dog1', '2021-01-01', 'bark', 2),
('Dog2', '2022-01-01', 'eE', 2),  
('Dog3', '2023-01-01', 'EEE!', 2);


INSERT INTO hamsters (name, birthday, commands, specie_id)
VALUES ('ham', '2021-01-01', 'heart_attack', 3),
('more_ham', '2022-01-01', 'stroke', 3),  
('bacon', '2023-01-01', 'DEATH_AND_DAMNATION, THE_FLEET_IS_COMING, HE_WAS_MADE_TO_RULE_THE_WAVES_ACROSS_THE_SEVEN_SEAS!!!', 3);

INSERT INTO horses (name, birthday, commands, specie_id)
VALUES ('horse1', '2021-01-01', 'galop', 1),
('horse2', '2022-01-01', '*dies*', 1),  
('camouflage', '2023-01-01', 'Woah-oh-oh-oh, camouflage, things_are_never_quite_the_way_they_seem', 1);


INSERT INTO donkeys (name, birthday, commands, specie_id)
VALUES ('young_ia', '2021-01-01', 'have_his_tail_being_brutally_ripped_off', 2),
('adult_ia', '2022-01-01', 'have_a_birthday', 2),  
('old_ia', '2023-01-01', 'have_his_tail_being_returned_as_a_gift', 2);


INSERT INTO camels (name, birthday, commands, specie_id)
VALUES ('1hump', '2021-01-01', 'have_one_hump', 3),
('2humps', '2022-01-01', 'have_two_humps', 3),  
('wtf', '2023-01-01', 'please_stop_two_was_enough', 3);
DELETE from camels WHERE id > 0;
CREATE TABLE totally_horses (id INT NOT NULL PRIMARY KEY)
SELECT name, 
       command, 
       birthday
FROM horses UNION 
SELECT name, 
       command,
       birthday
FROM donkeys;
CREATE TABLE young_animals AS
SELECT *, CONCAT(TIMESTAMPDIFF(YEAR, birthday, NOW()), " г ", TIMESTAMPDIFF(MONTH, birthday, NOW()) - (12 * TIMESTAMPDIFF(YEAR, birthday, NOW())), " м") AS age FROM dogs
UNION
SELECT *, CONCAT(TIMESTAMPDIFF(YEAR, birthday, NOW()), " г ", TIMESTAMPDIFF(MONTH, birthday, NOW()) - (12 * TIMESTAMPDIFF(YEAR, birthday, NOW())), " м") AS age FROM cats
UNION
SELECT *, CONCAT(TIMESTAMPDIFF(YEAR, birthday, NOW()), " г ", TIMESTAMPDIFF(MONTH, birthday, NOW()) - (12 * TIMESTAMPDIFF(YEAR, birthday, NOW())), " м") AS age FROM hamsters
UNION
SELECT *, CONCAT(TIMESTAMPDIFF(YEAR, birthday, NOW()), " г ", TIMESTAMPDIFF(MONTH, birthday, NOW()) - (12 * TIMESTAMPDIFF(YEAR, birthday, NOW())), " м") AS age FROM horses
UNION
SELECT *, CONCAT(TIMESTAMPDIFF(YEAR, birthday, NOW()), " г ", TIMESTAMPDIFF(MONTH, birthday, NOW()) - (12 * TIMESTAMPDIFF(YEAR, birthday, NOW())), " м") AS age FROM camels
UNION
SELECT *, CONCAT(TIMESTAMPDIFF(YEAR, birthday, NOW()), " г ", TIMESTAMPDIFF(MONTH, birthday, NOW()) - (12 * TIMESTAMPDIFF(YEAR, birthday, NOW())), " м") AS age FROM donkeys
WHERE TIMESTAMPDIFF(MONTH, birthday, NOW()) BETWEEN 12 AND 36;
CREATE TABLE all_animals AS
SELECT name, birthday, commands, specie_id, 'Dogs' AS oldTable FROM dogs
UNION
SELECT name, birthday, commands, specie_id, 'Cats' AS oldTable FROM cats
UNION
SELECT name, birthday, commands, specie_id, 'Hamsters' AS oldTable FROM hamsters
UNION
SELECT name, birthday, commands, specie_id, 'Horses' AS oldTable FROM horses
UNION
SELECT name, birthday, commands, specie_id, 'Camels' AS oldTable FROM camels
UNION
SELECT name, birthday, commands, specie_id, 'Donkeys' AS oldTable FROM donkeys;