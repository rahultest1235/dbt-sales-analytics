with product as (
    select * from {{ ref('stg_product')}}
),
customer as (
    select * from {{ ref('stg_customer')}}
),
transaction as (
    select * from {{ ref('stg_transaction')}}
),
customer_order_history_data as (
    select
        cr.customerid,
        cr.firstname,
        cr.lastname,
        pd.productid,
        pd.productname,
        pd.price,
        ts.quantity,
        ts.totalamount,
        ts.transactiondate
    from customer cr
    left join transaction ts using(customerid)
    left join product pd using (productid)
),
customer_purchase_data as(
    select 
        customerid,
        firstname,
        lastname,
        coalesce(sum(quantity),0) as purchase_count,
        coalesce(sum(totalamount),0) purchase_amount
    from customer_order_history_data
    group by customerid,firstname,lastname
)
select * from customer_purchase_data order by purchase_amount desc