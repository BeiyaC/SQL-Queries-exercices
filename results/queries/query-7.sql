SELECT sum(products.price*order_product.quantity)
FROM orders
         LEFT JOIN order_product ON (orders.id=order_product.order_id)
         LEFT JOIN products ON (products.id=order_product.product_id)
WHERE orders.date=NOW()
