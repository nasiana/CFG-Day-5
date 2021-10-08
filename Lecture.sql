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
end as "range"
from sales1