--q75.sql--

 with all_sales as (
    select
        d_year, i_brand_id, i_class_id, i_category_id, i_manufact_id,
        SUM(sales_cnt) as sales_cnt, SUM(sales_amt) as sales_amt
    from (
        select
            d_year, i_brand_id, i_class_id, i_category_id, i_manufact_id,
            cs_quantity - COALESCE(cr_return_quantity,0) as sales_cnt,
            cs_ext_sales_price - COALESCE(cr_return_amount,0.0) as sales_amt
        from catalog_sales
        join item on i_item_sk=cs_item_sk
        join date_dim on d_date_sk=cs_sold_date_sk
        left join catalog_returns on (cs_order_number=cr_order_number
                                      and cs_item_sk=cr_item_sk)
        where i_category='Books'
        UNIon
        select
            d_year, i_brand_id, i_class_id, i_category_id, i_manufact_id,
             ss_quantity - COALESCE(sr_return_quantity,0) as sales_cnt,
             ss_ext_sales_price - COALESCE(sr_return_amt,0.0) as sales_amt
        from store_sales
        join item on i_item_sk=ss_item_sk
        join date_dim on d_date_sk=ss_sold_date_sk
        left join store_returns on (ss_ticket_number=sr_ticket_number
                                    and ss_item_sk=sr_item_sk)
        where i_category='Books'
        UNIon
        select
            d_year, i_brand_id, i_class_id, i_category_id, i_manufact_id,
            ws_quantity - COALESCE(wr_return_quantity,0) as sales_cnt,
            ws_ext_sales_price - COALESCE(wr_return_amt,0.0) as sales_amt
        from web_sales
        join item on i_item_sk=ws_item_sk
        join date_dim on d_date_sk=ws_sold_date_sk
        left join web_returns on (ws_order_number=wr_order_number
                                  and ws_item_sk=wr_item_sk)
        where i_category='Books') sales_detail
    group by d_year, i_brand_id, i_class_id, i_category_id, i_manufact_id)
 select
    prev_yr.d_year as prev_year, curr_yr.d_year as year, curr_yr.i_brand_id,
    curr_yr.i_class_id, curr_yr.i_category_id, curr_yr.i_manufact_id,
    prev_yr.sales_cnt as prev_yr_cnt, curr_yr.sales_cnt as curr_yr_cnt,
    curr_yr.sales_cnt-prev_yr.sales_cnt as sales_cnt_diff,
    curr_yr.sales_amt-prev_yr.sales_amt as sales_amt_diff
 from all_sales curr_yr, all_sales prev_yr
 where curr_yr.i_brand_id=prev_yr.i_brand_id
   and curr_yr.i_class_id=prev_yr.i_class_id
   and curr_yr.i_category_id=prev_yr.i_category_id
   and curr_yr.i_manufact_id=prev_yr.i_manufact_id
   and curr_yr.d_year=2002
   and prev_yr.d_year=2002-1
   and CAST(curr_yr.sales_cnt as DECIMAL(17,2))/CAST(prev_yr.sales_cnt as DECIMAL(17,2))<0.9
 order by sales_cnt_diff
 limit 100
            
