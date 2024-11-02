-- T159.tpl

define YEAR = random(1999, 2003, uniform);
define MIN_DISCOUNT = random(500, 1500, uniform);

select
    d_year,
    sum(cs_discount_amt) as total_discount
from
    catalog_sales cs,
    date_dim d
where
    cs_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(cs_discount_amt) > [MIN_DISCOUNT]
order by
    total_discount desc
limit 100;
