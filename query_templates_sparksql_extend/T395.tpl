-- T395.tpl

define CATEGORY = random(1, 15, uniform);
define MIN_DISCOUNT = random(1000, 4000, uniform);

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
    sum(ss_ext_discount_amt) > [MIN_DISCOUNT]
order by
    category_discount desc
limit 100;
