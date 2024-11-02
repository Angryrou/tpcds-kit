-- T452.tpl

define LOYALTY_CLASS = random(1, 4, uniform);
define MAX_TAX = random(1000, 5000, uniform);

select
    c_loyalty_class,
    sum(cs_sales_tax) as total_tax
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_sales_tax) < [MAX_TAX]
order by
    total_tax asc
limit 100;
