{{ config( materialized = 'view' ) }}

with bv_latest_customer as (
    select * from {{ ref ('bv_latest_customer_view')}}
),
link_oce as (
    select * from {{ ref ('link_order_customer_employee')}}
),
order1 as (
    select * from {{ ref ('satellite_orders')}}
),
orderdetails as (
    select * from {{ ref ('satellite_order_details')}}
),
final as (
    select 
        bv_latest_customer.customer_id,
        bv_latest_customer.customer_name,
        bv_latest_customer.city,
        bv_latest_customer.country,
        count(order1.order_id) as TOTAL_ORDERS,
        SUM(orderdetails.quantity * orderdetails.unit_price * (1 - orderdetails.discount)) AS total_revenue
    from 
        bv_latest_customer left join link_oce 
            on bv_latest_customer.customer_id=link_oce.customer_id
        left join order1 
            on link_oce.order_id = order1.order_id
        left join orderdetails
            on order1.order_id = orderdetails.order_id
    group by 1, 2, 3, 4

)

select * from final

