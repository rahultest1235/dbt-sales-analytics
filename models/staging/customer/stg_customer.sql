with 
source as (
  select * from {{ source('sales', 'customer') }}
),
transformed as (
  select 
    customerid,
    firstname,
    lastname,
    email,
    phone
  from source
)
select * from transformed