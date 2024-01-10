WITH product AS (
    SELECT * FROM {{ ref('stg_product')}}
),
customer AS (
    SELECT * FROM {{ ref('stg_customer')}}
),
transaction AS (
    SELECT * FROM {{ ref('stg_transaction')}}
),
customer_order_history_data AS (
    SELECT
        cr.customerid,
        cr.firstname,
        cr.lastname,
        pd.productid,
        pd.productname,
        pd.price,
        ts.quantity,
        ts.totalamount,
        ts.transactiondate
    FROM customer cr
    LEFT JOIN transaction ts using(customerid)
    LEFT JOIN product pd using(productid)
)
SELECT * FROM customer_order_history_data