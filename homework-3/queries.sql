-- Напишите запросы, которые выводят следующую информацию:

-- 1. Название компании заказчика (company_name из табл. customers) и ФИО сотрудника, работающего над заказом этой компании (см таблицу employees),
-- когда и заказчик и сотрудник зарегистрированы в городе London, а доставку заказа ведет компания United Package (company_name в табл shippers)
SELECT cs.company_name AS компания,
	CONCAT(em.first_name, ' ', em.last_name) AS ФИО
FROM customers cs
	INNER JOIN orders ord USING(customer_id)
	INNER JOIN employees em USING(employee_id)
	INNER JOIN shippers sh ON sh.shipper_id = ord.ship_via
WHERE cs.city = 'London'
	AND em.city = 'London'
	AND sh.company_name = 'United Package'


-- 2. Наименование продукта, количество товара (product_name и units_in_stock в табл products),
-- имя поставщика и его телефон (contact_name и phone в табл suppliers) для таких продуктов,
-- которые не сняты с продажи (поле discontinued) и которых меньше 25 и которые в категориях Dairy Products и Condiments.
-- Отсортировать результат по возрастанию количества оставшегося товара.
SELECT pr.product_name,
	pr.units_in_stock,
	sp.contact_name,
	sp.phone
FROM products pr
	INNER JOIN suppliers sp USING(supplier_id)
	INNER JOIN categories ca USING(category_id)
WHERE pr.discontinued = 0
	AND pr.units_in_stock < 25
	AND ca.category_name in ('Dairy Products', 'Condiments')
ORDER BY pr.units_in_stock


-- 3. Список компаний заказчиков (company_name из табл customers), не сделавших ни одного заказа
SELECT company_name, customer_id
FROM customers
	LEFT JOIN orders USING(customer_id)
	WHERE orders.customer_id IS NULL


-- 4. уникальные названия продуктов, которых заказано ровно 10 единиц (количество заказанных единиц см в колонке quantity табл order_details)
-- Этот запрос написать именно с использованием подзапроса.
SELECT DISTINCT(product_name)
FROM products
WHERE product_id IN (
		SELECT product_id
		FROM order_details
		WHERE quantity = 10
	)