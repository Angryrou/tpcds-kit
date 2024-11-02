-- T427.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MAX_TAX = random(1000, 4000, uniform);

select
    c_customer_type,
    sum(ss_sales_tax) as customer_tax
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_sales_tax) < [MAX_TAX]
order by
    customer_tax asc
limit 100;
