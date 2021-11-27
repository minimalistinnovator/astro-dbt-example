with refined as(
    SELECT * FROM {{ ref('orderline')}}
),

stg_orderline as (
    SELECT
        orderline_id,
        order_id,
        product_id,
        quantity,price
    FROM
        refined
)
SELECT
    *
FROM
    stg_orderline