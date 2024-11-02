-- T325.tpl

define AGE_GROUP = random(20, 65, uniform);
define MIN_SPEND = random(5000, 20000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as age_group_spend
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_SPEND]
order by
    age_group_spend desc
limit 100;
