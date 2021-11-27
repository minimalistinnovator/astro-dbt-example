with refined as(
    SELECT * FROM {{ ref('order_info')}}
),

stg_order_info as (
    SELECT
        order_id,
        customer_id,
        create_dtm
    FROM
        refined
)
SELECT
    *
FROM
   stg_order_info