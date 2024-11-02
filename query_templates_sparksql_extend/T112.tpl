-- T112.tpl

define YEAR = random(1997, 2001, uniform);
define MIN_TAX = random(500, 3000, uniform);

select
    d_year,
    sum(sr_return_tax) as total_tax
from
    store_returns sr,
    date_dim d
where
    sr_returned_date_sk = d_date_sk
    and d_year = [YEAR]
group by
    d_year
having
    sum(sr_return_tax) > [MIN_TAX]
order by
    total_tax desc
limit 100;
