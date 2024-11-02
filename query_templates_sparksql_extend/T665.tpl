-- T665.tpl

define CATEGORY = random(1, 10, uniform);
define MIN_QUANTITY = random(5000, 20000, uniform);

select
    i_category,
    sum(ss_quantity) as category_quantity
from
    store_sales ss,
    item i
where
    ss_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(ss_quantity) > [MIN_QUANTITY]
order by
    category_quantity desc
limit 100;
