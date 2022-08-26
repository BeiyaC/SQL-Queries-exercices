
SELECT orders.number, sum(products.price*order_product.quantity)
FROM orders
         LEFT JOIN order_product ON (orders.id=order_product.order_id)
         LEFT JOIN products ON (products.id=order_product.product_id)
GROUP BY orders.number;
