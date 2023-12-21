-- 1A
-- GROUP BY + HAVING
-- Вывести всех игроков, которые имеют больше 1000 ресурсов
SELECT PLAYERS.nick, SUM(PLAYERS_X_RESURSES.count) AS res_count
FROM PLAYERS
INNER JOIN PLAYERS_X_RESURSES ON PLAYERS.player_id = PLAYERS_X_RESURSES.player_id
GROUP BY PLAYERS.nick
HAVING SUM(PLAYERS_X_RESURSES.count) > 1000;
-- В результате выполнения Запроса 1 будут получены все игроки, которые имеют больше 1000 ресурсов

-- 2B
-- ORDER BY
-- Вывести всех игроков, отсортированных по количеству ресурсов
SELECT PLAYERS.nick, SUM(PLAYERS_X_RESURSES.count) AS res_count
FROM PLAYERS
INNER JOIN PLAYERS_X_RESURSES ON PLAYERS.player_id = PLAYERS_X_RESURSES.player_id
GROUP BY PLAYERS.nick
ORDER BY res_count;
-- В результате выполнения Запроса 2 будут получены все игроки, отсортированные по количеству ресурсов

-- 3C
-- Оконные функции
-- Вывести всех игроков, отсортированных по количеству ресурсов
SELECT DISTINCT PLAYERS.nick, SUM(PLAYERS_X_RESURSES.count) OVER (PARTITION BY PLAYERS.nick) AS res_count
FROM PLAYERS
INNER JOIN PLAYERS_X_RESURSES ON PLAYERS.player_id = PLAYERS_X_RESURSES.player_id
ORDER BY res_count;
-- В результате выполнения Запроса 3 будут получены все игроки, отсортированные по количеству ресурсов

-- 4A
-- GROUP BY + HAVING
-- Вывести всех игроков, которые имеют меньше 4 зданий
SELECT PLAYERS.nick, COUNT(PLAYERS_X_BUILDS.build_type) AS builds_count
FROM PLAYERS
INNER JOIN PLAYERS_X_BUILDS ON PLAYERS.player_id = PLAYERS_X_BUILDS.player_id
GROUP BY PLAYERS.nick
HAVING COUNT(PLAYERS_X_BUILDS.build_type) < 4;
-- В результате выполнения Запроса 4 будут получены все игроки, которые имеют меньше 4 зданий

-- 5B
-- ORDER BY
-- Вывести всех игроков, отсортированных по количеству зданий по убыванию
SELECT PLAYERS.nick, COUNT(PLAYERS_X_BUILDS.build_type) AS builds_count
FROM PLAYERS
INNER JOIN PLAYERS_X_BUILDS ON PLAYERS.player_id = PLAYERS_X_BUILDS.player_id
GROUP BY PLAYERS.nick
ORDER BY builds_count DESC;
-- В результате выполнения Запроса 5 будут получены все игроки, отсортированные по количеству зданий по убыванию
