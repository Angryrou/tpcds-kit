-- T230.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MAX_DISCOUNT = random(0.05, 0.3, uniform);

select
    c_loyalty_class,
    avg(ss_discount_amt/ss_sales_price) as avg_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    avg(ss_discount_amt/ss_sales_price) < [MAX_DISCOUNT]
order by
    avg_discount asc
limit 100;
