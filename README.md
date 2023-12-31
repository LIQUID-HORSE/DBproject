# Описание Проекта: Стратегическая Игра для Мобильных Устройств

## Команда Разработчиков
- **Ефимов Александр**
- **Ильин Павел**
- **Кулешов Илья**
- **Прошин Антон**
- **Соснин Тимофей**

## Основные Сущности Проекта

### Список Сущностей
- **Факты:**
  - `PLAYERS_X_BUILDS`
  - `PLAYERS_X_RESURSES`
  - `PLAYERS_X_WARRIORS`

- **Измерения:**
  - `PLAYERS`
  - `BUILDS`
  - `RESURSES`
  - `WARRIORS`
  - `INTERSHIPS`
  - `INTERSHIPS_RES`
  - `INTERSHIPS_TYPE`

## Структура Базы Данных

### Нормализация
- База данных организована в соответствии с принципами **2НФ (Второй Нормальной Формы)**.
- Каждый атрибут в таблице функционально зависит только от первичного ключа.
- Уникальный идентификатор для каждой записи обеспечивает однозначную идентификацию.

### Версионность Таблиц
- Таблицы `WARRIORS` и `BUILDS` являются версионными, используется подход **SCD2 (Slowly Changing Dimension Type 2)**.
- Вместо замены старых данных новыми, каждое изменение генерирует новую запись, сохраняя историю изменений.

### Исторические Таблицы
- **`WARRIORS_HISTORY`**: 
  - Создается запись в этой таблице при каждом обновлении в `WARRIORS`.
  - Хранит исторические данные о войнах.

- **`BUILDS_HISTORY`**: 
  - Создается запись в этой таблице при каждом обновлении в `BUILDS`.
  - Хранит исторические данные о зданиях.

### Триггеры
- Реализованы триггеры для автоматического создания записей в исторических таблицах (`WARRIORS_HISTORY` и `BUILDS_HISTORY`) при обновлениях соответствующих основных таблиц.

---

Этот проект представляет собой комплексную систему баз данных, специально разработанную для поддержки стратегической игры на мобильных устройствах. Структура данных тщательно спланирована для обеспечения эффективности, целостности и исторической точности информации.
