# DBproject
TODO:
2a - ок
2b - ок

2c - проверить физ модель (надо вроде только TEXT на VARCHAR поменять; SERIAL для PLAYERS и INTERNSHIPS_TYPE поставить; поменять count на quantity; NOT NULL и UNIQUE по запросам)

3 - изменить res_type и PK для history (пока оставил, решим позже)
4 - проверить мои инсерты
7 - проверить мой вьюхи
8 - проверить мои вьюхи
5 - 9 - протестить локально со всеми инсертами

TODO для Тимоши:





1. Состав команды: Ефимов Александр, Ильин Павел, Кулешов Илья, Прошин Антон, Соснин Тимофей

Область: стратегическая игра для мобильных устройств
Список сущностей: 
Факты: 
PLAYERS_X_BUILDS
PLAYERS_X_RESURSES 
PLAYERS_X_WARRIORS

Измерения: 
PLAYERS
BUILDS
RESURSES
WARRIORS
INTERSHIPS
INTERSHIPS_RES
INTERSHIPS_TYPE

2. БД находится в 2НФ, где каждый атрибут в таблице должен быть функционально зависим только от первичного ключа. Каждая запись в таблице имеет уникальный идентификатор, который позволяет однозначно идентифицировать каждую запись.

Таблицы WARRIORS и BUILDS - версионные, выбрали SCD2, те вместо замены старых данных новыми, каждое изменение создаёт новую запись, сохраняя при этом старые версии.

Поэтому добавим "WARRIORS_HISTORY", триггер будет создавать запись в таблице "WARRIORS_HISTORY" каждый раз, когда в таблице "WARRIORS" происходит обновление. В таблице "WARRIORS_HISTORY" будут храниться старые значения полей войнов.

Добавим "BUILDS_HISTORY", триггер будет создавать запись в таблице "BUILDS_HISTORY" каждый раз, когда в таблице "BUILDS" происходит обновление. В таблице "BUILDS_HISTORY" будут храниться старые значения полей зданий.
