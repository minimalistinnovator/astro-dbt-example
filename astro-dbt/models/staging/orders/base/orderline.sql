with source_orderline as(
    SELECT * FROM {{ source('orders', 'orderline')}}
),

final as (
    SELECT
        orderline_id,
        order_id,
        product_id,
        quantity,
        price
    FROM
        source_orderline
)
SELECT
    *
FROM
    final