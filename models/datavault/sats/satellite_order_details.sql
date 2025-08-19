
-- Auto-generated Satellite: order_details

{{ config(materialized='table') }}
select
   md5(cast(order_id as string)) as order_details_hk,
   order_id,product_id, unit_price, quantity, discount,
   current_timestamp() as load_date,
   'order_details' as record_source
from {{ source('bigquery', 'order_details') }}

