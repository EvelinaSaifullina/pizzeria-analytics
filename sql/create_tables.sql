-- создание таблиц
PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS "customers";
DROP TABLE IF EXISTS "orders";
DROP TABLE IF EXISTS "addresses";
DROP TABLE IF EXISTS "items";
DROP TABLE IF EXISTS "recipes";
DROP TABLE IF EXISTS "ingredients";
DROP TABLE IF EXISTS "inventories";
DROP TABLE IF EXISTS "staffs";
DROP TABLE IF EXISTS "rotas";
DROP TABLE IF EXISTS "shifts";

-- Клиенты
CREATE TABLE "customers" (
    "cust_id" INTEGER PRIMARY KEY,
    "cust_firstname" TEXT NOT NULL,
    "cust_lastname" TEXT NOT NULL
);

-- Заказы
CREATE TABLE "orders" (
    "row_id" INTEGER PRIMARY KEY,
    "order_id" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL,
    "item_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "cust_id" INTEGER NOT NULL,
    "add_id" INTEGER NOT NULL,
    "delivery" INTEGER NOT NULL,
    FOREIGN KEY ("cust_id") REFERENCES "customers" ("cust_id"),
    FOREIGN KEY ("add_id") REFERENCES "addresses" ("add_id"),
    FOREIGN KEY ("item_id") REFERENCES "items" ("item_id")
);

-- Адреса доставки
CREATE TABLE "addresses" (
    "add_id" INTEGER PRIMARY KEY,
    "delivery_address1" TEXT NOT NULL,
    "delivery_address2" TEXT,
    "delivery_city" TEXT NOT NULL,
    "delivery_zipcode" TEXT NOT NULL
);

-- Товары (блюда)
CREATE TABLE "items" (
    "item_id" INTEGER PRIMARY KEY,
    "recipe_id" TEXT UNIQUE NOT NULL,
    "item_name" TEXT NOT NULL,
    "item_cat" TEXT NOT NULL,
    "item_size" TEXT NOT NULL,
    "item_price" INTEGER NOT NULL
);    

-- Рецепты (связь блюд с ингредиентами)
CREATE TABLE "recipes" (
    "row_id" INTEGER PRIMARY KEY,
    "recipe_id" TEXT NOT NULL,
    "ing_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    UNIQUE(recipe_id, ing_id),
    FOREIGN KEY ("recipe_id") REFERENCES "items" ("recipe_id"),
    FOREIGN KEY ("ing_id") REFERENCES "ingredients" ("ing_id")
);

-- Ингредиенты
CREATE TABLE "ingredients" (
    "ing_id" INTEGER PRIMARY KEY,
    "ing_name" TEXT UNIQUE NOT NULL,
    "ing_weight" INTEGER NOT NULL,
    "ing_meas" TEXT NOT NULL,
    "ing_price" INTEGER NOT NULL
);

-- Остатки готовых блюд
CREATE TABLE "inventories" (
    "inv_id" INTEGER PRIMARY KEY,
    "item_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    FOREIGN KEY ("item_id") REFERENCES "items" ("item_id")
);

-- Сотрудники
CREATE TABLE "staffs" (
    "staff_id" TEXT PRIMARY KEY,
    "first_name" TEXT NOT NULL, 
    "last_name" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "hourly_rate" INTEGER NOT NULL
);

-- Расписание сотрудников
CREATE TABLE "rotas" (
    "row_id" INTEGER PRIMARY KEY,
    "rota_id" TEXT NOT NULL,
    "date" DATETIME NOT NULL,
    "shift_id" TEXT NOT NULL,
    "staff_id" TEXT NOT NULL,
    UNIQUE(date, shift_id, staff_id),
    FOREIGN KEY ("staff_id") REFERENCES "staffs" ("staff_id"),
    FOREIGN KEY ("shift_id") REFERENCES "shifts" ("shift_id")
);

-- Типы смен
CREATE TABLE "shifts" (
    "shift_id" TEXT PRIMARY KEY,
    "day_of_week" TEXT NOT NULL,
    "start_time" TIME,
    "end_time" TIME,
    CHECK (start_time < end_time)
);
