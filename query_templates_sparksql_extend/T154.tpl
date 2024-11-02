-- T154.tpl

define YEAR = random(1998, 2002, uniform);
define MIN_DISCOUNT = random(0.01, 0.10, uniform);

select
    d_year,
    avg(ss_ext_discount_amt/ss_sales_price) as avg_discount
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    avg(ss_ext_discount_amt/ss_sales_price) > [MIN_DISCOUNT]
order by
    avg_discount desc
limit 100;
