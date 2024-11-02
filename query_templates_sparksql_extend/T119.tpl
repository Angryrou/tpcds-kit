-- T119.tpl

define CUSTOMER_CLASS = random(1, 5, uniform);
define MIN_SPENDING = random(3000, 15000, uniform);

select
    c_customer_id,
    sum(ws_ext_sales_price) as total_spending
from
    web_sales ws,
    customer c
where
    ws_bill_customer_sk = c_customer_sk
    and c_customer_class = [CUSTOMER_CLASS]
group by
    c_customer_id
having
    sum(ws_ext_sales_price) > [MIN_SPENDING]
order by
    total_spending desc
limit 100;
