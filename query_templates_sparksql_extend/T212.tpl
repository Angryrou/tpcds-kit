-- T212.tpl

define AGE = random(18, 65, uniform);
define MIN_REVENUE = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(cs_net_paid_inc_tax) as total_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(cs_net_paid_inc_tax) > [MIN_REVENUE]
order by
    total_revenue desc
limit 100;
