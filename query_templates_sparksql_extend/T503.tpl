-- T503.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_PURCHASES = random(3000, 10000, uniform);

select
    c_customer_type,
    sum(cs_sales_price) as total_sales
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_sales_price) > [MIN_PURCHASES]
order by
    total_sales desc
limit 100;
