{{config (materialized='table')}}

WITH orders as (
        select order_id from {{ source('bigquery','orders') }}
    ),
    shippers as (
        select shipper_id from {{ source('bigquery','shippers') }}
    )
select order_id,shipper_id from orders o join shippers s on o.order_id=s.shipper_id