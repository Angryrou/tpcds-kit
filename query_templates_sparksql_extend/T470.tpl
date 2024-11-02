-- T470.tpl

define CATEGORY_ID = random(1, 10, uniform);
define MAX_DISCOUNT = random(2000, 8000, uniform);

select
    i_category,
    sum(ss_ext_discount_amt) as total_discount
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY_ID]
group by
    i_category
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_discount asc
limit 100;
