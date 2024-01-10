with 
source as (
  select * from {{ source('sales', 'stock') }}
),
transformed as (
  select 
    productid,
    stockonhand,
    reorderlevel
  from source
)
select * from transformed