-- T296.tpl

define MONTH = random(1, 12, uniform);
define MIN_PURCHASES = random(500, 1500, uniform);

select
    d_moy,
    count(ss_ticket_number) as monthly_purchases
from
    store_sales ss,
    date_dim d
where
    ss_sold_date_sk = d_date_sk
    and d_moy = [MONTH]
group by
    d_moy
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    monthly_purchases desc
limit 100;
