use realbase;

SELECT avg(Q.CoffeeCupsPerCodingHours)
FROM (SELECT (CoffeeCupsPerDay/CodingHours) AS CoffeeCupsPerCodingHours FROM coffee_cafe) AS Q;


