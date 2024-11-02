-- T762.tpl

define AGE = random(18, 70, uniform);
define MAX_SALES = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(cs_sales_price) as age_sales
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_sales_price) < [MAX_SALES]
order by
    age_sales asc
limit 100;
