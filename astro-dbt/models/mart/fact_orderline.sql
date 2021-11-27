with product as (
    SELECT product_id FROM {{ ref('products_snapshot') }}
),

customer as (
    SELECT customer_id FROM {{ ref('customers_snapshot') }}
),

order_info as(
    SELECT         
        order_id,
        customer_id,
        create_dtm
    FROM
        {{ ref('stg_orders__order_info') }}
),

orderline as(
    SELECT
        orderline_id,
        order_id,
        product_id,
        quantity,
        price
    FROM
        {{ ref('stg_orders__orderline') }}
),

dim_date as(
    SELECT
        date_pk,
        year, 
        month, 
        day_of_month
    FROM
        {{ ref('dim_date') }}
), 

dim_time as(
    SELECT
        time_pk, 
        time_of_day, 
        hour, 
        minute
    FROM
        {{ ref('dim_time') }}
), 

fact_orderline as(
    SELECT
        {{ dbt_utils.surrogate_key(['o.order_id', 'ol.orderline_id']) }} as order_fact_surrogate_key,
        dd.date_pk as order_date_key,
        dt.time_pk as time_key,
        c.customer_id as customer_key,
        p.product_id as product_key,
        o.order_id as order_id,
        ol.orderline_id as orderline_id,
        ol.quantity as quantity,
        ol.price as price
    FROM
        order_info o
    INNER JOIN
        orderline ol ON o.order_id = ol.order_id
    INNER JOIN
        product p ON ol.product_id = p.product_id
    INNER JOIN
        customer c ON o.customer_id = c.customer_id
    INNER JOIN
        dim_date dd ON 
            {{ dbt_date.date_part('year', 'o.create_dtm') }} = dd.year AND 
            {{ dbt_date.date_part('month', 'o.create_dtm') }} = dd.month AND 
            {{ dbt_date.date_part('day', 'o.create_dtm') }} = dd.day_of_month
    INNER JOIN 
        dim_time dt ON 
            {{ dbt_date.date_part('hour', 'o.create_dtm') }} = dt.hour AND 
            ({{ dbt_date.date_part('hour', 'o.create_dtm') }} * 60 ) + {{ dbt_date.date_part('minute', 'o.create_dtm') }} = dt.minute 
)
SELECT
    *
FROM
    fact_orderline