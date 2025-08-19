{{ config( materialized = 'view' ) }}

with order1 as (

    select * from {{ ref ('hub_orders')}}
),

order2 as (

    select * from {{ ref ('satellite_orders')}}
),

bv_pit_order_view AS (

select 
    order1.order_id,
    MAX(order2.load_date) as latest_order_load_date
    from 
        order1 left join order2 
    on 
        order1.orders_hk = order2.orders_hk
    group by order1.order_id
)


select * from bv_pit_order_view