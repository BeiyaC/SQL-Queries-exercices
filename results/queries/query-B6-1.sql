DELETE FROM `customers`
WHERE NOT EXISTS
    (SELECT `customer_id` FROM `orders` WHERE `orders`.`customer_id` = `customers`.`id`);

DELETE FROM `customers`
WHERE `customers`.`id` NOT IN (SELECT `customers`.`id` FROM `orders`);

