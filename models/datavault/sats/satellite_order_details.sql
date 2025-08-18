
-- Auto-generated Satellite: order_details
{% raw %}
{{ config(materialized='incremental') }}
select
   md5(cast(order_id as string)) as order_details_hk,
   product_id, unit_price, quantity, discount,
   current_timestamp() as load_date,
   'order_details_raw' as record_source
from {{ source('bigquery_data', 'order_details_raw') }}
{% endraw %}
