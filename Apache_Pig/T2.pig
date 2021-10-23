Coffee_and_Code = LOAD '<Path HDFS>' USING PigStorage(',') AS (CodingHours:int ,CoffeeCupsPerDay:int ,CoffeeTime:chararray,CodingWithoutCoffee:chararray ,CoffeeType:chararray ,CoffeeSolveBugs:chararray ,Gender:chararray ,Country:chararray ,AgeRange:chararray);
Coffee_and_Code_T2 = GROUP Coffee_and_Code BY CoffeeTime;
Coffee_and_Code_T2_v2 = FOREACH Coffee_and_Code_T2 GENERATE group AS CoffeeTime , COUNT(Coffee_and_Code.CoffeeTime) AS n_coffeetime;
Coffee_and_Code_T2_v3 = ORDER Coffee_and_Code_T2_v2 BY n_coffeetime DESC;
Top_Coffee_and_Code_T2 = LIMIT Coffee_and_Code_T2_v3 1;
DUMP Top_Coffee_and_Code_T2;