with refined as(
    SELECT * FROM {{ ref('product')}}
),

stg_product as (
    SELECT
        product_id,
        product_name,
        supplier_id,
        producttype_id,
        updated_dtm
    FROM
        refined
)
SELECT
    *
FROM
    stg_product