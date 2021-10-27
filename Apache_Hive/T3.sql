use realbase;
SELECT CoffeeType,count(CoffeeType) AS n_ct
FROM coffee_cafe
GROUP BY CoffeeType
ORDER BY n_ct DESC;
