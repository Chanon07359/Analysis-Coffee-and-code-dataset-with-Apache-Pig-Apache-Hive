Coffee_and_Code = LOAD '<Path HDFS>' USING PigStorage(',') AS (CodingHours:int ,CoffeeCupsPerDay:int ,CoffeeTime:chararray,CodingWithoutCoffee:chararray ,CoffeeType:chararray ,CoffeeSolveBugs:chararray ,Gender:chararray ,Country:chararray ,AgeRange:chararray);
Coffee_and_Code_T5 = GROUP Coffee_and_Code BY AgeRange;
Coffee_and_Code_T5_v2 =  FOREACH Coffee_and_Code_T5 GENERATE group AS AgeRange , COUNT(Coffee_and_Code.AgeRange) AS n_agerange;
Coffee_and_Code_T5_v3 = ORDER Coffee_and_Code_T5_v2 BY n_agerange DESC;
Top_Coffee_and_Code_T5 = LIMIT Coffee_and_Code_T5_v3 1;
DUMP Top_Coffee_and_Code_T5;