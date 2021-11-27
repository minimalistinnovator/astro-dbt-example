{% snapshot products_snapshot %}

{{
    config(
      target_database='dwh',
      target_schema='dwh',
      unique_key='product_id',

      strategy='timestamp',
      updated_at='updated_dtm',
    )
}}

SELECT 
    product_id,
    product_name,
    supplier_id,
    producttype_id,
    updated_dtm
FROM 
    {{ ref('stg_orders__product') }}

{% endsnapshot %}