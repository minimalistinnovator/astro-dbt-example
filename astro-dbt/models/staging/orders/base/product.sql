with source_product as(
    SELECT * FROM {{ source('orders', 'product')}}
),

final as (
    SELECT
        product_id,
        product_name,
        supplier_id,
        producttype_id,
        updated_dtm
    FROM
        source_product
)
SELECT
    *
FROM
    final