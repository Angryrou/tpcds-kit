-- T114.tpl

define MAX_REFUND = random(500, 2000, uniform);
define CATEGORY_ID = random(1, 10, uniform);

select
    i_item_desc,
    sum(sr_return_amt) as total_refund
from
    store_returns sr,
    item i
where
    sr_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_item_desc
having
    sum(sr_return_amt) <= [MAX_REFUND]
order by
    total_refund asc
limit 100;
