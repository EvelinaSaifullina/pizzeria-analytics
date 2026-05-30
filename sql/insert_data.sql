-- Категории товаров
INSERT INTO items (item_id, recipe_id, item_name, item_cat, item_size, item_price) VALUES
(1, 'REC_MARGHERITA', 'Маргарита', 'Пицца', '30 см', 450),
(2, 'REC_PEPPERONI', 'Пепперони', 'Пицца', '30 см', 550),
(3, 'REC_GAVAYSKAYA', 'Гавайская', 'Пицца', '30 см', 520),
(4, 'REC_FOUR_CHEESE', 'Четыре сыра', 'Пицца', '30 см', 600),
(5, 'REC_CEZAR', 'Салат Цезарь', 'Салат', '200 г', 280),
(6, 'REC_GREEK', 'Греческий салат', 'Салат', '180 г', 250),
(7, 'REC_COLA', 'Coca-Cola', 'Напиток', '0.5 л', 120),
(8, 'REC_FANTA', 'Fanta', 'Напиток', '0.5 л', 120),
(9, 'REC_SPRITE', 'Sprite', 'Напиток', '0.5 л', 110),
(10, 'REC_TIRAMISU', 'Тирамису', 'Десерт', '150 г', 210);

-- Ингредиенты
INSERT INTO ingredients (ing_id, ing_name, ing_weight, ing_meas, ing_price) VALUES
(1, 'Мука пшеничная', 1000, 'г', 60),
(2, 'Дрожжи', 100, 'г', 30),
(3, 'Соль', 1000, 'г', 15),
(4, 'Сахар', 1000, 'г', 55),
(5, 'Масло оливковое', 1000, 'мл', 400),
(6, 'Томатный соус', 1000, 'г', 120),
(7, 'Сыр моцарелла', 1000, 'г', 450),
(8, 'Пепперони', 1000, 'г', 600),
(9, 'Ананас', 1000, 'г', 180),
(10, 'Куриное филе', 1000, 'г', 250);

-- Рецепты (ключевые)
INSERT INTO recipes (recipe_id, ing_id, quantity) VALUES
('REC_MARGHERITA', 1, 300),  -- мука
('REC_MARGHERITA', 2, 10),
('REC_MARGHERITA', 3, 5),
('REC_MARGHERITA', 5, 20),
('REC_MARGHERITA', 6, 80),
('REC_MARGHERITA', 7, 150);

-- Сотрудники
INSERT INTO staffs (staff_id, first_name, last_name, position, hourly_rate) VALUES
('ST001', 'Анна', 'Королева', 'Повар', 300),
('ST002', 'Игорь', 'Соколов', 'Повар', 320),
('ST003', 'Марина', 'Волкова', 'Курьер', 200),
('ST004', 'Алексей', 'Морозов', 'Курьер', 200),
('ST005', 'Екатерина', 'Зайцева', 'Менеджер', 400);

-- Смены
INSERT INTO shifts (shift_id, day_of_week, start_time, end_time) VALUES
('SH_MORNING', 'Пн-Вс', '09:00', '12:00'),
('SH_DAY', 'Пн-Вс', '12:00', '18:00'),
('SH_EVENING', 'Пн-Вс', '18:00', '23:00');

-- Клиенты (первые 3)
INSERT INTO customers (cust_id, cust_firstname, cust_lastname) VALUES
(1, 'Иван', 'Иванов'),
(2, 'Петр', 'Петров'),
(3, 'Мария', 'Сидорова');
