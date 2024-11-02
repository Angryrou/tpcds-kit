-- T185.tpl

define MONTH = random(1, 12, uniform);
define MIN_PURCHASE_COUNT = random(100, 500, uniform);

select
    d_moy,
    count(ss_ticket_number) as purchase_count
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    count(ss_ticket_number) > [MIN_PURCHASE_COUNT]
order by
    purchase_count desc
limit 100;
