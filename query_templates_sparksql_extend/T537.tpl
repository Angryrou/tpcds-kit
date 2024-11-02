-- T537.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_SALES = random(2000, 8000, uniform);

select
    c_customer_type,
    sum(ss_sales_price) as total_sales
from
    store_sales ss,
    customer c
where
    ss_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(ss_sales_price) > [MIN_SALES]
order by
    total_sales desc
limit 100;
