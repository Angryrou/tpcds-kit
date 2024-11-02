-- T498.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MAX_DISCOUNT = random(1000, 5000, uniform);

select
    c_loyalty_class,
    sum(cs_ext_discount_amt) as total_discount
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
