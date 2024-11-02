-- T630.tpl

define AGE_GROUP = random(18, 65, uniform);
define MAX_DISCOUNT = random(1000, 5000, uniform);

select
    c_customer_age,
    sum(cs_ext_discount_amt) as age_group_discount
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_GROUP]
group by
    c_customer_age
having
    sum(cs_ext_discount_amt) < [MAX_DISCOUNT]
order by
    age_group_discount asc
limit 100;
