-- T696.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MAX_DISCOUNT = random(1000, 6000, uniform);

select
    c_loyalty_class,
    sum(ss_ext_discount_amt) as loyalty_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    loyalty_discount asc
limit 100;
