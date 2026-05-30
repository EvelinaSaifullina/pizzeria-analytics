-- 1. Общая выручка
SELECT 
    SUM(i.item_price * o.quantity) AS total_revenue
FROM orders o
JOIN items i ON o.item_id = i.item_id;

-- 2. Количество уникальных заказов
SELECT COUNT(DISTINCT order_id) AS total_orders FROM orders;

-- 3. Средний чек
SELECT 
    ROUND(
        SUM(i.item_price * o.quantity) * 1.0 / COUNT(DISTINCT o.order_id),
        2
    ) AS avg_order_value
FROM orders o
JOIN items i ON o.item_id = i.item_id;

-- 4. Топ-5 продаваемых товаров
SELECT 
    i.item_name,
    SUM(o.quantity) AS total_sold
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY i.item_name
ORDER BY total_sold DESC
LIMIT 5;

-- 5. Выручка по категориям
SELECT 
    i.item_cat AS category,
    SUM(i.item_price * o.quantity) AS total_sales
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY i.item_cat
ORDER BY total_sales DESC;

-- 6. Заказы по часам
SELECT 
    STRFTIME('%H', created_at) AS hour,
    COUNT(DISTINCT order_id) AS orders_count
FROM orders
GROUP BY hour
ORDER BY hour;

-- 7. Выручка по часам
SELECT 
    STRFTIME('%H', o.created_at) AS hour,
    SUM(i.item_price * o.quantity) AS revenue
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY hour
ORDER BY hour;

-- 8. Соотношение доставки и самовывоза
SELECT 
    CASE 
        WHEN delivery = 1 THEN 'Доставка'
        ELSE 'Самовывоз'
    END AS order_type,
    COUNT(DISTINCT order_id) AS orders_count,
    ROUND(100.0 * COUNT(DISTINCT order_id) / (SELECT COUNT(DISTINCT order_id) FROM orders), 1) AS percentage
FROM orders
GROUP BY delivery;

-- 9. Расход ингредиентов
SELECT 
    ing.ing_name,
    SUM(rec.quantity * o.quantity) AS total_used,
    ing.ing_meas AS unit
FROM orders o
JOIN items i ON o.item_id = i.item_id
JOIN recipes rec ON i.recipe_id = rec.recipe_id
JOIN ingredients ing ON rec.ing_id = ing.ing_id
GROUP BY ing.ing_name
ORDER BY total_used DESC;
