-- T136.tpl

define EDUCATION_LEVEL = random(1, 5, uniform);
define MIN_SPEND = random(3000, 10000, uniform);

select
    c_education_status,
    sum(cs_net_paid_inc_tax) as education_spending
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_education_status = [EDUCATION_LEVEL]
group by
    c_education_status
having
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    education_spending desc
limit 100;
