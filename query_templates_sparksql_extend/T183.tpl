-- T183.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MAX_TAX = random(3000, 10000, uniform);

select
    c_loyalty_class,
    sum(ss_sales_tax) as total_tax
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    total_tax asc
limit 100;
