-- T239.tpl

define YEAR = random(1999, 2003, uniform);
define MIN_REVENUE = random(2000, 10000, uniform);

select
    d_year,
    sum(ss_sales_price) as yearly_revenue
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(ss_sales_price) > [MIN_REVENUE]
order by
    yearly_revenue desc
limit 100;
