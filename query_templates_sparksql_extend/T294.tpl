-- T294.tpl

define LOYALTY_CLASS = random(1, 5, uniform);
define MIN_REVENUE = random(2000, 10000, uniform);

select
    c_loyalty_class,
    sum(cs_sales_price) as loyalty_revenue
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_loyalty_class = [LOYALTY_CLASS]
group by
    c_loyalty_class
having
    sum(cs_sales_price) > [MIN_REVENUE]
order by
    loyalty_revenue desc
limit 100;
