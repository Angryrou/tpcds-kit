-- T833.tpl

define AGE = random(18, 70, uniform);
define MIN_EXPENSE = random(5000, 12000, uniform);

select
    c_customer_age,
    sum(ss_net_paid) as age_expense
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_age >= [AGE]
group by
    c_customer_age
having
    sum(ss_net_paid) > [MIN_EXPENSE]
order by
    age_expense desc
limit 100;
