-- T481.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_SALES = random(3000, 12000, uniform);

select
    c_customer_age,
    sum(cs_sales_price) as age_sales
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_age >= [AGE_RANGE]
group by
    c_customer_age
having
    sum(cs_sales_price) > [MIN_SALES]
order by
    age_sales desc
limit 100;
