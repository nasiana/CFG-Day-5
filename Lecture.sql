use shop;

-- using built in functions
-- left selects characters from the left 
-- left is as left (variable, integers wanted from the left)
-- now() contains current data time that the code has been executed
-- date_format formats dates in a certain way
select 
SalesPerson, SalesAmount, left(Store, 3), now() as 'AsOf',
date_format(now(), '%d%b%Y') as 'AsOf2'
from sales1;

-- case statement in mysql
select SalesAmount,
case 
when SalesAmount <= 50 then "0-50"
when SalesAmount > 50 AND SalesAmount <= 100 then "51-100"
-- default case, good to have so that we dont potentially have "nulls"
when SalesAmount > 100 then "101+"
-- "range" here represents the result of the case statement, this is true of any alias placed after the 'as'
-- "range" is simply an alias, 'end as' represents the results of the case statement
end as "range"
from sales1

-- Create function

DELIMITER $$

CREATE FUNCTION IsAdult  (age INTEGER)
returns varchar (3)
-- deterministic means that if  you give it the same input, it should always return the same output 
-- if it relies on other variables, won't be deterministic as it can change subject to initial conditions
-- deterministic helps with optimization of the programme
DETERMINISTIC

Begin
if age >= 18 
then return ("yes");
else
return ("no");
end if; 

END $$

DELIMITER ; 

-- calling the function

SELECT IsAdult(15);
SELECT IsAdult(25);

-- creating a variable
SET @TransferAmount = 50;

-- transactions

-- STARTING THE transaction, induces a temporary state of data
START TRANSACTION;
-- when using transaction, by using the command rollback we can 'undo' the transaction and go back to the original state of data
ROLLBACK;
-- commit comand makes the state of data permanent, so the changes have been committed permanently to the database
COMMIT;

-- INDEX
-- "country_code_idx" is simply a name of the index, can be anything
CREATE INDEX country_code_idx
-- ON specifies the table it needs to be run on which in this case is 'world.city_no_index' then the column specified in brackets
on world.city_no_index (CountryCode);