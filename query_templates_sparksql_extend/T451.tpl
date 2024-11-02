-- T451.tpl

define CUSTOMER_AGE = random(25, 65, uniform);
define MIN_SPENDING = random(3000, 10000, uniform);

select
    c_customer_age,
    sum(cs_sales_price) as total_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [CUSTOMER_AGE]
group by
    c_customer_age
having
    sum(cs_sales_price) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
