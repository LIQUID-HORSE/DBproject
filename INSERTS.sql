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
