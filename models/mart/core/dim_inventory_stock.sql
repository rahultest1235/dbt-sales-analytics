with product as (
    select * from {{ ref('stg_product')}}
),
stock as (
    select * from {{ ref('stg_stock')}}
),
inventory_stock_data as (
    select
        pd.*,
        sk.stockonhand,
        sk.reorderlevel
    from product pd
    left join stock sk using (productid)
)
select * from inventory_stock_data