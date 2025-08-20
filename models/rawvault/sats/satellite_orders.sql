
-- Auto-generated Satellite: orders
{{ config(materialized='table') }}
select
   md5(cast(order_id as string)) as orders_hk,
   order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_city, ship_region, ship_postal_code, ship_country,
   current_timestamp() as load_date,
   'orders' as record_source
from {{ source('bigquery', 'orders') }}
