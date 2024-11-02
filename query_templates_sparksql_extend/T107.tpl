-- T107.tpl

define YEAR = random(1998, 2002, uniform);
define MONTH = random(1, 12, uniform);
define MIN_REFUNDS = random(100, 1000, uniform);

select
    s_store_name,
    d_year,
    d_moy,
    sum(sr_return_amt) as total_refunds
from
    store_returns sr,
    store s,
    date_dim d
where
    sr_store_sk = s_store_sk
    and sr_returned_date_sk = d_date_sk
    and d_year = [YEAR]
    and d_moy = [MONTH]
group by
    s_store_name,
    d_year,
    d_moy
having
    sum(sr_return_amt) > [MIN_REFUNDS]
order by
    total_refunds desc
limit 100;
