-- T512.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MIN_SALES = random(5000, 20000, uniform);

select
    c_loyalty_class,
    sum(cs_sales_price) as loyalty_sales
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(cs_sales_price) > [MIN_SALES]
order by
    loyalty_sales desc
limit 100;
