-- T308.tpl

define CATEGORY = random(1, 15, uniform);
define MAX_DISCOUNT = random(500, 2500, uniform);

select
    i_category,
    sum(ss_ext_discount_amt) as total_category_discount
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_ext_discount_amt) < [MAX_DISCOUNT]
order by
    total_category_discount asc
limit 100;
