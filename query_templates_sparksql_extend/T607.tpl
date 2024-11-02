-- T607.tpl

define CATEGORY = random(1, 20, uniform);
define MAX_DISCOUNT = random(2000, 5000, uniform);

select
    i_category,
    sum(ss_ext_discount_amt) as category_discount
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
    category_discount asc
limit 100;
