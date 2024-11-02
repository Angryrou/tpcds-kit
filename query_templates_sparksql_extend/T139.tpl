-- T139.tpl

define MIN_INCOME = random(30000, 100000, uniform);
define AGE_RANGE = random(25, 65, uniform);

select
    c_customer_id,
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
    c_income_band
order by
    total_sales desc
limit 100;
