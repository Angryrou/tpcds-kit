-- T515.tpl

define CUSTOMER_TYPE = random(1, 4, uniform);
define MIN_TAX = random(1000, 4000, uniform);

select
    c_customer_type,
    sum(cs_sales_tax) as customer_tax
from
    catalog_sales cs,
    customer c
where
    cs_bill_customer_sk = c_customer_sk
    and c_customer_type = [CUSTOMER_TYPE]
group by
    c_customer_type
having
    sum(cs_sales_tax) > [MIN_TAX]
order by
    customer_tax desc
limit 100;
