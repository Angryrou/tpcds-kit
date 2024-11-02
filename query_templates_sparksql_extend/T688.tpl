-- T688.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MAX_REVENUE = random(5000, 15000, uniform);

select
    c_loyalty_class,
    sum(cs_sales_price) as loyalty_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(cs_sales_price) < [MAX_REVENUE]
order by
    loyalty_revenue asc
limit 100;
