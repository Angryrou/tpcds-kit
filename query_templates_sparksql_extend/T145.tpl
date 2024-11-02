-- T145.tpl

define CATEGORY = random(1, 20, uniform);
define MAX_RETURN = random(500, 3000, uniform);

select
    i_category,
    sum(sr_return_amt) as total_return
from
    store_returns sr,
    item i
where
    sr_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(sr_return_amt) < [MAX_RETURN]
order by
    total_return asc
limit 100;
