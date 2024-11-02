-- T836.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_REVENUE = random(5000, 15000, uniform);

select
    c_customer_age,
    sum(cs_net_paid) as age_range_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_net_paid) > [MIN_REVENUE]
order by
    age_range_revenue desc
limit 100;
