-- T211.tpl

define LOYALTY_LEVEL = random(1, 4, uniform);
define MIN_DISCOUNT = random(1000, 4000, uniform);

select
    c_loyalty_class,
    sum(ss_ext_discount_amt) as loyalty_discount
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    loyalty_discount desc
limit 100;
