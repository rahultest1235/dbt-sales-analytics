with product as (
    select * from {{ ref('stg_product')}}
),
stock as (
    select * from {{ ref('stg_stock')}}
),
inventory_stock_data AS (
    SELECT
        pd.productid,
        pd.productname,
        pd.category,
        pd.price,
        CASE WHEN sk.stockonhand > 0 THEN 'yes' ELSE 'no' END AS stock_available
    FROM product pd
    LEFT JOIN stock sk USING (productid)
)
SELECT * FROM inventory_stock_data