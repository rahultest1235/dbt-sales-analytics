with 
source as (
  select * from {{ source('sales', 'transaction') }}
),
transformed as (
  select 
    transactionid,
    customerid,
    productid,
    quantity,
    totalamount,
    TRANSACTIONDATE
  from source
)
select * from transformed