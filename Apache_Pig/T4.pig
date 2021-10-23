Coffee_and_Code = LOAD '<Path HDFS>' USING PigStorage(',') AS (CodingHours:int ,CoffeeCupsPerDay:int ,CoffeeTime:chararray,CodingWithoutCoffee:chararray ,CoffeeType:chararray ,CoffeeSolveBugs:chararray ,Gender:chararray ,Country:chararray ,AgeRange:chararray);
Coffee_and_Code_T4 = GROUP Coffee_and_Code BY CoffeeSolveBugs;
Coffee_and_Code_T4_v2 =  FOREACH Coffee_and_Code_T4 GENERATE group AS CoffeeSolveBugs , COUNT(Coffee_and_Code.CoffeeSolveBugs) AS n_coffeesolvebugs;
Coffee_and_Code_T4_v3 = ORDER Coffee_and_Code_T4_v2 BY n_coffeesolvebugs DESC;
Top_Coffee_and_Code_T4 = LIMIT Coffee_and_Code_T4_v3 1;
DUMP Top_Coffee_and_Code_T4;