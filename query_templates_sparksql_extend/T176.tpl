-- T176.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_RETURN = random(1000, 5000, uniform);

select
    i_category,
    sum(sr_return_amt) as total_returns
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
    total_returns asc
limit 100;
