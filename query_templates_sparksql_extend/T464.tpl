-- T464.tpl

define AGE_GROUP = random(18, 60, uniform);
define MIN_REVENUE = random(2000, 10000, uniform);

select
    c_customer_age,
    sum(ss_sales_price) as age_group_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(ss_sales_price) > [MIN_REVENUE]
order by
    age_group_revenue desc
limit 100;
