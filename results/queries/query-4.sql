SELECT *
FROM `orders`
WHERE `date` < NOW() - INTERVAL 3 YEAR
ORDER BY `number` DESC;
