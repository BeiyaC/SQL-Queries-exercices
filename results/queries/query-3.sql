SELECT *
FROM `orders`
WHERE `date` = NOW()
ORDER BY `number` DESC;
