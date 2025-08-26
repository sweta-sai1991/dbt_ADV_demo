{{ config( materialized = 'view' ) }}

with bv_bridge_customer_employee as (

    select * from {{ ref ('link_order_customer_employee')}}
),

final as (
    
    select distinct 
        customer_id,
        employee_id
    from bv_bridge_customer_employee
)


SELECT * from final
