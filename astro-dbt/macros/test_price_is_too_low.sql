{% test price_is_too_low(model, column_name) %}

with validation as (

    select
        {{ column_name }} as price

    from {{ model }}

),

validation_errors as (

    select
        price

    from validation

    where price < 30

)

select *
from validation_errors

{% endtest %}