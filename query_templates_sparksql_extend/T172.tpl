-- T172.tpl

define LOYALTY_LEVEL = random(1, 3, uniform);
define MIN_REWARD = random(1000, 5000, uniform);

select
    c_loyalty_class,
    sum(ss_ext_list_price) as loyalty_reward
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_LEVEL]
group by
    c_loyalty_class
having
    sum(ss_ext_list_price) > [MIN_REWARD]
order by
    loyalty_reward desc
limit 100;
