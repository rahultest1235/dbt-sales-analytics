with 
source as (
  select * from {{ source('sales', 'product') }}
),
transformed as (
  select 
    productid,
    productname,
    category,
    price,
    stockquantity
  from source
)
select * from transformed