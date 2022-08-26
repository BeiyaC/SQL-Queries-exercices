SELECT orders.number, sum(order_product.quantity * products.price)
FROM orders
         INNER JOIN order_product ON orders.id= order_product.order_id
         INNER JOIN products ON products.id = order_product.product_id
WHERE customer_id =2
GROUP BY orders.number
