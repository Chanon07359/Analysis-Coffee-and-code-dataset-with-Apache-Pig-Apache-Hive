Coffee_and_Code = LOAD '<Path HDFS>' USING PigStorage(',') AS (CodingHours:int ,CoffeeCupsPerDay:int ,CoffeeTime:chararray,CodingWithoutCoffee:chararray ,CoffeeType:chararray ,CoffeeSolveBugs:chararray ,Gender:chararray ,Country:chararray ,AgeRange:chararray);
Coffee_and_Code_T1 = FOREACH Coffee_and_Code GENERATE (CoffeeCupsPerDay/CodingHours) AS CoffeeCupsPerCodingHours;
Coffee_and_Code_T1_groupall = Group Coffee_and_Code_T1 All;
Coffee_and_Code_T1_v2 =FOREACH Coffee_and_Code_T1_groupall GENERATE AVG(Coffee_and_Code_T1.CoffeeCupsPerCodingHours);
Average_CoffeeCupsPerCodingHours = LIMIT Coffee_and_Code_T1_v2 1;
DUMP Average_CoffeeCupsPerCodingHours;