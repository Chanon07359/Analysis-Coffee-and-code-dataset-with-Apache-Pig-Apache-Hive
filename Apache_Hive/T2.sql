use realbase;
SELECT CoffeeTime, count(CoffeeTime) AS n_ct
FROM coffee_cafe
GROUP BY CoffeeTime
ORDER BY  n_ct DESC;
