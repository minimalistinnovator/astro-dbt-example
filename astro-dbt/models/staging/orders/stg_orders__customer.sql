with refined as(
    SELECT * FROM {{ ref('customer')}}
),

stg_customer as (
    SELECT
        customer_id,
        cust_name,
        street,
        city,
        updated_dtm
    FROM
        refined
)
SELECT
    *
FROM
    stg_customer