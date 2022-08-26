SELECT customers.first_name , customers.last_name, count(orders.number)
FROM customers
         LEFT JOIN orders ON customers.id = orders.customer_id
GROUP BY first_name, last_name
