-- Добавление нескольких игроков за один запрос
INSERT INTO PLAYERS (nick, mail, pass) VALUES
('dasham', 'dashadasha@example.com', 'passdasha'),
('katya', 'katyakatya@example.com', 'kkkatya'),
('victor', 'vityabac@example.com', 'mama228');

-- Чтение игроков с определенным никнеймом или электронной почтой
SELECT * FROM PLAYERS WHERE nick LIKE 'Player%' OR mail LIKE '%@gmail.com';

-- Получение количества игроков, зарегистрированных в системе
SELECT COUNT(*) FROM PLAYERS;

-- Получение игрока с максимальным ID
SELECT * FROM PLAYERS WHERE player_id = (SELECT MAX(player_id) FROM PLAYERS);

-- Пакетное обновление паролей для всех игроков с почтой @example.com
UPDATE PLAYERS SET pass = 'newSecurePass123' WHERE mail LIKE '%@gmail.com';

-- Увеличение ID на 1 для всех игроков (симуляция миграции данных)
UPDATE PLAYERS SET player_id = player_id + 1;

-- Удаление всех игроков, у которых электронная почта не подтверждена (пример условия)
DELETE FROM PLAYERS WHERE nick LIKE 'Player%';


-- Добавление различных строений
INSERT INTO BUILDS (res_type, name, price) VALUES
(1, 'Cannon', 200),
(2, 'Wizard Tower', 500),
(3, 'Air Defense', 300);

-- Чтение строений, отсортированных по убыванию их стоимости
SELECT * FROM BUILDS ORDER BY price DESC;

-- Получение средней стоимости всех строений
SELECT AVG(price) FROM BUILDS;

-- Получение списка строений с ценой выше средней
SELECT * FROM BUILDS WHERE price > (SELECT AVG(price) FROM BUILDS);

-- Увеличение цены всех строений на 10%
UPDATE BUILDS SET price = price * 1.1;

-- Обновление типа ресурса для строений, которые стоят дороже определенной суммы
UPDATE BUILDS SET price = 1200 WHERE build_type = 1;

-- Удаление всех строений, которые дешевле определенной цены
DELETE FROM BUILDS WHERE price < 200;

-- Удаление строений, если их количество в PLAYERS_X_BUILDS для каждого типа строения меньше определенного числа
DELETE FROM BUILDS WHERE build_type IN (
    SELECT build_type FROM PLAYERS_X_BUILDS GROUP BY build_type HAVING COUNT(*) < 3
);
