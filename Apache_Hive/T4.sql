use realbase;
SELECT CoffeeSolveBugs,count(CoffeeSolveBugs) AS n_csb
FROM coffee_cafe
GROUP BY CoffeeSolveBugs
ORDER BY n_csb DESC;