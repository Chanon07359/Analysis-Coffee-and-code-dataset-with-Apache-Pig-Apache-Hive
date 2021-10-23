Coffee_and_Code = LOAD '<Path HDFS>' USING PigStorage(',') AS (CodingHours:int ,CoffeeCupsPerDay:int ,CoffeeTime:chararray,CodingWithoutCoffee:chararray ,CoffeeType:chararray ,CoffeeSolveBugs:chararray ,Gender:chararray ,Country:chararray ,AgeRange:chararray);
Coffee_and_Code_T3 = GROUP Coffee_and_Code BY CoffeeType;
Coffee_and_Code_T3_v2 =  FOREACH Coffee_and_Code_T3 GENERATE group AS CoffeeType , COUNT(Coffee_and_Code.CoffeeType) AS n_coffeetype;
Coffee_and_Code_T3_v3 = ORDER Coffee_and_Code_T3_v2 BY n_coffeetype DESC;
Top_Coffee_and_Code_T3 = LIMIT Coffee_and_Code_T3_v3 1;
DUMP Top_Coffee_and_Code_T3;