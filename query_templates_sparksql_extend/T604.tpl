-- T604.tpl

define AGE_GROUP = random(18, 65, uniform);
define MIN_PURCHASES = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as age_group_purchases
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_sales_price) > [MIN_PURCHASES]
order by
    age_group_purchases desc
limit 100;
