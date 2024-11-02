-- T1061.tpl

define CATEGORY = random(1, 20, uniform);
define MAX_EXPENDITURE = random(5000, 15000, uniform);

select
    i_category,
    sum(cs_net_paid_inc_tax) as total_expenditure
from
    catalog_sales cs,
    item i
where
    cs_item_sk = i_item_sk
    and i_category_id = [CATEGORY]
group by
    i_category
having
    sum(cs_net_paid_inc_tax) < [MAX_EXPENDITURE]
order by
    total_expenditure asc
limit 100;
