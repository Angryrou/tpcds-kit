-- T878.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_QUANTITY = random(3000, 10000, uniform);

select
    c_loyalty_class,
    sum(cs_quantity) as loyalty_quantity
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_quantity) > [MIN_QUANTITY]
order by
    loyalty_quantity desc
limit 100;
