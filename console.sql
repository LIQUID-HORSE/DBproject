CREATE SCHEMA IF NOT EXISTS COCLIKERS;
set search_path = COCLIKERS, public;

DROP TABLE IF EXISTS PLAYERS CASCADE;
CREATE TABLE PLAYERS (
    player_id SERIAL PRIMARY KEY,
    nick VARCHAR(255) NOT NULL UNIQUE ,
    mail VARCHAR(255) NOT NULL UNIQUE,
    pass VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS INTERNSHIPS_TYPE CASCADE;
CREATE TABLE INTERNSHIPS_TYPE (
    int_type SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS INTERNSHIPS CASCADE;
CREATE TABLE INTERNSHIPS (
    int_id SERIAL PRIMARY KEY,
    int_type INTEGER NOT NULL REFERENCES INTERNSHIPS_TYPE(int_type),
    player_id1 INTEGER NOT NULL REFERENCES PLAYERS(player_id),
    player_id2 INTEGER NOT NULL REFERENCES PLAYERS(player_id)
);

DROP TABLE IF EXISTS RESURSES CASCADE;
CREATE TABLE RESURSES (
    res_type SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS WARRIORS CASCADE;
CREATE TABLE WARRIORS (
    warrior_type SERIAL PRIMARY KEY,
    res_type INTEGER NOT NULL REFERENCES RESURSES(res_type),
    name VARCHAR(255) NOT NULL UNIQUE,
    price INTEGER NOT NULL
);

DROP TABLE IF EXISTS BUILDS CASCADE;
CREATE TABLE BUILDS (
    build_type SERIAL PRIMARY KEY,
    res_type INTEGER NOT NULL REFERENCES RESURSES(res_type),
    name VARCHAR(255) NOT NULL UNIQUE,
    price INTEGER NOT NULL
);

DROP TABLE IF EXISTS PLAYERS_X_BUILDS CASCADE;
CREATE TABLE PLAYERS_X_BUILDS (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES PLAYERS(player_id),
    build_type INTEGER NOT NULL REFERENCES BUILDS(build_type),
    quantity INTEGER NOT NULL
);

DROP TABLE IF EXISTS PLAYERS_X_RESURSES CASCADE;
CREATE TABLE PLAYERS_X_RESURSES (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES PLAYERS(player_id),
    res_type INTEGER NOT NULL REFERENCES RESURSES(res_type),
    quantity INTEGER NOT NULL
);

DROP TABLE IF EXISTS PLAYERS_X_WARRIORS CASCADE;
CREATE TABLE PLAYERS_X_WARRIORS (
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES PLAYERS(player_id),
    warrior_type INTEGER NOT NULL REFERENCES WARRIORS(warrior_type),
    quantity INTEGER NOT NULL
);

DROP TABLE IF EXISTS INTERNSHIPS_RES CASCADE;
CREATE TABLE INTERNSHIPS_RES (
    id SERIAL PRIMARY KEY,
    int_id INTEGER NOT NULL REFERENCES INTERNSHIPS(int_id),
    res_type INTEGER NOT NULL REFERENCES RESURSES(res_type),
    quantity INTEGER NOT NULL
);

DROP TABLE IF EXISTS BUILDS_HISTORY CASCADE;
CREATE TABLE BUILDS_HISTORY (
    build_type INTEGER PRIMARY KEY REFERENCES BUILDS(build_type),
    res_type INTEGER REFERENCES RESURSES(res_type),
    name_old VARCHAR(255) NOT NULL,
    price_old INTEGER NOT NULL
);

DROP TABLE IF EXISTS WARRIORS_HISTORY CASCADE;
CREATE TABLE WARRIORS_HISTORY (
    warrior_type INTEGER PRIMARY KEY REFERENCES WARRIORS(warrior_type),
    res_type INTEGER REFERENCES RESURSES(res_type),
    name_old VARCHAR(255) NOT NULL,
    price_old INTEGER NOT NULL
);

INSERT INTO PLAYERS (nick, mail, pass) VALUES
('awesome67', 'megacrazy@gmail.com', 'babyland2008'),
('sasaprincess', 'sasatop@example.com', 'sasasasa228'),
('cactustim', 'almosttravis@example.com', 'passreader16yrsoldhotboy'),
('antonp', 'anton2004@example.com', 'nevzlomat'),
('DussyPestryer', 'neonrider@example.com', 'dolbil_dremal322'),
('dead_inside_toxic_emotionless', 'imdead@example.com', 'sftier30'),
('hurt_weak', 'notox@cvrsxd.com', 'neverm1nd'),
('watch_me_die', 'letmedrop@example.com', 'd0nt0uch'),
('igrushka_otchima', 'iloveit@example.com', 'b1gsplashh1337'),
('clown_suffered', 'clown_safr@example.com', 'justf0rfun');

INSERT INTO INTERNSHIPS_TYPE (name) VALUES
('War'),
('Exchange');

INSERT INTO INTERNSHIPS (int_type, player_id1, player_id2) VALUES
(1, 1, 2),
(2, 3, 4),
(1, 2, 3),
(2, 4, 5),
(2, 1, 5),
(1, 9, 7),
(2, 5, 8),
(1, 10, 6),
(1, 2, 9),
(1, 4, 7);

INSERT INTO RESURSES (name) VALUES
('Gold'),
('Elixir'),
('Dark Elixir'),
('Emeralds');

INSERT INTO WARRIORS (res_type, name, price) VALUES
(1, 'Barbarian', 50),
(2, 'Archer', 80),
(3, 'Giant', 100),
(1, 'Goblin', 30),
(2, 'Wall Breaker', 1000),
(2, 'Wizard', 300),
(3, 'Dragon', 200),
(3, 'Yeti', 500);

INSERT INTO BUILDS (res_type, name, price) VALUES
(1, 'Town Hall', 2000),
(2, 'Barracks', 500),
(3, 'Gold Mine', 150),
(2, 'Elixir Collector', 150),
(3, 'Dark Elixir Drill', 1000),
(4, 'Emerald Drill', 200),
(4, 'Museum', 300),
(1, 'Theatre', 2000);

INSERT INTO PLAYERS_X_BUILDS (player_id, build_type, quantity) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 1),
(6, 7, 1),
(6, 2, 2);

INSERT INTO PLAYERS_X_RESURSES (player_id, res_type, quantity)VALUES
(1, 1, 10000),
(2, 2, 8000),
(3, 3, 5000),
(4, 3, 2000),
(5, 2, 3000);

INSERT INTO PLAYERS_X_WARRIORS (player_id, warrior_type, quantity)VALUES
(1, 1, 20),
(2, 2, 30),
(3, 3, 5),
(4, 4, 15),
(5, 5, 2);

INSERT INTO INTERNSHIPS_RES (int_id, res_type, quantity) VALUES
(1, 1, 500),
(2, 2, 300),
(3, 3, 250),
(4, 2, 100),
(5, 1, 50);
