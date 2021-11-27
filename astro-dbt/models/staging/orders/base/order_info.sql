with source_order_info as(
    SELECT * FROM {{ source('orders', 'order_info')}}
),

final as (
    SELECT
        order_id,
        customer_id,
        create_dtm
    FROM
        source_order_info
)
SELECT
    *
FROM
    final