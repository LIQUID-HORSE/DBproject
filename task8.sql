-- Создание схемы для представлений
CREATE SCHEMA IF NOT EXISTS views_schema;

CREATE OR REPLACE VIEW views_schema.player_resources_details AS
SELECT
    P.player_id,
    P.nick,
    R.res_type,
    RESURSES.name AS resource_name,
    SUM(R.quantity) AS total_resources
FROM
    PLAYERS P
JOIN PLAYERS_X_RESURSES R ON P.player_id = R.player_id
JOIN RESURSES ON R.res_type = RESURSES.res_type
GROUP BY
    P.player_id,
    P.nick,
    R.res_type,
    RESURSES.name;


-- Это представление объединяет данные из таблиц PLAYERS, PLAYERS_X_RES, и RES,
-- чтобы показать общее количество каждого типа ресурсов,
-- которыми владеет каждый игрок.

CREATE OR REPLACE VIEW views_schema.building_resources_statistics AS
SELECT
    P.nick,
    B.build_type,
    BD.name AS building_name,
    RESURSES.name AS resource_name,
    COUNT(B.id) AS number_of_buildings,
    AVG(BD.price) AS average_building_cost
FROM
    PLAYERS P
JOIN PLAYERS_X_BUILDS B ON P.player_id = B.player_id
JOIN BUILDS BD ON B.build_type = BD.build_type
JOIN RESURSES ON BD.res_type = RESURSES.res_type
GROUP BY
    P.nick,
    B.build_type,
    BD.name,
    RESURSES.name;

-- Это представление соединяет таблицы PLAYERS, PLAYERS_X_BUILDS, BUILDS, и RES, чтобы показать,
-- сколько строений каждого типа было построено игроками и среднюю стоимость этих строений,
-- разбивку по типу используемых ресурсов.

CREATE OR REPLACE VIEW views_schema.internship_participation AS
SELECT
    P.nick,
    IT.name AS internship_type,
    COUNT(I.int_id) AS participation_count
FROM
    PLAYERS P
JOIN INTERNSHIPS I ON P.player_id = I.player_id1 OR P.player_id = I.player_id2
JOIN INTERNSHIPS_TYPE IT ON I.int_type = IT.int_type
GROUP BY
    P.nick,
    IT.name;

-- В этом представлении данные из PLAYERS, INTERNSHIPS,
-- и INTERNSHIPS_TYPE объединяются для подсчета количества раз,
-- когда каждый игрок участвовал в различных типах интернатов.
