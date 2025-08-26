
-- Auto-generated Hub: orders
{{ config(materialized='table') }}
select
   md5(cast(order_id as string)) as orders_hk,
   order_id,
   current_timestamp() as load_date,
   'orders' as record_source
from {{ source('bigquery', 'orders') }}
