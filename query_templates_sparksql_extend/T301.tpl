-- T301.tpl

define YEAR = random(2001, 2005, uniform);
define MAX_REVENUE = random(1000, 7000, uniform);

select
    d_year,
    sum(ss_sales_price) as annual_revenue
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(ss_sales_price) < [MAX_REVENUE]
order by
    annual_revenue asc
limit 100;
