create database realbase;
use realbase;

CREATE Table coffee_cafe (CodingHours INT,CoffeeCupsPerDay INT,CoffeeTime STRING,CodingWithoutCoffee STRING,CoffeeType STRING,CoffeeSolveBugs STRING,Gender STRING,Country STRING,AgeRange STRING)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES("skip.header.line.count"="1");

LOAD DATA INPATH '<HDFS PATH>' into table coffee_cafe;



