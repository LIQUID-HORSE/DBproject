-- Добавление нескольких игроков за один запрос
INSERT INTO PLAYERS (nick, mail, pass) VALUES
('dasham', 'dashadasha@example.com', 'passdasha'),
('katya', 'katyakatya@example.com', 'kkkatya'),
('victor', 'vityabac@example.com', 'mama228');
-- Работает

-- Чтение игроков с определенным никнеймом или электронной почтой
SELECT * FROM PLAYERS WHERE nick LIKE 'Player%' OR mail LIKE '%@gmail.com';
-- Работает

-- Получение количества игроков, зарегистрированных в системе
SELECT COUNT(*) FROM PLAYERS;
-- Работает

-- Получение игрока с максимальным ID
SELECT * FROM PLAYERS WHERE player_id = (SELECT MAX(player_id) FROM PLAYERS);
-- Работает

-- Пакетное обновление паролей для всех игроков с почтой @gmail.com
UPDATE PLAYERS SET pass = 'newSecurePass123' WHERE mail LIKE '%@gmail.com';
-- Работает

-- Установить всем игрокам с "zxc" приписку клана "[deadinside]" в начале никнейма
UPDATE PLAYERS SET nick = '[deadinside]' || nick WHERE nick LIKE '%zxc%';
-- Работает

-- Удаление всех игроков, у которых никнейм начинается на "Player"
DELETE FROM PLAYERS WHERE nick LIKE 'Player%';
-- Работает


-- Добавление различных строений
INSERT INTO BUILDS (res_type, name, price) VALUES
(1, 'Cannon', 200),
(2, 'Wizard Tower', 500),
(3, 'Air Defense', 300);
-- Работает

-- Чтение строений, отсортированных по убыванию их стоимости
SELECT * FROM BUILDS ORDER BY price DESC;
-- Работает

-- Получение средней стоимости всех строений
SELECT AVG(price) FROM BUILDS;
-- Работает

-- Получение списка строений с ценой выше средней
SELECT * FROM BUILDS WHERE price > (SELECT AVG(price) FROM BUILDS);
-- Работает

-- Увеличение цены всех строений на 10%
UPDATE BUILDS SET price = price * 1.1;
-- Работает

-- Обновление цены для строений, стоимость которых оценивается золотом
UPDATE BUILDS SET price = 1200 WHERE res_type = 1;
-- Работает

-- Удаление всех строений, которые дешевле определенной цены
DELETE FROM PLAYERS_X_BUILDS WHERE build_type IN (SELECT build_type FROM BUILDS WHERE price < 200);
DELETE FROM BUILDS WHERE price < 200;
-- Работает
