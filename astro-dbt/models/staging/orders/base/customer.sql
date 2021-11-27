with source_customer as(
    SELECT * FROM {{ source('orders', 'customer')}}
),

final as (
    SELECT
        customer_id,
        cust_name,
        street,
        city,
        updated_dtm
    FROM
        source_customer
)
SELECT
    *
FROM
    final