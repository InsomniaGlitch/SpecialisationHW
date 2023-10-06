# Итоговая КР
## Задания
1. Используя cat в терминале Linux, создать
два файла: Домашние животные (собаки, кошки и
хомяки) и Вьючные животные (лошади, верблюды и
ослы), а затем объединить их. Просмотреть содержимое созданного файла.
Переименовать файл, дав ему новое имя (Друзья человека).
```
cat domestic.txt
cat pack.txt
cat domestic.txt pack.txt > human_friends.txt
cat human_friends.txt
```

2. Создать директорию, переместить файл туда.
```
mkdir animal_nursery
mv human_friends.txt /home/insomnia/animal_nursery
```

3. Подключить дополнительный репозиторий MySQL, установить любой пакет
из этого репозитория.
```
wget https://dev.mysql.com/get/mysql-apt-config_0.8.26-1_all.deb
apt install ./mysql-apt-config_0.8.26-1_all.deb
apt-get update
apt install -f mysql-client mysql-community-server mysql-server
```

4. Установить и удалить deb-пакет с помощью dpkg.
```
dpkg -i mysql-apt-config_0.8.26-1_all.deb
dpkg -r mysql
```

5. Выложить историю команд в терминале ubuntu.
> Выше

6. Нарисовать диаграмму, в которой есть классы "родительский класс", "домашние
животные" и "вьючные животные", в составы которых в случае домашних
животных войдут классы: "собаки", "кошки", "хомяки", а в случае вьючных животных
войдут: "лошади", "верблюды" и "ослы".
[Диаграмма](Hierarchy.drawio)

7. В подключенном MySQL репозитории создать БД “Друзья
человека”.
`CREATE DATABASE human_friends;`

8. Создать в БД таблицы с иерархией из диаграммы.
```
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
);```

9. Заполнить низкоуровневые таблицы именами животных, командами,
которые они выполняют, и датами рождения.
```INSERT INTO cats (name, birthday, commands, specie_id)
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
('wtf', '2023-01-01', 'please_stop_two_was_enough', 3);```

10. Удалить из таблицы верблюдов, т.к. верблюдов решили перевезти в другой
питомник на зимовку; объединить таблицы "лошади" и "ослы" в одну таблицу.
```DELETE from camels WHERE id > 0;
CREATE TABLE totally_horses (id INT NOT NULL PRIMARY KEY)
SELECT name, 
       command, 
       birthday
FROM horses UNION 
SELECT name, 
       command, 
       birthday
FROM donkeys;
```

11. Создать новую таблицу “молодые животные”, в которую попадут все
животные старше 1 года, но младше 3 лет и в отдельном столбце с точностью
до месяца подсчитать возраст животных в новой таблице.
```
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
```

12. Объединить все таблицы в одну, при этом сохраняя поля, указывающие на
прошлую принадлежность к старым таблицам.
```
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
```

13. Создать [класс с инкапсуляцией методов и наследованием по диаграмме](pets).

14. Написать [программу, имитирующую работу реестра домашних животных](pets).
В программе должен быть реализован следующий функционал:

* 14.1 Завести новое животное
* 14.2 определять животное в правильный класс
* 14.3 увидеть список команд, которое выполняет животное
* 14.4 обучить животное новым командам
* 14.5 Реализовать навигацию по меню

15. Создайте класс [Счетчик](pets), у которого есть метод add(), увеличивающий
значение внутренней int переменной на 1 при нажатие “Завести новое
животное” Сделайте так, чтобы с объектом такого типа можно было работать в
блоке try-with-resources. Нужно бросить исключение, если работа с объектом
типа счетчик была не в ресурсном try и/или ресурс остался открыт. Значение
считать в ресурсе try, если при заведения животного заполнены все поля.