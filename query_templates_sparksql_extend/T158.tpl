-- T158.tpl

define AGE_RANGE = random(18, 65, uniform);
define MIN_INCOME = random(20000, 80000, uniform);

select
    c_customer_id,
    c_customer_age,
    c_income_band,
    sum(cs_sales_price) as total_sales
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_income_band > [MIN_INCOME]
    and c_customer_age > [AGE_RANGE]
group by
    c_customer_id,
    c_customer_age,
    c_income_band
order by
    total_sales desc
limit 100;
