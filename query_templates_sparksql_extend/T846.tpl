-- T846.tpl

define AGE = random(18, 65, uniform);
define MIN_REVENUE = random(5000, 12000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as age_revenue
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_net_paid) > [MIN_REVENUE]
order by
    age_revenue desc
limit 100;
