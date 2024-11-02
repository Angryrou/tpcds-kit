-- T120.tpl

define MAX_RANK = random(5, 15, uniform);
define MIN_RETURN = random(200, 1000, uniform);

select
    i_item_id,
    rank() over (order by sum(sr_return_amt) desc) as return_rank,
    sum(sr_return_amt) as total_return
from
    store_returns sr,
    item i
where
    sr_item_sk = i_item_sk
group by
    i_item_id
having
    return_rank <= [MAX_RANK]
    and sum(sr_return_amt) > [MIN_RETURN]
order by
    return_rank asc
limit 100;
