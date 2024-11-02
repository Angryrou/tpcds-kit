-- T129.tpl

define MIN_REWARD = random(100, 500, uniform);
define CUSTOMER_TYPE = random(1, 3, uniform);

select
    c_customer_type,
    sum(ss_ext_list_price) as total_reward
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_ext_list_price) > [MIN_REWARD]
order by
    total_reward desc
limit 100;
