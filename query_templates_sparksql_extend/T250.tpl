-- T250.tpl

define LOYALTY_LEVEL = random(1, 5, uniform);
define MAX_DISCOUNT = random(0.1, 0.4, uniform);

select
    c_loyalty_class,
    avg(ss_discount_amt/ss_sales_price) as average_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    avg(ss_discount_amt/ss_sales_price) < [MAX_DISCOUNT]
order by
    average_discount asc
limit 100;
