{% snapshot customers_snapshot %}

{{
    config(
      target_database='dwh',
      target_schema='dwh',
      unique_key='customer_id',

      strategy='timestamp',
      updated_at='updated_dtm',
    )
}}

SELECT 
    customer_id,
    cust_name,
    street,
    city,
    updated_dtm
FROM 
    {{ ref('stg_orders__customer') }}

{% endsnapshot %}