-- Создание схемы для представлений
CREATE SCHEMA IF NOT EXISTS views_schema;

-- Представление для таблицы PLAYERS
CREATE OR REPLACE VIEW views_schema.players_view AS
SELECT
    player_id,
    nick,
    mail,
    LEFT(pass, 1) || '*****' AS pass_masked -- Маскирование пароля
FROM
    PLAYERS;

-- Представление для таблицы BUILDS
CREATE OR REPLACE VIEW views_schema.builds_view AS
SELECT
    name,
    price
FROM
    BUILDS;

-- Представление для таблицы RES
CREATE OR REPLACE VIEW views_schema.res_view AS
SELECT
    name
FROM
    RESURSES;

-- Представление для таблицы WARRIORS
CREATE OR REPLACE VIEW views_schema.warriors_view AS
SELECT
    name,
    price
FROM
    WARRIORS;

-- Представление для таблицы INT
CREATE OR REPLACE VIEW views_schema.internships_view AS
SELECT
    int_type,
    player_id1,
    player_id2
FROM
    INTERNSHIPS;

-- Представление для таблицы INT_TYPE
CREATE OR REPLACE VIEW views_schema.internships_type_view AS
SELECT
    name
FROM
    INTERNSHIPS_TYPE;

-- Представление для таблицы INT_RES
CREATE OR REPLACE VIEW views_schema.internships_res_view AS
SELECT
    int_id,
    res_type,
    quantity
FROM
    INTERNSHIPS_RES;
