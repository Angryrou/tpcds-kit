-- T543.tpl

define AGE = random(25, 65, uniform);
define MAX_REVENUE = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(cs_sales_price) as total_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_sales_price) < [MAX_REVENUE]
order by
    total_revenue asc
limit 100;
