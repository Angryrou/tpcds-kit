-- T102.tpl

define COUNTY = random(1, rowcount("active_counties", "store"), uniform);
define STATE = distmember(fips_county, [COUNTY], 3);
define MIN_QUANTITY = random(5, 20, uniform);

with customer_purchases as (
    select
        c_customer_id,
        sum(ss_quantity) as total_quantity
    from
        store_sales ss,
        customer c,
        store s
    where
        ss_customer_sk = c_customer_sk
        and ss_store_sk = s_store_sk
        and s_state = '[STATE]'
    group by
        c_customer_id
)
select
    c_customer_id,
    total_quantity
from
    customer_purchases
where
    total_quantity > [MIN_QUANTITY]
order by
    total_quantity desc
limit 100;
