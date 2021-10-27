Coffee_and_Code = LOAD '/user/chanon_sattrupinat_cs/coffee/data/coffee_code.csv' USING PigStorage(',')  AS (CodingHours:float ,CoffeeCupsPerDay:float ,CoffeeTime:chararray,CodingWithoutCoffee:chararray ,CoffeeType:chararray ,CoffeeSolveBugs:chararray ,Gender:chararray ,Country:chararray ,AgeRange:chararray);
ranked_Coffee_and_Code = rank Coffee_and_Code;
Coffee_and_Code_NoHeader = Filter ranked_Coffee_and_Code by (rank_Coffee_and_Code > 1);
Coffee_and_Code_Ordered = Order Coffee_and_Code_NoHeader by rank_Coffee_and_Code;
Coffee_and_Code_With_out_header= foreach Coffee_and_Code_Ordered Generate CodingHours, CoffeeCupsPerDay,CoffeeTime,CodingWithoutCoffee,CoffeeType,CoffeeSolveBugs,Gender,Country,AgeRange;
Coffee_and_Code_T1 = FOREACH Coffee_and_Code_With_out_header GENERATE (CoffeeCupsPerDay/CodingHours) AS CoffeeCupsPerCodingHours;
Coffee_and_Code_T1_groupall = Group Coffee_and_Code_T1 All;
Coffee_and_Code_T1_v2 =FOREACH Coffee_and_Code_T1_groupall GENERATE AVG(Coffee_and_Code_T1.CoffeeCupsPerCodingHours);
DUMP Coffee_and_Code_T1_v2;