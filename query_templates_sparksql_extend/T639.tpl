-- T639.tpl

define CATEGORY = random(1, 20, uniform);
define MIN_EXPENDITURE = random(3000, 12000, uniform);

select
    i_category,
    sum(cs_net_paid) as category_expenditure
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_paid) > [MIN_EXPENDITURE]
order by
    category_expenditure desc
limit 100;
