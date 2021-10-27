use realbase;
SELECT AgeRange,count(AgeRange) AS n_ar
FROM coffee_cafe
GROUP BY AgeRange
ORDER BY n_ar DESC;

