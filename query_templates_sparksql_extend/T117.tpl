-- T117.tpl

define STATE_CODE = random(1, 50, uniform);
define MIN_PURCHASES = random(10, 100, uniform);

select
    s_state,
    count(ss_ticket_number) as total_purchases
from
    store_sales ss,
    store s
where
    ss_store_sk = s_store_sk
    and s_state_code = [STATE_CODE]
group by
    s_state
having
    count(ss_ticket_number) > [MIN_PURCHASES]
order by
    total_purchases desc
limit 100;
