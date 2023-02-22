DROP DATABASE IF EXISTS superheroes;
CREATE DATABASE superheroes CHARACTER SET utf8mb4;
USE superheroes;

CREATE TABLE creador (
id_creador INT UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
  nombre VARCHAR(20) NOT NULL
);


CREATE TABLE personajes (
  id_personaje INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre_real VARCHAR(20) NOT NULL,
  personaje VARCHAR(20) NOT NULL,
  inteligencia INT(10) NOT NULL,
  fuerza VARCHAR(10) NOT NULL,
  velocidad INT(11) NOT NULL,
  poder INT(11) NOT NULL,
  aparicion INT(11) NOT NULL,
  ocupacion VARCHAR(30) NULL,
  id_creador INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_creador) REFERENCES creador(id_creador)
  );

INSERT INTO creador VALUES (1,"Marvel");
INSERT INTO creador VALUES (2,"DcComics");

INSERT INTO personajes VALUES (1, "Bruce banner", "Hulk", 160, "600 Mil", 75, 98, 1962, "Fisico Nuclear", 1);
INSERT INTO personajes VALUES (2, "Tony Stark", "Iron Man", 100, "200 Mil", 70, 123, 1963,"Inventor Industrual", 1);
INSERT INTO personajes VALUES (3, "Thor Odinson", "Thor", 145, "Infinita", 100, 233, 1962, "Rey de Asgard", 1);
INSERT INTO personajes VALUES (4, "Wanda Maximof", "Scarlet witch", 170, "100 Mil", 90, 345, 1964,"Bruja", 1);
INSERT INTO personajes VALUES (5, "Carol Danvers", "Captain Marvel", 157, "250 Mil", 95, 128, 1968,"Oficial De Inteligencia", 1);
INSERT INTO personajes VALUES (6, "Thanos", "The Mad Titan", 170, "Infinita", 40, 306, 1973, "Adorador de la Muerte", 1);
INSERT INTO personajes VALUES (7, "Peter Parker", "Spiderman", 165, "25 Mil", 80, 74, 1962, "Fotografo", 1);
INSERT INTO personajes VALUES (8, "Steve Rogers", "Captain America", 145, "600", 45, 65, 1941,"Oficial Federal",1);
INSERT INTO personajes VALUES (9, "Bobby Drake", "Ice Man", 140, "2 mil", 64, 122, 1963, "Contador", 1);
INSERT INTO personajes VALUES (10, "Barry Allen", "The Flash", 260, "10 Mil", 120, 168, 1956, "Cientifico Forence", 2);
INSERT INTO personajes VALUES (11, "Bruce wayne ", "Batman", 170, "500", 32, 47, 1939, "Empresario", 2);
INSERT INTO personajes VALUES (12, "Clark kent", "Superman", 165, "Infinita", 120, 182, 1948, "Reportero", 2);
INSERT INTO personajes VALUES (13, "Diana Prince", "Wonder Woman", 160, "Infinita", 95, 127, 1949, "Princesa gerrera", 2);

SELECT * FROM creador;

UPDATE personajes SET aparicion = 1938 WHERE id_personaje = 12;
UPDATE personajes SET inteligencia = 160 WHERE id_personaje = 10;
UPDATE personajes SET inteligencia = 170 WHERE id_personaje = 2;

SELECT * FROM personajes;
SELECT nombre_real FROM personajes;
SELECT * FROM personajes WHERE nombre_real LIKE "b%";
SELECT * FROM personajes ORDER BY inteligencia DESC;