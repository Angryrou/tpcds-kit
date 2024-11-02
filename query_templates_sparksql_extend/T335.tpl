-- T335.tpl

define YEAR_RANGE = random(1999, 2005, uniform);
define MIN_SPEND = random(3000, 10000, uniform);

select
    d_year,
    sum(cs_net_paid_inc_tax) as total_spend
from
    catalog_sales cs,
    date_dim d
where
    cs_sold_date_sk = d_date_sk
    and d_year >= [YEAR_RANGE]
group by
    d_year
having
    sum(cs_net_paid_inc_tax) > [MIN_SPEND]
order by
    total_spend desc
limit 100;
